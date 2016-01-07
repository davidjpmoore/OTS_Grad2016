##### Fit ACI curves
#Grab the following packages before you start
library(devtools)
library(PEcAn.photosynthesis)
library(plantecophys)

APari_plant1 = read.Licor("./data/Light/2016-01-05-ots-light-curve-plant-1")
AACI_plant1 = read.Licor("./data/ACI/2016-01-05-ots-aci-curve-plant-1")


fitaci(AACI_plant1)

