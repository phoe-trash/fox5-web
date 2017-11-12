(in-package :cl-user)
(defpackage fox5-web-test
  (:use :cl :fiveam))
(in-package :fox5-web-test)

(def-suite tests
  :description "fox5-web tests.")
(in-suite tests)

(test simple-test
  (is
   (equal 1 1))
  (is-true
   (and t t)))

(run! 'tests)
