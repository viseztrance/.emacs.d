;; Buffer autocompletion

(require-package 'flx-ido)
(require-package 'ido-vertical-mode)

(require 'flx-ido)

(setq ido-everywhere t)
(setq ido-ignore-buffers  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*"))

(ido-mode t)
(flx-ido-mode t)
(ido-vertical-mode t)

(setq ido-use-faces nil)

(provide 'ido-setup)