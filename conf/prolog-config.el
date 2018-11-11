;;;========================================
;;; Prolog
;;;========================================

;; 拡張子.prlのファイルを開いたときprolog-modeに
(add-to-list 'auto-mode-alist '("\\.prl$" . prolog-mode))

(custom-set-variables
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


(provide 'prolog-config)
