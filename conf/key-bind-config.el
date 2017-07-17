(setq w32-pass-apps-to-system nil
      w32-apps-modifier 'hyper
	  w32-scroll-lock-modifier 'super)


;; C-mにnewline-and-indentを割り当てる
;; global-set-keyを使用
(define-key global-map (kbd "C-m") 'newline-and-indent)

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

;; キャピタル、アッパー、ダウンケース
(define-key global-map (kbd "s-c") (lambda ()
									 (interactive)
									 (capitalize-word -1)))
(define-key global-map (kbd "s-u") (lambda ()
									 (interactive)
									 (upcase-word -1)))
(define-key global-map (kbd "s-l") (lambda ()
									 (interactive)
									 (downcase-word -1)))
(define-key global-map (kbd "M-c") 'capitalize-dwim)
(define-key global-map (kbd "M-u") 'upcase-dwim)
(define-key global-map (kbd "M-l") 'downcase-dwim)

(define-key global-map (kbd "s-f") 'enlarge-window-horizontally)
(define-key global-map (kbd "s-b") 'shrink-window-horizontally)
(define-key global-map (kbd "s-n") 'enlarge-window)
(define-key global-map (kbd "s-p") 'shrink-window)

 


(provide 'key-bind-config)
