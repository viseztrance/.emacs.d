(require 'package)

(defun require-package (name)
  (unless (package-installed-p name)
    (progn
      (package-refresh-contents)
      (package-install name))))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(provide 'package-management-setup)
