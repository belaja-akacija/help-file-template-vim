;;;; Generates the template for the help file, based on interactive input.
;;;; Ask for heading (name.txt       *name.txt*)
;;;; Table of contents (if provided, generate none if just blank)

(defparameter *test-dir* #P "../../tests")
(defparameter *separator-equal* #\=)
(defparameter *separator-dash* #\-)

(defun generate-top-of-file ()
  "generates help file header"
  (labels (
           (get-title ()
             (format t "Enter title: ")
             (let ((title (read-line)))
               title))
           (get-description ()
             (format t "Enter description ")
             (let ((description (read-line)))
               description)))
    (let ((title (get-title))
          (description (get-description)))
    (format nil "*~A*~30T~A" title description))))

;; TODO format each entry with "....... |entry|"
;; make sure they line up with each other, regardless of length of entry.
;; take the longest entry and line everything up with that 
;; something along the lines of: (make-string (length longest-entry) :initial-element #\.)
(defun generate-table-of-contents ()
  "generates table of contents, enumerated"
  (format t "Enter table of contents.~%")
  (labels ((enumerate-list (lst i strng)
             (let ((formatted-string "")
                   (temp-string ""))
             (if (string= (car lst) "")
                 (format nil "~A" strng)
               (enumerate-list (cdr lst) (1+ i) (string-concat strng (string (digit-char i)) ". " (car lst) (string #\NewLine)))))))
    (let ((steps '())
          (i 1))
      (loop while (not (string= (car steps) ""))
            do (princ "> ")
            do (push (read-line) steps))
      (setf steps (reverse steps))
      (enumerate-list steps 1 ""))))

(defun make-template (header toc)
  (let ((separator (make-string (length header) :initial-element *separator-equal*)))
    (format t "~A~%~A~%~A" header separator toc)))
