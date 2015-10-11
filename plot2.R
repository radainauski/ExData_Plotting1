#setwd("~/GitHub/ExData_Plotting1") - use if needed
#read source data
plotin <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";")

#temp measure to avoid rereading while testing - preserves plotin
plot <- plotin 

#subset needed data
plot <- subset(plot, plot$Date == "1/2/2007" | plot$Date == "2/2/2007")

#make a single date field of date and time
plot$longdate <- strptime(paste(plot$Date, plot$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")

#open ong file
png("plot2.png", width=480, height=480)

plot(plot$longdate, plot$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

#close device!
dev.off()