(require-package 'expand-region)

(global-set-key (kbd "M-=") 'er/expand-region)
(global-set-key (kbd "M-SPC") 'er/contract-region)

(provide 'selection-setup)
