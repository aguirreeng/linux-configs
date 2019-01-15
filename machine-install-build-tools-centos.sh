# Compile Cling
#mkdir cling
#cd cling
#git clone http://root.cern.ch/git/llvm.git src
#cd src
#git checkout cling-patches
#cd tools
#git clone http://root.cern.ch/git/cling.git
#git clone http://root.cern.ch/git/clang.git
#cd clang
#git checkout cling-patches
#cd ../../..
#mkdir build
#cd build
#cmake -DCMAKE_INSTALL_PREFIX=$HOME/apps/cling -DCMAKE_BUILD_TYPE=Release ../src
#cmake --build .
#cmake --build . --target install
#cd $ORIGIN_DIR
#rm -rf $ORIGIN_DIR/cling

# Adjust environment variables related to gcc-7.3.0, CMake and Git
#cp $HOME/.bashrc $HOME/.bashrc_build_tools_backup
#echo "# Environment variables related to gcc-7.3.0, CMake and Git" >> $HOME/.bashrc
#echo "PATH=\$HOME/apps/gcc-7.3.0/bin/:\$PATH" >> $HOME/.bashrc
#echo "PATH=\$HOME/apps/cmake-3.12.4-Linux-x86_64/bin/:\$PATH" >> $HOME/.bashrc
#echo "PATH=\$HOME/apps/git-2.19.1/bin/:\$PATH" >> $HOME/.bashrc
#echo "LD_LIBRARY_PATH=\$HOME/apps/gcc-7.3.0/lib64/" >> $HOME/.bashrc
#echo "LD_RUN_PATH=\$HOME/apps/gcc-7.3.0/lib64/" >> $HOME/.bashrc
#echo "# Cling path" >> $HOME/.bashrc
#echo "export PATH=\$HOME/apps/cling/bin:\$PATH" >> $HOME/.bashrc

