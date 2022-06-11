#!/bin/bash

./clean -a

./configure -D <<< "32"

# turn on RRTMK
sed -i 's/RRTMK=0/RRTMK=1/g' configure.wrf
# add LIB_EXTERNAL
sed -i 's/-lnetcdff -lnetcdf/& -L\/luc\/lib\/fta\/lib -ltorch_wrapper_F/' configure.wrf
# add INCLUDE_MODULES
sed -i '/NETCDFPATH)\/include \\/a-I\/luc\/lib\/fta\/include \\' configure.wrf

./compile em_real &> compile.log

