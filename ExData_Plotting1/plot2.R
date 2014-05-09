

# Read data
pc<-read.table("household_power_consumption.txt", sep = ";", header=TRUE)
pcsel<-pc[pc$Date=='1/2/2007' |  pc$Date=='2/2/2007',]
rm(pc)

# Convert Date
date2 <- strptime(paste0(pcsel$Date, " ", pcsel$Time), "%d/%m/%Y %H:%M:%S")
pcsel<-cbind(pcsel,date2)
colnames(pcsel)[10]<-"DatumConv"
rm(date2)


# Create Plot 2
png("plot2.png", width = 480, height = 480)
plot(pcsel$DatumConv, as.numeric(pcsel$Global_active_power), 
     pch=1, type="n",
     ylab="Global Active Power (kilowatts)",
     xlab="")
lines(pcsel$DatumConv, as.numeric(pcsel$Global_active_power))
dev.off()
