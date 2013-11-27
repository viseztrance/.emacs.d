;; Buffer autocompletion
(require-package 'ido-vertical-mode)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-buffers  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*"))

(ido-mode 1)
(ido-vertical-mode 1)

(provide 'ido-setup)
