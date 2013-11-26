(require-package 'projectile)

(projectile-global-mode)
(global-set-key [f2] 'projectile-find-file)

(provide 'projectile-setup)
