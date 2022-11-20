(require-package 'web-mode)

(associate-files 'web ".php" ".html.erb" ".ui")
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-enable-auto-pairing nil)

(provide 'web-mode-setup)
