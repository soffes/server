# Install dependencies
apt-get update
apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# Setup firewall
# From https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-with-ufw-on-ubuntu-14-04
apt-get install ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow http
ufw allow https
ufw enable

# Setup user
useradd --user-group --create-home www

# Install rbenv
su www
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# Install ruby-build
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

# Install rbenv-vars
git clone https://github.com/sstephenson/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars

# Install Ruby
rbenv install 2.3.0
rbenv global 2.3.0

# Configure RubyGems
echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Install Bundler
gem install bundler
exit

# Install Node
apt-get install nodejs

# Install Nginx
apt-get install nginx

# Install Upstart
dpkg-divert --local --rename --add /sbin/initctl
ln -s /bin/true /sbin/initctl
apt-get install upstart ubuntu-standard systemd-sysv
update-initramfs -u
reboot

# More things from https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-puma-and-nginx-on-ubuntu-14-04
