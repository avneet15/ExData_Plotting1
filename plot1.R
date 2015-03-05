#Code for reading data and creating PLOT 1


#READING AND FILTERING DATA BASED ON DATE

data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE,colClasses = c(rep("character",2), rep("numeric",7)))
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %T")


#CREATION OF PLOT 1 IN A PNG FILE

png(filename = "plot1.png", width = 480,height = 480, units = "px", bg = "white")
hist(data$Global_active_power,freq = TRUE, col = "RED",main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()