(defsystem fox5-web-test
  :author "Michał &quot;phoe&quot; Herda <phoe@teknik.io>"
  :license "BSD 3-clause"
  :description "Tests for fox5-web."
  :depends-on (:fox5-web
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "fox5-web")))))
