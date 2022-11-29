;; -*- lexical-binding: t; -*-

(use-package magit
  :hook (git-commit-mode-hook . turn-on-flyspell)
  :bind ("<f6>" . magit-status)
  :custom-face (magit-section-highlight ((nil :background "#444"))))

(provide 'version-control-setup)
