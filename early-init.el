;; -*- lexical-binding: t; -*-

(defvar my/cachedir (expand-file-name "var/" user-emacs-directory))

;; Change eln-cache location
(when (boundp 'native-comp-eln-load-path)
  (setcar native-comp-eln-load-path
          (concat my/cachedir "eln-cache")))

;; Visual transition is a bit jaring so we update the window size as soon as possible
;; Disable menu / toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)

;; Remove the scrollbar
(scroll-bar-mode -1)

;; Start maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))
