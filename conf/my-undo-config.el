;; undohist
;; ファイルクローズ後も履歴をさかのぼれる
(when (require 'undohist nil t)
  (undohist-initialize))

;; undo-tree
;; 履歴樹形図
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; point-undo
;; エディタ内迷子防止
(when (require 'point-undo nil t)
  (define-key global-map (kbd "M-[") 'point-undo)
  (define-key global-map (kbd "M-]") 'point-redo))

(setq undohist-ignored-files '(".git/*"))

(provide 'my-undo-config)
