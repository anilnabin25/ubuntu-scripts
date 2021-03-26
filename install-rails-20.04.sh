set -e

echo "== start installing rails =="
echo "== configure for rails installatin =="
apt install curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

apt-get update
apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn

echo "== start installing rbenv =="
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
# exec $SHELL
echo "== end installing rbenv =="

echo "== installing ruby 3.0.0 =="
rbenv install 3.0.0
rbenv global 3.0.0
ruby -v
echo "== installing bundler =="
gem install bundler

echo "== installing rails 6.1.1 =="
gem install rails -v 6.1.1
rbenv rehash
rails -v

echo "== end rails installating =="
