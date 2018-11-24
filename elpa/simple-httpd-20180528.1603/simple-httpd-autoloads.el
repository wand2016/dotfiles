;;; simple-httpd-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "simple-httpd" "../../../.emacs.d/elpa/simple-httpd-20180528.1603/simple-httpd.el"
;;;;;;  "616ea559204f6d05450f29c149b179c9")
;;; Generated autoloads from ../../../.emacs.d/elpa/simple-httpd-20180528.1603/simple-httpd.el

(autoload 'httpd-start "simple-httpd" "\
Start the web server process. If the server is already
running, this will restart the server. There is only one server
instance per Emacs instance.

\(fn)" t nil)

(autoload 'httpd-stop "simple-httpd" "\
Stop the web server if it is currently running, otherwise do nothing.

\(fn)" t nil)

(autoload 'httpd-running-p "simple-httpd" "\
Return non-nil if the simple-httpd server is running.

\(fn)" nil nil)

(autoload 'httpd-serve-directory "simple-httpd" "\
Start the web server with given `directory' as `httpd-root'.

\(fn DIRECTORY)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../.emacs.d/elpa/simple-httpd-20180528.1603/simple-httpd-autoloads.el"
;;;;;;  "../../../.emacs.d/elpa/simple-httpd-20180528.1603/simple-httpd.el")
;;;;;;  (23543 56801 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; simple-httpd-autoloads.el ends here
