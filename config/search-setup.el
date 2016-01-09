(require-package 'projectile)

(projectile-global-mode)

(global-set-key [f2] 'projectile-switch-project)
(global-set-key (kbd "C-.") 'projectile-find-file)

;; Treat cammel case and underscores as word separators
(add-hook 'prog-mode-hook (lambda () (subword-mode 1)))

(provide 'search-setup)
