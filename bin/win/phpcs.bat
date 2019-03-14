REM path通す
@echo off
docker container run -i -v %CD%:/project --rm herloct/phpcs %*
