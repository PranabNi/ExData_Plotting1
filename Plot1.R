setwd("c:/datascience/R")
pwr <- read.csv("household_power_consumption.txt",sep=";",header=TRUE)
pwr$NewDate <- as.Date(pwr$Date,"%d/%m/%Y")
pwr1 <- pwr[pwr$NewDate=="2007-02-01"|pwr$NewDate=="2007-02-02",]
hist(as.numeric(as.character(pwr1$Global_active_power)),xlab="Global Active Power(Kilowatts)",ylab="Frequency",col="red",main="Global Active Power")
dev.copy(png,file="plot1.png",width=480, height=480)
dev.off()