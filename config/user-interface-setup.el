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

;; Set color theme
(require-package 'tangotango-theme)
(load-theme 'tangotango t)

;; Set the mode line
(set-face-attribute 'default nil :height 120)
(set-face-background 'region "gray30")

(make-face 'mode-line-position-face)
(make-face 'mode-line-position-large-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-modified-filename-face)
(make-face 'mode-line-readonly-filename-face)
(make-face 'mode-line-major-mode-face)
(make-face 'mode-line-minor-modes-face)

(set-face-attribute 'mode-line-position-face nil
                    :foreground "dark orange")

(set-face-attribute 'mode-line-position-large-face nil
                    :inherit 'mode-line-position-face
                    :foreground "salmon")

(set-face-attribute 'mode-line-filename-face nil
                    :foreground "#000"
                    :background "dark orange")

(set-face-attribute 'mode-line-modified-filename-face nil
                    :inherit 'mode-line-filename-face
                    :foreground "#fff")

(set-face-attribute 'mode-line-readonly-filename-face nil
                    :inherit 'mode-line-filename-face
                    :foreground "#fff"
                    :background "darkorange4")

(set-face-attribute 'mode-line-major-mode-face nil
                    :foreground "#999")

(set-face-attribute 'mode-line-minor-modes-face nil
                    :foreground "#555")

(setq-default
 mode-line-format
 '(
   (:eval (propertize "  %b  " 'face (cond (buffer-read-only 'mode-line-readonly-filename-face)
                                       ((buffer-modified-p) 'mode-line-modified-filename-face)
                                       (t 'mode-line-filename-face))))
   (:eval (propertize " %3c  " 'face (if  (>= (current-column) 80)
                                        'mode-line-position-large-face
                                      'mode-line-position-face)))
   (:propertize mode-name face mode-line-major-mode-face)
   (:eval (propertize (format-mode-line minor-mode-alist) 'face 'mode-line-minor-modes-face))
   (vc-mode vc-mode)))

(set-face-background 'modeline-inactive "#ccc")

(provide 'user-interface-setup)
