;;;;
;;;; This is quicksource.lisp, the quickstart file for Quicklisp. To use
;;;; it, start Lisp, then (ql:quickload :quicksource)
;;;;
;;;; Quicksource is beta software and comes with no warranty of any kind.
;;;;
;;;; For more information about the Quicklisp beta, see:
;;;;
;;;;    https://github.com/betaFunction/quicksource
;;;;
;;;; If you have any questions or comments about Quicksource, please
;;;; contact:
;;;;
;;;;    luoxing <xingfe123@gmail.com>
;;;;

(cl:in-package #:cl-user)
(cl:defpackage #:quicksource
  (:use #:cl))

(cl:in-package #:quicksource)
;;
(defun repo-path()
  (cl-fad:directory-exists-p #p"~/setup/"))
(defun repo-is-empty()
  (not (repo-path)))



(defun repo-find-yaml-by-name(name)
  (when (not (repo-is-empty))
	(cl-fad:merge-pathnames-as-file
	 (repo-path) (format nil "~A.sh" name))))
	 

(defun eval-yaml(path)
  (cl-cwd:with-cwd (ensure-directories-exist #p"~/.quicksource/") ;;; no create 
	(sb-ext:run-program "/bin/bash" 
					  (list (namestring path)) ;;;; "-c " Permission denied ???
					  :input nil
					  :output *standard-output*)))



(defun quickstart()
  "init manager  git clone git@github.com:betaFunction/setup.git -c ~/setup"
  )

(defun quickload(name)
  (when (repo-is-empty)
	(quickstart))
  
  (let ((yaml (repo-find-yaml-by-name name)))
	(if yaml
		(eval-yaml yaml)
		(format t "no found package ~A" name))))

(defclass source-package-info()
	(name))
(defun make-source-package(&key name version configure depends-on)
  (make-instance 'source-package-info
				 ))

;;; End of quicklisp.lisp
