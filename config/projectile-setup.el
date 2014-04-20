(require-package 'projectile)

(projectile-global-mode)

(global-set-key [f2] 'projectile-switch-project)
(global-set-key (kbd "C-.") 'projectile-find-file)

(provide 'projectile-setup)
