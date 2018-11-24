;; ========================================
;; markdown-preview
;; markdown-preview-mode
;; の設定
;; ========================================


;; cssのフルパスを局所変数に定義
(let (css-path)
  (setq css-path (file-truename "github.css"))
  
  ;; winのときはfile:///をつける
  ;; root
  (when (eq system-type 'windows-nt)
    (setq css-path (concat "file:///" css-path)))

  ;; markdownレンダラ
  (setq markdown-command "markdown")
  
  ;; css設定
  (setq markdown-css-paths (list css-path))
  (setq markdown-preview-stylesheets (list "https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/2.10.0/github-markdown.min.css")))


(provide 'markdown-config)
