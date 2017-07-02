#!/bin/bash
#PBS -k o
#PBS -l nodes=1:ppn=16,vmem=500gb,walltime=60:00:00
#PBS -M vkuo@iu.edu
#PBS -m abe
#PBS -j oe
cd /N/dc2/projects/Lennon_Sequences/2017BrassicaRpf
module load gcc/4.9.4
module load boost/1.52.0
module load mothur/1.39.5
mothur Brassica.Batch
