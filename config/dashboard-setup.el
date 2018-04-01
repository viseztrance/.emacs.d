(require-package 'dashboard)

(dashboard-setup-startup-hook)

(setq dashboard-items '((recents  . 5)
                        (projects . 5)))

(set-face-attribute 'dashboard-heading-face nil
                    :height 160
                    :weight 'bold)

(provide 'dashboard-setup)
