#setwd("~/GitHub/ExData_Plotting1") - use if needed

#read source data
plotin <- read.table("household_power_consumption.txt", header=TRUE, na.strings = "?", sep=";")

#temp measure to avoid rereading while testing - preserves plotin
plot <- plotin 

#subset needed data
plot <- subset(plot, plot$Date == "1/2/2007" | plot$Date == "2/2/2007")

#set needed column to numeric
plot$Global_active_power <- as.numeric(plot$Global_active_power)


#open ong file
png("plot1.png", width=480, height=480)

#plot histogram
hist(plot$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     border="black", 
     col="red",
     cex.axis=.8,
     ylim=c(0,1200))
     
#close device!
dev.off()

