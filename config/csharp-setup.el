(require-package 'omnisharp)
(associate-files 'csharp ".cs")

(add-hook 'csharp-mode-hook
          (lambda ()
            (setq-local omnisharp-server-executable-path "~/Software/omnisharp/omnisharp/start.sh")
            (setq-local tab-width 4)
            (setq-local c-basic-offset 4)
            (omnisharp-mode)))

(provide 'csharp-setup)
