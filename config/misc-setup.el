;; Change backup location to the OS temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Highlight matching parentheses
(show-paren-mode t)
;; Auto close matching characters
(electric-pair-mode)

;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)

;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)

(provide 'misc-setup)
