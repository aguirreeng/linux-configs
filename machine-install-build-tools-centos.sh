# gcc-8.2.0
# Install necessary tools.
yum install gperf.x86_64 dejagnu autogen.x86_64 texinfo.x86_64 --assumeyes
# Install dependencies.
yum install glibc.x86_64 glibc-devel.x86_64 glibc-headers.x86_64 glibc.i686 glibc-devel.i686 --assumeyes
yum install libgnat.i686 libgnat.x86_64 libgnat-devel.i686 libgnat-devel.x86_64 gcc-gnat.x86_64 --assumeyes
yum install gmp.x86_64 gmp-devel.x86_64 gmp.i686 gmp-devel.i686 --assumeyes
yum install mpfr.x86_64 mpfr-devel.x86_64 mpfr.i686 mpfr-devel.i686 --assumeyes
yum install libmpc.x86_64 libmpc-devel.x86_64 libmpc.i686 libmpc.x86_64 --assumeyes
# Download source.
ORIGIN_DIR=$PWD
mkdir $HOME/Downloads
wget --directory-prefix=$HOME/Downloads http://mirrors-usa.go-parts.com/gcc/releases/gcc-8.2.0/gcc-8.2.0.tar.gz
tar --extract --gzip --verbose --file=$HOME/Downloads/gcc-8.2.0.tar.gz --directory=$HOME/Downloads
mkdir $HOME/Downloads/objdir
cd $HOME/Downloads/objdir
$HOME/Downloads/gcc-8.2.0/configure --prefix=$HOME/apps/gcc-8.2.0
make --directory=$HOME/Downloads/objdir BOOT_CFLAGS='-O' bootstrap
make install
export PATH=$HOME/apps/gcc-8.2.0/bin/:$PATH
cd $ORIGIN_DIR
rm -rf $HOME/Downloads/gcc-8.2.0.tar.gz
rm -rf $HOME/Downloads/gcc-8.2.0
rm -rf $HOME/Downloads/objdir

# Compile CMake
wget --directory-prefix=$HOME/Downloads https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2.tar.gz
mkdir $HOME/apps/cmake-3.12.4-Linux-x86_64
/usr/bin/sh $HOME/Downloads/cmake-3.12.4-Linux-x86_64.sh --prefix=$HOME/apps/cmake-3.12.4-Linux-x86_64 --skip-license
rm -rf $HOME/Downloads/cmake-3.12.4-Linux-x86_64.sh
export PATH=$HOME/apps/cmake-3.12.4-Linux-x86_64/bin/:$PATH

# Compile Git
wget --directory-prefix=$HOME/Downloads https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.19.2.tar.gz
tar --extract --gzip --verbose --file=$HOME/Downloads/git-2.19.2.tar.gz --directory=$HOME/Downloads
cd $HOME/Downloads/git-2.19.2
make configure
./configure --prefix=$HOME/apps/git-2.19.2
make all
make install
export PATH=$HOME/apps/git-2.19.2/bin/:$PATH
cd $ORIGIN_DIR
rm -rf $HOME/Downloads/git-2.19.2.tar.gz
rm -rf $HOME/Downloads/git-2.19.2

# Compile Cling
mkdir cling
cd cling
git clone http://root.cern.ch/git/llvm.git src
cd src
git checkout cling-patches
cd tools
git clone http://root.cern.ch/git/cling.git
git clone http://root.cern.ch/git/clang.git
cd clang
git checkout cling-patches
cd ../../..
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$HOME/apps/cling -DCMAKE_BUILD_TYPE=Release ../src
cmake --build .
cmake --build . --target install
cd $ORIGIN_DIR
rm -rf $ORIGIN_DIR/cling

# Adjust environment variables related to gcc-7.3.0, CMake and Git
cp $HOME/.bashrc $HOME/.bashrc_build_tools_backup
echo "# Environment variables related to gcc-7.3.0, CMake and Git" >> $HOME/.bashrc
echo "PATH=\$HOME/apps/gcc-7.3.0/bin/:\$PATH" >> $HOME/.bashrc
echo "PATH=\$HOME/apps/cmake-3.12.4-Linux-x86_64/bin/:\$PATH" >> $HOME/.bashrc
echo "PATH=\$HOME/apps/git-2.19.1/bin/:\$PATH" >> $HOME/.bashrc
echo "LD_LIBRARY_PATH=\$HOME/apps/gcc-7.3.0/lib64/" >> $HOME/.bashrc
echo "LD_RUN_PATH=\$HOME/apps/gcc-7.3.0/lib64/" >> $HOME/.bashrc
echo "# Cling path" >> $HOME/.bashrc
echo "export PATH=\$HOME/apps/cling/bin:\$PATH" >> $HOME/.bashrc

