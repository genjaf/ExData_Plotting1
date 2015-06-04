data <- read.csv2("household_power_consumption.txt",colClasses=rep("character",9))
subset <- as.Date(data$Date,"%d/%m/%Y")
data2 <- data[subset>="2007-02-01" & subset<="2007-02-02",]
rm(subset,data)
data2$datetime <- paste(data2$Date,data2$Time)
data2$datetime <- strptime(data2$datetime,format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))
plot(data2$datetime,as.numeric(data2$Sub_metering_1),type="l",col="black",xlab="",ylab="Energy sub metering")
points(data2$datetime,as.numeric(data2$Sub_metering_2),type="l",col="red",xlab="",ylab="Energy sub metering")
points(data2$datetime,as.numeric(data2$Sub_metering_3),type="l",col="blue",xlab="",ylab="Energy sub metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)

# the plot repeated to work around the problem with dev.copy() function truncating legend
png(file="plot3.png",width=480,height=480)
par(mfrow=c(1,1))
plot(data2$datetime,as.numeric(data2$Sub_metering_1),type="l",col="black",xlab="",ylab="Energy sub metering")
points(data2$datetime,as.numeric(data2$Sub_metering_2),type="l",col="red",xlab="",ylab="Energy sub metering")
points(data2$datetime,as.numeric(data2$Sub_metering_3),type="l",col="blue",xlab="",ylab="Energy sub metering")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
dev.off()
