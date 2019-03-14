@echo off
REM path通す
docker container run -i -v %CD%:/project --rm herloct/phpcs %*
