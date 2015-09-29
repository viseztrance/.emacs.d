(require-package 'scss-mode)

(autoload 'scss-mode "scss-mode")
(associate-files 'scss ".scss")

(setq scss-compile-at-save nil) ; Don't compile on each save.

(require-package 'sass-mode)
(associate-files 'sass ".sass")

(provide 'css-setup)
