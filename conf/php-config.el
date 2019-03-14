;; require前に書く必要があるらしい
(setq php-mode-coding-style 'psr2)
(when (require 'php-mode nil t) 
  ;; 拡張子phpのファイルを開いたときにphp-modeに。
  ;; TODO
  ;; blade.phpはbladeテンプレートなので除く
  (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

  ;; コメントを行コメに
  (defun php-comment-hook ()
    (setq comment-start "//")
    (setq comment-end ""))

  ;; companyによる補完
  (defun php-company-hook ()
    (require 'company-php)
    (company-mode t)
    (ac-php-core-eldoc-setup) ;; enable eldoc
    (make-local-variable 'company-backends)
    (add-to-list 'company-backends 'company-ac-php-backend)
                                        ; 定義にジャンプ
    (define-key php-mode-map  (kbd "M-.") 'ac-php-find-symbol-at-point)
                                        ; ジャンプ先から戻る
    (define-key php-mode-map  (kbd "M-,") 'ac-php-location-stack-back))

  ;; flycheck
  ;; phpcs and phpstan
  (defun php-flycheck-hook ()
    (require 'flycheck nil t)
    (require 'flycheck-phpstan nil t)
    (setq-default flycheck-phpcs-standard "PSR2")
    (setq-default phpstan-executable 'docker)
    (flycheck-mode t))
    

  (add-hook 'php-mode-hook 'php-comment-hook)
  (add-hook 'php-mode-hook 'php-company-hook)
  (add-hook 'php-mode-hook 'php-flycheck-hook)

  (provide 'php-config))
