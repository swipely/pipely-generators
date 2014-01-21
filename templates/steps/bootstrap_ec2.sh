#!/bin/bash

set -e

# Install rbenv
curl --silent -L https://github.com/sstephenson/rbenv/archive/master.zip -o ~/rbenv.zip
unzip ~/rbenv.zip -d ~
mv ~/rbenv-master ~/rbenv
ln -s ~/rbenv ~/.rbenv
rm -rf ~/rbenv/versions

# Set up rbenv
export PATH="~/rbenv/bin:$PATH"
eval "$(rbenv init -)"
rbenv rehash
rbenv global 1.9.3-p327

# Set up rbenv for future logins
cat >> ~/.bash_profile << 'EOF'
if [ -d ~/rbenv ]; then
  export PATH="~/rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
EOF

# Install bundler
gem install bundler --no-ri --no-rdoc
rbenv rehash

# Set up ssh access
if [ ! -f ~/.ssh/id_rsa ]; then
  mkdir -p ~/.ssh
  ssh-keygen -P '' -f ~/.ssh/id_rsa
  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
  chmod 600 ~/.ssh/authorized_keys
fi

# Use ssh to bypass the sudo "require tty" setting
ssh -o "StrictHostKeyChecking no" -t -t ec2-user@localhost <<- EOF
  sudo su -;
  yum -y install gcc ruby-devel libxml2 libxml2-devel libxslt libxslt-devel make mysql mysql-devel;
  ln -s /home/ec2-user/rbenv ~/rbenv;
  ln -s /home/ec2-user/rbenv ~/.rbenv;
  export PATH="/home/ec2-user/rbenv/bin:\$PATH";
  eval "\$(rbenv init -)";
  exit;
  exit;
EOF
# ^^^ Double exit above is on purpose. (1) exit su, (2) exit ssh.

# Install fog.  Has to happen after libxml2-devel
rbenv rehash
gem install fog --no-ri --no-rdoc
rbenv rehash
