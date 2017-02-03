#!/bin/bash

###SETUP ENVIRONMENT
   D=$PWD
   source module_load.sh
   module list

###SETUP EXPERIMENTS
#Set resolution
   Resolution=4000
   Dir=$D/MPAS/test_cases/ocean/landice/MISI-CV/standard_resolution/standard_test
   cp $Dir/namelist.input."$Resolution"m $Dir/namelist.input
   sed -i "s/config case=\"[0-9]*m\"/config case=\"${Resolution}m\"/g" $Dir/config_setup_experiments.xml

#Create MISI-CV+ experiment structure in working directory
   myWorkDir=/lustre/scratch2/turquoise/jer/MISI_experiments
   rm -rf myWorkDir
   cd $D/MPAS/test_cases/ocean
   n=33
   python clean_testcase.py --core landice --case_number $n --work_dir $myWorkDir
   python setup_testcase.py --core landice --case_number $n -f $D/general.config.landice --work_dir $myWorkDir
   ln -s $myWorkDir/ $D

#Configure MISI-CV experiments
   cd $myWorkDir/landice/MISI-CV/standard_resolution/standard_test/"$Resolution"m
   python setup_test.py

