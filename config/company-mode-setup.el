(require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray"))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "cornsilk3" :foreground "black" :weight bold  :height 110))))
 '(company-tooltip-selection
   ((t (:background "dark orange" :foreground "white"))))
 '(company-tooltip-annotation
   ((t (:foreground "magenta4" :weight medium :slant oblique))))
 '(company-tooltip-annotation-selection
   ((t (:inherit company-tooltip-annotation :foreground "black"))))
 '(company-tooltip-mouse
   ((t (:background "cornsilk2"))))
 '(company-tooltip-common
   ((t (:foreground "orange red"))))
 '(company-tooltip-common-selection
   ((t (:foreground "firebrick"))))
 '(company-tooltip-search
   ((t (:foreground "white" :background "firebrick"))))
 '(company-tooltip-search-selection
   ((t (:inherit company-tooltip-search)))))

(provide 'company-mode-setup)
