@echo off
docker container run --rm -i -v %CD%:/source -v %HOME%/.emacs.d/bin/common/pandoc/resources:/root/resources jagregory/pandoc -s --self-contained -c /root/resources/github.css -t html5  --metadata pagetitle=hoge
