;; -*- lexical-binding: t; -*-

;; This changes the size of all fonts to a certain percentage
(defvar my/font-scaling-ratio 1.0)
(defvar my/font-scaling-monitored-faces
  '(default mode-line line-number line-number-current-line company-tooltip))

(defvar-local my/font-scaling-intial-faces-heights
  (mapcar
   (lambda (face-name) (cons face-name (face-attribute face-name :height)))
   my/font-scaling-monitored-faces))

(defun my/font-scaling-update-face-heights ()
  (dolist (face-data my/font-scaling-intial-faces-heights)
    (set-face-attribute (car face-data) nil
                        :height (round (* my/font-scaling-ratio (cdr face-data))))))

(my/font-scaling-update-face-heights)
(if (> my/font-scaling-ratio 1)
    (setq dashboard-startup-banner nil))

(provide 'font-scaling-setup)
