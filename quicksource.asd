#|
  This file is a part of quicksource project.
|#


;; push  ql:*local-project-directories* 
(defsystem "quicksource"
  :version "0.0.1"
  :author "luoxing xingfe123@gmail.com"
  :license "GPL"
  :depends-on ( "cl-fad" "cl-git" "cl-cwd")
  :components ((:module "src"
                :components
                ((:file "quicksource"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "quicksource-test"))))
