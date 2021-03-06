(add-to-list 'load-path "~/.emacs.d/config")

(defun load-settings (&rest files)
  (dolist (current-file files)
    (require (intern (format "%s-setup" current-file)))))

(defun associate-files (mode &rest files)
  (dolist (current-file files)
    (let ((file-match (regexp-quote (format "%s$" current-file)))
          (mode-name (intern (format "%s-mode" mode))))
      (add-to-list 'auto-mode-alist
                   (cons file-match mode-name)))))

(load-settings "package-management"
               "user-interface"
               "ido"
               "git"
               "dashboard"
               "drag-stuff"
               "search"
               "flycheck"
               "smartparens"
               "tags"
               "yasnippet"
               "company-mode"

               "web-mode"
               "ruby"
               "javascript"
               "css"
               "yaml"
               "common-lisp"
               "rust"
               "csharp"
               "shader"
               "toml"
               "slim"

               "misc")
