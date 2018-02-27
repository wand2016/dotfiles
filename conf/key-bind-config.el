;; Windows
;; Super/Hyperキーの設定
;; (setq w32-pass-lwindow-to-system nil)
;; (setq w32-lwindow-modifier 'super) ; Left Windows key
;; (setq w32-pass-rwindow-to-system nil)
;; (setq w32-rwindow-modifier 'super) ; Right Windows key
(setq w32-pass-apps-to-system nil)
;; (setq w32-apps-modifier 'hyper) ; Menu/App key
;; (setq w32-scroll-lock-modifier 'super) ; ScrollLck
(setq w32-apps-modifier 'super) ; Menu/App key
(setq w32-scroll-lock-modifier 'hyper) ; ScrollLck



;; C-mにnewline-and-indentを割り当てる
;; global-set-keyを使用
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "<convert>") 'newline-and-indent)

;; 入力されるキーシーケンスを置き換える
;; ?\C-?はDEL
(keyboard-translate ?\C-h ?\C-?)

;; ヘルプを新たに割り当て
(define-key global-map (kbd "C-x ?") 'help-command)

;; 行の折り返し表示をトグル
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; "C-t" でウインドウ切り替え。*初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)

;; 指定行数へ移動
(define-key global-map (kbd "C-c g") 'goto-line)

;; F5で更新
(define-key global-map (kbd "<f5>") 'revert-buffer)

;; キャピタルとかそれ系
(define-key global-map (kbd "M-c") 'capitalize-dwim)
(define-key global-map (kbd "M-u") 'upcase-dwim)
(define-key global-map (kbd "M-l") 'downcase-dwim)

;; diredでもC-tでタブ切り替え
(define-key dired-mode-map (kbd "C-t") 'other-window)

;; mkdirのキーバインド
(define-key global-map (kbd "C-c d") 'mkdir)

(provide 'key-bind-config)

