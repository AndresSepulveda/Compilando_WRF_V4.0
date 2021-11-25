#!/bin/bash 
export PATH=/usr/bin:/bin:/usr/local/bin
export NCARG_ROOT=/opt/NCL

export WRF_HOME=/data2/wrf/Orestes

cd ${WRF_HOME}
 ./wrf.exe

