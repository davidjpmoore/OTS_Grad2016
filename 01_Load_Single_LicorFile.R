#Author: Dave Moore
#Date: 01/05/2016 
#Purpose: Script for reading in LiCor files, doing QC, fitting A/Ci. 
#Then creates summary df for work with stats


#Grab the following packages before you start
library(devtools)
library(PEcAn.photosynthesis)

#### To load a single file using PECAN.photosynthesis
## Read LI-COR 6400 files (ASCII not xls)
NameofDataFrame <- read.Licor("./data/2015-01-05_restoffilename")
