#!/bin/csh
#
# Get GFS files for the next 72h, every 6h, 0.50°
#
# 28/09/2012 Andres Sepulveda - University of Concepcion (andres@dgeo.udec.cl)
# Adapted from a script of Rodrigo Sanchez - University of Chile (DGF)
#
# 10/04/2015 Updated gfs file name - Andres Sepulveda (DGEO)
# 20/06/2019 Updated gfs path      - Andres Sepulveda (DGEO)
#
set f=`date +%Y%m%d`
#set hracb=00
set URL = "ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod"
set WGET=/usr/bin/wget

/bin/mkdir $f
cd $f

foreach hracb ( 00 )
  foreach hra ( 00 06 12 18 24 30 36 42 48 54 60 66 72 )
       $WGET -t 0 ${URL}/gfs.${f}/${hracb}/gfs.t${hracb}z.pgrb2.0p50.f0${hra}
   end
end
