#setwd("~/GitHub/ExData_Plotting1") - use if needed
#read source data
plotin <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";")

#temp measure to avoid rereading while testing - preserves plotin
plot <- plotin 

#subset needed data
plot <- subset(plot, plot$Date == "1/2/2007" | plot$Date == "2/2/2007")

#make a single date field of date and time
plot$longdate <- strptime(paste(plot$Date, plot$Time, sep = " "), 
                          format = "%d/%m/%Y %H:%M:%S")

#open ong file
png("plot3.png", width=480, height=480)

plot(c(plot$longdate,plot$longdate,plot$longdate), c(plot$Sub_metering_1, plot$Sub_metering_2, plot$Sub_metering_3), 
     type = "n", ylab = "Energy sub metering", xlab="")
lines(plot$longdate, plot$Sub_metering_1, col="black")
lines(plot$longdate, plot$Sub_metering_2, col="red")
lines(plot$longdate, plot$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

#close device!
dev.off()