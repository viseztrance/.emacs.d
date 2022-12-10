;; -*- lexical-binding: t; -*-

;; Based on https://stackoverflow.com/a/12635317
(defun me/rename-active-buffer ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name (window-buffer me/selected-window)))
        (name (buffer-name (window-buffer me/selected-window))))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (cond ((get-buffer new-name)
               (message "A buffer named '%s' already exists!" new-name))
              (t
               (rename-file name new-name 1)
               (rename-buffer new-name)
               (set-visited-file-name new-name)
               (set-buffer-modified-p nil)))))))

;; Calling rename active buffer interactively uses a dialog,
;; so we want to prevent this and rely on ivy
(setq use-dialog-box nil)

;; (buffer-file-name (window-buffer me/selected-window))
(use-package eglot
  :bind
  (("<f2>" . eglot-rename)
   :map minibuffer-local-map
   ("<f2>" . (lambda ()
               (interactive)
               (me/ivy-quit-and-run (call-interactively 'me/rename-active-buffer)))))
  :custom
  ;; Highlights are too distracting
  (eglot-ignored-server-capabilites '(:documentHighlightProvider))
  :config
  ;; Prevent "Active processes exist" message when leaving emacs
  (advice-add 'save-buffers-kill-emacs :before 'eglot-shutdown-all))

;; Don't allow multi line docs
(setq eldoc-echo-area-use-multiline-p nil)

(provide 'language-server-setup)
