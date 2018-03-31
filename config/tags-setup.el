(require-package 'etags-select)

(defun create-tags (&rest extensions)
  (let* ((root
          (substring
           (shell-command-to-string "git rev-parse --show-toplevel")
           0 -1))
         (arguments (substring
                     (mapconcat 'identity
                                (cl-maplist #'(lambda (extension)
                                                (format "-o -name '*.%s'" (cl-first extension)))
                                            extensions) " ")
                     3))
         (command (format "cd %s && find . %s | egrep -v '#|~' | xargs etags -f TAGS" root arguments)))
    (shell-command command)))

(global-set-key [f8] (lambda ()
                       (interactive)
                       (create-tags "rb" "erb" "js" "php" "el")))

(setq etags-select-go-if-unambiguous t)

(global-set-key (kbd "M-.") 'etags-select-find-tag-at-point)

(provide 'tags-setup)
