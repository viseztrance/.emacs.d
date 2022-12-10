;; Highlight TODO and similar strings

(make-face 'me/todo-note-face)
(set-face-attribute 'me/todo-note-face nil
                    :inherit 'default
                    :weight 'bold
                    :foreground "medium sea green")

(use-package hl-todo
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("NOTE"       me/todo-note-face)
          ("DEPRECATED" font-lock-doc-face bold))))

;; Untabify file on save and delete trailing whitespace
(setq tabbed-modes '(go-mode makefile-gmake-mode))
(defun me/untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))
(add-hook 'before-save-hook #'(lambda ()
                                (progn
                                  (delete-trailing-whitespace)
                                  (unless (member major-mode tabbed-modes)
                                    (me/untabify-buffer) ()))))

(provide 'programming-setup)
