;; -*- lexical-binding: t; -*-

;; Keep track if we're in active window,
;; so we can set different font faces later
;; https://emacs.stackexchange.com/a/26345

(defvar me/selected-window nil)

(defun me/record-selected-window ()
  (unless (string-match "\\*Minibuf" (buffer-name))
    (setq me/selected-window (selected-window))))

(defun me/selected-window-update ()
  (force-mode-line-update t))

(defun me/selected-window-p ()
  (eq me/selected-window (selected-window)))

(defun me/selected-window-update-font-face-state (face-name)
  (if (me/selected-window-p)
      (intern face-name)
    (intern (concat face-name "-inactive"))))

(add-hook 'post-command-hook 'me/record-selected-window)
(add-hook 'buffer-list-update-hook 'me/selected-window-update)

;; Show file or buffer name in frame title bar
(setq-default frame-title-format
              '(:eval (if buffer-file-truename (abbreviate-file-name buffer-file-truename) "%b")))

;; Use a nicer titlebar on macosx
(use-package ns-auto-titlebar
  :if me/os-mac-p
  :config
  (ns-auto-titlebar-mode))

;; Show column position
(column-number-mode 1)

(global-display-line-numbers-mode 1)

(set-face-attribute 'line-number nil
                    :foreground "#ccc"
                    :background "#444"
                    :height 110
                    :weight 'regular
                    :box nil)

(set-fringe-mode 0)

;; Highlight current line number
(set-face-attribute 'line-number-current-line nil
                    :foreground "#444"
                    :background "#ccc"
                    :height 110
                    :weight 'semi-bold
                    :box nil)

(use-package all-the-icons
  :config
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t)))

;; Install font if it does not exist
(unless (find-font (font-spec :name "Red Hat Mono"))
  (let ((font-install-directory
         (if me/os-mac-p
             "/Library/Fonts/"
           "~/.local/share/fonts/")))
    (unless (file-directory-p font-install-directory)
      (mkdir font-install-directory t))
    (message "Copying theme fonts ...")
    (dolist (file (directory-files "~/.emacs.d/resources/fonts/RedHatMono" t ".ttf"))
      (copy-file file (concat font-install-directory (file-name-nondirectory file))))
    (message "Refreshing font cache ...")
    (shell-command-to-string (format "fc-cache -f -v"))))

;; Set color theme
(use-package tangotango-theme
  :custom-face
  (default ((nil :height 150 :font "Red Hat Mono")))
  (error ((t (:foreground "indian red" :weight bold))))
  (font-lock-function-name-face ((nil :weight semi-bold)))
  (font-lock-keyword-face ((nil :weight semi-bold)))
  (vertical-border ((nil :foreground "#111")))
  (region ((nil :background "gray30")))
  (highlight ((nil :inherit 'region :foreground "#2e3434" :background "dark orange")))
  :config
  (load-theme 'tangotango t))

;; Change minibuffer background
(defun me/theme-minibuffer-background ()
  (set (make-local-variable 'face-remapping-alist)
       '((default :background "#333"))))
(add-hook 'minibuffer-setup-hook 'me/theme-minibuffer-background)

;; Don't increase minibuffer spacing
(defun set-bigger-spacing ()
  (setq-local default-text-properties '(line-spacing 0.05 line-height 1.05)))
(add-hook 'text-mode-hook 'set-bigger-spacing)
(add-hook 'prog-mode-hook 'set-bigger-spacing)

;; Change cursor appearance
(setq-default cursor-type 'bar)
(set-cursor-color "navajo white")
(blink-cursor-mode 0)

(use-package dashboard
  :init
  ;; Move cursor on first entry
  (add-hook 'emacs-startup-hook #'dashboard-section-1)
  :custom
  (dashboard-center-content t)
  (dashboard-startup-banner 3)
  (dashboard-banner-logo-title nil)
  (dashboard-set-heading-icons t)
  (dashboard-set-footer nil)
  (dashboard-set-file-icons t)
  (dashboard-items '((recents  . 5)
                     (projects . 5)))
  (dashboard-projects-backend 'project-el)
  :custom-face
  (dashboard-items-face ((nil (:height 160))))
  :config
  (dashboard-setup-startup-hook))

;; Make active buffer stand out
(use-package dimmer
  :custom (dimmer-fraction 0.2)
  :config
  (dimmer-configure-magit)
  (dimmer-mode t))

(provide 'user-interface-setup)
