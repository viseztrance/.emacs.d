;; -*- lexical-binding: t; -*-

(use-package company
  :init (global-company-mode)
  :config (setq company-format-margin-function nil)
  :custom-face
  (company-preview
   ((t (:foreground "darkgray"))))
  (company-preview-common
   ((t (:inherit default :foreground "slate gray"))))
  (company-tooltip
   ((t (:background "cornsilk3" :foreground "black" :weight bold :height 110))))
  (company-tooltip-selection
   ((t (:background "dark orange" :foreground "white"))))
  (company-tooltip-annotation
   ((t (:foreground "magenta4" :weight medium :slant oblique))))
  (company-tooltip-annotation-selection
   ((t (:inherit company-tooltip-annotation :foreground "black"))))
  (company-tooltip-mouse
   ((t (:background "cornsilk2"))))
  (company-tooltip-common
   ((t (:foreground "orange red"))))
  (company-tooltip-common-selection
   ((t (:foreground "firebrick"))))
  (company-tooltip-search
   ((t (:foreground "white" :background "firebrick"))))
  (company-tooltip-search-selection
   ((t (:inherit company-tooltip-search)))))

(use-package smartparens
  :custom-face
  (sp-pair-overlay-face ((nil :background "gray30")))
  :config (smartparens-global-mode 1))

(provide 'autocomplete-setup)
