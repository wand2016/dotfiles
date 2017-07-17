(require 'company)
(global-company-mode) ; 全バッファで有効にする 
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る


;; ========================================
;; キーバインド設定
;; ========================================
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)


;; ========================================
;; tabの挙動をいい感じに
;; - 候補が1つ  : それを選択
;; - 候補が複数
;;   - 挿入可能なprefixがある : それを挿入
;;   -                   ない : company-select-next
;; ========================================
(defun company--insert-candidate2 (candidate)
  (when (> (length candidate) 0)
    (setq candidate (substring-no-properties candidate))
    (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
        (insert (company-strip-prefix candidate))
      (if (equal company-prefix candidate)
          (company-select-next)
		(delete-region (- (point) (length company-prefix)) (point))
        (insert candidate))
      )))

(defun company-complete-common2 ()
  (interactive)
  (when (company-manual-begin)
    (if (and (not (cdr company-candidates))
             (equal company-common (car company-candidates)))
        (company-complete-selection)
      (company--insert-candidate2 company-common))))

(define-key company-active-map [tab] 'company-complete-common2)
(define-key company-active-map [backtab] 'company-select-previous) ; おまけ

;; ========================================
;; 候補のソート
;; 
;; [標準]
;; - company-sort-by-occurrence
;; 	現在のバッファの現在見えている部分の中で各候補を検索
;; 	その結果からランク付けしてソート
;; - company-sort-by-backend-importance
;; 	backendがgroup（リスト）のとき、:withキーワードの
;; 	前にあるbackendから生成されたものが前に並び，
;; 	後ろにあるbackendから生成されたものが後ろに並ぶ
;; [company-statictics]
;; - company-sort-by-statictics
;;     補完候補の履歴でソート
;; ========================================

(add-hook 'after-init-hook #'company-statistics-mode)
(setq company-transformers
	  '(company-sort-by-statistics company-sort-by-backend-importance))



(provide 'company-config)

