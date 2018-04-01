(require-package 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(progn (setq flycheck-checkers
                (delq 'emacs-lisp-checkdoc flycheck-checkers))
          (set-face-background 'flycheck-error "VioletRed4")))

(provide 'flycheck-setup)
