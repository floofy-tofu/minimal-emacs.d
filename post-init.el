;;; post-init.el --- Configure Emacs after minimal emacs.d finishes running -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(require 'tofu-useful-functions)
(require 'init-completion-frameworks)
(require 'init-meow)
(require 'init-magit)

;;; Programming Languages

(use-package treesit-auto
  :ensure t
  :config
  (global-treesit-auto-mode))

;;; post-init.el ends here
