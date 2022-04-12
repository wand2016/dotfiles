;;; rainbow-delimiters-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "rainbow-delimiters" "../../../../.emacs.d/elpa/rainbow-delimiters-1.3.21/rainbow-delimiters.el"
;;;;;;  "d0bb0ca4b117d6175871fdae21348ccc")
;;; Generated autoloads from ../../../../.emacs.d/elpa/rainbow-delimiters-1.3.21/rainbow-delimiters.el

(autoload 'rainbow-delimiters-mode "rainbow-delimiters" "\
Highlight nested parentheses, brackets, and braces according to their depth.

\(fn &optional ARG)" t nil)

(autoload 'rainbow-delimiters-mode-enable "rainbow-delimiters" "\


\(fn)" nil nil)

(defvar global-rainbow-delimiters-mode nil "\
Non-nil if Global Rainbow-Delimiters mode is enabled.
See the `global-rainbow-delimiters-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-rainbow-delimiters-mode'.")

(custom-autoload 'global-rainbow-delimiters-mode "rainbow-delimiters" nil)

(autoload 'global-rainbow-delimiters-mode "rainbow-delimiters" "\
Toggle Rainbow-Delimiters mode in all buffers.
With prefix ARG, enable Global Rainbow-Delimiters mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Rainbow-Delimiters mode is enabled in all buffers where
`rainbow-delimiters-mode-enable' would do it.
See `rainbow-delimiters-mode' for more information on Rainbow-Delimiters mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/rainbow-delimiters-1.3.21/rainbow-delimiters-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/rainbow-delimiters-1.3.21/rainbow-delimiters.el")
;;;;;;  (23680 43620 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; rainbow-delimiters-autoloads.el ends here
