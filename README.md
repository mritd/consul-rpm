## consul-rpm

### 安装 fpm

``` sh
# install rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh

# install ruby
rvm install 2.4.1
rvm use 2.4.1 --default

# install fpm
gem install fpm
```

### build rpm

``` sh
./build.sh 0.9.3
```
