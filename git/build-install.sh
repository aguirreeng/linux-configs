# git-2.20.1
ORIGIN_DIR=$PWD
mkdir $HOME/Downloads
ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi
wget --directory-prefix=$HOME/Downloads https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.20.1.tar.gz
tar --extract --gzip --verbose --file=$HOME/Downloads/git-2.20.1.tar.gz --directory=$HOME/Downloads
cd $HOME/Downloads/git-2.20.1
make configure
./configure --prefix=$HOME/apps/git-2.20.1
make all doc info
make install install-doc install-html install-info
cd $ORIGIN_DIR
rm -rf $HOME/Downloads/git-2.20.1.tar.gz
rm -rf $HOME/Downloads/git-2.20.1

