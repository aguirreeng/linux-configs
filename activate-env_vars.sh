#!/bin/sh

# set personal library in PYTHONPATH
if env | grep -q ^PYTHONPATH=
then
  export PYTHONPATH_OLD=$PYTHONPATH
  export PYTHONPATH=${PYTHONPATH}:$HOME/repository
else
  export PYTHONPATH=$HOME/repository
fi

