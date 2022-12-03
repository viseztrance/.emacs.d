;; -*- lexical-binding: t; -*-
(use-package eglot
  :bind ("<f2>" . eglot-rename)
  :custom
  ;; Highlights are too distracting
  (eglot-ignored-server-capabilites '(:documentHighlightProvider))
  :config
  ;; Prevent "Active processes exist" message when leaving emacs
  (advice-add 'save-buffers-kill-emacs :before 'eglot-shutdown-all))

;; Don't allow multi line docs
(setq eldoc-echo-area-use-multiline-p nil)

(provide 'language-server-setup)
