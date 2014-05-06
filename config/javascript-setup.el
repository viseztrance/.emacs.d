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

(provide 'javascript-setup)
