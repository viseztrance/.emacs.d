;; -*- lexical-binding: t; -*-

(defun me/ruby-file-relative-path ()
  (let ((root (project-root (project-current))))
    (file-relative-name (buffer-file-name) root)))

(defvar me/ruby-testable-locations '("lib/" "app/"))

(defun me/ruby-spec-p ()
  (string-suffix-p "_spec.rb" (buffer-file-name)))

(defun me/ruby-spec-file ()
  (let* ((file-path (me/ruby-file-relative-path))
         (file-path-without-top-dir (s-chop-prefixes me/ruby-testable-locations file-path)))
    (concat (project-root (project-current))
            "spec/"
            (s-chop-suffix ".rb" file-path-without-top-dir)
            "_spec.rb")))

(defun me/ruby-source-file-spec-file-with-dir (file-path-without-top-dir top-dir)
  (concat (project-root (project-current))
          top-dir
          (s-chop-suffix "_spec.rb" file-path-without-top-dir)
          ".rb"))

(defun me/ruby-source-file-from-spec ()
  (let* ((file-path (me/ruby-file-relative-path))
         (file-path-without-top-dir (s-chop-prefix "spec/" file-path)))
    (catch 'early-exit
      (dolist (dir me/ruby-testable-locations)
        (let ((source-file-path (me/ruby-source-file-spec-file-with-dir file-path-without-top-dir dir)))
          (when (file-exists-p source-file-path)
            (throw 'early-exit source-file-path)))))))

(defun me/ruby-jump-to-spec ()
  (let ((spec-file (me/ruby-spec-file)))
    (if (or (file-exists-p spec-file)
            (yes-or-no-p "No spec found. Create one?"))
        (find-file spec-file))))

(defun me/ruby-jump-to-source ()
  (let ((source-file (me/ruby-source-file-from-spec)))
    (if source-file
        (find-file source-file)
      (message "No source file found"))))

(defun me/ruby-jump-to-source-file-or-spec ()
  (interactive)
  (when (project-current)
    (if (me/ruby-spec-p)
        (me/ruby-jump-to-source)
      (me/ruby-jump-to-spec))))

(defvar me/ruby-preffered-version nil)

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
  :bind (:map ruby-mode-map
              ("C-," . me/ruby-jump-to-source-file-or-spec))
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
