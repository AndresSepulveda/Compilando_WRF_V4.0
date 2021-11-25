#!/bin/bash 
export f=`date +%Y%m%d`
export yr=`date +%Y`
export mn=`date +%m`
export dy=`date +%d`
export WRF_HOME=/data2/wrf/Orestes
export hracb=00

cd ${WRF_HOME}

#
#  Rename and store output (gzip?)
#
/bin/mv wrfout_d01_${yr}-${mn}-${dy}_00:00:00  wrfout_d01_${yr}-${mn}-${dy}.nc
/bin/mv wrfout_d02_${yr}-${mn}-${dy}_00:00:00  wrfout_d02_${yr}-${mn}-${dy}.nc
/bin/mv wrfout_d03_${yr}-${mn}-${dy}_00:00:00  wrfout_d03_${yr}-${mn}-${dy}.nc
/bin/mv wrfout_d04_${yr}-${mn}-${dy}_00:00:00  wrfout_d04_${yr}-${mn}-${dy}.nc

/bin/mv wrfout_d01_${yr}-${mn}-${dy}.nc /data2/wrf/Orestes/done
/bin/mv wrfout_d02_${yr}-${mn}-${dy}.nc /data2/wrf/Orestes/done
/bin/mv wrfout_d03_${yr}-${mn}-${dy}.nc /data2/wrf/Orestes/done
/bin/mv wrfout_d04_${yr}-${mn}-${dy}.nc /data2/wrf/Orestes/done

/bin/mv pronostico.log /data2/wrf/Orestes/done/pronostico_${yr}-${mn}-${dy}.log

#
#  Copy generated plots
#
##/usr/bin/scp *.png /atmos/WRF/plots

#
# Clean directory
#
#/bin/rm --force gfs.t${hracb}z.pgrb2*
#/bin/rm wrfout_d01_${yr}-${mn}-${dy}.nc
/bin/rm --force namelist.wps
/bin/rm --force namelist.input
/bin/rm --force namelist.wps-middle
/bin/rm --force wget-log* met_em* PFILE* FILE* GRIBFILE.* >& /dev/null
/bin/rm --force wrfbdy* wrfinput* 
/bin/rm --force wrfrst*
/bin/rm --force core* 
/bin/rm --force namelist.output

/bin/gzip  ./done/*nc 
