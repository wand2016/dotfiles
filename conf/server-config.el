;; invoke emacs server
;; for emacsclient
(require 'server)
(unless (server-running-p)
  (server-start))

(provide 'server-config)
