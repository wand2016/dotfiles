;; ========================================
;;  Vue SFCの設定
;; ========================================
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))

;; vue-mode時、node_modulesのパスを登録
(add-hook 'vue-mode-hook 'add-node-modules-path)

;; eslintによるflycheck
(require 'flycheck)
(flycheck-add-mode 'javascript-eslint 'vue-mode)
(flycheck-add-mode 'javascript-eslint 'vue-html-mode)
(flycheck-add-mode 'javascript-eslint 'css-mode)

;; tern-mode有効
(add-hook 'vue-mode-hook 'tern-mode)

;; vue-modeでflycheck有効にしたら、
;; 保存時にfixする
(add-hook 'vue-mode-hook
          (lambda ()
            (add-hook 'flycheck-mode-hook
                      (lambda()
                        (add-hook 'after-save-hook #'eslint-fix)))))

(provide 'vue-config)
