;; ace-jumpの設定
(when (require 'ace-jump-mode nil t)
  ;; ふつうはこう
  ;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

  ;; Hyperキーをつぶす
  (defun add-keys-to-ace-jump-mode (prefix c &optional mode)
	(define-key global-map
	  (read-kbd-macro (concat prefix (string c)))
	  `(lambda ()
	     (interactive)
	     (funcall (if (eq ',mode 'word)
					  #'ace-jump-word-mode
					  #'ace-jump-char-mode)
				  ,c))))

  ;; マッピング
  (loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-" c))
  (loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-" c))
  (loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-" c))
  ;; word-jumpにもマッピング
  (loop for c from ?0 to ?9 do (add-keys-to-ace-jump-mode "H-M-" c 'word))
  (loop for c from ?a to ?z do (add-keys-to-ace-jump-mode "H-M-" c 'word))
  (loop for c from ?! to ?~ do (add-keys-to-ace-jump-mode "H-M-" c 'word))

  (provide 'ace-jump-config))


