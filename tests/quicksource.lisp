(defpackage quicksource-test
  (:use :cl
        :quicksource
        :prove))
(in-package :quicksource-test)

;; NOTE: To run this test file, execute `(asdf:test-system :quicksource)' in your Lisp.

(plan 1)
(ok (not (quicksource::repo-is-empty)))
(ok (quicksource::repo-find-yaml-by-name "emacs"))
;;(isnt nil)
;; blah blah blah.

(finalize)
