#!/bin/bash

module use /usr/projects/climate/SHARED_CLIMATE/modulefiles/all
module purge

module load git/2.3.3
module load cmake
module load python/anaconda-2.7-climate

module load gcc/4.8.2
module load openmpi/1.6.5

module load netcdf/4.4.0
module load parallel-netcdf/1.5.0
module load pio/1.7.2

module load boost/1.57.0
module load metis
module load parmetis
module load hdf5-parallel

module load trilinos/2015-08-24
module load albany/2015-11-12
