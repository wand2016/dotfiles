;; ========================================
;;  進捗文法チェック
;; ========================================

;; shinchoku-modeの定義
(defun shinchoku-mode ()
  "花房G 進捗報告用"
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "花房G 進捗報告用")
  (setq major-mode 'shinchoku-mode)
  (run-hooks 'shinchoku-mode-hook))


;; ファイル名にshinchokuが含まれる場合、shinchoku-modeで開く
(add-to-list 'auto-mode-alist '(".*shinchoku.txt" . shinchoku-mode))

;; shinchoku-modeになったら文法チェック
(add-hook 'shinchoku-mode-hook 'flymake-mode)

;; shinchoku-modeになったらセーブ時に自動でuntabify
(add-hook 'shinchoku-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'untabify-buffer nil t)))


;; 自作進捗文法チェッカshinchokuを用いる
(defun flymake-shinchoku-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "shinchoku" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '(".*shinchoku.txt" flymake-shinchoku-init))
(add-to-list 'flymake-err-line-patterns
             '("line \\([0-9]+\\):\\(.*\\)" nil 1 nil 2))




(provide 'shinchoku-config)
