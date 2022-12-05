;; -*- lexical-binding: t; -*-

(setq my/gc-default-threshold 800000)
;; Improve startup time
(setq gc-cons-threshold (* my/gc-default-threshold 10))

(add-to-list 'load-path "~/.emacs.d/config")

(defun my/load-settings (&rest files)
  (dolist (current-file files)
    (require (intern (format "%s-setup" current-file)))))

(my/load-settings "package"
                  "language-server"
                  "navigation"
                  "user-interface"
                  "modeline"
                  "misc"
                  "version-control"

                  "ruby")

(setq gc-cons-threshold my/gc-default-threshold)
