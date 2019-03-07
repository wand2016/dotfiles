;;; docker-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "docker" "../../../../.emacs.d/elpa/docker-20190215.1358/docker.el"
;;;;;;  "7c3bcdb9c31186d7275db265f242b48c")
;;; Generated autoloads from ../../../../.emacs.d/elpa/docker-20190215.1358/docker.el
 (autoload 'docker "docker" nil t)

;;;***

;;;### (autoloads nil "docker-compose" "../../../../.emacs.d/elpa/docker-20190215.1358/docker-compose.el"
;;;;;;  "cba901e5aa9db1af3c0f9f5ba43ffb8a")
;;; Generated autoloads from ../../../../.emacs.d/elpa/docker-20190215.1358/docker-compose.el

(autoload 'docker-compose-build "docker-compose" "\
Run \"docker-compose build ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-create "docker-compose" "\
Run \"docker-compose create ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-down "docker-compose" "\
Run \"docker-compose down ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-exec "docker-compose" "\
Run \"docker-compose exec ARGS SERVICE COMMAND\".

\(fn SERVICE COMMAND ARGS)" t nil)

(autoload 'docker-compose-logs "docker-compose" "\
Run \"docker-compose logs ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-pull "docker-compose" "\
Run \"docker-compose pull ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-push "docker-compose" "\
Run \"docker-compose push ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-restart "docker-compose" "\
Run \"docker-compose restart ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-rm "docker-compose" "\
Run \"docker-compose rm ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-run "docker-compose" "\
Run \"docker-compose run ARGS SERVICE COMMAND\".

\(fn SERVICE COMMAND ARGS)" t nil)

(autoload 'docker-compose-start "docker-compose" "\
Run \"docker-compose start ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-stop "docker-compose" "\
Run \"docker-compose stop ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)

(autoload 'docker-compose-up "docker-compose" "\
Run \"docker-compose up ARGS SERVICES\".

\(fn SERVICES ARGS)" t nil)
 (autoload 'docker-compose "docker-compose" nil t)

;;;***

;;;### (autoloads nil "docker-container" "../../../../.emacs.d/elpa/docker-20190215.1358/docker-container.el"
;;;;;;  "1db824b9bee762cedbe1997740c6bc9b")
;;; Generated autoloads from ../../../../.emacs.d/elpa/docker-20190215.1358/docker-container.el

(autoload 'docker-container-attach "docker-container" "\
Run \"docker attach ARGS CONTAINER\".

\(fn CONTAINER ARGS)" t nil)

(autoload 'docker-container-eshell "docker-container" "\
Open `eshell' in CONTAINER.

\(fn CONTAINER)" t nil)

(autoload 'docker-container-find-directory "docker-container" "\
Inside CONTAINER open DIRECTORY.

\(fn CONTAINER DIRECTORY)" t nil)

(autoload 'docker-container-find-file "docker-container" "\
Inside CONTAINER open FILE.

\(fn CONTAINER FILE)" t nil)

(autoload 'docker-container-shell "docker-container" "\
Open `shell' in CONTAINER.

\(fn CONTAINER)" t nil)

(autoload 'docker-diff "docker-container" "\
Diff the container named NAME.

\(fn NAME)" t nil)

(autoload 'docker-inspect "docker-container" "\
Inspect the container named NAME.

\(fn NAME)" t nil)

(autoload 'docker-kill "docker-container" "\
Kill the container named NAME using SIGNAL.

\(fn NAME &optional SIGNAL)" t nil)

(autoload 'docker-logs "docker-container" "\
Show the logs from container NAME.

If FOLLOW is set, run in `async-shell-command'.

\(fn NAME &optional FOLLOW)" t nil)

(autoload 'docker-pause "docker-container" "\
Pause the container named NAME.

\(fn NAME)" t nil)

(autoload 'docker-rename "docker-container" "\
Rename CONTAINER using NAME.

\(fn CONTAINER NAME)" t nil)

(autoload 'docker-restart "docker-container" "\
Restart the container named NAME.

TIMEOUT is the number of seconds to wait for the container to stop before killing it.

\(fn NAME &optional TIMEOUT)" t nil)

(autoload 'docker-rm "docker-container" "\
Remove the container named NAME.

With prefix argument, sets FORCE to true.

Force the removal even if the container is running when FORCE is set.
Remove the specified link and not the underlying container when LINK is set.
Remove the volumes associated with the container when VOLUMES is set.

\(fn NAME &optional FORCE LINK VOLUMES)" t nil)

(autoload 'docker-start "docker-container" "\
Start the container named NAME.

\(fn NAME)" t nil)

(autoload 'docker-stop "docker-container" "\
Stop the container named NAME.

TIMEOUT is the number of seconds to wait for the container to stop before killing it.

\(fn NAME &optional TIMEOUT)" t nil)

(autoload 'docker-unpause "docker-container" "\
Unpause the container named NAME.

\(fn NAME)" t nil)

(autoload 'docker-containers "docker-container" "\
List docker containers.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "docker-image" "../../../../.emacs.d/elpa/docker-20190215.1358/docker-image.el"
;;;;;;  "bec35827e2818d8a264dff06faf28ccc")
;;; Generated autoloads from ../../../../.emacs.d/elpa/docker-20190215.1358/docker-image.el

(autoload 'docker-pull "docker-image" "\
Pull the image named NAME.  If ALL is set, use \"-a\".

\(fn NAME &optional ALL)" t nil)

(autoload 'docker-push "docker-image" "\
Push the image named NAME.

\(fn NAME)" t nil)

(autoload 'docker-rmi "docker-image" "\
Destroy or untag the image named NAME.

Force removal of the image when FORCE is set.
Do not delete untagged parents when NO-PRUNE is set.

\(fn NAME &optional FORCE NO-PRUNE)" t nil)

(autoload 'docker-tag "docker-image" "\
Tag IMAGE using NAME.

\(fn IMAGE NAME)" t nil)

(autoload 'docker-images "docker-image" "\
List docker images.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "docker-machine" "../../../../.emacs.d/elpa/docker-20190215.1358/docker-machine.el"
;;;;;;  "6557e31dd6f64bdf9554cf60f1b8b5d3")
;;; Generated autoloads from ../../../../.emacs.d/elpa/docker-20190215.1358/docker-machine.el

(autoload 'docker-machine-config "docker-machine" "\
Print the connection config for the machine NAME.

\(fn NAME)" t nil)

(autoload 'docker-machine-create "docker-machine" "\
Create a machine NAME using DRIVER.

\(fn NAME DRIVER)" t nil)

(autoload 'docker-machine-env "docker-machine" "\
Parse and set environment variables from \"docker-machine env NAME\" output.

\(fn NAME)" t nil)

(autoload 'docker-machine-inspect "docker-machine" "\
Inspect information about the machine NAME.

\(fn NAME)" t nil)

(autoload 'docker-machine-ip "docker-machine" "\
Get the IP address of the machine NAME.

\(fn NAME)" t nil)

(autoload 'docker-machine-kill "docker-machine" "\
Kill the machine NAME.

\(fn NAME)" t nil)

(autoload 'docker-machine-restart "docker-machine" "\
Restart the machine NAME.

\(fn NAME)" t nil)

(autoload 'docker-machine-rm "docker-machine" "\
Destroy or uncommand the machine NAME.  If FORCE is set, use \"--force\".

\(fn NAME &optional FORCE)" t nil)

(autoload 'docker-machine-start "docker-machine" "\
Start the machine NAME.

\(fn NAME)" t nil)

(autoload 'docker-machine-status "docker-machine" "\
Get the status of the machine NAME.

\(fn NAME)" t nil)

(autoload 'docker-machine-stop "docker-machine" "\
Stop the machine NAME.

\(fn NAME)" t nil)

(autoload 'docker-machine-upgrade "docker-machine" "\
Upgrade the machine NAME to the latest version of Docker.

\(fn NAME)" t nil)

(autoload 'docker-machines "docker-machine" "\
List docker machines.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "docker-network" "../../../../.emacs.d/elpa/docker-20190215.1358/docker-network.el"
;;;;;;  "5556d169d652cfaa71691424a436eb68")
;;; Generated autoloads from ../../../../.emacs.d/elpa/docker-20190215.1358/docker-network.el

(autoload 'docker-network-rm "docker-network" "\
Destroy the network named NAME.

\(fn NAME)" t nil)

(autoload 'docker-networks "docker-network" "\
List docker networks.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "docker-volume" "../../../../.emacs.d/elpa/docker-20190215.1358/docker-volume.el"
;;;;;;  "1a2d025e491c8fe08d996662f0b2a749")
;;; Generated autoloads from ../../../../.emacs.d/elpa/docker-20190215.1358/docker-volume.el

(autoload 'docker-volume-dired "docker-volume" "\
Enter `dired' in the volume named NAME.

\(fn NAME)" t nil)

(autoload 'docker-volume-rm "docker-volume" "\
Destroy the volume named NAME.

\(fn NAME)" t nil)

(autoload 'docker-volumes "docker-volume" "\
List docker volumes.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../.emacs.d/elpa/docker-20190215.1358/docker-autoloads.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-compose.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-container.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-group.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-image.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-machine.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-network.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-pkg.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-process.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-utils.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker-volume.el"
;;;;;;  "../../../../.emacs.d/elpa/docker-20190215.1358/docker.el")
;;;;;;  (23680 39655 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; docker-autoloads.el ends here
