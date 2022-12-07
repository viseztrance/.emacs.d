;; -*- lexical-binding: t; -*-

(setq my/ruby-preffered-version nil)

(defun my/ruby-version-from-project ()
  (let ((file (chruby--locate-file ".ruby-version")))
    (if file (chruby--read-version-from-file file))))

(defun my/ruby-latest-installed-version ()
  (car (chruby--available-names)))

(use-package chruby
  :config
  (chruby (or
           my/ruby-preffered-version
           (my/ruby-version-from-project)
           (my/ruby-latest-installed-version))))

(use-package ruby-mode
  :ensure-system-package
  ((solargraph . "gem install solargraph")
   (rubocop . "gem install rubocop"))
  :hook (ruby-mode . (lambda () (eglot-ensure)))
  :custom
  (ruby-insert-encoding-magic-comment nil)
  (dabbrev-abbrev-skip-leading-regexp ":"))

(use-package smartparens-ruby
  :ensure nil)

(provide 'ruby-setup)
