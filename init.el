;; Emacs 23より前のバージョンでは
;; user-emacs-directory変数が未定義のため次の設定を追加

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;(package-initialize)
(when (< emacs-major-version 23)
  (defvar user-emacs-directory "~/.emacs.d/"))

;;;========================================
;;; path
;;;========================================

;; load-pathを追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
			  (expand-file-name (concat user-emacs-directory path))))
		(add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
			(normal-top-level-add-subdirs-to-load-path))))))

;; 引数のディレクトリとそのサブディレクトリをload-pathに追加
(add-to-load-path "elisp" "conf" "public_repos" "auto-install")

;; バックアップファイルの作成場所をシステムのTempディレクトリに変更
(add-to-list 'backup-directory-alist
			 (cons "." "~/.emacs.d/backups"))

;; オートセーブファイルの作成場所をシステムのTempディレクトリに変更
(setq auto-save-file-name-transforms
	  `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))


;;;========================================
;;; ELPA, auto-install
;;;========================================

;; package.el
(when (require 'package nil t)
  ;; パッケージリポジトリにMarmaladeと開発者運営のELPAを追加
  (add-to-list 'package-archives
			   '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  ;; MELPAも追加
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  ;; インストールしたパッケージにロードパスを通して読み込む
  (package-initialize))

;; auto-install
;; http://www.emacswikiがエラーのもとだったため
;; 全部httpsに直した。
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))


;;;========================================
;;; タブは使わない
;;;========================================
(setq-default indent-tabs-mode nil)


;;;==========================================
;;; 文字コード系の設定
;;; conf/char-code-config.el
;;;==========================================
(require 'char-code-config)

;;;========================================
;;; frameの設定
;;; conf/frame-config.el
;;;========================================
(require 'frame-config)


;;;==========================================
;;; 機能追加
;;;========================================

;; cua-modeの設定
;; 素晴らしい矩形編集モードが備わっている
;; CUA : Common User Access は邪魔なので切る
(cua-mode t) ; cua-modeをオン
(setq cua-enable-cua-keys nil) ; CUAキーバインドを無効にする

;; companyの設定
;; 補完
(require 'company-config)

;; undohist
;; ファイルクローズ後も履歴をさかのぼれる
(when (require 'undohist nil t)
  (undohist-initialize))

;; undo-tree
;; 履歴樹形図
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; point-undo
;; エディタ内迷子防止
(when (require 'point-undo nil t)
  (define-key global-map (kbd "M-[") 'point-undo)
  (define-key global-map (kbd "M-]") 'point-redo))

;; helm
(require 'my-helm-config)

;; wgrepの設定
(require 'wgrep nil t)

;; ediffの設定
;; ediffコントロールパネルを別フレームにしない
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; color-moccurの設定
(when (require 'color-moccur nil t)
  ;; M-oにoccur-my-moccurを割り当て
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; スペース区切りでAND検索
  (setq moccur-split-word t)
  ;; ディレクトリ検索のとき除外するファイル)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  ;; Migemoを利用できる環境であれば使用
  (when (and (executable-find "cmigemo")
			 (require 'migemo nil t))
	(setq moccur-use-migemo)))

;; moccur-editの設定
(require 'moccur-edit nil t)

;; ace-jumpの設定
(require 'ace-jump-config)

;; print
(defun my-printout-region (begin end)
  (interactive "r")
  (shell-command-on-region begin end (format "PrFile32 /q /-")))
(defun my-printout-buffer ()
  (interactive)
  (my-printout-region (point-min) (point-max)))

;; タブ/タブ解除
(defun untabify-buffer ()
  (interactive)
  (untabify (buffer-end -1) (buffer-end 1)))
(defun tabify-buffer ()
  (interactive)
  (tabify (buffer-end -1) (buffer-end 1)))




;; ========================================
;;  各種言語の設定
;; ========================================

;; flymake
(require 'my-flymake-config)

;;  JavaScript
(require 'js-config)

;; json
(require 'json-config)

;; HTML
(require 'html-config)

;; css
(require 'css-config)

;; python
(require 'python-config)

;; csharp
(require 'csharp-config)

;; haskell
(require 'haskell-config)

;; G進捗報告用
(require 'shinchoku-config)


;; ========================================
;; テキストブラウザの設定
;; ========================================
(require 'eww-config)



;;;========================================
;;; キーバインド
;;; 追加機能とかのもあるのでさいご
;;; conf/key-bind-config.el
;;;========================================
(require 'key-bind-config)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" default)))
 '(package-selected-packages
   (quote
    (abyss-theme csv-mode json-mode neotree haskell-mode omnisharp csharp-mode flymake-cursor ace-jump-mode undohist point-undo helm-helm-commands helm-pydoc helm-descbinds helm color-moccur company-tern company-jedi company-statistics wgrep undo-tree pymacs popup nxml-mode js2-mode html5-schema flymake-python-pyflakes company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
