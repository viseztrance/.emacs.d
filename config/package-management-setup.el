(require 'package)

(defun require-package (name)
  (unless (package-installed-p name)
    (progn
      (package-refresh-contents)
      (package-install name))))

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(provide 'package-management-setup)
