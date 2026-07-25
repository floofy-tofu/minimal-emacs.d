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


;;; Native Compile Everything
(use-package compile-angel
  :ensure t
  :demand t
  :config
  ;; Set `compile-angel-verbose' to nil to disable compile-angel messages.
  ;; (When set to nil, compile-angel won't show which file is being compiled.)
  (setq compile-angel-verbose t)

  ;; The following directive prevents compile-angel from compiling your init
  ;; files. If you choose to remove this push to `compile-angel-excluded-path-suffixes'
  ;; and compile your pre/post-init files, ensure you understand the
  ;; implications and thoroughly test your code. For example, if you're using
  ;; the `use-package' macro, you'll need to explicitly add:
  ;; (eval-when-compile (require 'use-package))
  ;; at the top of your init file.
  (push "/init.el" compile-angel-excluded-path-suffixes)
  (push "/early-init.el" compile-angel-excluded-path-suffixes)
  (push "/pre-early-init.el" compile-angel-excluded-path-suffixes)
  (push "/pre-init.el" compile-angel-excluded-path-suffixes)
  (push "/post-init.el" compile-angel-excluded-path-suffixes)
  
  ;; Uncomment the line below to compile automatically when an Elisp file is saved
  ;; (add-hook 'emacs-lisp-mode-hook #'compile-angel-on-save-local-mode)

  ;; A global mode that compiles .el files when they are loaded
  ;; using `load' or `require'.
  (compile-angel-on-load-mode 1))


;; Ensure that the value of `savehist-file` is updated before proceeding
(with-eval-after-load "savehist"
  (push (concat "/" (file-name-nondirectory savehist-file))
        compile-angel-excluded-path-suffixes))

;; Ensure that the value of `recentf-save-file` is updated before proceeding
(with-eval-after-load "recentf"
  (push (concat "/" (file-name-nondirectory recentf-save-file))
        compile-angel-excluded-path-suffixes))

;; Ensure that the value of `custom-file` is updated before proceeding
(with-eval-after-load "cus-edit"
  (when (stringp custom-file)
    (push (concat "/" (file-name-nondirectory custom-file))
          compile-angel-excluded-path-suffixes)))

;;; post-init.el ends here
