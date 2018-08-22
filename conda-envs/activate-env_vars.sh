#!/bin/sh

# set personal library in PYTHONPATH
if env | grep -q ^PYTHONPATH=
then
  export PYTHONPATH_OLD=$PYTHONPATH
  export PYTHONPATH=${PYTHONPATH}:$HOME/repository
else
  export PYTHONPATH=$HOME/repository
fi

# set conda C++ libraries include path
if env | grep -q ^CPLUS_INCLUDE_PATH=
then
  export CPLUS_INCLUDE_PATH_OLD=$CPLUS_INCLUDE_PATH
  export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${CONDA_PREFIX}/include
  export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${CONDA_PREFIX}/include/eigen3
else
  export CPLUS_INCLUDE_PATH=${CONDA_PREFIX}/include
  export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${CONDA_PREFIX}/include/eigen3
fi