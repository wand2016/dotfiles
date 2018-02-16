;; shell�̕������������
(add-hook 'shell-mode-hook
          (lambda ()
            (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix)
            ))

;; Emacs 23���O�̃o�[�W�����ł�
;; user-emacs-directory�ϐ�������`�̂��ߎ��̐ݒ��ǉ�

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

;; load-path��ǉ�����֐����`
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
			  (expand-file-name (concat user-emacs-directory path))))
		(add-to-list 'load-path default-directory)
		(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
			(normal-top-level-add-subdirs-to-load-path))))))

;; �����̃f�B���N�g���Ƃ��̃T�u�f�B���N�g����load-path�ɒǉ�
(add-to-load-path "elisp" "conf" "public_repos" "auto-install")

;; �o�b�N�A�b�v�t�@�C���̍쐬�ꏊ���V�X�e����Temp�f�B���N�g���ɕύX
(add-to-list 'backup-directory-alist
			 (cons "." "~/.emacs.d/backups"))

;; �I�[�g�Z�[�u�t�@�C���̍쐬�ꏊ���V�X�e����Temp�f�B���N�g���ɕύX
(setq auto-save-file-name-transforms
	  `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))


;;;========================================
;;; ELPA, auto-install
;;;========================================

;; package.el
(when (require 'package nil t)
  ;; �p�b�P�[�W���|�W�g����Marmalade�ƊJ���҉^�c��ELPA��ǉ�
  (add-to-list 'package-archives
			   '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
  ;; MELPA���ǉ�
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  ;; �C���X�g�[�������p�b�P�[�W�Ƀ��[�h�p�X��ʂ��ēǂݍ���
  (package-initialize))

;; auto-install
;; http://www.emacswiki���G���[�̂��Ƃ���������
;; �S��https�ɒ������B
(when (require 'auto-install nil t)
  (setq auto-install-directory "~/.emacs.d/elisp/")
  (auto-install-update-emacswiki-package-name t)
  (auto-install-compatibility-setup))


;;;========================================
;;; �^�u�͎g��Ȃ�
;;;========================================
(setq-default indent-tabs-mode nil)


;;;==========================================
;;; �����R�[�h�n�̐ݒ�
;;; conf/char-code-config.el
;;;==========================================
(require 'char-code-config)

;;;========================================
;;; frame�̐ݒ�
;;; conf/frame-config.el
;;;========================================
(require 'frame-config)


;;;==========================================
;;; �@�\�ǉ�
;;;========================================

;; cua-mode�̐ݒ�
;; �f���炵����`�ҏW���[�h��������Ă���
;; CUA : Common User Access �͎ז��Ȃ̂Ő؂�
(cua-mode t) ; cua-mode���I��
(setq cua-enable-cua-keys nil) ; CUA�L�[�o�C���h�𖳌��ɂ���

;; company�̐ݒ�
;; �⊮
(require 'company-config)

;; undohist
;; �t�@�C���N���[�Y��������������̂ڂ��
(when (require 'undohist nil t)
  (undohist-initialize))

;; undo-tree
;; �������`�}
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; point-undo
;; �G�f�B�^�����q�h�~
(when (require 'point-undo nil t)
  (define-key global-map (kbd "M-[") 'point-undo)
  (define-key global-map (kbd "M-]") 'point-redo))

;; helm
(require 'my-helm-config)

;; wgrep�̐ݒ�
(require 'wgrep nil t)

;; ediff�̐ݒ�
;; ediff�R���g���[���p�l����ʃt���[���ɂ��Ȃ�
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; color-moccur�̐ݒ�
(when (require 'color-moccur nil t)
  ;; M-o��occur-my-moccur�����蓖��
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; �X�y�[�X��؂��AND����
  (setq moccur-split-word t)
  ;; �f�B���N�g�������̂Ƃ����O����t�@�C��)
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
  ;; Migemo�𗘗p�ł�����ł���Ύg�p
  (when (and (executable-find "cmigemo")
			 (require 'migemo nil t))
	(setq moccur-use-migemo)))

;; moccur-edit�̐ݒ�
(require 'moccur-edit nil t)

;; ace-jump�̐ݒ�
(require 'ace-jump-config)

;; print
(defun my-printout-region (begin end)
  (interactive "r")
  (shell-command-on-region begin end (format "PrFile32 /q /-")))
(defun my-printout-buffer ()
  (interactive)
  (my-printout-region (point-min) (point-max)))

;; �^�u/�^�u����
(defun untabify-buffer ()
  (interactive)
  (untabify (buffer-end -1) (buffer-end 1)))
(defun tabify-buffer ()
  (interactive)
  (tabify (buffer-end -1) (buffer-end 1)))




;; ========================================
;;  �e�팾��̐ݒ�
;; ========================================

;; flymake
(require 'my-flymake-config)

;;  JavaScript
(require 'js-config)

;; json
(require 'json-config)

;; HTML
(require 'html-config)

;; python
(require 'python-config)

;; csharp
(require 'csharp-config)

;; G�i���񍐗p
(require 'shinchoku-config)



;;;========================================
;;; �L�[�o�C���h
;;; �ǉ��@�\�Ƃ��̂�����̂ł�����
;;; conf/key-bind-config.el
;;;========================================
(require 'key-bind-config)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(json-mode neotree haskell-mode omnisharp csharp-mode flymake-cursor ace-jump-mode helm-google undohist point-undo helm-helm-commands helm-pydoc helm-descbinds helm color-moccur company-tern company-jedi company-statistics wgrep undo-tree pymacs popup nxml-mode js2-mode html5-schema flymake-python-pyflakes company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)

;; disable popup
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
