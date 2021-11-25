#!/bin/bash 

export fecha=`date +%Y%m%d`
export WRF_HOME=/data2/wrf/Orestes
export hracb=00

cd ${WRF_HOME}
export sy=`/bin/date +%Y`
export sm=`/bin/date +%m`
export sd=`/bin/date +%e`
export ey=`date --date="+5 day" +%Y`
export em=`date --date="+5 day" +%m`
export ed=`date --date="+5 day" +%d`

echo " start_year   =   ${sy}, ${sy}, ${sy}, ${sy}   "  > namelist.wps-middle
echo " start_month  =   ${sm}, ${sm}, ${sm}, ${sm}   " >> namelist.wps-middle
echo " start_day    =   ${sd}, ${sd}, ${sd}, ${sd}   " >> namelist.wps-middle
echo " start_hour   =   ${hracb}, ${hracb}, ${hracb}, ${hracb} " >> namelist.wps-middle
echo " start_minute =   00, 00, 00, 00      " >> namelist.wps-middle
echo " start_second =   00, 00, 00, 00      " >> namelist.wps-middle
echo " end_year     =   ${ey}, ${ey}, ${ey}, ${ey}  " >> namelist.wps-middle
echo " end_month    =   ${em}, ${em}, ${em}, ${em}  " >> namelist.wps-middle
echo " end_day      =   ${ed}, ${ed}, ${ed}, ${ed}   " >> namelist.wps-middle
echo " end_hour     =   ${hracb}, ${hracb}, ${hracb}, ${hracb} " >> namelist.wps-middle
echo " end_minute   =   00, 00, 00, 00      " >> namelist.wps-middle
echo " end_second   =   00, 00, 00, 00      " >> namelist.wps-middle

cat namelist.wps.pre namelist.wps-middle namelist.wps.post > namelist.wps
./link_grib.csh /data2/wrf/GFS/$fecha/gfs.t00z.pgrb2* . 
./ungrib.exe  >& ungriblog.log 
./metgrid.exe >& metgridlog.log
cat namelist.input.pre namelist.wps-middle namelist.input.post > namelist.input 
./real.exe    >& reallog.log

