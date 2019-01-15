;; 拡張子phpのファイルを開いたときにphp-modeに。
;; TODO
;; blade.phpはbladeテンプレートなので除く
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

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

;; companyによる補完
(defun php-company-hook ()
  (require 'company-php)
  (company-mode t)
  (ac-php-core-eldoc-setup) ;; enable eldoc
  (make-local-variable 'company-backends)
  (add-to-list 'company-backends 'company-ac-php-backend)
  ; 定義にジャンプ
  (define-key php-mode-map  (kbd "M-.") 'ac-php-find-symbol-at-point)
  ; ジャンプ先から戻る
  (define-key php-mode-map  (kbd "M-,") 'ac-php-location-stack-back))


(add-hook 'php-mode-hook 'php-indent-hook)
(add-hook 'php-mode-hook 'php-comment-hook)
(add-hook 'php-mode-hook 'php-company-hook)

(provide 'php-config)
