;;; init-c.el --- Configure C/C++ modes -*- lexical-binding: t; -*-
;;; Commentary:
;; Emacs is a GNU project written in C... and as a result it's default style is bad.

;;; Code:

(add-to-list 'treesit-language-source-alist
             '(c "https://github.com/tree-sitter/tree-sitter-c"))

(add-to-list 'treesit-language-source-alist
             '(cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.22.0" "src"))




(provide 'init-c)

;;; init-c.el ends here
