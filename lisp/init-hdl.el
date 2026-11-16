;;; init-hdl.el --- HDL and such -*- lexical-binding: t; -*-
;;; Commentary:

;;; Code:

(require 'flymake-verilator)

(use-package verilog-mode
  :ensure nil
  :bind
  (:map verilog-mode-map
        ;; While verilog-mode is awesome, it has some awful defaults
        (";" . nil)))

(provide 'init-hdl)

;;; init-hdl.el ends here
