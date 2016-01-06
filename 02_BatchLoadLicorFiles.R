#Author: Dave Moore
#Date: 01/05/2016 
#Purpose: Script for reading in LiCor files, doing QC, fitting A/Ci. 
#Then creates summary df for work with stats


#Grab the following packages before you start

library(devtools)
#library(ggplot2)
#library(plyr)
#library(dplyr)
#library(scales)

library(ggplot2)
library(PEcAn.photosynthesis)

################################################################################
#####                       BEFORE YOU START                              ######
#####                         READ THIS                                   ######
################################################################################

#https://github.com/PecanProject/pecan/blob/master/modules/photosynthesis/vignettes/ResponseCurves.Rmd

################################################################################

#
#
#
# Seriously .... go back and read that!

## Get list of LI-COR 6400 file names (ASCII not xls)

#this command looks for files *starting with* '2015-01-' within the folder "data" - the files adhere to 
# a naming convention that let's the code pull out whether the file is an A/ci curve or an aq curve
#

# ##Reading data files using PEcAn.photosynthesis function read.Licor
# #Preferred way: load files to a list

#Create a list of files from the "ACI" folder
filepathACI="./data/ACI/"

tempFilelistACI = list.files(filepathACI,pattern="2016-01")

#Create a list of files from the "Light" folder
filepathLight="./data/Light/"
tempFilelistLIGHT = list.files(filepathLight,pattern="2016-01")

#working directory on this computer
cpath = getwd()

#Creates ACIfiles object that is a list of the file locations
midpathACI="/data/ACI/"
ACIFiles = paste0(cpath,midpathACI,tempFilelistACI)

#Creates Lightfiles object that is a list of the file locations
midpathLight="/data/Light/"
LightFiles = paste0(cpath,midpathLight,tempFilelistLIGHT)


# ##Perform QA/QC to get rid of outliers
# #Make master list and apply read.Licor
ACIMaster = lapply(ACIFiles, read.Licor)
LIGHTMaster = lapply(LightFiles, read.Licor)



#########################################
###### MUST TROUBLE SHOOT BELOW #########
#########################################

# # The code below performs a set of interactive QA/QC checks on the LI-COR data that's been loaded. 
# Because it's interactive it isn't run when this vignette is knit.

# # If you want to get a feel for how the code works you'll 
# want to run it first on just one file, rather than looping over all the files

#this runs licor QC on a file - you click on outliers to remove them

master[[1]] <- Licor.QC(master[[1]])

#same process for all files
for(i in 1:length(master)){
  master[[i]] = Licor.QC(master[[i]])
}

#after the QC process combine the files into one data frame

dat<-do.call("rbind", master)


## if QC was done, remove both unchecked points and those that fail QC
if("QC" %in% colnames(dat)){
  dat = dat[-which(dat$QC < 1),]  
} else{
  QC = rep(1,nrow(dat))
  dat = cbind(dat,QC)
}
Status 

