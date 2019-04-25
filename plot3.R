## Set working directory
setwd("~/Exploratory Data Analysis Case")

## Read data, but only from 2007-02-01 and 2007-02-02 (Feb 1 & 2 2007)
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
data<-subset(dt, Date=='1/2/2007'|Date=='2/2/2007')


## Convert date and time variables into date and time classes
data$Time<-strptime(data$Time,format="%H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data[1:1440, "Time"] <- format(data[1:1440, "Time"], "2007-02-01 %H:%M:%S")
data[1441:2880, "Time"] <- format(data[1441:2880, "Time"], "2007-02-02 %H:%M:%S")


### PLOT 3

png("plot3.png",width = 480, height = 480)
plot(data$Time,as.numeric(data$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
lines(data$Time,as.numeric(data$Sub_metering_2),type="l",col="red")
lines(data$Time,as.numeric(data$Sub_metering_3),type="l",col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Disconnect from png
dev.off()