;; -*- lexical-binding: t; -*-

(use-package magit
  :bind ("<f6>" . magit-status)
  :custom-face (magit-section-highlight ((nil :background "#444")))
  :config (add-hook 'git-commit-mode-hook 'turn-on-flyspell))

(provide 'version-control-setup)
