;; Use the dark gnome 3 theme
(defun set-gtk-theme (&optional frame)
  (let ((xid (cdr (assoc 'outer-window-id (frame-parameters frame)))))
    (shell-command (format "xprop -f -id %s _GTK_THEME_VARIANT 8u -set _GTK_THEME_VARIANT 'dark'" xid))))
(add-hook 'after-make-frame-functions 'set-gtk-theme t nil)
(set-gtk-theme)

;; Start maximized
(toggle-frame-maximized)

;; Disable menu / toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Show column position
(column-number-mode 1)

;; Show line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format " %2d ")
(set-face-attribute 'linum nil
                    :foreground "#ccc"
                    :background "#444"
                    :height 80
                    :weight 'ultra-light
                    :box nil)

(set-fringe-mode 0)

;; Remove the scrollbar
(scroll-bar-mode -1)

;; Hide welcome screen
(setq inhibit-startup-screen t)

;; Set color theme
(require-package 'tangotango-theme)
(load-theme 'tangotango t)

(set-face-attribute 'default nil :height 120)
(set-face-background 'region "gray30")

;; Change cursor appearance
(setq-default cursor-type 'bar)
(set-cursor-color "navajo white")

;; Set the mode line
(make-face 'mode-line-position-face)
(make-face 'mode-line-position-large-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-modified-filename-face)
(make-face 'mode-line-readonly-filename-face)
(make-face 'mode-line-major-mode-face)
(make-face 'mode-line-minor-modes-face)

(set-face-attribute 'mode-line nil
                    :height 90
                    :box nil
                    :background "#111")

(set-face-attribute 'mode-line-inactive nil
                    :inherit 'mode-line
                    :background "#333"
                    :box nil
                    :weight 'semi-light)

(set-face-attribute 'mode-line-position-face nil
                    :foreground "dark orange")

(set-face-attribute 'mode-line-position-large-face nil
                    :inherit 'mode-line-position-face
                    :foreground "salmon")

(set-face-attribute 'mode-line-filename-face nil
                    :foreground "#000"
                    :weight 'semi-bold
                    :background "dark orange")

(set-face-attribute 'mode-line-modified-filename-face nil
                    :inherit 'mode-line-filename-face
                    :foreground "#fff")

(set-face-attribute 'mode-line-readonly-filename-face nil
                    :inherit 'mode-line-filename-face
                    :foreground "#fff"
                    :background "darkorange4")

(set-face-attribute 'mode-line-major-mode-face nil
                    :foreground "#eee")

(set-face-attribute 'mode-line-minor-modes-face nil
                    :foreground "#777")

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

;; Make active buffer stand out
(require-package 'auto-dim-other-buffers)
(auto-dim-other-buffers-mode t)
(set-face-attribute 'auto-dim-other-buffers-face nil
                    :background "#394040"
                    :foreground "#ddd")

(provide 'user-interface-setup)
