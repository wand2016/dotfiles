;; PDF出力
(setq my-pdfout-command-format "nkf -e | e2ps -a4 -p -nh | ps2pdf - %s")

(defun my-pdfout-region (begin end)
  (interactive "r")
  (shell-command-on-region begin end (format my-pdfout-command-format (read-from-minibuffer "File name:"))))

(defun my-pdfout-buffer ()
  (interactive)
  (my-pdfout-region (point-min) (point-max)))

(provide 'my-pdfout)
