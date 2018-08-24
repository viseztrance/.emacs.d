(require-package 'web-mode)

(associate-files 'web ".php" ".html.erb")
(setq web-mode-code-indent-offset 2)
(setq web-mode-markup-indent-offset 2)

(provide 'web-mode-setup)
