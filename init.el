(add-to-list 'load-path "~/.emacs.d/config")

(defun load-settings (&rest files)
  (dolist (current-file files)
    (require (intern (format "%s-setup" current-file)))))

(load-settings "package-management"
               "user-interface"
               "ido"
               "projectile"
               "flycheck"
               "recent-files"
               "paredit"
               "multiple-cursors"
               "tags"

               "web-mode"
               "javascript"
               "css"
               "common-lisp"

               "misc")
