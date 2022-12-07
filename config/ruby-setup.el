;; -*- lexical-binding: t; -*-

(setq me/ruby-preffered-version nil)

(defun me/ruby-version-from-project ()
  (let ((file (chruby--locate-file ".ruby-version")))
    (if file (chruby--read-version-from-file file))))

(defun me/ruby-latest-installed-version ()
  (car (chruby--available-names)))

(use-package chruby
  :config
  (chruby (or
           me/ruby-preffered-version
           (me/ruby-version-from-project)
           (me/ruby-latest-installed-version))))

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
