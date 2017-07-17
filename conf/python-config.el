;; ========================================
;;  pythonの設定
;; ========================================

;; 文法・スタイルチェック
(when (require 'flymake-python-pyflakes nil t) 
  (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
  (setq flymake-python-pyflakes-executable "flake8")
  )

;; jediによる補完
(require 'jedi-core)
(setq jedi:complete-on-dot t)
(setq jedi:use-shortcuts t)
(add-hook 'python-mode-hook 'jedi:setup)
(add-to-list 'company-backends 'company-jedi) ; backendに追加

(provide 'python-config)


