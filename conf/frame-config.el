;;;========================================
;;; frameの設定
;;;========================================

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
       '((top                 . 22)    ; フレームの Y 位置(ピクセル数)
		 (left                . 50)   ; フレームの X 位置(ピクセル数)
		 (width               . 80)    ; フレーム幅(文字数)
		 (height              . 40))   ; フレーム高(文字数)
       initial-frame-alist))

;; カーソル座標
(line-number-mode t)
(column-number-mode t)

;; 行数表示
(require 'linum)
(global-linum-mode)

;; タブの表示幅。初期値は8
(setq-default tab-width 4)

;; 等幅設定
;;** Consolas + MSゴシック
(set-default-font "Consolas 10")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("ＭＳ ゴシック" . "unicode-bmp")
                  )
(set-fontset-font (frame-parameter nil 'font)
                  'katakana-jisx0201
                  '("ＭＳ ゴシック" . "unicode-bmp")
                  )

(provide 'frame-config)
