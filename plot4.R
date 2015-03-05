#Code for reading data and creating PLOT 4 assuming data is already downloaded and unzipped in your working directory,
#else first download data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip



#READING AND FILTERING DATA BASED ON DATE

data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE,colClasses = c(rep("character",2), rep("numeric",7)))
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %T")


#CREATION OF PLOT 4 IN A PNG FILE

png(filename = "plot4.png", width = 480,height = 480, units = "px", bg = "white")
par(mfrow = c(2,2))

#PLOT 1

plot(data$Date, data$Global_active_power, type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")

#PLOT 2

plot(data$Date, data$Voltage, type = "l",ylab = "Voltage",xlab = "datetime")

#PLOT 3

plot(data$Date,data$Sub_metering_1, type = "n",ylab = "Energy sub metering",xlab = "")
points(data$Date,data$Sub_metering_1, col = "black",type = "l")
points(data$Date,data$Sub_metering_2, col = "red",type = "l")
points(data$Date,data$Sub_metering_3, col = "blue",type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1,bty = "n")

#PLOT 4

plot(data$Date, data$Global_reactive_power, type = "l",ylab = "Global_reactive_power",xlab = "datetime")
dev.off()