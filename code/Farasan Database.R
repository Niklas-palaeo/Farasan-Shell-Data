#LIBRARIES####
library(magrittr)
library(purrr)
library(readr)
library(dplyr)
library(tidyverse)
library(reshape2)
#IMPORT DATA####
setwd("~/capsule/data/CSV Exports")

#Data from Janaba West - 
#JW1864####
    #This is the species data
JW1864 <- read.csv("JW1864.csv")
    #This is the aperture data
ApsJW1864<- read.csv("JW1864-Apertures.csv")%>%
  na.omit()
    #Species structured as a list
JW1864 <- nrow(JW1864)%>%
  seq(.)%>%
  split(JW1864,.)%>%
  setNames(.,JW1864$Sample.No)
JW1864 <- modify_depth(JW1864,1,~ discard(.x,is.na))#Remove NA columns
    #Apertures structured into lists
ApGroupsJW1864<- split( ApsJW1864 ,f = ApsJW1864$Sample.No)
ApGroupsJW1864 <- modify_depth(ApGroupsJW1864,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
    #Add Apertures to list of site
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(JW1864))  {JW1864[[i]][[Sfac]] <- c(ApGroupsJW1864[[i]])}

#JW1705####
JW1705 <- read.csv("JW1705.csv")
ApsJW1705<- read.csv("JW1705-Apertures.csv")
JW1705 <- nrow(JW1705)%>%
  seq(.)%>%
  split(JW1705,.)%>%
  setNames(.,JW1705$Sample.No)
JW1705 <- modify_depth(JW1705,1,~ discard(.x,is.na))
ApGroupsJW1705<- split( ApsJW1705 ,f = ApsJW1705$Sample.No)
ApGroupsJW1705 <- modify_depth(ApGroupsJW1705,1,~ list_modify(.x,"Sample.No" = NULL))
for (i in 1:length(ApGroupsJW1705))  {JW1705[[as.character(names(ApGroupsJW1705[i]))]][[Sfac]] <- c(ApGroupsJW1705[[i]])} #for when some samples don't have apertures



#JW3120####
JW3120 <- read.csv("JW3120.csv")
ApsJW3120<- read.csv("JW3120-Apertures.csv")
JW3120 <- nrow(JW3120)%>%
  seq(.)%>%
  split(JW3120,.)%>%
  setNames(.,JW3120$Sample.No)
