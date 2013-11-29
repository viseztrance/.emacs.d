(require-package 'slime)

(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))
(add-hook 'lisp-mode-hook 'slime-mode)

(require 'slime-autoloads)

(eval-after-load 'slime
  '(progn
     (setq inferior-lisp-program (executable-find "sbcl"))
     (slime-setup)
     (setq slime-auto-connect 'always)))

(provide 'common-lisp-setup)
