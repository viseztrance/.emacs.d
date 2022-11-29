;; -*- lexical-binding: t; -*-

(setq recentf-save-file (concat my/cachedir "recentf"))

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
  :custom-face
  (flx-highlight-face ((nil :underline nil)))
  :config
  (setq flx-ido-threshhold 3000) ; Things get slow on large collections
  (setq ido-save-directory-list-file (concat my/cachedir "ido.last"))
  (flx-ido-mode t))

(use-package ido-vertical-mode
  :config (ido-vertical-mode t))

(use-package projectile
  :bind
  ("C-," . projectile-toggle-between-implementation-and-test)
  ("C-." . projectile-find-file)
  :init
  (setq projectile-known-projects-file (concat my/cachedir "projectile-bookmarks.eld"))
  :config
  (projectile-mode))

;; Treat cammel case and underscores as word separators
(add-hook 'prog-mode-hook (lambda () (subword-mode 1)))

(use-package drag-stuff
  :init
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))

(provide 'navigation-setup)
