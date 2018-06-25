#!/bin/sh

# set personal library in PYTHONPATH
if env | grep -q ^PYTHONPATH_OLD=
then
  export PYTHONPATH=$PYTHONPATH_OLD
  unset PYTHONPATH_OLD
else
  unset PYTHONPATH
fi
