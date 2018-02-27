
(add-hook 'css-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'untabify-buffer nil t)))

(provide 'css-config)
