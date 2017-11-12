(asdf:defsystem #:fox5-web
  :author "Michał \"phoe\" Herda <phoe@teknik.io>"
  :maintainer "Michał \"phoe\" Herda <phoe@teknik.io>"
  :license "BSD 3-clause"
  :version "0.1"
  :homepage "https://github.com/phoe/fox5-web"
  :bug-tracker "https://github.com/phoe/fox5-web/issues"
  :source-control (:git "git@github.com:phoe/fox5-web.git")
  :depends-on (#:asdf-linguist
               #:lucerne
               #:fox5
               #:clack)
  :defsystem-depends-on (#:asdf-linguist)
  :components ((:module "assets"
                :components
                ((:module "css"
                  :components
                  ((:sass "style")))
                 (:module "js"
                  :components
                  ((:static-file "scripts.js")))))
               (:module "src"
                :serial t
                :components
                ((:file "fox5-web"))))
  :description "Web frontend for the FOX5 library"
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md"))
  :in-order-to ((test-op (test-op fox5-web-test))))
