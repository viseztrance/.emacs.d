(require-package 'markdown-mode)

;; Use syntax highlighting in code blocks ex: ```ruby
(setq markdown-fontify-code-blocks-natively t)

(add-hook 'markdown-mode-hook
          (lambda ()
            (local-set-key [f5] 'markdown-toggle-inline-images)))
(provide 'markdown-setup)
