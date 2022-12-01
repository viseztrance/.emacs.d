;; -*- lexical-binding: t; -*-

(add-to-list 'load-path "~/.emacs.d/config")

(defun my/load-settings (&rest files)
  (dolist (current-file files)
    (require (intern (format "%s-setup" current-file)))))

(my/load-settings "package"
                  "language-server"
                  "user-interface"
                  "modeline"
                  "misc"
                  "navigation"
                  "version-control")
