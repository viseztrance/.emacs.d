;; Buffer autocompletion
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-ignore-buffers  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace" "^\*compilation" "^\*GTAGS" "^session\.*"))
(ido-mode 1)

(provide 'ido-setup)
