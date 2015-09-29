(require-package 'js2-mode)
(associate-files 'js2 ".js" ".js.erb")
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
(associate-files 'coffee ".coffee" ".coffee.erb")

(provide 'javascript-setup)
