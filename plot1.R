## Set working directory
setwd("~/Exploratory Data Analysis Case")

## Read data, but only from 2007-02-01 and 2007-02-02 (Feb 1 & 2 2007)
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
data<-subset(dt, Date=='1/2/2007'|Date=='2/2/2007')

## Convert date and time variables into date and time classes
data$Time<-strptime(data$Time,format="%H:%M:%S")
data$Date<-as.Date(data$Date,"%d/%m/%Y")

### PLOT 1

png("plot1.png",width = 480, height = 480)
gap<-as.numeric(data$Global_active_power)/500
hist(gap,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")

## Disconnect from png
dev.off()
