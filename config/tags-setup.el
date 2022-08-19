(require 'etags-select)

;; Don't create TAGS for certain folders
(setq projectile-globally-ignored-directories
      '(".git"
        ".sass-cache"
        "coverage"
        "node_packages"
        "node_modules"
        "dist"
        "log"
        "tmp"
        "vendor"
        "build"))

;; Don't preserve tags when moving between projects
(setq tags-add-tables nil)

;; Reload tags without confirmation
(setq tags-revert-without-query 1)
(global-set-key [f8] 'projectile-regenerate-tags)

;; Jump to file directly when a single tag was found
(setq etags-select-go-if-unambiguous t)

(global-set-key (kbd "M-.") 'etags-select-find-tag-at-point)

(provide 'tags-setup)
