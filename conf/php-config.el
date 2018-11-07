;; 拡張子jsのファイルを開いたときjs2-modeに
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; インデントの設定
(defun php-indent-hook ()
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (c-set-offset 'case-label '+)    ; switch文のcaseラベル
  (c-set-offset 'arglist-intro '+) ; 配列の最初の要素が改行した場合
  (c-set-offset 'arglist-close 0)  ; 配列の閉じ括弧
  (setq php-mode-force-pear t))  


;; コメントを行コメに
(defun php-comment-hook ()
  (setq comment-start "//")
  (setq comment-end ""))


(add-hook 'php-mode-hook 'php-indent-hook)
(add-hook 'php-mode-hook 'php-comment-hook)

(provide 'php-config)
