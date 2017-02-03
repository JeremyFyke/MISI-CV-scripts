#!/bin/bash
#
#MSUB -l walltime=00:05:00
#MSUB -l nodes=1:ppn=16
#MSUB -A w17_greenland

D=$PWD
source module_load.sh

Resolution=4000
cd MISI_experiments/landice/MISI-CV/standard_resolution/standard_test/"$Resolution"m/Spinup_0_0.0_0.0_1_0_1000_0.2_10000

mpirun -n 16 landice_model
