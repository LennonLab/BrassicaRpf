# Brassica-Rpf Project 

## Goal
To test how resuscitating the microbial seedbank with a bacterial resuscitation promoting factor (Rpf) will alter plant-soil microbe interactions and affect plant fitness and productivity. 

## Methods 
Briefly, in a full factoral experiment treating Brassica rapa plants grown in growth chambers with recombiant Rpf protein in live and sterilized soil. At the end of the six week growth chamber experiment, biomass was determined by dry weight. Soil community structure and diversity was determined. 

## Contents

**analyses**
BrassicaRpfRCode.Rmd: All anaylses of plant fitness and productivity testing the effects of Rpf treatment. 

MothurTools.R: R code of workflow pipeline for mothur output files. Done by Mario Muscarella. 

summarySE.R: R code for determine summary standard error to be used for ggplot2. 

IRGARespiration.R: R code of workflow pipeline for normalizing and determining CO2 level of soil samples.

CommunityComposition.Rmd: R code of workflow pipeline to generate soil community diversity and composition. 

Figure 1.Rmd: Cleaned code to generate figure 1 of the manuscript describing the effect of Rpf treatment on Brassica plants in live soil. 

**data**
qPCR.csv : Bacterial 16S rRNA and fungal ITS gene copy abundance data from quantitative PCR analysis. 

GCH_CO2.csv : Soil CO2 respiration data from soil. 

Plant Fitness.csv : Plant measurements of flower count, specific leaf area, seed counts, height, total (above and belowground) biomass. 

**figures**
Not added yet

**mothur**
code folder contains mothur Batch scripts and shell scripts for running pipeline in mason.

output folder contains shared and summary files from mothur pipeline output. 

**raw data**
growth chamber raw data folder contains all raw data of plant measurements taken by Peyton.

respiration raw data folder contains raw txt file reads of CO2  soil respiration. 

## Software used and versions
R Programing v3.3.0

mothur/1.36.1

gcc/4.9.2

## Known Bugs and Issues


## Contributors 
[Venus Kuo](https://github.com/vkuo2): Ph.D. student in the [Lennon Lab](http://www.indiana.edu/~microbes/people.php)

[Dr. Jay Lennon](http://www.indiana.edu/~microbes/people.php): Principle Investigator, Associate Professor, Department of Biology, Indiana University, Bloomington. Head of the [Lennon Lab](http://www.indiana.edu/~microbes/people.php).

## Funding
Dimensions of Biodiversity National Science Foundation
