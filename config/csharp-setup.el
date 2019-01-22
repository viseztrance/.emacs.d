(require-package 'omnisharp)
(associate-files 'csharp ".cs")

(add-hook 'csharp-mode-hook
          (lambda ()
            (setq-local omnisharp-server-executable-path "~/Software/omnisharp/run")
            (omnisharp-mode)
            (c-set-style "ellemtel")))

(provide 'csharp-setup)
