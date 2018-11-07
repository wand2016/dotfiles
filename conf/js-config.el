;;;========================================
;;; JavaScript系の設定
;;;========================================


;; 拡張子jsのファイルを開いたときjs2-modeに
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;; (setq comment-style 'multi-line)


;; インデントの設定
(defun js-indent-hook ()
  ;; インデント幅を4にする
  (setq js-indent-level 4
		js-expr-indent-offset 4
		indent-tabs-mode nil
        ;; switch-case
        js2-basic-offset 4
        js-switch-indent-offset 4))

(add-hook 'js2-mode-hook 'js-indent-hook)


;; JS用Flymakeの初期化関数の定義
(defun flymake-gjslint-init ()
  "Initialize flymake for gjslint"
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
					 'flymake-create-temp-inplace)))
    (list "gjslint" (list temp-file "--nosummary"))))

;; JavaScript編集でFlymakeを起動する
(add-to-list 'flymake-allowed-file-name-masks
			 '(".+\\.js$"
			   flymake-gjslint-init
			   flymake-simple-cleanup
			   flymake-get-real-file-name))

(add-to-list 'flymake-err-line-patterns
			 '("^Line \\([[:digit:]]+\\), E:[[:digit:]]+: "
			   nil 1 nil))

;; スタイルチェック
;; 重いのでoff
;(add-hook 'js2-mode-hook 'flymake-mode)


;; コメントの設定
(defun js-comment-hook ()
  ;; 新たなcomment-box
  (defun my-comment-box (beg end &optional arg)
	(interactive "*r\np")
	;; commentの設定を退避
	(setq-local comment-start-tmp comment-start)
	(setq-local comment-end-tmp comment-end)
	;; /**/形式でボックスを作る
	(setq-local comment-start "/*")
	(setq-local comment-end "*/")
	(comment-box beg end arg)
	;; 設定を書き戻す
	(setq-local comment-start comment-start-tmp)
	(setq-local comment-end comment-end-tmp))
  )

;; js2-modeで上記コメント設定
(add-hook 'js2-mode-hook 'js-comment-hook)

;; ========================================
;;  補完の設定
;; ========================================

;; 自身をマークする いらねえ
(setq company-tern-property-marker "")

;; depth絡みの不具合があるらしい
;; 対策
(defun company-tern-depth (candidate)
  "Return depth attribute for CANDIDATE. 'nil' entries are treated as 0."
  (let ((depth (get-text-property 0 'depth candidate)))
    (if (eq depth nil) 0 depth)))
(add-hook 'js2-mode-hook 'tern-mode)

;; backendに追加
;; company-dabbrev-codeは現在開いているバッファからワードを拾ってくる
(add-to-list 'company-backends '(company-tern :with company-dabbrev-code))
;(add-to-list 'company-backends 'company-tern)



;; よく使うやつ
(add-hook 'js2-mode-hook
          (lambda ()
            ;; よく使うものをキーバインド登録
            (define-key js2-mode-map (kbd "s-f") "function () {}")
            (define-key js2-mode-map (kbd "s-l") "console.log();")
            (define-key js2-mode-map (kbd "s-q") "''")
            (define-key js2-mode-map (kbd "s-Q") "\"\"")

            ;; .term-port を作らない            
            (when (locate-library "tern")
              (setq tern-command '("tern" "--no-port-file"))
              (tern-mode t)
              (eval-after-load 'tern
                '(progn
                   (require 'tern-auto-complete)
                   (tern-ac-setup))))))


;; js2-modeでjsdocを使う
;; C-ciにバインド
(add-hook 'js2-mode-hook
          (lambda ()
            (local-set-key "\C-ci" 'js-doc-insert-function-doc)
            (local-set-key "@" 'js-doc-insert-tag)))

(provide 'js-config)
