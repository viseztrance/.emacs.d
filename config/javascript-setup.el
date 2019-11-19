(associate-files 'js ".js" ".js.erb" ".jsx")

(setq-default js2-global-externs '("module"
                                   "require"
                                   "jQuery"
                                   "$"
                                   "setTimeout"
                                   "clearTimeout"
                                   "setInterval"
                                   "clearInterval"
                                   "console"
                                   "JSON"))

(require-package 'coffee-mode)

(setq-default js-basic-offset 2)
(associate-files 'coffee ".coffee" ".coffee.erb")

(add-hook 'js-mode-hook 'js2-minor-mode)

(provide 'javascript-setup)
