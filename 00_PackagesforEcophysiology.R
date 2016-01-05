#Author: Dave Moore
#Date: 01/05/2016 
#Purpose: Script for reading in LiCor files, doing QC, fitting A/Ci. 
#Then creates summary df for work with stats


#Grab the following packages before you start
#This is a comment

library(devtools)
#also need rjags and JAGS
library(ggplot2)
library(plyr)
library(dplyr)
library(scales)
library(ggplot2)


###### Only need to do this once ########
#installing PEcAn.photosynthesis as a stand alone
if (!require("PEcAn.photosynthesis",character.only = TRUE))
{
  library(devtools)
  install_github("PecanProject/pecan/modules/photosynthesis") 
}
#note you need rjags installed in R and also JAGS (stand alone application) installed on your computer
#note you will also need Rtools installed.

#note you will get an error 
library(PEcAn.photosynthesis)


#PlantEcoPhys
# Plantecophys - An R Package for Analysing and Modelling Leaf Gas Exchange Data
# Remko A. Duursma
# Paper describing the package: http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0143346
# Source code and descriptions: https://bitbucket.org/remkoduursma/plantecophys

library(devtools)
install_bitbucket("remkoduursma/plantecophys")

