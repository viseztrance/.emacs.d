(require-package 'scss-mode)

(autoload 'scss-mode "scss-mode")
(associate-files 'scss ".scss")

(setq scss-compile-at-save nil) ; Don't compile on each save.

(provide 'css-setup)
