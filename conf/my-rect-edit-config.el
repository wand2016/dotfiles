;; cua-modeの設定
;; 素晴らしい矩形編集モードが備わっている
;; CUA : Common User Access は邪魔なので切る
(cua-mode t) ; cua-modeをオン
(setq cua-enable-cua-keys nil) ; CUAキーバインドを無効にする

(provide 'my-rect-edit-config)
