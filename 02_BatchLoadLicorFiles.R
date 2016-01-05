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


## Get list of LI-COR 6400 file names (ASCII not xls)

#this command looks for files *starting with* '2015-01-' within the folder "data" - the files adhere to 
# a naming convention that let's the code pull out whether the file is an A/ci curve or an aq curve
#
filenames <- system.file("data", paste0("2015-01-",rep(1:6,each=2),c("aci","aq")), package = "PEcAn.photosynthesis")


## Load files to a list
master = lapply(filenames, read.Licor)

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

