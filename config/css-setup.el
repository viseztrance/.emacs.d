(require-package 'scss-mode)

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(setq scss-compile-at-save nil) ; Don't compile on each save.

(provide 'css-setup)
