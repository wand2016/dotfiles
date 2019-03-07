;;;========================================
;;; JavaScript系の設定
;;;========================================

;; 拡張子jsのファイルを開いたときjs-modeに
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))

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

(defun js-company-tern-hook ()
  (when (locate-library "tern")
    ;; .tern-port を作らない
    (setq tern-command '("tern" "--no-port-file"))
    (tern-mode t)))

(add-hook 'js-mode-hook 'js-company-tern-hook)

;; backend追加
(add-to-list 'company-backends 'company-tern)
;; company-dabbrev-codeは現在開いているバッファからワードを拾ってくる
;; (add-to-list 'company-backends '(company-tern :with company-dabbrev-code))

;; ========================================
;; jsdocコメント
;; C-ciにバインド
;; ========================================

(defun js-jsdoc-hook ()
  (local-set-key "\C-ci" 'js-doc-insert-function-doc)
  (local-set-key "@" 'js-doc-insert-tag))

(add-hook 'js-mode-hook 'js-jsdoc-hook)

;; ========================================
;; node_modulesのパスを通す
;; ========================================
(add-hook 'js-mode-hook 'add-node-modules-path)

(provide 'js-config)
