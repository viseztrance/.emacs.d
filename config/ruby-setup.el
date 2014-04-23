(require-package 'ruby-tools)

(require 'ruby-tools)

(associate-files 'ruby ".rake" ".thor" "Gemfile" "Rakefile" "Capfile")

;; Indent files automatically
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

(provide 'ruby-setup)
