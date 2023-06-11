;;;; Generates the template for the help file, based on interactive input.
;;;; Ask for heading (name.txt       *name.txt*)
;;;; Table of contents (if provided, generate none if just blank)

(defparameter *test-dir* #P "../../tests")

;; TODO make separator terminate at the last column of the header. e.g.:
;;                                            v
;;*test.txt*                   some description
;;=============================================
;;                                            ^
(defparameter *separator-equal* "============================================================")
(defparameter *separator-dash* "------------------------------------------------------------")

(defun get-title-user ()
  (format t "Enter title: ")
  (let ((title (read-line)))
    title))

(defun get-description ()
  (format t "Enter description ")
  (let ((description (read-line)))
    description))

(defun generate-top-of-file (title description)
  (let ((test-title title)
        (test-description description)) 
    (format nil "*~A*~60T~A" test-title test-description)))

(defun make-template (header toc)
  (format t "~A~%~A" header toc))
