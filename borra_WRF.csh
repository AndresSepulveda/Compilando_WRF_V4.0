#!/bin/bash
#
#
export yr=`date +%Y --date="3 days ago"`
export mn=`date +%m --date="3 days ago"`
export dy=`date +%d --date="3 days ago"`

cd /data2/wrf/Orestes/done 

rm -rf wrfout*${yr}-${mn}-${dy}*

