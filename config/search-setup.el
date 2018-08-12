(require-package 'projectile)

(projectile-mode)
(global-set-key (kbd "C-,") 'projectile-toggle-between-implementation-and-test)
(global-set-key (kbd "C-.") 'projectile-find-file)

;; Treat cammel case and underscores as word separators
(add-hook 'prog-mode-hook (lambda () (subword-mode 1)))

(provide 'search-setup)
