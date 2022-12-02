;; -*- lexical-binding: t; -*-

(use-package ivy
  :custom-face
  (ivy-current-match
   ((t (:background "#555" :foreground nil))))
  (ivy-minibuffer-match-face-2
   ((t (:foreground "dark orange" :background nil :weight normal))))
  (ivy-minibuffer-match-face-3
   ((t (:inherit ivy-minibuffer-match-face-2 :background nil))))
  (ivy-minibuffer-match-face-4
   ((t (:inherit ivy-minibuffer-match-face-2 :background nil))))
  (ivy-subdir
   ((t (:weight normal :foreground "#729fcf"))))
  :custom
  ;; Don't close on backspace
  (ivy-on-del-error-function #'ignore)
  (ivy-extra-directories nil)
  ;; Don't show number of matches
  (ivy-count-format "")
  (ivy-height 8)
  :config
  (ivy-mode 1)
  ;; Switch to buffer, not dired view
  (define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done))

(use-package counsel
  :after (ivy)
  :bind
  (("C-." . counsel-git)
   ;; Do a ripgrep search
   ("C-;" . counsel-rg)
   ;; Allow calling M-y repeatedly
   ("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line-call))
  :config (counsel-mode 1))

(use-package flx)

(use-package ivy-rich
  :after (ivy)
  :config
  (ivy-rich-mode 1)
  ;; Cache project name in buffer view
  (ivy-rich-project-root-cache-mode)
  ;; Extend current match background to window width
  (setf (alist-get 't ivy-format-functions-alist)
        #'ivy-format-function-line))

(use-package all-the-icons-ivy-rich
  :init (all-the-icons-ivy-rich-mode 1))

;; Prefer most recent commands
(use-package ivy-prescient
  :after (ivy)
  :config
  (ivy-prescient-mode 1)
  ;; Store between sessions
  (prescient-persist-mode 1)
  ;; Fuzzy autocomplete (can't be initialized earlier)
  (setq ivy-re-builders-alist
        '((ivy-switch-buffer . ivy--regex-plus)
          (t . ivy--regex-fuzzy)))
  (setq ivy-initial-inputs-alist nil))

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
   ((t (:inherit company-tooltip-search))))
  (company-tooltip-scrollbar-thumb
   ((t (:background "#55626f"))))
  (company-tooltip-scrollbar-track
   ((t (:background "slate gray")))))

;; Prefer most recent commands
(use-package company-prescient
  :after (company)
  :config
  (company-prescient-mode 1))

;; Navigate buffers using mouse keys
(global-set-key (kbd "<mouse-9>") 'previous-buffer)
(global-set-key (kbd "<mouse-8>") 'next-buffer)

(use-package smartparens
  :custom-face
  (sp-pair-overlay-face ((nil :background "gray30")))
  :config (smartparens-global-mode 1))

;; Treat cammel case and underscores as word separators
(add-hook 'prog-mode-hook (lambda () (subword-mode 1)))

(use-package drag-stuff
  :init
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

(provide 'navigation-setup)
