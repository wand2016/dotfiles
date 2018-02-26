;;;==========================================
;;; 文字コード系の設定
;;;==========================================

;; 文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; windowsにて、shellの文字化けを回避
(when (eq system-type 'windows-nt)
  ;; Windows用
  (set-file-name-coding-system 'cp932)
  (add-hook 'shell-mode-hook
            (lambda ()
              (set-buffer-process-coding-system 'sjis 'sjis))))

;; mac
(when (eq system-type 'darwin)
  (add-hook 'shell-mode-hook
            (lambda ()
              (set-buffer-process-coding-system 'utf-8-hfs 'utf-8-hfs))))


(provide 'char-code-config)
