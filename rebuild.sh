#!/bin/bash

./clean -a

./configure <<< "34"

sed -i 's/RRTMK=0/RRTMK=1/g' configure.wrf

./compile em_real &> compile.log

