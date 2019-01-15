# gcc-8.2.0
ORIGIN_DIR=$PWD
mkdir $HOME/Downloads
wget --directory-prefix=$HOME/Downloads http://mirrors-usa.go-parts.com/gcc/releases/gcc-8.2.0/gcc-8.2.0.tar.gz
wget --directory-prefix=$HOME/Downloads ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.18.tar.bz2
tar --extract --gzip --verbose --file=$HOME/Downloads/gcc-8.2.0.tar.gz --directory=$HOME/Downloads
tar --extract --bzip2 --verbose --file=$HOME/Downloads/isl-0.18.tar.bz2 --directory=$HOME/Downloads/gcc-8.2.0
mv $HOME/Downloads/gcc-8.2.0/isl-0.18 $HOME/Downloads/gcc-8.2.0/isl
mkdir $HOME/Downloads/objdir
cd $HOME/Downloads/objdir
$HOME/Downloads/gcc-8.2.0/configure --prefix=$HOME/apps/gcc-8.2.0
make --directory=$HOME/Downloads/objdir BOOT_CFLAGS='-O' bootstrap
make install
export PATH=$HOME/apps/gcc-8.2.0/bin/:$PATH
cd $ORIGIN_DIR
rm -rf $HOME/Downloads/gcc-8.2.0.tar.gz
rm -rf $HOME/Downloads/isl-0.18.tar.bz2
rm -rf $HOME/Downloads/gcc-8.2.0
rm -rf $HOME/Downloads/objdir

