;; -*- lexical-binding: t; -*-

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package use-package-ensure-system-package)

(use-package no-littering)

(use-package exec-path-from-shell
  :if me/os-mac-p
  :init (exec-path-from-shell-initialize))

(provide 'package-setup)
