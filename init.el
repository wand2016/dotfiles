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
(setq recentf-exclude '("^/[^/:]+:"))

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
  ;; オフラインの場合やサーバーが死んでいる場合等、エラーが出る
  ;; 握りつぶす
  (ignore-errors
    (progn
      ;; パッケージリポジトリにMarmaladeと開発者運営のELPAを追加
      (add-to-list 'package-archives
                   '("marmalade" . "http://marmalade-repo.org/packages/"))
      (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
      ;; MELPAも追加
      (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
      ;; インストールしたパッケージにロードパスを通して読み込む
      (package-initialize))))

;; auto-install
;; http://www.emacswikiがエラーのもとだったため
;; 全部httpsに直した。
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))


;; 環境変数持ち込む
(when (and (not (eq system-type 'windows-nt))
           (require 'exec-path-from-shell nil t))
  (exec-path-from-shell-initialize))


;;;========================================
;;; タブは使わない
;;;========================================
(setq-default indent-tabs-mode nil)

;;;==========================================
;;; サーバーの起動
;;;==========================================
(require 'server-config)

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

(require 'my-mozc-config)
(require 'my-org-config)

;;;==========================================
;;; 機能追加
;;;========================================

;; 矩形編集の設定
(require 'my-rect-edit-config)
;; 補完設定
(require 'company-config)

(require 'my-undo-config)
(require 'my-helm-config)
(require 'my-grep-config)
(require 'my-diff-config)
(require 'my-moccur-config)
(require 'ace-jump-config)
(require 'my-yas-config)


;; ========================================
;;  各種言語の設定
;; ========================================

(require 'my-lsp-config)

(require 'js-config)
(require 'php-config)
(require 'html-config)
(require 'haskell-config)
(require 'prolog-config)
(require 'markdown-config)
(require 'lisp-config)


;; ========================================
;; テキストブラウザの設定
;; ========================================
(require 'eww-config)

(require 'twittering-mode)
(when (eq system-type 'windows-nt)
    (setq twittering-curl-program "c:/Program Files/Git/mingw64/bin/curl.exe"))


;;;========================================
;;; キーバインド
;;; 追加機能とかのもあるのでさいご
;;;========================================
(require 'key-bind-config)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e083a478848444bf0c0caa8c875f8645f5b8a17f4ba0991f95b83a26d6983296" "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" "551596f9165514c617c99ad6ce13196d6e7caa7035cea92a0e143dbe7b28be0e" default)))
 '(lsp-intelephense-files-max-size 10485760)
 '(package-selected-packages
   (quote
    (twittering-mode mmm-mode vue-mode stylus-mode flymake lsp-mode mozc-popup mozc-im exec-path-from-shell markdown-preview-mode org-pomodoro geben-helm-projectile geben darcula-theme markdown-toc vmd-mode rainbow-delimiters highlight-indent-guides mozc js-doc add-node-modules-path eslint-fix prettier-js go-mode dockerfile-mode git-commit yaml-mode yasnippet-snippets helm-c-yasnippet yasnippet web-mode php-mode markdown-mode abyss-theme csv-mode json-mode neotree haskell-mode omnisharp ace-jump-mode undohist point-undo helm-helm-commands helm-pydoc helm-descbinds helm color-moccur company-statistics wgrep undo-tree pymacs popup nxml-mode js2-mode html5-schema)))
 '(prolog-program-name
   (quote
    (((getenv "EPROLOG")
      (eval
       (getenv "EPROLOG")))
     (eclipse "eclipse")
     (mercury nil)
     (sicstus "sicstus")
     (swi "swipl")
     (gnu "gprolog")
     (t "prolog"))))
 '(prolog-system (quote swi)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-ui-sideline-symbol ((t (:foreground "grey" :box (:line-width -1 :color "grey") :height 0.8))))
 '(lsp-ui-sideline-symbol-info ((t (:slant italic :height 0.8)))))
(put 'scroll-left 'disabled nil)
