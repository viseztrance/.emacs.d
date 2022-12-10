;; -*- lexical-binding: t; -*-

;; Improve startup time, we set the GC threshold high initially,
;; and revert it back after to keep things responsive
;; https://github.com/purcell/emacs.d/blob/master/init.el
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(add-to-list 'load-path "~/.emacs.d/config")

(defun me/load-settings (&rest files)
  (dolist (current-file files)
    (require (intern (format "%s-setup" current-file)))))

(me/load-settings "package"
                  "language-server"
                  "navigation"
                  "user-interface"
                  "modeline"
                  "misc"
                  "version-control"
                  "font-scaling"

                  "programming"

                  "markdown"
                  "ruby")
