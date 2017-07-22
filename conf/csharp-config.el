(when (require 'csharp-mode)
  ;; launch omnisharp-mode when csharp-mode
  (add-hook 'csharp-mode-hook 'omnisharp-mode)

  (when (require 'omnisharp)
	;; server path
	(setq omnisharp-server-executable-path "OmniSharp.exe")


	(define-key omnisharp-mode-map "." 'omnisharp-add-dot-and-auto-complete)))

(provide 'csharp-config)
