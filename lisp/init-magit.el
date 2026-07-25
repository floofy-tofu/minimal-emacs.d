;;; init-magit.el --- Initialize magit -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(use-package magit
  :ensure t
  :bind
  (("C-x g" . magit-status)
   :map magit-mode-map
   ("<deletechar>" . magit-delete-thing)))
(provide 'init-magit)

;;; init-magit.el ends here
