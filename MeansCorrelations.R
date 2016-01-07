library (dplyr)
allLight=read.csv("data/MASTER1.csv")

ENV=read.csv("data/ENVI.csv")

ENV= ENV %>%
  mutate(morpho.species=plot) %>%
  group_by(morpho.species) %>% 
  mutate(PAR=PARo) 

  meanENV = ENV %>%
  group_by(morpho.species) %>% 
  summarise(meanPAR = mean(PAR), meanTemp=mean(Tleaf), meanRH=mean(RH_S))
           
 meanENV


MASTER1 = allLight %>%
  group_by(morpho.species) %>%
  filter(PARi>1000)


MeanMASTER1 = MASTER1 %>%
  group_by(morpho.species) %>% 
  summarise(meanAsat = mean(Photo), sdAsat=sd(Photo), meanCond=mean(Cond), sdCond=sd(Cond))
MeanMASTER1

plot(meanENV$meanPAR, MeanMASTER1$meanAsat)
pairs(meanENV,MeanMASTER1)