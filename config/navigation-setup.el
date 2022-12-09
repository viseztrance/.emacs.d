;; -*- lexical-binding: t; -*-

;; https://emacs.stackexchange.com/a/20980
(defmacro ivy-quit-and-run (&rest body)
  "Quit the minibuffer and run BODY afterwards."
  `(progn
     (put 'quit 'error-message "")
     (run-at-time nil nil
                  (lambda ()
                    (put 'quit 'error-message "Quit")
                    ,@body))
     (minibuffer-keyboard-quit)))

(use-package ivy
  :custom-face
  (ivy-current-match
   ((t (:background "#555" :foreground nil))))
  (ivy-minibuffer-match-face-1
   ((t (:foreground "dark orange" :background nil :weight normal))))
  (ivy-minibuffer-match-face-2
   ((t (:inherit ivy-minibuffer-match-face-1 :background nil :weight normal))))
  (ivy-minibuffer-match-face-3
   ((t (:inherit ivy-minibuffer-match-face-1 :background nil :weight normal))))
  (ivy-minibuffer-match-face-4
   ((t (:inherit ivy-minibuffer-match-face-1 :background nil :weight normal))))
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
   ;; Allow calling M-y repeatedly
   ("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("C-." . (lambda ()
              (interactive)
              ;; Do a ripgrep search when calling C-. twice
              ;; Pass over what was already typed
              (let ((current-input (ivy--input)))
                (ivy-quit-and-run (counsel-rg current-input)))))
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
  ;; Fuzzy autocomplete (can't be initialized earlier),
  ;; but don't use it for ripgrep
  (setq ivy-re-builders-alist
        '((ivy-switch-buffer . ivy--regex-plus)
          (counsel-rg . regexp-quote)
          (t . ivy--regex-fuzzy)))
  (setq ivy-initial-inputs-alist nil))

(use-package project
  :bind
  (:map minibuffer-local-map
        ("C-M-%" . (lambda ()
                   (interactive)
                   ;; Calling C-M-% twice does a project wide query replace
                   (ivy-quit-and-run (call-interactively 'project-query-replace-regexp))))))

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

;; Close minibuffer with escape key
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Navigate buffers using mouse keys
(global-set-key (kbd "<mouse-9>") 'previous-buffer)
(global-set-key (kbd "<mouse-8>") 'next-buffer)

(use-package smartparens
  :custom-face
  (sp-pair-overlay-face ((nil :inherit nil)))
  :config (smartparens-global-mode 1))

;; Treat cammel case and underscores as word separators
(add-hook 'prog-mode-hook (lambda () (subword-mode 1)))

(use-package drag-stuff
  :init
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

(provide 'navigation-setup)
