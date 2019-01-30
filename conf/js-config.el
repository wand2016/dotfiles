;;;========================================
;;; JavaScript系の設定
;;;========================================


;; 拡張子jsのファイルを開いたときjs2-modeに
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

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


;; ========================================
;;  補完の設定
;;  company-tern
;; ========================================

;; depth絡みの不具合への対策
;; override
(defun company-tern-depth (candidate)
  "Return depth attribute for CANDIDATE. 'nil' entries are treated as 0."
  (let ((depth (get-text-property 0 'depth candidate)))
    (if (eq depth nil) 0 depth)))

(defun js2-company-tern-hook ()
  (when (locate-library "tern")
    ;; .tern-port を作らない
    (setq tern-command '("tern" "--no-port-file"))
    (tern-mode t)))

(add-hook 'js2-mode-hook 'js2-company-tern-hook)

;; backend追加
(add-to-list 'company-backends 'company-tern)
;; company-dabbrev-codeは現在開いているバッファからワードを拾ってくる
;; (add-to-list 'company-backends '(company-tern :with company-dabbrev-code))

;; ========================================
;; js2-modeでjsdocを使う
;; C-ciにバインド
;; ========================================

(defun js2-jsdoc-hook ()
  (local-set-key "\C-ci" 'js-doc-insert-function-doc)
  (local-set-key "@" 'js-doc-insert-tag))

(add-hook 'js2-mode-hook 'js2-jsdoc-hook)


;; ========================================
;; node_modulesのパスを通す
;; ========================================
(add-hook 'js-mode-hook 'add-node-modules-path)


(provide 'js-config)
