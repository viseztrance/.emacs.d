(require-package 'magit)

(add-hook 'git-commit-mode-hook 'turn-on-flyspell)
(global-set-key [f6] 'magit-status)

(provide 'git-setup)
