(require 'lsp-mode)
(require 'lsp)
(require 'lsp-clients)
(add-hook 'prog-mode-hook 'lsp)
(add-hook 'vue-mode-hook 'lsp)


(require 'lsp-ui)

(setq-default lsp-prefer-flymake nil
              lsp-ui-doc-header t
              lsp-ui-doc-include-signature t
              lsp-ui-doc-max-height 20
              lsp-ui-doc-max-width 30
              lsp-ui-doc-use-childframe nil
              lsp-ui-doc-use-webkit nil)


(require 'company)
(require 'company-lsp)
(push 'company-lsp company-backends)

;; remap definition jump
;; (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;; (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;; remap definition jump
(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-find-definition)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-find-references)


;; lsp-modeの関数のバグ修正
;; Vue SFC編集時、file:///スキーマのないパスが渡ってきてしまうことがある
(defun lsp--uri-to-path (uri-or-path)
  "Convert URI to a file path."
  (let* ((uri (if (and (eq system-type 'windows-nt)
                       (file-exists-p uri-or-path)
                       (not (url-file-exists-p uri-or-path)))
                  (concatenate 'string "file:///" uri-or-path)
                uri-or-path))
         (url (url-generic-parse-url (url-unhex-string uri)))
         (type (url-type url))
         (file (decode-coding-string (url-filename url) locale-coding-system))
         (file-name (if (and type (not (string= type "file")))
                        (if-let ((handler (lsp--get-uri-handler type)))
                            (funcall handler uri)
                          (signal 'lsp-file-scheme-not-supported (list uri)))
                      ;; `url-generic-parse-url' is buggy on windows:
                      ;; https://github.com/emacs-lsp/lsp-mode/pull/265
                      (or (and (eq system-type 'windows-nt)
                               (eq (elt file 0) ?\/)
                               (substring file 1))
                          file))))

    (lsp--fix-path-casing
     (concat (-some 'lsp--workspace-host-root (lsp-workspaces)) file-name))))


(provide 'my-lsp-config)
