(in-package :cl-user)
(defpackage fox5-web
  (:use :cl :lucerne)
  (:export :app)
  (:documentation "Main fox5-web code."))
(in-package :fox5-web)
(annot:enable-annot-syntax)

;;; App

(defapp app
  :middlewares ((clack.middleware.static:<clack-middleware-static>
                 :root (asdf:system-relative-pathname :fox5-web #p"assets/")
                 :path "/static/")))

;;; Templates

(djula:add-template-directory
 (asdf:system-relative-pathname :fox5-web #p"templates/"))

(defparameter +index+ (djula:compile-template* "index.html"))

;;; Views

@route app "/"
(defview index ()
  (render-template (+index+)))

@route app (:post "/submit")
(defview upload ()
  (with-params (file)
    (uiop/stream:with-temporary-file (:direction :io :pathname gif :stream sgif)
      (uiop/stream:with-temporary-file (:direction :io :pathname fox)
        (alexandria:copy-stream (first file) sgif)
        (file-position sgif 0)
        (close sgif)
        (fox5:gif-fox5 gif fox)
        (let* ((response (respond (alexandria:read-file-into-byte-vector fox)
                                  :type "application/force-download")))
          (push "attachment; filename=converted.fox" (second response))
          (push :content-disposition (second response))
          response)))))
