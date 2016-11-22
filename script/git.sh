sudo yum -y  install \
  zlib-devel \
  openssl-devel \
  gettext-devel \
  libcurl-devel \
  expat-devel \
  perl-ExtUtils-CBuilder \
  perl-ExtUtils-MakeMaker

wget --content-disposition https://github.com/git/git/archive/v2.10.2.tar.gz
tar xvzf git-2.10.2.tar.gz
cd git-2.10.2

make -j8 prefix=/usr/local all
sudo make prefix=/usr/local install

cd ..
rm -rf git-2.10.2 git-2.10.2.tar.gz
