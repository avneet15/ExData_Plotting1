#Code for reading data and creating PLOT 3


#READING AND FILTERING DATA BASED ON DATE

data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE,colClasses = c(rep("character",2), rep("numeric",7)))
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %T")


#CREATION OF PLOT 3 IN A PNG FILE

png(filename = "plot3.png", width = 480,height = 480, units = "px", bg = "white")
plot(data$Date,data$Sub_metering_1, type = "n",ylab = "Energy sub metering",xlab = "")
points(data$Date,data$Sub_metering_1, col = "black",type = "l")
points(data$Date,data$Sub_metering_2, col = "red",type = "l")
points(data$Date,data$Sub_metering_3, col = "blue",type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1)
dev.off()