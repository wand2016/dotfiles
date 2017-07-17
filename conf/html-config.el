;; ========================================
;;  HTMLの設定
;; ========================================

;; HTML編集のデフォルトモードをnxml-modeにする
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . nxml-mode))

;; </を入力すると自動的にタグを閉じる
(setq nxml-slash-auto-complete-flag t)

;; M-TAB, C-M-iでタグを補完する
(setq nxml-bind-meta-tab-to-complete-flag t)

(provide 'html-config)
