#!bin/csh
#
# Get SST for a certain date
#
# 28/05/2015 Andres Sepulveda - University of Concepcion (andres@dgeo.udec.cl)
#
set f=20000124
set URL = "ftp://polar.ncep.noaa.gov/pub/history/sst/rtg_low_res"
set WGET=/usr/bin/wget

       $WGET -t 0 ${URL}/rtg_sst_grb_0.5.${f}
