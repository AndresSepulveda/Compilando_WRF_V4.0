#!/bin/bash 

export WRF_HOME=/data2/wrf/Orestes

date
cd /data2/wrf/GFS
#./get_GFS.csh 
date
cd ${WRF_HOME}/
./mk_BC.csh
./mk_RUN.csh
##./mk_PLOTS.csh
##date
./clean_fcst.csh



