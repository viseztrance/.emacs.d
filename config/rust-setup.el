(require-package 'rust-mode)
(associate-files 'rust ".rs")

(require-package 'flycheck-rust)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(require-package 'racer)
(setq racer-cmd "~/.cargo/bin/racer")
(setq racer-rust-src-path "~/Sources/rust/src")

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(provide 'rust-setup)
