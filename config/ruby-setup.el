(require-package 'chruby)

(require 'chruby)
(chruby "ruby-3")

(require-package 'ruby-tools)

(require 'ruby-tools)

(associate-files 'ruby ".rake" ".thor" "Gemfile" "Rakefile" "Capfile" ".json.jbuilder")
(setq ruby-insert-encoding-magic-comment nil)

;; Indent files automatically
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key "\r" 'newline-and-indent)
            (setq-local dabbrev-abbrev-skip-leading-regexp ":")))

(provide 'ruby-setup)
