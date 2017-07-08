#!/bin/bash
#PBS -k o
#PBS -l nodes=2:ppn=8,vmem=100gb,walltime=5:00:00
#PBS -M lennonj@indiana.edu
#PBS -m abe
#PBS -j oe

module load python/2.7.3
module load biopython/1.63
module load fasttree/2.1.1

cd /N/dc2/projects/Lennon_Sequences/2017BrassicaRpf

python name_change.py "Brassica.bac.final.0.03.rep.fasta" "Brassica.bac.final.0.03.rep.rename.fasta"

fasttree -gtr -nt -gamma -fastest Brassica.bac.final.0.03.rep.fasta > Brassica.bac.rename.tree.2
