;; ========================================
;;  進捗文法チェック
;; ========================================

;; weekly_report-modeの定義
(defun weekly-report-mode ()
  "社内フォーマット"
  (interactive)
  (kill-all-local-variables)
  (setq mode-name "社内フォーマット")
  (setq major-mode 'weekly-report-mode)
  (run-hooks 'weekly-report-mode-hook))


;; ファイル名にweekly_reportが含まれる
(add-to-list 'auto-mode-alist '(".*weekly.?report.*\.txt" . weekly-report-mode))

;; 文法チェック
(add-hook 'weekly-report-mode-hook 'flymake-mode)

;; 自作文法チェッカ
(defun flymake-weekly-report-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "weekly_report_linter" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
             '(".*weekly.?report.*\.txt" flymake-weekly-report-init))
(add-to-list 'flymake-err-line-patterns
             '("line \\([0-9]+\\):\\(.*\\)" nil 1 nil 2))




(provide 'weekly-report-config)
