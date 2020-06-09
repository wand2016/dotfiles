npm i -g vmd
npm i -g intelephense # php
npm i -g vue-language-server # vue
npm i -g typescript-language-server; npm i -g typescript #ts

npm i -g textlint \
         textlint-rule-preset-ja-spacing \
         textlint-rule-preset-ja-technical-writing \
         textlint-rule-spellcheck-tech-word


sudo add-apt-repository -y ppa:x4121/ripgrep
apt-get update -y && apt-get upgrade -y
sudo apt-get install -y ripgrep

mkdir ~/.fonts
cp ./fonts/MyricaM.TTC ~/.fonts/MyricaM.TTC
fc-cache -fv


sudo apt-get install -y python3-pip
pip3 install 'python-language-server[all]'
