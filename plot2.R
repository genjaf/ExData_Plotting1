data <- read.csv2("household_power_consumption.txt",colClasses=rep("character",9))
subset <- as.Date(data$Date,"%d/%m/%Y")
data2 <- data[subset>="2007-02-01" & subset<="2007-02-02",]
rm(subset,data)
data2$datetime <- paste(data2$Date,data2$Time)
data2$datetime <- strptime(data2$datetime,format="%d/%m/%Y %H:%M:%S")

plot(data2$datetime,as.numeric(data2$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()
