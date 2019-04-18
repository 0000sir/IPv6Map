#! /bin/bash

apt-get install -y git
curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
apt-get install build-essential libssl-dev libcurl4-openssl-dev libreadline-dev zlib1g-dev -y
git clone https://github.com/andorchen/rbenv-china-mirror.git "$(rbenv root)"/plugins/rbenv-china-mirror
rbenv install 2.6.3
rbenv global 2.6.3

# cd to project dir
apt-get install libsqlite3-dev
bundle install