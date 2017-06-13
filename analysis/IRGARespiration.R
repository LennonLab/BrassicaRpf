################################################################################
#                                                                              #
#  Bacterial Respiration for Analysis of IRGA CO2 Data                         #
#  Written By: Mario Muscarella                                                #
#  Last Update: 01 June 2015                                                   #
#                                                                              #
#  Use this file to determine CO2 concentration based on IRGA output           #
#                                                                              #
#  Future Changes:                                                             #
#      1. Make analysis automated similar to PreSens workflow                  #
#                                                                              #
################################################################################

setwd('~/Github/MicrobialSoilCO2/analyses')
rm(list=ls())

#install.packages("chron", "simecol")
require(chron)
require(simecol)

# Import the function from source file

# May 31 2015 Experiment: Atmospheric CO2 Reduction ############################
# Experimental Description: Reduce CO2 Concentration with KOH trap
#
################################################################################
CO2Trap <- read.delim("../data/2016-06-05_soil (24).txt", , header=T, sep = " ",
                      skip=1, as.is=T)
colnames(CO2Trap) <- c("Time", "CO2", "Temp", "Press")
CO2Trap$Time <- chron(times = CO2Trap$Time, format = "h:m:s")
CO2Trap$CO2[CO2Trap$CO2 < 5] <- 0 # pseudo-baseline subtraction

maxpeaks <- peaks(y=CO2Trap$CO2, x=CO2Trap$Time, mode='max')
length(maxpeaks$y)

plot(CO2Trap$Time, CO2Trap$CO2)
points(x = maxpeaks$x[1:30], y = maxpeaks$y[1:30], col='red',
       cex=1.5, pch=19)    # Does this look good?

maxpeaks$y[1:30]

################################################################################
# Add user data here
# Label design 
design <- c("std", "std", "std", "std", "std", "std", "T1-1", "T1-2", "T1-3",
            "T1-4", "T2-1", "T2-2", "T2-3", "T2-4", "T3-1", "T3-2", "T3-3", "T3-4",
            "T4-1", "T4-2", "T4-3", "T4-4", "CN-1", "CN-2", "CN-3", "CN-4", 
            "CP-1", "CP-2", "CP-3", "CP-4", "T5-1", "T5-2", "T5-3", "T5-4")
concs <- c(12997, 6998.5, 3639.2, 1856.73, 751.9, 302.26, rep(NA, 28))
peak <- maxpeaks$y[1:34]
table1 <- cbind(concs, peak)
row.names(table1) <- design

std.table <- table1[grepl("std", rownames(table1)),]
std.crv <- lm(std.table[,1] ~ std.table[,2])
summary(std.crv)         # Does this look good?

#Predictions based on Curve Data
pred.frame <- data.frame(std.table[,2])
pl <- predict.lm(std.crv, int="p", newdata=pred.frame)
pl

f.stat <- summary(std.crv)$fstatistic
p.val <- pf(f.stat[1],f.stat[2],f.stat[3],lower.tail=FALSE)
R.2 <- summary(std.crv)$r.squared

#Visualization of Curve
plot(y=std.table[,1],x=std.table[,2],ylab="Expected Concentration (ppm CO2)",xlab="Peak Height",pch=5)
matlines(pred.frame, pl, lty=c(1,2,2), lw=c(2,1,1), col= c("red","blue","blue"))
R_sqr <- paste("R-squared =", round(R.2,4))
if(p.val >= 0.001){
  P_val <- paste("p-value =", round(p.val, 4))
} else {
  P_val <- "p-value < 0.001"
}
legend('topleft', c(R_sqr, P_val), bty='n')


#Predictions for Sample Data
exp.2 <- concs
obs.2 <- peak
crv.2 <- lm(exp.2 ~ obs.2)
summary(crv.2)
pred.frame.2 <- data.frame(obs.2)
pl.2 <- predict(crv.2, int="p", newdata=pred.frame.2,se.fit=TRUE)
pl.2
pl.2$fit
pl.2$se
exp.2



#Data Table
tab.1 <- as.data.frame(cbind(design, round(pl.2$fit, 3), round(pl.2$se, 3)))
colnames(tab.1) <- c("Sample","Conc (ppm CO2)","LCL","UCL","SE")
tab.1

# I'm not gonna save the data right now because it doesn't appear that the trap
# did that much. I thought when I looked at it on the IRGA that the difference
# Was greater. I guess I was wrong.
