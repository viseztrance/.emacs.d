(require-package 'magit)
(require 'magit)

(add-hook 'git-commit-mode-hook 'turn-on-flyspell)
(global-set-key [f6] 'magit-status)

(set-face-attribute 'magit-section-highlight nil
                    :background "#444")

(require-package 'exec-path-from-shell)
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(exec-path-from-shell-copy-env "EMAIL")
(exec-path-from-shell-copy-env "GIT_AUTHOR_NAME")

(provide 'git-setup)
