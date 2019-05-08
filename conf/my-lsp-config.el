(require 'lsp-mode)
(require 'lsp)
(require 'lsp-clients)
(add-hook 'prog-mode-hook 'lsp)


(require 'lsp-ui)
(setq-default lsp-ui-doc-max-width 40
              lsp-ui-doc-max-height 10
              lsp-ui-flycheck-enable t
              lsp-ui-peek-enable t)

(require 'company)
(require 'company-lsp)
(push 'company-lsp company-backends)


;; ...

(provide 'my-lsp-config)
