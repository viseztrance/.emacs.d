(require-package 'omnisharp)
(associate-files 'csharp ".cs")

(eval-after-load
    'company
  '(add-to-list 'company-backends #'company-omnisharp))

(add-hook 'csharp-mode-hook
          (lambda ()
            (setq-local tab-width 4)
            (setq-local c-basic-offset 4)
            (c-set-offset 'arglist-cont '(c-lineup-arglist-operators 0))
            (omnisharp-mode)))
(provide 'csharp-setup)
