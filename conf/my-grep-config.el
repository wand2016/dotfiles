;; wgrepの設定
(require 'wgrep nil t)

;; grepの実行ファイルの場所の指定
(when (eq system-type 'windows-nt)
  (setq find-program "\"C:\\Program Files\\Git\\usr\\bin\\find.exe\""
        grep-program "\"C:\\Program Files\\Git\\usr\\bin\\grep.exe\""
        null-device "/dev/null"))

(provide 'my-grep-config)
