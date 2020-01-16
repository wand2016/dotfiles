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

(use-package auto-install
  :config
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))


;; 環境変数持ち込む
(use-package exec-path-from-shell
  :if (not (eq system-type 'windows-nt))
  :config
  (exec-path-from-shell-initialize))


;;;========================================
;;; タブは使わない
;;;========================================
(setq-default indent-tabs-mode nil)


(use-package server
  :config
  (unless (server-running-p)
    (server-start)))


(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))


;;;==========================================
;;; 文字コード系の設定
;;;==========================================

;; 文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; windowsにて、shellの文字化けを回避
(when (eq system-type 'windows-nt)
  ;; Windows用
  (set-file-name-coding-system 'cp932)
  (add-hook 'shell-mode-hook
            (lambda ()
              (set-buffer-process-coding-system 'sjis 'sjis))))

;; mac
(when (eq system-type 'darwin)
  (add-hook 'shell-mode-hook
            (lambda ()
              (set-buffer-process-coding-system 'utf-8-hfs 'utf-8-hfs))))




;;;========================================
;;; frameの設定
;;;========================================

;; かっこいいテーマ
(load-theme 'darcula t)

(add-hook 'prog-mode-hook
          (lambda () (whitespace-mode t)))

;; カッコがきれいなやつ
(use-package cl-lib)
(use-package color)
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :config
  ;; ギラギラした色にする
  (global-rainbow-delimiters-mode t)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
     (cl-callf color-saturate-name (face-foreground face) 30)))
  (global-rainbow-delimiters-mode -1))


;; タイトルバーにファイルのフルパスを表示
(setq frame-title-format "%f")

;; 初期フレームの設定
(setq initial-frame-alist
      (append
       '(;(top . 10) (left . 30)
         (width . 80) (height . 40))
       initial-frame-alist))

(setq default-frame-alist
      (append
       '((width . 70) (height . 35))
       default-frame-alist))


;; カーソル座標
(line-number-mode t)
(column-number-mode t)

;; 行数表示
(use-package linum
  :config
  (global-linum-mode))

;; タブの表示幅。初期値は8
(setq-default tab-width 4)

;; ツールバーを非表示
(tool-bar-mode -1)
;; メニューバーを非表示
(menu-bar-mode -1)

;; 半透明
(set-frame-parameter (selected-frame) 'alpha '(85 50))

;; cursor点滅止める
(setq visible-cursor nil)

;; 等幅フォント設定
(set-face-font 'default "MyricaM M")



(require 'my-mozc-config)

;;;==========================================
;;; 機能追加
;;;========================================

;; 矩形編集の設定
(require 'my-rect-edit-config)


;; 補完設定
;; ========================================
;; tabの挙動をいい感じに
;; - 候補が1つ  : それを選択
;; - 候補が複数
;;   - 挿入可能なprefixがある : それを挿入
;;   -                   ない : company-select-next
;; ========================================
(defun company--insert-candidate2 (candidate)
  (when (> (length candidate) 0)
    (setq candidate (substring-no-properties candidate))
    (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
        (insert (company-strip-prefix candidate))
      (if (equal company-prefix candidate)
          (company-select-next)
        (delete-region (- (point) (length company-prefix)) (point))
        (insert candidate)))))

(defun company-complete-common2 ()
  (interactive)
  (when (company-manual-begin)
    (if (and (not (cdr company-candidates))
             (equal company-common (car company-candidates)))
        (company-complete-selection)
      (company--insert-candidate2 company-common))))

;; yasnippetとの連携
(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")
(defun company-mode/backend-with-yas (backend)
  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
      backend
    (append (if (consp backend) backend (list backend))
            '(:with company-yasnippet))))



(use-package company
  :config
  (global-company-mode) ; 全バッファで有効にする 
  (setq company-idle-delay 0
        company-minimum-prefix-length 2
        company-selection-wrap-around t ; 候補の一番下でさらに下に行こうとすると一番上に戻る
        company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  
  :bind (:map company-active-map
              ("M-n" . nil)
              ("M-p" . nil)
              ("C-h" . nil)
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
              ("<tab>" . company-complete-common2)
              ("<backtab>" . 'company-select-previous))

  :init
  ;; ========================================
  ;; 候補のソート
  ;; 
  ;; [標準]
  ;; - company-sort-by-occurrence
  ;;   現在のバッファの現在見えている部分の中で各候補を検索
  ;;   その結果からランク付けしてソート
  ;; - company-sort-by-backend-importance
  ;;   backendがgroup（リスト）のとき、:withキーワードの
  ;;   前にあるbackendから生成されたものが前に並び，
  ;;   後ろにあるbackendから生成されたものが後ろに並ぶ
  ;; [company-statictics]
  ;; - company-sort-by-statictics
  ;;     補完候補の履歴でソート
  ;; ========================================
  (add-hook 'after-init-hook #'company-statistics-mode)
  (setq company-transformers
        '(company-sort-by-statistics company-sort-by-backend-importance)))



;; undohist
;; ファイルクローズ後も履歴をさかのぼれる
(use-package undohist
  :config
  (setq undohist-ignored-files '(".git/*"))
  (undohist-initialize))

;; undo-tree
;; 履歴樹形図
(use-package undo-tree
  :config
  (global-undo-tree-mode))


;; ========================================
;;  helmの設定
;; ========================================

(use-package helm
  :bind (("C-x C-b" . helm-for-files)
         ("C-x C-f" . helm-find-files)
         ("M-y" . helm-show-kill-ring)
         ("C-M-o" . helm-occur)
         ("M-x" . helm-M-x)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action)))

(use-package helm-descbinds
  :config
  (helm-descbinds-install))

(use-package helm-config
  :config
  (helm-mode 1)
  (helm-popup-tip-mode t)
  (set-face-background 'helm-ff-dotted-directory nil) ;; ドットディレクトリに色がついているのが見づらいのでやめる
  (setq
   helm-idle-delay 0.3
   helm-input-idle-delay 0.1
   helm-candidate-number-limit 100))




;; grep

(use-package rg
  :config
  (rg-enable-menu))
(use-package wgrep)

(autoload 'wgrep-rg-setup "wgrep-rg")
(add-hook 'rg-mode-hook 'wgrep-rg-setup)


;; grep,findの実行ファイルの場所の指定
(when (eq system-type 'windows-nt)
  (setq find-program "\"C:\\Program Files\\Git\\usr\\bin\\find.exe\""
        grep-program "\"C:\\Program Files\\Git\\usr\\bin\\grep.exe\""
        null-device "/dev/null"))


;; ediffの設定
;; ediffコントロールパネルを別フレームにしない
(setq ediff-window-setup-function 'ediff-setup-windows-plain)



(use-package moccur
  :bind (("M-o" . occur-by-moccur))
  :config
  (setq moccur-split-word t) ;; スペース区切りでAND検索
  ;; ディレクトリ検索のとき除外するファイル)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$"))

(use-package moccur-edit)




(require 'ace-jump-config)


(use-package yasnippet
  :config
  (yas-global-mode t))


;; ========================================
;;  各種言語の設定
;; ========================================

(require 'my-lsp-config)

(require 'js-config)
(require 'php-config)

;; ========================================
;;  HTMLの設定
;; ========================================


(use-package web-mode
  :mode (("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . web-mode)
         ;; blade template
         ("\\.blade\\.php\\'" . web-mode))
  :config
  (setq web-mode-markup-indent-offset 2))



(require 'haskell-config)



;; lisp

;; インデントをいい感じにする
(add-hook 'lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'lisp-indent-function)
                 'common-lisp-indent-function)))



;; ========================================
;; テキストブラウザの設定
;; ========================================
(require 'eww-config)

(use-package twittering-mode
  :config
  (when (eq system-type 'windows-nt)
    (setq twittering-curl-program "c:/Program Files/Git/mingw64/bin/curl.exe")))



;;;========================================
;;; emacs上でdocker操作
;;;========================================
(use-package docker
  :bind (("C-c d" . 'docker)
         :map magit-popup-mode-map
         ("C-t" . nil)))

;;;========================================
;;; /docker:[user@]<hash>:/
;;; でコンテナに入れるように
;;;========================================
(use-package docker-tramp-compat
  :config
  (set-variable 'docker-tramp-use-names t))

;;;========================================
;;; docker-compose.yml編集用
;;;========================================
(use-package docker-compose-mode)




;; org

(use-package org
  :commands org-agenda
  :mode (("\\.org\\'" . org-mode))
  :init
  ;; define org root and subdirectories
  (setq org-directory "~/org/")
  (setq org-subdirectory-names '("projects" "study"))
  (setq org-subdirectories
        (mapcar (lambda (subdirectory-name)
                  (concat org-directory subdirectory-name))
                org-subdirectory-names))

  ;; define org entry point and other agenda files
  (setq org-default-notes-file (concat org-directory "main.org"))
  (setq org-agenda-files (append (list org-directory) org-subdirectories))

  (defun my:org-goto-inbox ()
    (interactive)
    (find-file org-default-notes-file))
  :config
  (setq system-time-locale "C")  ;; to avoid Japanese in the time stamp
  (setq org-hide-leading-stars t)
  (setq org-startup-folded nil)
  ;; org-capture and enrty
  (setq org-todo-keywords
        '((sequence "TASK(t)" "WAIT(w)" "|" "DONE(d)" "ABORT(a)" "SOMEDAY(s)")))
  (setq org-tag-alist '(("PROJECT" . ?p) ("MEMO" . ?m) ("PETIT" . ?t)))
  (setq org-capture-templates
        '(("t" "Task" entry (file+headline org-default-notes-file "inbox")
           "** TASK %?\n   CREATED: %U\n")))
  (setq org-refile-targets '((org-agenda-files :maxlevel . 1)))
  ;; org-clock
  (setq org-log-done 'time)  ;; add a time stamp to the task when done
  (setq org-clock-clocked-in-display 'frame-title)
  :bind
  (("C-c a" . org-agenda)
   ("C-c c" . org-capture)
   ("C-c g" . org-clock-goto)
   ("C-c i" . my:org-goto-inbox)
   :map org-mode-map
   ("C-m" . org-return-indent)
   ("M-n" . org-forward-same-level)
   ("M-p" . org-backward-same-level)
   ("C-c h" . helm-org-in-buffer-headings)))

(use-package org-agenda
  :commands org-agenda
  :config
  (setq org-agenda-custom-commands
        '(("x" "Unscheduled Tasks" tags-todo
           "-SCHEDULED>=\"<today>\"-DEADLINE>=\"<today>\"" nil)
          ("d" "Daily Tasks" agenda ""
           ((org-agenda-span 1)))))
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-return-follows-link t)  ;; RET to follow link
  (setq org-agenda-columns-add-appointments-to-effort-sum t)
  (setq org-agenda-time-grid
        '((daily today require-timed)
          (0900 1200 1300 1800) "......" "----------------"))
  (setq org-columns-default-format
        "%68ITEM(Task) %6Effort(Effort){:} %6CLOCKSUM(Clock){:}")
  (defadvice org-agenda-switch-to (after org-agenda-close)
    "Close a org-agenda window when RET is hit on the window."
    (progn (delete-other-windows)
           (recenter-top-bottom)))
  (ad-activate 'org-agenda-switch-to)
  :bind
  (:map org-agenda-mode-map
        ("s" . org-agenda-schedule)
        ("S" . org-save-all-org-buffers)))



;; forecast
(use-package forecast
  :config
  (setq calendar-latitude 35.7037033
        calendar-longitude 139.7718418
        forecast-api-key "ca9f67658afb3820c4a7f3155828befb"))



(use-package magit
  :commands (magit-status)
  :bind (("C-c g" . 'magit-status)))



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
 '(grep-find-template
   "find <D> <X> -type f <F> -exec grep <C> -nH -e <R> \\{\\} +")
 '(lsp-intelephense-files-max-size 10485760)
 '(package-selected-packages
   (quote
    (editorconfig rg wgrep-helm docker docker-compose-mode forecast use-package magit cursor-chg typescript-mode twittering-mode mmm-mode vue-mode stylus-mode flymake lsp-mode mozc-popup mozc-im exec-path-from-shell markdown-preview-mode geben-helm-projectile geben darcula-theme markdown-toc vmd-mode rainbow-delimiters highlight-indent-guides mozc js-doc add-node-modules-path eslint-fix prettier-js go-mode dockerfile-mode git-commit yaml-mode yasnippet-snippets helm-c-yasnippet yasnippet web-mode php-mode markdown-mode abyss-theme csv-mode json-mode neotree haskell-mode omnisharp ace-jump-mode undohist helm-helm-commands helm-pydoc helm-descbinds helm color-moccur company-statistics wgrep undo-tree pymacs popup nxml-mode js2-mode html5-schema)))
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
 '(lsp-ui-sideline-symbol-info ((t (:slant italic :height 0.8))))
 '(whitespace-line ((t (:background "gray20"))))
 '(whitespace-newline ((t (:foreground "dim gray" :weight normal))))
 '(whitespace-space ((t (:background "grey20" :foreground "dim gray")))))
(put 'scroll-left 'disabled nil)
(put 'magit-clean 'disabled nil)
