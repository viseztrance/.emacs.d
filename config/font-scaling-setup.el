;; -*- lexical-binding: t; -*-

;; This changes the size of all fonts to a certain percentage
(defvar me/font-scaling-ratio 1.0)
(defvar me/font-scaling-monitored-faces
  '(default mode-line line-number line-number-current-line company-tooltip))

(defvar-local me/font-scaling-intial-faces-heights
  (mapcar
   (lambda (face-name) (cons face-name (face-attribute face-name :height)))
   me/font-scaling-monitored-faces))

(defun me/font-scaling-update-face-heights ()
  (dolist (face-data me/font-scaling-intial-faces-heights)
    (set-face-attribute (car face-data) nil
                        :height (round (* me/font-scaling-ratio (cdr face-data))))))

(me/font-scaling-update-face-heights)
(if (> me/font-scaling-ratio 1)
    (setq dashboard-startup-banner nil))

(provide 'font-scaling-setup)
