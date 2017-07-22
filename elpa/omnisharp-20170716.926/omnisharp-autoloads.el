;;; omnisharp-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "omnisharp" "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp.el"
;;;;;;  "26a4aa2b3bae6c9f95bd85bf7b046acd")
;;; Generated autoloads from ../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp.el

(autoload 'omnisharp-mode "omnisharp" "\
Omnicompletion (intellisense) and more for C# using an OmniSharp
server backend.

\(fn &optional ARG)" t nil)

(autoload 'omnisharp-start-omnisharp-server "omnisharp" "\
Starts an OmniSharp server for a given path to a project file or a directory

\(fn PATH-TO-PROJECT)" t nil)

(autoload 'omnisharp-stop-server "omnisharp" "\
Stops Omnisharp server if running.

\(fn)" t nil)

(autoload 'omnisharp-reload-solution "omnisharp" "\
Restarts omnisharp server on solution last loaded

\(fn)" t nil)

(autoload 'omnisharp-check-alive-status "omnisharp" "\
Shows a message to the user describing whether the
OmniSharpServer process specified in the current configuration is
alive.
\"Alive\" means it is running and not stuck. It also means the connection
to the server is functional - I.e. The user has the correct host and
port specified.

\(fn)" t nil)

(autoload 'omnisharp-check-ready-status "omnisharp" "\
Shows a message to the user describing whether the
OmniSharpServer process specified in the current configuration has
finished loading the solution.

\(fn)" t nil)

(autoload 'omnisharp-install-server "omnisharp" "\
Installs OmniSharp server locally into ~/.emacs/cache/omnisharp/server/$(version)

\(fn REINSTALL)" t nil)

(autoload 'company-omnisharp "omnisharp" "\


\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-auto-complete-actions.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-current-symbol-actions.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-format-actions.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-helm-integration.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-http-utils.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-navigation-actions.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-server-actions.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-server-installation.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-server-management.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-settings.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-solution-actions.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp-utils.el"
;;;;;;  "../../../../.emacs.d/elpa/omnisharp-20170716.926/omnisharp.el")
;;;;;;  (22898 7035 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; omnisharp-autoloads.el ends here
