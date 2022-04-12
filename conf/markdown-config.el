(require 'markdown-preview-mode)

;; localstackと9000がぶつかるので変えた
(setq markdown-preview-http-port 19000)
(setq markdown-command "runpandoc")
(setq markdown-use-pandoc-style-yaml-metadata t)

;; ショッキングピンクとか使ってて見た目がやばいので変える
(setq markdown-preview-stylesheets nil)

(provide 'markdown-config)
