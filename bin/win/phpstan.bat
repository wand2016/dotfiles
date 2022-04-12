@echo off
REM path通す
docker container run -i -v %CD%:/app --rm phpstan/phpstan %*
