(require 'lsp-mode)
(require 'lsp)
(require 'lsp-clients)
(add-hook 'prog-mode-hook 'lsp)


(require 'lsp-ui)

(setq-default lsp-prefer-flymake nil
              lsp-ui-doc-header t
              lsp-ui-doc-include-signature t
              lsp-ui-doc-max-height 20
              lsp-ui-doc-max-width 30
              lsp-ui-doc-use-childframe nil
              lsp-ui-doc-use-webkit nil)


(require 'company)
(require 'company-lsp)
(push 'company-lsp company-backends)

;; remap definition jump
;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)


(provide 'my-lsp-config)
