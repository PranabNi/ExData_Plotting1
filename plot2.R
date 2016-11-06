setwd("c:/datascience/R")
pwr <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string="?")
pwr$NewDate <- as.Date(pwr$Date,"%d/%m/%Y")
pwr1 <- pwr[pwr$NewDate=="2007-02-01"|pwr$NewDate=="2007-02-02",]
pwr1$DateTime <-strptime( paste(pwr1$Date,pwr1$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
plot(pwr1$DateTime,pwr1$Global_active_power,type='l', xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width=480, height=480)
dev.off()