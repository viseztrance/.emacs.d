;; Buffer autocompletion

(require-package 'flx-ido)
(require-package 'ido-vertical-mode)

(require 'flx-ido)

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

(set-face-attribute 'flx-highlight-face nil
                    :underline nil)

(ido-mode t)
(flx-ido-mode t)
(ido-vertical-mode t)

(setq ido-use-faces nil)

;; Things get slow on large collections
(setq flx-ido-threshhold 1250)

(provide 'ido-setup)