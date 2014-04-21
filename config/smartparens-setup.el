(require-package 'smartparens)

(require 'smartparens-config)
(smartparens-global-mode 1)

(set-face-attribute 'sp-pair-overlay-face nil
                    :background "gray30")

(provide 'smartparens-setup)
