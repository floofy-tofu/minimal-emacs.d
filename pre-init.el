;;; pre-init.el --- After early init but before minimal Emacs init -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

;; I cannot live without this keybind
(global-set-key (kbd "M-o") #'other-window)
;; (keymap-global-set "M-o" #'other-window) ; That one server with Emacs 23 on it

;;; pre-init.el ends here
