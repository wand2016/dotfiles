;;; php-runtime-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "php-runtime" "../../../../.emacs.d/elpa/php-runtime-20181212.1825/php-runtime.el"
;;;;;;  "35d268eb6346b79c3ae56785deeae8a8")
;;; Generated autoloads from ../../../../.emacs.d/elpa/php-runtime-20181212.1825/php-runtime.el

(eieio-defclass-autoload 'php-runtime-execute 'nil "php-runtime" nil)

(autoload 'php-runtime-expr "php-runtime" "\
Evalute and echo PHP expression `PHP-EXPR'.

Pass `INPUT-BUFFER' to PHP executable as STDIN.

\(fn PHP-EXPR &optional INPUT-BUFFER)" nil nil)

(autoload 'php-runtime-eval "php-runtime" "\
Evalute PHP code `CODE' without open tag, and return buffer.

Pass `INPUT-BUFFER' to PHP executable as STDIN.

\(fn CODE &optional INPUT-BUFFER)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/php-runtime-20181212.1825/php-runtime-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/php-runtime-20181212.1825/php-runtime.el")
;;;;;;  (23680 29444 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; php-runtime-autoloads.el ends here