JW3120 <- modify_depth(JW3120,1,~ discard(.x,is.na))#Remove NA columns
ApGroupsJW3120<- split( ApsJW3120 ,f = ApsJW3120$Sample.No) #make into list
ApGroupsJW3120 <- modify_depth(ApGroupsJW3120,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
for (i in 1:length(JW3120))  {JW3120[[i]][[Sfac]] <- c(ApGroupsJW3120[[i]])}



#JW1807####
JW1807 <- read.csv("JW1807.csv")
ApsJW1807<- read.csv("JW1807-Apertures.csv")
JW1807 <- nrow(JW1807)%>%
  seq(.)%>%
  split(JW1807,.)%>%
  setNames(.,JW1807$Sample.No)
JW1807 <- modify_depth(JW1807,1,~ discard(.x,is.na))#Remove NA columns
ApGroupsJW1807<- split( ApsJW1807 ,f = ApsJW1807$Sample.No) #make into list
ApGroupsJW1807 <- modify_depth(ApGroupsJW1807,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
for (i in 1:length(JW1807))  {JW1807[[i]][[Sfac]] <- c(ApGroupsJW1807[[i]])}



#JW2298####
JW2298 <- read.csv("JW2298.csv")
ApsJW2298<- read.csv("JW2298-Apertures.csv")
JW2298 <- nrow(JW2298)%>%
  seq(.)%>%
  split(JW2298,.)%>%
  setNames(.,JW2298$Sample.No)
JW2298 <- modify_depth(JW2298,1,~ discard(.x,is.na))#Remove NA columns
ApGroupsJW2298<- split( ApsJW2298 ,f = ApsJW2298$Sample.No) #make into list
ApGroupsJW2298 <- modify_depth(ApGroupsJW2298,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
for (i in 1:length(JW2298))  {JW2298[[i]][[Sfac]] <- c(ApGroupsJW2298[[i]])}



#JW5697####
JW5697 <- read.csv("JW5697.csv")
#No aperture data available
JW5697 <- nrow(JW5697)%>%
  seq(.)%>%
  split(JW5697,.)%>%
  setNames(.,JW5697$Sample.No)
JW5697 <- modify_depth(JW5697,1,~ discard(.x,is.na))#Remove NA columns


#JW1727 had two sample colums. Column A was a the centre of the midden, column B was in the mid-rim of the midden with increased layer disturbances.
#JW1727_A####
JW1727_A <- read.csv("JW1727_A.csv")
ApsJW1727_A<- read.csv("JW1727_A-Apertures.csv")
JW1727_A <- nrow(JW1727_A)%>%
  seq(.)%>%
  split(JW1727_A,.)%>%
  setNames(.,JW1727_A$Sample.No)
JW1727_A <- modify_depth(JW1727_A,1,~ discard(.x,is.na))#Remove NA columns
ApGroupsJW1727_A<- split( ApsJW1727_A ,f = ApsJW1727_A$Sample.No) #make into list
ApGroupsJW1727_A <- modify_depth(ApGroupsJW1727_A,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
for (i in 1:length(JW1727_A))  {JW1727_A[[i]][[Sfac]] <- c(ApGroupsJW1727_A[[i]])}



#JW1727_B####
JW1727_B <- read.csv("JW1727_B.csv")
ApsJW1727_B<- read.csv("JW1727_B-Apertures.csv")
JW1727_B <- nrow(JW1727_B)%>%
  seq(.)%>%
  split(JW1727_B,.)%>%
  setNames(.,JW1727_B$Sample.No)
JW1727_B <- modify_depth(JW1727_B,1,~ discard(.x,is.na))#Remove NA columns
ApGroupsJW1727_B<- split( ApsJW1727_B ,f = ApsJW1727_B$Sample.No) #make into list
ApGroupsJW1727_B <- modify_depth(ApGroupsJW1727_B,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
for (i in 1:length(JW1727_B))  {
  if (Sfac %in% names(JW1727_B[[i]]) == FALSE) {
    next
  }
  JW1727_B[[i]][[Sfac]] <- c(ApGroupsJW1727_B[[i]])
}



#TestPits - This is an akward way of reading the testpits. I could have used similar means to read in all the other lists, but they were less consistent and kept failing.
JWTP<- read.csv("JWTP.csv")
TPL <- list() 
TPs <- list()
for (i in 1:20) {
  write_csv(as.data.frame(JWTP[i,]),file.path(paste0(JWTP$Site.Reference[i],".csv")))
  TP <- read.csv(paste0(JWTP$Site.Reference[i],".csv"))
  TPL <- nrow(TP)%>%
    seq(.)%>%
    split(TP,.)%>%
    setNames(.,TP$Sample.No)
  TPL <- modify_depth(TPL,1,~ discard(.x,is.na))#Remove NA columns
  TPs[length(TPs)+1] <- list(TPL)
  names(TPs)[[i]][1] <- paste0(JWTP$Site.Reference[i])
}
#
rm(TPL,TP)






#UPDATE SITE LIST####
Janaba_West <- list("JW0001"=TPs[[1]],"JW0002"=TPs[[2]],"JW0003"=TPs[[3]],"JW0004"=TPs[[4]],"JW0005"=TPs[[5]],
                    "JW0006"=TPs[[6]],"JW0007"=TPs[[7]],"JW0008"=TPs[[8]],"JW0009"=TPs[[9]],"JW0010"=TPs[[10]],
                    "JW0011"=TPs[[11]],"JW0012"=TPs[[12]],"JW0013"=TPs[[13]],"JW0014"=TPs[[14]],"JW0015"=TPs[[15]],
                    "JW0016"=TPs[[16]],"JW0017"=TPs[[17]],"JW0018"=TPs[[18]],"JW0019"=TPs[[19]],"JW0021"=TPs[[20]],
                    "JW1705"=JW1705,
                    "JW1727_A"=JW1727_A,
                    "JW1727_B"=JW1727_B,
                    "JW1807"=JW1807,
                    "JW1864" = JW1864,
                    "JW2298"=JW2298,
                    "JW3120"=JW3120,
                    "JW5697"=JW5697)


# #Janaba East

#JE0003####
JE0003<- read.csv("JE0003.csv")

ApsJE0003<- read.csv("JE0003-Apertures.csv")


#Database structure###
JE0003<- nrow(JE0003)%>%
  seq(.)%>%
  split(JE0003,.)%>%
  setNames(.,JE0003$Sample.No)

JE0003<- modify_depth(JE0003,1,~ discard(.x,is.na))#Remove NA columns

#Structure Apertures###
#ApsJE0003[,2] <- as.numeric(levels(ApsJE0003[,2]))[ApsJE0003[,2]] #make numeric
#ApsJE0003<- as.data.frame(ApsJE0003[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsJE0003<- split( ApsJE0003,f = ApsJE0003$Sample.No) #make into list
ApGroupsJE0003<- modify_depth(ApGroupsJE0003,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(JE0003))  {JE0003[[i]][[Sfac]] <- c(ApGroupsJE0003[[i]])}

#JE0004####
JE0004<- read.csv("JE0004.csv")
JE0004B<- read.csv("JE0004-Bivalves.csv")
JE0004 <- cbind(JE0004,JE0004B[10:167])


ApsJE0004<- read.csv("JE0004-Apertures.csv")%>%
  na.omit()


#Database structure###
JE0004<- nrow(JE0004)%>%
  seq(.)%>%
  split(JE0004,.)%>%
  setNames(.,JE0004$Sample.No)

JE0004<- modify_depth(JE0004,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsJE0004[,2] <- as.numeric(levels(ApsJE0004[,2]))[ApsJE0004[,2]] #make numeric
#ApsJE0004<- as.data.frame(ApsJE0004[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsJE0004<- split( ApsJE0004,f = ApsJE0004$Sample.No) #make into list
ApGroupsJE0004<- modify_depth(ApGroupsJE0004,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(JE0004))  {JE0004[[i]][[Sfac]] <- c(ApGroupsJE0004[[i]])}

#JE0078####
JE0078<- read.csv("JE0078.csv")

ApsJE0078<- read.csv("JE0078-Apertures.csv")%>%
  na.omit()


#Database structure###
JE0078<- nrow(JE0078)%>%
  seq(.)%>%
  split(JE0078,.)%>%
  setNames(.,JE0078$Sample.No)

JE0078<- modify_depth(JE0078,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsJE0078[,2] <- as.numeric(levels(ApsJE0078[,2]))[ApsJE0078[,2]] #make numeric
#ApsJE0078<- as.data.frame(ApsJE0078[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsJE0078<- split( ApsJE0078,f = ApsJE0078$Sample.No) #make into list
ApGroupsJE0078<- modify_depth(ApGroupsJE0078,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(JE0078))  {JE0078[[i]][[Sfac]] <- c(ApGroupsJE0078[[i]])}



#JE0087####
JE0087<- read.csv("JE0087.csv")

ApsJE0087<- read.csv("JE0087-Apertures.csv")%>%
  na.omit()


#Database structure###
JE0087<- nrow(JE0087)%>%
  seq(.)%>%
  split(JE0087,.)%>%
  setNames(.,JE0087$Sample.No)

JE0087<- modify_depth(JE0087,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsJE0087[,2] <- as.numeric(levels(ApsJE0087[,2]))[ApsJE0087[,2]] #make numeric
#ApsJE0087<- as.data.frame(ApsJE0087[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsJE0087<- split( ApsJE0087,f = ApsJE0087$Sample.No) #make into list
ApGroupsJE0087<- modify_depth(ApGroupsJE0087,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(ApGroupsJE0087))  {JE0087[[names(ApGroupsJE0087[i])]][[Sfac]] <- c(ApGroupsJE0087[[i]])}

#JE5642####
JE5642<- read.csv("JE5642.csv")

ApsJE5642<- read.csv("JE5642-Apertures.csv")%>%
  na.omit()


#Database structure###
JE5642<- nrow(JE5642)%>%
  seq(.)%>%
  split(JE5642,.)%>%
  setNames(.,JE5642$Sample.No)

JE5642<- modify_depth(JE5642,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsJE5642[,2] <- as.numeric(levels(ApsJE5642[,2]))[ApsJE5642[,2]] #make numeric
#ApsJE5642<- as.data.frame(ApsJE5642[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsJE5642<- split( ApsJE5642,f = ApsJE5642$Sample.No) #make into list
ApGroupsJE5642<- modify_depth(ApGroupsJE5642,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(ApGroupsJE5642))  {JE5642[[names(ApGroupsJE5642[i])]][[Sfac]] <- c(ApGroupsJE5642[[i]])}



#UPDATE SITE LIST####
Janaba_East <- list("JE0003"=JE0003,
                    "JE0004"=JE0004,
                    "JE0078"=JE0078,
                    "JE0087"=JE0087,
                    "JE5642" = JE5642)





#Khur Maadi

#KM####
#KM1057####
KM1057<- read.csv("KM1057.csv")

ApsKM1057<- read.csv("KM1057-Apertures.csv")%>%
  na.omit()


#Database structure###
KM1057<- nrow(KM1057)%>%
  seq(.)%>%
  split(KM1057,.)%>%
  setNames(.,KM1057$Sample.No)

KM1057<- modify_depth(KM1057,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsKM1057[,2] <- as.numeric(levels(ApsKM1057[,2]))[ApsKM1057[,2]] #make numeric
#ApsKM1057<- as.data.frame(ApsKM1057[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsKM1057<- split( ApsKM1057,f = ApsKM1057$Sample.No) #make into list
ApGroupsKM1057<- modify_depth(ApGroupsKM1057,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(ApGroupsKM1057))  {KM1057[[names(ApGroupsKM1057[i])]][[Sfac]] <- c(ApGroupsKM1057[[i]])}



#TESTPITSKM#### 
#KM1048####
KM1048 <- read.csv("KM1048.csv")
ApsKM1048<- read.csv("KM1048-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1048 <- nrow(KM1048)%>%
  seq(.)%>%
  split(KM1048,.)%>%
  setNames(.,KM1048$Sample.No)
KM1048 <- modify_depth(KM1048,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1048<- split( ApsKM1048 ,f = ApsKM1048$Sample.No) #make into list
ApGroupsKM1048 <- modify_depth(ApGroupsKM1048,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1048))  {KM1048[[i]][[Sfac]] <- c(ApGroupsKM1048[[i]])}
#KM1050####
KM1050<- read.csv("KM1050.csv")

ApsKM1050<- read.csv("KM1050-Apertures.csv")%>%
  na.omit()


#Database structure###
KM1050<- nrow(KM1050)%>%
  seq(.)%>%
  split(KM1050,.)%>%
  setNames(.,KM1050$Sample.No)

KM1050<- modify_depth(KM1050,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsKM1050[,2] <- as.numeric(levels(ApsKM1050[,2]))[ApsKM1050[,2]] #make numeric
#ApsKM1050<- as.data.frame(ApsKM1050[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsKM1050<- split( ApsKM1050,f = ApsKM1050$Sample.No) #make into list
ApGroupsKM1050<- modify_depth(ApGroupsKM1050,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(KM1050))  {KM1050[[i]][[Sfac]] <- c(ApGroupsKM1050[[i]])}


#KM1051####
KM1051<- read.csv("KM1051.csv")

ApsKM1051<- read.csv("KM1051-Apertures.csv")%>%
  na.omit()


#Database structure###
KM1051<- nrow(KM1051)%>%
  seq(.)%>%
  split(KM1051,.)%>%
  setNames(.,KM1051$Sample.No)

KM1051<- modify_depth(KM1051,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsKM1051[,2] <- as.numeric(levels(ApsKM1051[,2]))[ApsKM1051[,2]] #make numeric
#ApsKM1051<- as.data.frame(ApsKM1051[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsKM1051<- split( ApsKM1051,f = ApsKM1051$Sample.No) #make into list
ApGroupsKM1051<- modify_depth(ApGroupsKM1051,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(KM1051))  {KM1051[[i]][[Sfac]] <- c(ApGroupsKM1051[[i]])}


#KM1052####
KM1052<- read.csv("KM1052.csv")

ApsKM1052<- read.csv("KM1052-Apertures.csv")%>%
  na.omit()


#Database structure###
KM1052<- nrow(KM1052)%>%
  seq(.)%>%
  split(KM1052,.)%>%
  setNames(.,KM1052$Sample.No)

KM1052<- modify_depth(KM1052,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsKM1052[,2] <- as.numeric(levels(ApsKM1052[,2]))[ApsKM1052[,2]] #make numeric
#ApsKM1052<- as.data.frame(ApsKM1052[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsKM1052<- split( ApsKM1052,f = ApsKM1052$Sample.No) #make into list
ApGroupsKM1052<- modify_depth(ApGroupsKM1052,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(KM1052))  {KM1052[[i]][[Sfac]] <- c(ApGroupsKM1052[[i]])}


#KM1053####
KM1053<- read.csv("KM1053.csv")

ApsKM1053<- read.csv("KM1053-Apertures.csv")%>%
  na.omit()


#Database structure###
KM1053<- nrow(KM1053)%>%
  seq(.)%>%
  split(KM1053,.)%>%
  setNames(.,KM1053$Sample.No)

KM1053<- modify_depth(KM1053,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsKM1053[,2] <- as.numeric(levels(ApsKM1053[,2]))[ApsKM1053[,2]] #make numeric
#ApsKM1053<- as.data.frame(ApsKM1053[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsKM1053<- split( ApsKM1053,f = ApsKM1053$Sample.No) #make into list
ApGroupsKM1053<- modify_depth(ApGroupsKM1053,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(KM1053))  {KM1053[[i]][[Sfac]] <- c(ApGroupsKM1053[[i]])}


#KM1054####
KM1054<- read.csv("KM1054.csv")

ApsKM1054<- read.csv("KM1054-Apertures.csv")%>%
  na.omit()


#Database structure###
KM1054<- nrow(KM1054)%>%
  seq(.)%>%
  split(KM1054,.)%>%
  setNames(.,KM1054$Sample.No)

KM1054<- modify_depth(KM1054,1,~ discard(.x,is.na))#Remove NA columns


#Structure Apertures###
#ApsKM1054[,2] <- as.numeric(levels(ApsKM1054[,2]))[ApsKM1054[,2]] #make numeric
#ApsKM1054<- as.data.frame(ApsKM1054[,1:2]) #make the whole thing into a dataframe of only two colums
ApGroupsKM1054<- split( ApsKM1054,f = ApsKM1054$Sample.No) #make into list
ApGroupsKM1054<- modify_depth(ApGroupsKM1054,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element


#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable

for (i in 1:length(KM1054))  {KM1054[[i]][[Sfac]] <- c(ApGroupsKM1054[[i]])}







#KM1056####
KM1056 <- read.csv("KM1056.csv")
ApsKM1056<- read.csv("KM1056-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1056 <- nrow(KM1056)%>%
  seq(.)%>%
  split(KM1056,.)%>%
  setNames(.,KM1056$Sample.No)
KM1056 <- modify_depth(KM1056,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1056<- split( ApsKM1056 ,f = ApsKM1056$Sample.No) #make into list
ApGroupsKM1056 <- modify_depth(ApGroupsKM1056,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1056))  {KM1056[[i]][[Sfac]] <- c(ApGroupsKM1056[[i]])}






#KM1304####
KM1304 <- read.csv("KM1304.csv")
ApsKM1304<- read.csv("KM1304-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1304 <- nrow(KM1304)%>%
  seq(.)%>%
  split(KM1304,.)%>%
  setNames(.,KM1304$Sample.No)
KM1304 <- modify_depth(KM1304,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1304<- split( ApsKM1304 ,f = ApsKM1304$Sample.No) #make into list
ApGroupsKM1304 <- modify_depth(ApGroupsKM1304,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1304))  {KM1304[[i]][[Sfac]] <- c(ApGroupsKM1304[[i]])}































#KM1307####
KM1307 <- read.csv("KM1307.csv")
ApsKM1307<- read.csv("KM1307-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1307 <- nrow(KM1307)%>%
  seq(.)%>%
  split(KM1307,.)%>%
  setNames(.,KM1307$Sample.No)
KM1307 <- modify_depth(KM1307,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1307<- split( ApsKM1307 ,f = ApsKM1307$Sample.No) #make into list
ApGroupsKM1307 <- modify_depth(ApGroupsKM1307,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1307))  {KM1307[[i]][[Sfac]] <- c(ApGroupsKM1307[[i]])}
#KM1313####
KM1313 <- read.csv("KM1313.csv")
ApsKM1313<- read.csv("KM1313-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1313 <- nrow(KM1313)%>%
  seq(.)%>%
  split(KM1313,.)%>%
  setNames(.,KM1313$Sample.No)
KM1313 <- modify_depth(KM1313,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1313<- split( ApsKM1313 ,f = ApsKM1313$Sample.No) #make into list
ApGroupsKM1313 <- modify_depth(ApGroupsKM1313,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1313))  {KM1313[[i]][[Sfac]] <- c(ApGroupsKM1313[[i]])}

#KM1317####
KM1317 <- read.csv("KM1317.csv")
ApsKM1317<- read.csv("KM1317-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1317 <- nrow(KM1317)%>%
  seq(.)%>%
  split(KM1317,.)%>%
  setNames(.,KM1317$Sample.No)
KM1317 <- modify_depth(KM1317,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1317<- split( ApsKM1317 ,f = ApsKM1317$Sample.No) #make into list
ApGroupsKM1317 <- modify_depth(ApGroupsKM1317,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1317))  {KM1317[[i]][[Sfac]] <- c(ApGroupsKM1317[[i]])}
#KM1328####
KM1328 <- read.csv("KM1328.csv")
ApsKM1328<- read.csv("KM1328-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1328 <- nrow(KM1328)%>%
  seq(.)%>%
  split(KM1328,.)%>%
  setNames(.,KM1328$Sample.No)
KM1328 <- modify_depth(KM1328,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1328<- split( ApsKM1328 ,f = ApsKM1328$Sample.No) #make into list
ApGroupsKM1328 <- modify_depth(ApGroupsKM1328,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1328))  {KM1328[[i]][[Sfac]] <- c(ApGroupsKM1328[[i]])}
#KM1330####
KM1330 <- read.csv("KM1330.csv")
ApsKM1330<- read.csv("KM1330-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1330 <- nrow(KM1330)%>%
  seq(.)%>%
  split(KM1330,.)%>%
  setNames(.,KM1330$Sample.No)
KM1330 <- modify_depth(KM1330,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1330<- split( ApsKM1330 ,f = ApsKM1330$Sample.No) #make into list
ApGroupsKM1330 <- modify_depth(ApGroupsKM1330,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1330))  {KM1330[[i]][[Sfac]] <- c(ApGroupsKM1330[[i]])}
#KM1335####
KM1335 <- read.csv("KM1335.csv")
ApsKM1335<- read.csv("KM1335-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1335 <- nrow(KM1335)%>%
  seq(.)%>%
  split(KM1335,.)%>%
  setNames(.,KM1335$Sample.No)
KM1335 <- modify_depth(KM1335,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1335<- split( ApsKM1335 ,f = ApsKM1335$Sample.No) #make into list
ApGroupsKM1335 <- modify_depth(ApGroupsKM1335,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1335))  {KM1335[[i]][[Sfac]] <- c(ApGroupsKM1335[[i]])}
#KM1336####
KM1336 <- read.csv("KM1336.csv")
ApsKM1336<- read.csv("KM1336-Apertures.csv")%>%
  na.omit()
#Database structure###
KM1336 <- nrow(KM1336)%>%
  seq(.)%>%
  split(KM1336,.)%>%
  setNames(.,KM1336$Sample.No)
KM1336 <- modify_depth(KM1336,1,~ discard(.x,is.na))#Remove NA columns
#Structure Apertures###
ApGroupsKM1336<- split( ApsKM1336 ,f = ApsKM1336$Sample.No) #make into list
ApGroupsKM1336 <- modify_depth(ApGroupsKM1336,1,~ list_modify(.x,"Sample.No" = NULL)) #remove sample.No element
#Add Aps to Sites###
Sfac <- "Strombus.fasciatus..............Born.1778..Aperture" #make code more readable
for (i in 1:length(KM1336))  {KM1336[[i]][[Sfac]] <- c(ApGroupsKM1336[[i]])}







#####
#UPDATE LIST####
Khur_Maadi <- list("KM1048"=KM1048,
                   "KM1050"=KM1050,
                   "KM1051"=KM1051,
                   "KM1052"=KM1052,
                   "KM1053"=KM1053,
                   "KM1054"=KM1054,
                   "KM1056"=KM1056,
                   "KM1057"=KM1057,
                   "KM1304"=KM1304,
                   "KM1307"=KM1307,
                   "KM1313"=KM1313,
                   "KM1317"=KM1317,
                   "KM1328"=KM1328,
                   "KM1330"=KM1330,
                   "KM1335"=KM1335,
                   "KM1336"=KM1336)



Sites <- c(Khur_Maadi,Janaba_West,Janaba_East)

Areas<- list("Khur_Maadi"=Khur_Maadi,"Janaba_West"=Janaba_West,"Janaba_East"=Janaba_East)


#List for Species
Species <- c(Khur_Maadi,Janaba_West,Janaba_East)
toremove <- "MNI|Saudi|Shell.Only.Weight|MNS|Insect.Modern.|Seed|Fossil.Shell|Flint|Modern.Twig|Heated.Shell...not.charred.|Fish.Teeth|Seed.Pod.old.modern.|Charred.Seed|Site.Reference|Stone|Date|Operculum|Stuff|Barnacle|X|Context|Depth|Nother|Bone|Charcoal|Chiton|Pearl|Calcite|still.to.be|Possibly|Column|Unidentified|Fragments|SHELLWEIGHT|Length|Width|Height|Aperture|Upper|Lower|Left|Right|Coral|Notes|Sample.Number|Sample.No|Layer|Position|Spit|Year.Ref|Minimum.Number.of.Species..MNS.|Burnt.Shell|Crab|Fishbone|Worm|Breccia|Sorted|Urchin|Residue|York|Total"
Species <- modify_depth(Species,2,~ discard(.x,grepl(toremove,names(.x))))


#List for Apertures
Apertures <- c(Khur_Maadi,Janaba_West,Janaba_East)
Apertures <- modify_depth(Apertures,2,~ keep(.x,grepl(Sfac,names(.x))))













#Remove old lists and vectors####
rm(list=setdiff(ls(), c("Species","Apertures","Sites","Areas")))
setwd("~/capsule/code")

