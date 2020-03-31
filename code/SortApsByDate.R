 library(xts)
# library(gganimate)
# library(gifski)
# library(scales)


#Make dataframe of sample

SumJW2298 <- Aps[Aps$Site=="JW2298",]
SumJW3120 <- Aps[Aps$Site=="JW3120",]
SumJW1864 <- Aps[Aps$Site=="JW1864",]
SumJW1807 <- Aps[Aps$Site=="JW1807",]
SumJW1727 <- Aps[Aps$Site=="JW1727_A",]


#Add start and end dates to column samples
#Janaba West

SumJW2298$Year <- NA
SumJW2298$Year[1] <- -4800
SumJW2298$Year[length(SumJW2298$Year)] <- -5700

SumJW3120$Year <- NA
SumJW3120$Year[1] <- -5900
SumJW3120$Year[length(SumJW3120$Year)] <- -6590

SumJW1864$Year <- NA
SumJW1864$Year[1] <- -5480
SumJW1864$Year[length(SumJW1864$Year)] <- -5940

SumJW1807$Year <- NA
SumJW1807$Year[1] <- -4910
SumJW1807$Year[length(SumJW1807$Year)] <- -5420

SumJW1727$Year <- NA
SumJW1727$Year[1] <- -4700
SumJW1727$Year[length(SumJW1727$Year)] <- -4870

#Add relative start and end dates to column samples

SumJW2298$Order <- NA
SumJW2298$Order[1] <- 100
SumJW2298$Order[length(SumJW2298$Order)] <- 1


SumJW3120$Order <- NA
SumJW3120$Order[1] <- 100
SumJW3120$Order[length(SumJW3120$Order)] <- 1

SumJW1864$Order <- NA
SumJW1864$Order[1] <- 100
SumJW1864$Order[length(SumJW1864$Order)] <- 1

SumJW1807$Order <- NA
SumJW1807$Order[1] <- 100
SumJW1807$Order[length(SumJW1807$Order)] <- 1

SumJW1727$Order <- NA
SumJW1727$Order[1] <- 100
SumJW1727$Order[length(SumJW1727$Order)] <- 1



#interpolate between samples
SumJW2298$Year <- round(na.approx(SumJW2298$Year),0)
SumJW3120$Year <- round(na.approx(SumJW3120$Year),0)
SumJW1864$Year <- round(na.approx(SumJW1864$Year),0)
SumJW1807$Year <- round(na.approx(SumJW1807$Year),0)
SumJW1727$Year <- round(na.approx(SumJW1727$Year),0)

#interpolate between samples
SumJW2298$Order <- round(na.approx(SumJW2298$Order),0)
SumJW3120$Order <- round(na.approx(SumJW3120$Order),0)
SumJW1864$Order <- round(na.approx(SumJW1864$Order),0)
SumJW1807$Order <- round(na.approx(SumJW1807$Order),0)
SumJW1727$Order <- round(na.approx(SumJW1727$Order),0)

JWApsByDate <- rbind(SumJW2298,SumJW3120,SumJW1864,SumJW1807,SumJW1727)
JWApsByDate$Area <- "Janaba West"

JWApsByDate <- JWApsByDate[order(JWApsByDate$Year,decreasing=TRUE),]


JWApsByDate$AreaOrder <- NA
JWApsByDate$AreaOrder[length(JWApsByDate$AreaOrder)] <- 1
JWApsByDate$AreaOrder[1] <- 100
JWApsByDate$AreaOrder <- round(na.approx( JWApsByDate$AreaOrder),0)






#Janaba east

#Make dataframe of sample
SumJE0087 <- Aps[Aps$Site=="JE0087",]
SumJE0078 <- Aps[Aps$Site=="JE0078",]
SumJE5642 <- Aps[Aps$Site=="JE5642",]
SumJE0004 <- Aps[Aps$Site=="JE0004",]

#Add start and end dates to column samples
SumJE0087$Year <- NA
SumJE0087$Year[length(SumJE0087$Year)] <- -5970
SumJE0087$Year[1] <- -5850

SumJE0078$Year <- NA
SumJE0078$Year[length(SumJE0078$Year)] <- -5600
SumJE0078$Year[1] <- -4900

SumJE5642$Year <- NA
SumJE5642$Year[length(SumJE5642$Year)] <- -6160
SumJE5642$Year[1] <- -5730

SumJE0004$Year <- NA
SumJE0004$Year[length(SumJE0004$Year)] <- -5580
SumJE0004$Year[1] <- -4830


#Add relative start and end dates to column samples
SumJE0087$Order <- NA
SumJE0087$Order[length(SumJE0087$Order)] <- 1
SumJE0087$Order[1] <- 100

SumJE0078$Order <- NA
SumJE0078$Order[length(SumJE0078$Order)] <- 1
SumJE0078$Order[1] <- 100

SumJE5642$Order <- NA
SumJE5642$Order[length(SumJE5642$Order)] <- 1
SumJE5642$Order[1] <- 100

SumJE0004$Order <- NA
SumJE0004$Order[length(SumJE0004$Order)] <- 1
SumJE0004$Order[1] <- 100


#interpolate between samples
SumJE0087$Year <- round(na.approx(SumJE0087$Year),0)
SumJE0078$Year <- round(na.approx(SumJE0078$Year),0)
SumJE5642$Year <- round(na.approx(SumJE5642$Year),0)
SumJE0004$Year <- round(na.approx(SumJE0004$Year),0) 

#interpolate between samples
SumJE0087$Order <- round(na.approx(SumJE0087$Order),0)
SumJE0078$Order <- round(na.approx(SumJE0078$Order),0)
SumJE5642$Order <- round(na.approx(SumJE5642$Order),0)
SumJE0004$Order <- round(na.approx(SumJE0004$Order),0)

JEApsByDate <- rbind(SumJE0087,SumJE0078,SumJE5642,SumJE0004)
JEApsByDate$Area <- "Janaba East"

JEApsByDate <- JEApsByDate[order(JEApsByDate$Year,decreasing=TRUE),]

JEApsByDate$AreaOrder <- NA
JEApsByDate$AreaOrder[length(JEApsByDate$AreaOrder)] <- 1
JEApsByDate$AreaOrder[1] <- 100
JEApsByDate$AreaOrder <- round(na.approx( JEApsByDate$AreaOrder),0)






#Khur Maadi


#Make dataframe of sample
SumKM1057 <- Aps[Aps$Site=="KM1057",]

#Add start and end dates to column samples
SumKM1057$Year <- NA
SumKM1057$Year[length(SumKM1057$Year)] <- -5250
SumKM1057$Year[1] <- -5030

#Add relative start and end dates to column samples
SumKM1057$Order <- NA
SumKM1057$Order[length(SumKM1057$Order)] <- 1
SumKM1057$Order[1] <- 100

#interpolate between samples
SumKM1057$Year <- round(na.approx(SumKM1057$Year),0)
#interpolate between samples
SumKM1057$Order <- round(na.approx(SumKM1057$Order),0)

KMApsByDate <- rbind(SumKM1057)
KMApsByDate$Area <- "Khur Maadi"

KMApsByDate$AreaOrder <- NA
KMApsByDate$AreaOrder[length(KMApsByDate$AreaOrder)] <- 1
KMApsByDate$AreaOrder[1] <- 100
KMApsByDate$AreaOrder <- round(na.approx( KMApsByDate$AreaOrder),0)


ApsByDate <- rbind(JEApsByDate,JWApsByDate,KMApsByDate)

rm(list=setdiff(ls(), c("ApsByDate","Apertures","Aps")))
