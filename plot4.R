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
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4.1,3,2.1))

#plot1

plot(plot$longdate, plot$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)", 
     cex.lab=.7)

#plot2

plot(plot$longdate, plot$Voltage, type = "l", ylab="Voltage", xlab = "datetime",
     cex.lab=.7)

#plot3

plot(c(plot$longdate,plot$longdate,plot$longdate), c(plot$Sub_metering_1, plot$Sub_metering_2, plot$Sub_metering_3), 
     type = "n", ylab = "Energy sub metering", xlab="", cex.axis=.7, cex.lab = .7)
lines(plot$longdate, plot$Sub_metering_1, col="black")
lines(plot$longdate, plot$Sub_metering_2, col="red")
lines(plot$longdate, plot$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, pt.cex=.4, cex=.4)

#plot4

plot(plot$longdate, plot$Global_reactive_power, type = "l", ylab="Global_reactive_power", xlab = "datetime",
     cex.axis=.7, cex.lab = .7)

#close device!
dev.off()