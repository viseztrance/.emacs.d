;; -*- lexical-binding: t; -*-

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
(set-face-background 'show-paren-match "gray30")

;; Show trailing whitespaces
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "snow4")

;; Don't show whitespaces in minibuffer
(add-hook 'minibuffer-setup-hook (lambda () (setq show-trailing-whitespace nil)))

;; Easily toggle whitespace
(global-set-key "\C-cw" 'whitespace-mode)

;; Revert file automatically, when changed outside emacs, and having no local changes
(global-auto-revert-mode t)

;; Use shorter confirmations
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; Align with spaces only
(defadvice align-regexp (around align-regexp-with-spaces)
  "Never use tabs for alignment."
  (let ((indent-tabs-mode nil))
    ad-do-it))
(ad-activate 'align-regexp)

;; Move custom settings to a separate file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Remove default minimize behaviour
(global-unset-key (kbd "C-z"))

;; Files should always have a new line at the end
(setq-default mode-require-final-newline t)

;; Remeber last visited buffer location
(save-place-mode t)

;; Garbage Collector Magic Hack
(use-package gcmh
  :config
  (gcmh-mode 1))

(provide 'misc-setup)
