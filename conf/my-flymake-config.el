;; ========================================
;;  flymakeの設定
;; ========================================

(when (require 'flymake nil t)


  ;; flymakeが落ちるのを回避
  ;; - exit-statusが0以外で
  ;; - flymake-check-was-interruptedがnil
  ;; だとfatal-statusとなってしまうらしい。
  ;; 
  ;; 定義済みの関数に処理を付け足す
  (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
	(setq flymake-check-was-interrupted t))
  (ad-activate 'flymake-post-syntax-check)

  ;; flymake 現在行のエラーをpopup.elのツールチップで表示する
  ;; flymake-popup-current-error-menuを上書き
  (when (require 'popup nil t)
	(defun flymake-popup-current-error-menu () ; 'flymake-display-err-menu-for-current-line' is obsolete
	  (interactive)
	  (let* ((line-no             (line-number-at-pos))
			 ;;(line-no flymake-current-line-no)) ; obsolete
			 (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no))))
		(when line-err-info-list
		  (let* ((count           (length line-err-info-list))
				 (menu-item-text  nil))
			(while (> count 0)
			  (setq menu-item-text (flymake-ler-text (nth (1- count) line-err-info-list)))
			  (let* ((file       (flymake-ler-file (nth (1- count) line-err-info-list)))
					 (line       (flymake-ler-line (nth (1- count) line-err-info-list))))
				(if file
					(setq menu-item-text (concat menu-item-text " - " file "(" (format "%d" line) ")"))))
			  (setq count (1- count))
			  (if (> count 0) (setq menu-item-text (concat menu-item-text "\n")))
			  )
			(popup-tip menu-item-text))))))

  ;; カーソルが位置している行のエラーを即表示  
  (when (require 'flymake-cursor nil t)
	(defun flyc/show-fly-error-at-point-pretty-soon-quick ()
	  "If the cursor is sitting on a flymake error, grab the error,
and set a timer for \"pretty soon\". When the timer fires, the error
message will be displayed in the minibuffer.

This allows a post-command-hook to NOT cause the minibuffer to be
updated 10,000 times as a user scrolls through a buffer
quickly. Only when the user pauses on a line for more than a
second, does the flymake error message (if any) get displayed."
	  
	  (if flyc--e-display-timer
		  (cancel-timer flyc--e-display-timer))

	  (let ((error-at-point (flyc/-get-error-at-point)))
		(if error-at-point
			(setq flyc--e-at-point error-at-point
				  flyc--e-display-timer
				  (run-at-time  "0.1 sec" nil 'flyc/show-stored-error-now))
		  (setq flyc--e-at-point nil
				flyc--e-display-timer nil))))

	(fset 'flyc/show-fly-error-at-point-pretty-soon
		  (symbol-function 'flyc/show-fly-error-at-point-pretty-soon-quick))
	(fset 'flyc/show-stored-error-now
		  (symbol-function 'flymake-popup-current-error-menu))))


;; 軽くなる？

(provide 'my-flymake-config)
