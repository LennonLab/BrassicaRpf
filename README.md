# Resuscitating the microbial seed bank alter plant-soil interacts

## Goal
To test how resuscitating the microbial seedbank with a resuscitation promoting factor (Rpf) will alter plant-soil microbe interactions and affect plant traits. 

## Methods 
We conducted a factoral growth chamber experiment to test the effect of Rpf and soil sterilization treatment on Brassica rapa plant biomass and reproductive output. We also determined the effects of Rpf treatment on soil microbial activity, abundance, and community composition using culture-independent genomic methods. 

## Contents

**analyses**

brassica_traits.Rmd: Analysis of plant trait changes with Rpf and soil sterilization treatment.

control_experiment.Rmd: Analysis of control experiment testing the effect of direct Rpf application on Arabidopsis seedlings

soil_abundanceactivity.Rmd: Analysis of weekly soil CO2 respiration with Rpf treatment and soil bacterial and fungal gene copy abundances with Rpf treatment and week of growth chamber experiment. 

soil_diversity.Rmd: Analysis of active and total soil bacterial diversity, richness, and community composition between Rpf treatments.

soil_properties.Rmd: Analysis of soil pH, C:N ratio, and available P. 

**bin**

DiversityFunctions.R: R code of custom diversity functions for bacterial community structure analyses. 

MothurTools.R: R code of workflow pipeline for mothur output files. Done by Mario Muscarella. 

summarySE.R: R code for determine summary standard error to be used for ggplot2. 

IRGARespiration.R: R code of workflow pipeline for normalizing and determining CO2 level of soil samples.

**data**

Brassica.design.txt: Text file of factoral experimental design.

CN.txt: Text file of C:N ratio results.

even.txt: Text file of bacterial community evenness resampling output.

rich.txt: Test file of bacterial community taxonomic richness resampling output. 

GCH_CO2.txt: Text file of determined soil CO2 respiration results for each week of the growth chamber experiment. 

qPCR.txt: Text file of bacterial 16S rRNA and fungal ITS gene copy abundance data from quantitative PCR analysis. 

plantfitness.txt: Text file of Brassica rapa plant measurements of flower count, specific leaf area, seed counts, height, total (above and belowground) biomass. 

seedlingbiomass.txt: Text file of Arabidopsis thaliana seedling biomass on MS media plates with Rpf treatment.

SoilpH.txt: Text file of soil pH results. 

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
