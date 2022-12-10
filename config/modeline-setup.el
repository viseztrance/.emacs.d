;; -*- lexical-binding: t; -*-

;; Update modeline inactive face based on the active window
(defun me/selected-window-update ()
  (force-mode-line-update t))

(defun me/selected-window-p ()
  (eq me/selected-window (selected-window)))

(defun me/selected-window-update-font-face-state (face-name)
  (if (me/selected-window-p)
      (intern face-name)
    (intern (concat face-name "-inactive"))))

(add-hook 'buffer-list-update-hook 'me/selected-window-update)

(make-face 'me/mode-line-position-face)
(make-face 'me/mode-line-position-face-inactive)

(make-face 'me/mode-line-position-large-face)
(make-face 'me/mode-line-position-large-face-inactive)

(make-face 'me/mode-line-filename-face)
(make-face 'me/mode-line-filename-face-inactive)

(make-face 'me/mode-line-modified-filename-face)
(make-face 'me/mode-line-modified-filename-face-inactive)

(make-face 'me/mode-line-readonly-filename-face)
(make-face 'me/mode-line-readonly-filename-face-inactive)

(set-face-attribute 'mode-line nil
                    :height 110
                    :box '(:line-width 1 :color "#111")
                    :background "#111")
(set-face-attribute 'mode-line-inactive nil
                    :inherit 'mode-line
                    :background "#232323"
                    :box '(:line-width 1 :color "#232323")
                    :weight 'semi-light)

(set-face-attribute 'me/mode-line-position-face nil
                    :foreground "dark orange")
(set-face-attribute 'me/mode-line-position-face-inactive nil
                    :foreground "#b18f65"
                    :inherit 'me/mode-line-position-face)

(set-face-attribute 'me/mode-line-position-large-face nil
                    :inherit 'me/mode-line-position-face
                    :weight 'bold
                    :foreground "firebrick3")
(set-face-attribute 'me/mode-line-position-large-face-inactive nil
                    :foreground "#994c4c"
                    :inherit 'me/mode-line-position-large-face)

(set-face-attribute 'me/mode-line-filename-face nil
                    :foreground "#000"
                    :weight 'semi-bold
                    :box '(:line-width 1 :color "dark orange")
                    :background "dark orange")
(set-face-attribute 'me/mode-line-filename-face-inactive nil
                    :background "#b18f65"
                    :box '(:line-width 1 :color "#b18f65")
                    :inherit 'me/mode-line-filename-face)

(set-face-attribute 'me/mode-line-modified-filename-face nil
                    :inherit 'me/mode-line-filename-face
                    :foreground "#fff")
(set-face-attribute 'me/mode-line-modified-filename-face-inactive nil
                    :inherit 'me/mode-line-filename-face-inactive
                    :foreground "#eee")

(set-face-attribute 'me/mode-line-readonly-filename-face nil
                    :inherit 'me/mode-line-filename-face
                    :foreground "#fff"
                    :box '(:line-width 1 :color "darkorange4")
                    :background "darkorange4")
(set-face-attribute 'me/mode-line-readonly-filename-face-inactive nil
                    :inherit 'me/mode-line-readonly-filename-face
                    :foreground "#ccc"
                    :box '(:line-width 1 :color "#4b3622")
                    :background "#4b3622")

(defun me/mode-line-buffer-name ()
  (propertize  "  %b  " 'face (me/selected-window-update-font-face-state
                               (cond (buffer-read-only "me/mode-line-readonly-filename-face")
                                     ((buffer-modified-p) "me/mode-line-modified-filename-face")
                                     (t "me/mode-line-filename-face")))))
(defun me/mode-line-loc ()
  (propertize " %3c  " 'face (me/selected-window-update-font-face-state
                              (if (>= (current-column) 80)
                                  "me/mode-line-position-large-face"
                                "me/mode-line-position-face"))))
(defun me/mode-line-project-name ()
  (let ((project-name (me/mode-line-calculate-project-name)))
    (when project-name
      (concat
       (propertize (format "%s"
                           (all-the-icons-icon-for-mode major-mode :height 0.8 :v-adjust 0.01)))
       (propertize (format " %s    " project-name))))))

(defun me/mode-line-calculate-project-name ()
  (let ((project-name (project-current)))
    (when project-name
      (file-name-nondirectory (directory-file-name (project-root project-name))))))

;; Poll git for changes (has overhead)
(setq auto-revert-check-vc-info t)

(defun me/mode-line-version-control ()
  (when vc-mode
    (let* ((icon-color (cond ((string-match-p "Git:" vc-mode)
                              (if (me/selected-window-p) "dark orange" "#c5863a"))
                             ((string-match-p "Git!" vc-mode)
                              (if (me/selected-window-p) "firebrick3" "#994c4c"))
                             (t "#777")))
           (branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
      (concat
       (propertize (format "%s" (all-the-icons-octicon "git-branch"))
                   'face `(:height 1.2 :foreground ,icon-color :family ,(all-the-icons-octicon-family))
                   'display '(raise 0))
       (propertize (format " %s" branch))))))

(defun me/mode-line-calculate-font-ratio ()
  (let ((base-font-width (frame-char-width))
        (mode-line-width (window-font-width nil 'mode-line)))
    (/ (float mode-line-width) base-font-width)))

(setq me/mode-line-font-ratio (me/mode-line-calculate-font-ratio))

(defun me/mode-line-calculate-branch-name ()
  (when vc-mode
    (let ((text (substring-no-properties vc-mode)))
      (when (string-match "Git\[-!:]\\(.*\\)" text)
        (match-string 1 text)))))

(defun me/mode-line-visible-branch-name ()
  (let ((branch-name (me/mode-line-calculate-branch-name)))
    (if branch-name (format "        %s" branch-name) "")))

(defun me/mode-line-visible-project-name ()
  (let ((project-name (me/mode-line-calculate-project-name)))
    (if project-name (format "   %s" project-name) "")))

(defun me/mode-line-align-right-spacer (&rest items)
  ;; The modeline fonts have a different size than the buffer, so we need to adjust using the size ratio
  (let ((right-items-size (* (string-width (apply 'concat items)) me/mode-line-font-ratio)))
    (propertize " "
                'display `((space :align-to (- (+ right right-fringe right-margin) ,right-items-size))))))

(setq-default mode-line-format
              '("%e" (:eval (concat
                             (me/mode-line-buffer-name)
                             (me/mode-line-loc)
                             (me/mode-line-align-right-spacer
                              (me/mode-line-visible-branch-name)
                              (me/mode-line-visible-project-name))
                             (me/mode-line-project-name)
                             (me/mode-line-version-control)))))
(provide 'modeline-setup)
