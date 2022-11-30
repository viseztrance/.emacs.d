;; -*- lexical-binding: t; -*-

(ido-mode t)
(setq ido-use-faces nil)
(setq ido-everywhere t)
(setq ido-ignore-buffers '("\\` "
                           "^\*Mess"
                           "^\*Back"
                           ".*Completion"
                           "^\*Ido"
                           "^\*trace"
                           "^\*compilation"
                           "^\*GTAGS"
                           "^\*magit-process"
                           "^\*Flycheck"
                           "^session\.*"))

(use-package flx-ido
  :custom
  (flx-ido-threshhold 3000) ; Things get slow on large collections
  :custom-face
  (flx-highlight-face ((nil :underline nil)))
  :config
  (flx-ido-mode t))

(use-package ido-vertical-mode
  :config (ido-vertical-mode t))

(use-package projectile
  :bind
  ("C-," . projectile-toggle-between-implementation-and-test)
  ("C-." . projectile-find-file)
  :config
  (projectile-mode))

;; Treat cammel case and underscores as word separators
(add-hook 'prog-mode-hook (lambda () (subword-mode 1)))

(use-package drag-stuff
  :init
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

(provide 'navigation-setup)
