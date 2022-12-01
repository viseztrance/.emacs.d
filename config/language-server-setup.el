;; -*- lexical-binding: t; -*-

(use-package eglot
  :bind ("C-x C-r" . eglot-rename)
  :custom-face
  (eglot-highlight-symbol-face ((t (:inherit nil))))
  :config
  ;; Prevent "Active processes exist" message when leaving emacs
  (advice-add 'save-buffers-kill-emacs :before 'eglot-shutdown-all))

;; Don't allow multi line docs
(setq eldoc-echo-area-use-multiline-p nil)

(provide 'language-server-setup)
