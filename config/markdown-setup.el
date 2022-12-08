(use-package markdown-mode
  :bind ("<f5>" . markdown-toggle-inline-images)
  :custom
  ;; Use syntax highlighting in code blocks ex: ```ruby
  (markdown-fontify-code-blocks-natively t))

(provide 'markdown-setup)
