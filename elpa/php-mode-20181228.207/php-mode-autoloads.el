;;; php-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "php-mode" "../../../../.emacs.d/elpa/php-mode-20181228.207/php-mode.el"
;;;;;;  "5cb6b0d23373f85512fec318c9981766")
;;; Generated autoloads from ../../../../.emacs.d/elpa/php-mode-20181228.207/php-mode.el

(let ((loads (get 'php 'custom-loads))) (if (member '"php-mode" loads) nil (put 'php 'custom-loads (cons '"php-mode" loads))))

(let ((loads (get 'php-mode 'custom-loads))) (if (member '"php-mode" loads) nil (put 'php-mode 'custom-loads (cons '"php-mode" loads))))

(if (version< emacs-version "24.4") (dolist (i '("php" "php5" "php7")) (add-to-list 'interpreter-mode-alist (cons i 'php-mode))) (add-to-list 'interpreter-mode-alist (cons "php\\(?:-?[3457]\\(?:\\.[0-9]+\\)*\\)?" 'php-mode)))

(define-obsolete-variable-alias 'php-available-project-root-files 'php-project-available-root-files "1.19.0")

(let ((loads (get 'php-faces 'custom-loads))) (if (member '"php-mode" loads) nil (put 'php-faces 'custom-loads (cons '"php-mode" loads))))

(autoload 'php-mode "php-mode" "\
Major mode for editing PHP code.

\\{php-mode-map}

\(fn)" t nil)

(autoload 'php-current-class "php-mode" "\
Insert current class name if cursor in class context.

\(fn)" t nil)

(autoload 'php-current-namespace "php-mode" "\
Insert current namespace if cursor in namespace context.

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons (eval-when-compile (rx (or (: "." (or (: "php" (32 (in "s345t"))) "amk" "phtml")) (: "/" (or "Amkfile" ".php_cs" ".php_cs.dist"))) string-end)) 'php-mode) t)

;;;***

;;;### (autoloads nil "php-project" "../../../../.emacs.d/elpa/php-mode-20181228.207/php-project.el"
;;;;;;  "a68b9d48fe5e2cd35f7f3a646892f4ae")
;;; Generated autoloads from ../../../../.emacs.d/elpa/php-mode-20181228.207/php-project.el

(defvar-local php-project-root 'auto "\
Method of searching for the top level directory.

`auto' (default)
      Try to search file in order of `php-project-available-root-files'.

SYMBOL
      Key of `php-project-available-root-files'.

STRING
      A file/directory name of top level marker.
      If the string is an actual directory path, it is set as the absolute path
      of the root directory, not the marker.")

(put 'php-project-root 'safe-local-variable #'(lambda (v) (or (stringp v) (assq v php-project-available-root-files))))

(defvar-local php-project-bootstrap-scripts nil "\
List of path to bootstrap php script file.

The ideal bootstrap file is silent, it only includes dependent files,
defines constants, and sets the class loaders.")

(put 'php-project-bootstrap-scripts 'safe-local-variable #'php-project--eval-bootstrap-scripts)

(defvar-local php-project-php-executable nil "\
Path to php executable file.")

(put 'php-project-php-executable 'safe-local-variable #'(lambda (v) (and (stringp v) (file-executable-p v))))

(defvar-local php-project-phan-executable nil "\
Path to phan executable file.")

(put 'php-project-phan-executable 'safe-local-variable #'php-project--eval-bootstrap-scripts)

(defvar-local php-project-coding-style nil "\
Symbol value of the coding style of the project that PHP major mode refers to.

Typically it is `pear', `drupal', `wordpress', `symfony2' and `psr2'.")

(put 'php-project-coding-style 'safe-local-variable #'symbolp)

(defvar php-project-repl nil "\
Function name or path to REPL (interactive shell) script.")

(make-variable-buffer-local 'php-project-repl)

(put 'php-project-repl 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))

(defvar php-project-unit-test nil "\
Function name or path to unit test script.")

(make-variable-buffer-local 'php-project-unit-test)

(put 'php-project-unit-test 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))

(defvar php-project-deploy nil "\
Function name or path to deploy script.")

(make-variable-buffer-local 'php-project-deploy)

(put 'php-project-deploy 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))

(defvar php-project-build nil "\
Function name or path to build script.")

(make-variable-buffer-local 'php-project-build)

(put 'php-project-build 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))

(defvar php-project-server-start nil "\
Function name or path to server-start script.")

(make-variable-buffer-local 'php-project-server-start)

(put 'php-project-server-start 'safe-local-variable #'(lambda (v) (or (functionp v) (php-project--eval-bootstrap-scripts v))))

(autoload 'php-project-get-bootstrap-scripts "php-project" "\
Return list of bootstrap script.

\(fn)" nil nil)

(autoload 'php-project-get-root-dir "php-project" "\
Return path to current PHP project.

\(fn)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/php-mode-20181228.207/php-array.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-classobj.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-control-structures.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-crack.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-dio.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-dom.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-exceptions.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-exif.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-ext.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-filesystem.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-gd.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-math.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-mode-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-mode-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-mode.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-pcre.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-project.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-regex.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-simplexml.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-strings.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-var.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-xmlparser.el"
;;;;;;  "../../../../.emacs.d/elpa/php-mode-20181228.207/php-xmlreader.el")
;;;;;;  (23605 40094 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; php-mode-autoloads.el ends here
