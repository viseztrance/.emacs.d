(require-package 'ruby-tools)
(require-package 'rvm)

(require 'ruby-tools)

(require 'rvm)
(rvm-use-default)

(associate-files 'ruby ".rake" ".thor" "Gemfile" "Rakefile" "Capfile" ".json.jbuilder")

;; Indent files automatically
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key "\r" 'newline-and-indent)
            (setq-local dabbrev-abbrev-skip-leading-regexp ":")))

(provide 'ruby-setup)
