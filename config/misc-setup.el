;; Change backup location to the OS temp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't create lock files
(setq create-lockfiles nil)

;; Move files to trash instead of removing them
(setq delete-by-moving-to-trash t)

;; Highlight matching parentheses
(show-paren-mode t)
(set-face-background 'show-paren-match "khaki4")

;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "snow4")

;; Easily toggle whitespace
(global-set-key "\C-cw" 'whitespace-mode)

;; Revert file automatically, when changed outside emacs, and having no local changes
(global-auto-revert-mode t)

;; Use shorter confirmations
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Untabify file on save and delete trailing whitespace
(setq tabbed-modes '(go-mode makefile-gmake-mode))
(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))
(add-hook 'before-save-hook '(lambda ()
                               (progn
                                 (delete-trailing-whitespace)
                                 (unless (member major-mode tabbed-modes)
                                   (untabify-buffer) ()))))
;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)

;; Move custom settings to a separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(if (string-equal system-type "darwin")
  (progn
    (setq mac-control-modifier 'control)
    (setq mac-right-control-modifier 'left)
    (setq mac-command-modifier 'meta)
    (setq mac-right-command-modifier 'left)
    (setq mac-option-modifier 'super)
    (setq mac-right-option-modifier 'none)
    (setq mac-function-modifier 'hyper)))

(setq-default mode-require-final-newline t)

(provide 'misc-setup)
