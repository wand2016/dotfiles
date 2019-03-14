#!/user/bin/sh
docker container run -i -v $(pwd):/project --rm herloct/phpcs $@
