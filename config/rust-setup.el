(require-package 'rust-mode)

(defun rust-compile()
  (interactive)
  (let ((output (shell-command-to-string (concat "rustc " buffer-file-name))))
    (if (equal output "")
        (message "Compiled %s" buffer-file-name)
      (message output))))

(setenv "LD_LIBRARY_PATH"
        (let ((current-path (getenv "LD_LIBRARY_PATH"))
              (new-path "/usr/local/lib"))
          (if current-path (concat new-path ":" current-path) new-path)))

(add-hook 'rust-mode-hook
          (lambda ()
            (define-key rust-mode-map (kbd "<f5>") 'rust-compile)))

(associate-files 'rust ".rs")

(provide 'rust-setup)
