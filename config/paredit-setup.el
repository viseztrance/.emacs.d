(require-package 'paredit)

(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)

(provide 'paredit-setup)
