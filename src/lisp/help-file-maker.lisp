;;;; Generates the template for the help file, based on interactive input.
;;;; Ask for heading (name.txt       *name.txt*)
;;;; Table of contents (if provided, generate none if just blank)

(defparameter *test-dir* #P "../../tests")
(defparameter *separator-equal* #\=)
(defparameter *separator-dash* #\-)

;; are these functions really necessary to be separated from one another?
;; maybe use (labels)?
(defun get-title-user ()
  (format t "Enter title: ")
  (let ((title (read-line)))
    title))

(defun get-description ()
  (format t "Enter description ")
  (let ((description (read-line)))
    description))

(defun generate-top-of-file ()
  (let ((title (get-title-user))
        (description (get-description))) 
    (format nil "*~A*~60T~A" title description)))

(defun generate-table-of-contents ()
  (print "Enter table of contents.")
  (let ((steps '()))
    (loop while (not (string= (car steps) ""))
          do (princ "> ")
          do (push (read-line) steps))
    (setf steps (reverse steps))
    steps))

(defun make-template (header)
  (let ((separator (make-string (length header) :initial-element *separator-equal*)))
    (format t "~A~%~A" header separator)))
