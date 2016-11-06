setwd("c:/datascience/R")
pwr <- read.csv("household_power_consumption.txt",sep=";",header=TRUE,na.string="?")
pwr$NewDate <- as.Date(pwr$Date,"%d/%m/%Y")
pwrfiltered <- pwr[pwr$NewDate=="2007-02-01"|pwr$NewDate=="2007-02-02",]
pwrfiltered$DateTime <-strptime( paste(pwrfiltered$Date,pwrfiltered$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

pwr_submeter_1 <- pwrfiltered[,c(11,7)]
pwr_submeter_2 <- pwrfiltered[,c(11,8)]
pwr_submeter_3 <- pwrfiltered[,c(11,9)]


pwr_submeter_1$name <-"sub_metering_1"
pwr_submeter_2$name <-"sub_metering_2"
pwr_submeter_3$name <-"sub_metering_3"
names(pwr_submeter_1) <-c("","","")
names(pwr_submeter_2) <-c("","","")
names(pwr_submeter_3) <-c("","","")

pwr_sub_meter <-rbind( rbind(pwr_submeter_1,pwr_submeter_2),pwr_submeter_3)
names(pwr_sub_meter) <- c("DateTime","Value","Name")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

## 1st row 1st column
plot(pwrfiltered$DateTime,pwrfiltered$Global_active_power,type='l', xlab="", ylab="Global Active Power (kilowatts)")
## 1st row 2nd column
with(pwrfiltered,plot(DateTime,Voltage, type='l', xlab="datetime", ylab="Voltage"))

## 2nd row 1st column
with(pwr_sub_meter,plot(DateTime,Value,type="n", xlab="",ylab="Energy sub metering"))
with(subset(pwr_sub_meter,Name=="sub_metering_1"),points(DateTime,Value,type="l"))
with(subset(pwr_sub_meter,Name=="sub_metering_2"),points(DateTime,Value,type="l",col='red'))
with(subset(pwr_sub_meter,Name=="sub_metering_3"),points(DateTime,Value,type="l",col='blue'))
legend("topright", lty=1, col = c("black", "red", "blue"),  legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

## 2nd row 2nd column
with(pwrfiltered,plot(DateTime,Global_reactive_power,type="l", xlab="datetime",  ylab="Global_reactive_power"))
dev.off()
