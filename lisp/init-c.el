;;; init-c.el --- Configure C/C++ modes -*- lexical-binding: t; -*-
;;; Commentary:
;; Emacs is a GNU project written in C... and as a result it's default style is bad.

;;; Code:

(require 'treesit)
(add-to-list 'treesit-language-source-alist
             '(c "https://github.com/tree-sitter/tree-sitter-c"))

(add-to-list 'treesit-language-source-alist
             '(cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.22.0" "src"))

(use-package cc-mode
  :ensure nil
  :init
  (defconst tofu-c-style
    '("gnu"
      (c-basic-offset . 4)
      (c-offsets-alist . ((innamespace . [0])))))
  ;; (case-label . +)))))
  (c-add-style "tofu" tofu-c-style)
  (setq c-default-style '((java-mode . "java")
                          (awk-mode . "awk")
                          (other . "tofu")))
  :bind
  (:map c-mode-base-map
        ;; Why does it rebind that?
        ("<tab>" . indent-for-tab-command)))

(provide 'init-c)

;;; init-c.el ends here
