(require-package 'web-mode)

(associate-files 'web ".php" ".html.erb")
(setq web-mode-code-indent-offset 4)
(setq web-mode-markup-indent-offset 4)

(provide 'web-mode-setup)
