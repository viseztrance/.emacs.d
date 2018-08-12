(require-package 'magit)
(require 'magit)

(add-hook 'git-commit-mode-hook 'turn-on-flyspell)
(global-set-key [f6] 'magit-status)

(set-face-attribute 'magit-section-highlight nil
                    :background "#444")

(provide 'git-setup)
