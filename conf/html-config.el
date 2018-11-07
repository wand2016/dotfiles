;; ========================================
;;  HTMLの設定
;; ========================================

;; html
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . web-mode))

;; blade template
(add-to-list 'auto-mode-alist '("\\.blade\\.php\\'" . web-mode))


;; web-modeのインデント設定
(defun web-mode-indent-hook ()
  (setq web-mode-markup-indent-offset 2))

(add-hook 'web-mode-hook 'web-mode-indent-hook)

(provide 'html-config)
