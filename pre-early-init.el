;;; pre-early-init.el --- Pre-Early Init File, native comp and such -*- lexical-binding: t; -*-
;;; Commentary:
;; This file (as of July 25 2026) is not my own; it is taken from
;; https://www.jamescherti.com/compiling-emacs/

;;; Code:

;; gcc -march=native -Q --help=target | grep march
;; Native compilation options

;; Author: James Cherti
;; URL: https://www.jamescherti.com/compiling-emacs/
;; License: MIT

;; (setq native-comp-compiler-options nil)
;; (setq my-cpu-architecture nil)

;; `native-comp-compiler-options' specifies flags passed directly to the C
;; compiler (for example, GCC) when compiling the Lisp-to-C output
;; produced by the native compilation process. These flags affect code
;; generation, optimization, and debugging information.
(setq native-comp-compiler-options `(;; The most meaningful optimizations:
                                     "-O2"
                                     ;; ,(format "-mtune=%s" my-cpu-architecture)
                                     ;; ,(format "-march=%s" my-cpu-architecture)
                                     ;; Reduce .eln size and compilation
                                     ;; overhead.
                                     "-g0"
                                     ;; Good defensive choice for Emacs
                                     ;; stability.
                                     "-fno-omit-frame-pointer"
                                     "-fno-finite-math-only"))

(setq native-comp-driver-options '(;; -Wl,-z,pack-relative-relocs compresses
                                   ;; relocation tables to reduce file size and
                                   ;; slightly improve load times.
                                   "-Wl,-z,pack-relative-relocs"
                                   ;; -Wl,-O2 applies standard linker-level
                                   ;; optimizations (like string merging) to the
                                   ;; generated shared object.
                                   "-Wl,-O2"
                                   ;; -Wl,--as-needed prevents the linker from
                                   ;; recording dependencies on libraries that
                                   ;; are not actually used by the code.
                                   "-Wl,--as-needed"))

(defun my-get-cpu-architecture ()
  "Return the CPU architecture detected via GCC target help output.
The detected value is stored in `my-cpu-architecture' and returned as a
string.
If GCC is not available or no architecture information can be
extracted, the function returns nil."
  (when (executable-find "gcc")
    (with-temp-buffer
      (let ((exit-code (call-process "gcc" nil t nil "-march=native"
                                     "-Q" "--help=target")))
        (when (zerop exit-code)
          (goto-char (point-min))
          (when (re-search-forward
                 "^[[:space:]]*-march=[[:space:]]+\\([^[:space:]]+\\)" nil t)
            (match-string 1)))))))

;; Auto detect the CPU architecture
(when-let* ((cpu-architecture (my-get-cpu-architecture)))
  (add-to-list 'native-comp-compiler-options
               (format "-march=%s" cpu-architecture))
  (add-to-list 'native-comp-compiler-options
               (format "-mtune=%s" cpu-architecture)))


(setq native-comp-driver-options '(;; -Wl,-z,pack-relative-relocs compresses
                                   ;; relocation tables to reduce file size and
                                   ;; slightly improve load times.
                                   "-Wl,-z,pack-relative-relocs"
                                   ;; -Wl,-O2 applies standard linker-level
                                   ;; optimizations (like string merging) to the
                                   ;; generated shared object.
                                   "-Wl,-O2"
                                   ;; -Wl,--as-needed prevents the linker from
                                   ;; recording dependencies on libraries that
                                   ;; are not actually used by the code.
                                   "-Wl,--as-needed"))
;;; pre-early-init.el ends here
