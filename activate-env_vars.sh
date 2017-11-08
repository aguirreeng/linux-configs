#!/bin/sh

# set personal library in PYTHONPATH
if env | grep -q ^PYTHONPATH=
then
  export PYTHONPATH_OLD=$PYTHONPATH
  export PYTHONPATH=${PYTHONPATH}:$HOME/repository
else
  export PYTHONPATH=$HOME/repository
fi
# set Conda include path to C++
export CPLUS_INCLUDE_PATH=$CONDA_PREFIX/include:$CONDA_PREFIX/include/eigen3
