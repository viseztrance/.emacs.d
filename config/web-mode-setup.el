(require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(setq web-mode-code-indent-offset 4)
(setq web-mode-markup-indent-offset 4)

(provide 'web-mode-setup)
