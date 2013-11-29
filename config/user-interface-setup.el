;; Set color theme
(require-package 'tangotango-theme)
(load-theme 'tangotango t)

(set-face-attribute 'default nil :height 120)
(set-face-background 'region "gray30")

(add-hook 'post-command-hook
          (lambda ()
            (let ((color
                   (if (buffer-modified-p) "white" "gray")))
              (set-face-attribute 'mode-line-buffer-id nil :foreground color))))

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
