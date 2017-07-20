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

(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)
(setq mac-right-command-modifier 'hyper)


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
;; 直前の単語をキャピタルとかにする自作関数
(defun capitalize-last-word ()
  (interactive)
  (capitalize-word -1))
(defun upcase-last-word ()
  (interactive)
  (upcase-word -1))
(defun downcase-last-word ()
  (interactive)
  (downcase-word -1))
;; キーバインド
(define-key global-map (kbd "s-c") 'capitalize-last-word)
(define-key global-map (kbd "s-u") 'upcase-last-word)
(define-key global-map (kbd "s-l") 'downcase-last-word)


(provide 'key-bind-config)

