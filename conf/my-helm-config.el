;; ========================================
;;  helmの設定
;; ========================================

(when (require 'helm-config nil t)
  (helm-popup-tip-mode t)
  (setq
   ;; 候補表示までの時間。default : 0.5
   helm-idle-delay 0.3
   ;; タイプして再描写するまでの時間。default : 0.1
   helm-input-idle-delay 0.1
   ;; 候補の最大表示数。default : 50
   helm-candidate-number-limit 100)
  
  ;; tabとC-zをswap
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  ;; キーバインド一覧をhelm仕様に置き換え
  (when (require 'helm-descbinds nil t)
	(helm-descbinds-install))

  ;; バッファ一覧表示をhelmに置き換え
  (define-key global-map (kbd "C-x C-b") 'helm-for-files)

  ;; find-files
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)

  ;; キルリング一覧表示をhelmに置き換え
  (define-key global-map (kbd "M-y") 'helm-show-kill-ring)

  ;; helm-c-moccur
  (define-key global-map (kbd "C-M-o") 'helm-occur)
  
  ;; M-xをhelm仕様に
  (define-key global-map (kbd "M-x") 'helm-M-x)


  (require 'helm-google nil t))

(provide 'my-helm-config)
