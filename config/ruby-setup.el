(require-package 'ruby-tools)

(require 'ruby-tools)

(associate-files 'ruby ".rake" ".thor" "Gemfile" "Rakefile" "Capfile" ".json.jbuilder")

;; Indent files automatically
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key "\r" 'newline-and-indent)
            (setq-local dabbrev-abbrev-skip-leading-regexp ":")))

(provide 'ruby-setup)
