
# Read data
pc<-read.table("household_power_consumption.txt", sep = ";", header=TRUE)
pcsel<-pc[pc$Date=='1/2/2007' |  pc$Date=='2/2/2007',]
rm(pc)

# Convert Date
date2 <- strptime(paste0(pcsel$Date, " ", pcsel$Time), "%d/%m/%Y %H:%M:%S")
pcsel<-cbind(pcsel,date2)
colnames(pcsel)[10]<-"DatumConv"
rm(date2)

# Create Plot 3
png("plot3.png", width = 480, height = 480)
plot(pcsel$DatumConv, as.numeric(pcsel$Sub_metering_1), 
     pch=1, type="n",
     ylab="Energy sub metering",
     xlab="")
lines(pcsel$DatumConv, as.numeric(pcsel$Sub_metering_1), col="black")
lines(pcsel$DatumConv, as.numeric(pcsel$Sub_metering_2), col="red")
lines(pcsel$DatumConv, as.numeric(pcsel$Sub_metering_3), col="blue")
legend("topright", c("Sub metering 1","Sub metering 2", "Sub metering 3"),
       col=c("black","red","blue"), lty=1)
dev.off()


