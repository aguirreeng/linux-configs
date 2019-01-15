# CMake-3.13.3
wget --directory-prefix=$HOME/Downloads https://github.com/Kitware/CMake/releases/download/v3.13.3/cmake-3.13.3-Linux-x86_64.sh
mkdir $HOME/apps/cmake-3.13.3
/usr/bin/sh $HOME/Downloads/cmake-3.13.3-Linux-x86_64.sh --prefix=$HOME/apps/cmake-3.13.3 --skip-license
rm -rf $HOME/Downloads/cmake-3.13.3-Linux-x86_64.sh

