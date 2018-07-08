#|
  This file is a part of quicksource project.
|#

(defsystem "quicksource-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("quicksource"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "quicksource"))))
  :description "Test system for quicksource"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
