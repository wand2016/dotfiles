;;; markdown-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "markdown-mode" "../../../.emacs.d/elpa/markdown-mode-20181112.1529/markdown-mode.el"
;;;;;;  "440652d8da814bc69c0bac83c5eb0277")
;;; Generated autoloads from ../../../.emacs.d/elpa/markdown-mode-20181112.1529/markdown-mode.el

(autoload 'markdown-mode "markdown-mode" "\
Major mode for editing Markdown files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode" "\
Major mode for editing GitHub Flavored Markdown files.

\(fn)" t nil)

(autoload 'markdown-view-mode "markdown-mode" "\
Major mode for viewing Markdown content.

\(fn)" t nil)

(autoload 'gfm-view-mode "markdown-mode" "\
Major mode for viewing GitHub Flavored Markdown content.

\(fn)" t nil)

(autoload 'markdown-live-preview-mode "markdown-mode" "\
Toggle native previewing on save for a specific markdown file.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../.emacs.d/elpa/markdown-mode-20181112.1529/markdown-mode-autoloads.el"
;;;;;;  "../../../.emacs.d/elpa/markdown-mode-20181112.1529/markdown-mode.el")
;;;;;;  (23549 53845 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; markdown-mode-autoloads.el ends here
