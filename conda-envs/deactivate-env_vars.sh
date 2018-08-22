!/bin/sh

# unset personal library in PYTHONPATH
if env | grep -q ^PYTHONPATH_OLD=
then
  export PYTHONPATH=$PYTHONPATH_OLD
  unset PYTHONPATH_OLD
else
  unset PYTHONPATH
fi

# unset conda C++ libraries include path
if env | grep -q ^CPLUS_INCLUDE_PATH_OLD=
then
  export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH_OLD
  unset CPLUS_INCLUDE_PATH_OLD
else
  unset CPLUS_INCLUDE_PATH
fi