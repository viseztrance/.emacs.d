;; Searches for files in git root
(require-package 'find-file-in-project)
(global-set-key (kbd "C-.") 'projectile-find-file)

;; Treat cammel case and underscores as word separators
(add-hook 'prog-mode-hook (lambda () (subword-mode 1)))

(provide 'search-setup)
