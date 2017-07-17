;;;==========================================
;;; 文字コード系の設定
;;;==========================================

;; 文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
;; Windows用
(set-file-name-coding-system 'cp932)

;; シェルの文字コードをcmdに合わせる
(add-hook 'shell-mode-hook
          (lambda ()
            (set-buffer-process-coding-system 'cp932 'cp932)
            ))


(provide 'char-code-config)
