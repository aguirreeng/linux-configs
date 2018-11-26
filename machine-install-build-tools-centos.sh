# Compile gcc-7.3.0
ORIGIN_DIR=$PWD
mkdir $HOME/Downloads
wget --directory-prefix=$HOME/Downloads http://mirrors-usa.go-parts.com/gcc/releases/gcc-7.3.0/gcc-7.3.0.tar.gz
tar --extract --gzip --verbose --file=$HOME/Downloads/gcc-7.3.0.tar.gz --directory=$HOME/Downloads
mkdir $HOME/Downloads/objdir
cd $HOME/Downloads/objdir
$HOME/Downloads/gcc-7.3.0/configure --prefix=$HOME/apps/gcc-7.3.0
make --directory=$HOME/Downloads/objdir BOOT_CFLAGS='-O' bootstrap
make install
export PATH=$HOME/apps/gcc-7.3.0/bin/:$PATH
cd $ORIGIN_DIR
rm -rf $HOME/Downloads/gcc-7.3.0.tar.gz
rm -rf $HOME/Downloads/gcc-7.3.0
rm -rf $HOME/Downloads/objdir

# Compile CMake
wget --directory-prefix=$HOME/Downloads https://cmake.org/files/v3.12/cmake-3.12.4-Linux-x86_64.sh
mkdir $HOME/apps/cmake-3.12.4-Linux-x86_64
/usr/bin/sh $HOME/Downloads/cmake-3.12.4-Linux-x86_64.sh --prefix=$HOME/apps/cmake-3.12.4-Linux-x86_64 --skip-license
rm -rf $HOME/Downloads/cmake-3.12.4-Linux-x86_64.sh
export PATH=$HOME/apps/cmake-3.12.4-Linux-x86_64/bin/:$PATH

# Compile Git
wget --directory-prefix=$HOME/Downloads https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.19.1.tar.gz
tar --extract --gzip --verbose --file=$HOME/Downloads/git-2.19.1.tar.gz --directory=$HOME/Downloads
cd $HOME/Downloads/git-2.19.1
make configure
./configure --prefix=$HOME/apps/git-2.19.1
make all
make install
export PATH=$HOME/apps/git-2.19.1/bin/:$PATH
cd $ORIGIN_DIR
rm -rf $HOME/Downloads/git-2.19.1.tar.gz
rm -rf $HOME/Downloads/git-2.19.1

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

