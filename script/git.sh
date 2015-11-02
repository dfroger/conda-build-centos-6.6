sudo yum -y  install \
  zlib-devel.x86_64 \
  openssl-devel.x86_64 \
  gettext-devel.x86_64 \
  libcurl-devel.x86_64 \
  expat-devel.x86_64 \
  perl-ExtUtils-CBuilder \
  perl-ExtUtils-MakeMaker

wget --content-disposition https://github.com/git/git/archive/v2.6.0.tar.gz
tar xvzf git-2.6.0.tar.gz
cd git-2.6.0

make -j8 prefix=/usr/local all
sudo make prefix=/usr/local install

cd ..
rm -rf git-2.6.0 git-2.6.0.tar.gz
