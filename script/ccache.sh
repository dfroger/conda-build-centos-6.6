wget --no-check-certificate http://samba.org/ftp/ccache/ccache-3.3.3.tar.gz
tar xvzf ccache-3.3.3.tar.gz
cd ccache-3.3.3

./configure --prefix=/usr/local/ccache
make -j8
sudo make install

cd ..
rm -rf ccache-3.3.3 ccache-3.3.3.tar.gz

for COMP in gcc g++ cc c++
do
    sudo ln -s /usr/local/ccache/bin/ccache /usr/local/ccache/bin/$COMP
done
