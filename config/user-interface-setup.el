;; Set color theme
(add-to-list 'load-path "~/.emacs.d/themes")
(require 'color-theme)
(load "color-theme-tango")
(color-theme-tango)
(set-face-attribute 'default nil :height 120)

;; Disable menu / toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Show column position
(column-number-mode 1)

;; Show line numbers
(require 'linum)
(global-linum-mode 1)

;; Remove the scrollbar
(scroll-bar-mode -1)

;; Hide welcome screen
(setq inhibit-startup-screen t)

(provide 'user-interface-setup)
