;;;========================================
;;; frameの設定
;;;========================================


;; カッコがきれいなやつ
(global-rainbow-delimiters-mode)
(require 'cl-lib)
(require 'color)
(cl-loop
 for index from 1 to rainbow-delimiters-max-face-count
 do
 (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
   (cl-callf color-saturate-name (face-foreground face) 30))) 


;; かっこいいテーマ
(load-theme 'darcula t)


;; 日本語入力 (linux)
(when (eq system-type 'gnu/linux)
  (require 'mozc)
  (setq default-input-method "japanese-mozc")

  (setq mozc-candidate-style 'overlay)
  (global-set-key (kbd "C-o") 'toggle-input-method)
  (prefer-coding-system 'utf-8))





;; ファイルサイズの表示
(size-indication-mode t)

;; 時計を表示
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time-mode t)

;; バッテリー残量を表示
(display-battery-mode t)

;; リージョンの行数・文字数を表示
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines, %d chars "
			  (count-lines (region-beginning) (region-end))
			  (- (region-end) (region-beginning)))
      ;; これだとエコーエリアがチラつく
      ;; (count-lines-region (region-beginning) (region-end))
      ""))
(add-to-list 'default-mode-line-format
			 '(:eval (count-lines-and-chars)))

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
(require 'linum)
(global-linum-mode)

;; タブの表示幅。初期値は8
(setq-default tab-width 4)

;; 等幅設定0
;;** Consolas + MSゴシック
(when (eq system-type 'windows-nt)
  (cond ((display-graphic-p)
         (set-default-font "Consolas 10")
         (set-fontset-font (frame-parameter nil 'font)
                           'japanese-jisx0208
                           '("ＭＳ ゴシック" . "unicode-bmp")
                           )
         (set-fontset-font (frame-parameter nil 'font)
                           'katakana-jisx0201
                           '("ＭＳ ゴシック" . "unicode-bmp")
                           ))
        (t 0)))    ;; ターミナル用


;; ツールバーを非表示
(tool-bar-mode -1)
;; メニューバーを非表示
(menu-bar-mode -1)

(provide 'frame-config)
