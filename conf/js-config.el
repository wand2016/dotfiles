;;;========================================
;;; JavaScript系の設定
;;;========================================

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; 定義ジャンプまわりの設定
(defun js-mode-keybinds ()
  (define-key js-mode-map  (kbd "M-.") #'xref-find-definitions)
  (define-key js-mode-map  (kbd "M-,") #'xref-pop-marker-stack))
(add-hook 'js-mode-hook #'js-mode-keybinds)


(provide 'js-config)
