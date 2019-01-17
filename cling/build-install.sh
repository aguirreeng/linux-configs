# CLING
ORIGIN_DIR=$PWD
mkdir $HOME/Downloads/cling
cd $HOME/Downloads/cling
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
rm -rf $HOME/Downloads/cling
