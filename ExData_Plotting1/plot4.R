

# Read data
pc<-read.table("household_power_consumption.txt", sep = ";", header=TRUE)
pcsel<-pc[pc$Date=='1/2/2007' |  pc$Date=='2/2/2007',]
rm(pc)

# Convert Date
date2 <- strptime(paste0(pcsel$Date, " ", pcsel$Time), "%d/%m/%Y %H:%M:%S")
pcsel<-cbind(pcsel,date2)
colnames(pcsel)[10]<-"DatumConv"
rm(date2)

# Create Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

## Subplot 1
plot(pcsel$DatumConv, pcsel$Global_active_power,
     ylab="Global active power",
     xlab="", type="n") 
lines(pcsel$DatumConv, as.numeric(pcsel$Global_active_power), col="black")

## Subplot 2
plot(pcsel$DatumConv, pcsel$Voltage,
     ylab="Voltage",
     xlab="datetime", type="n") 
lines(pcsel$DatumConv, as.numeric(pcsel$Voltage), col="black")

## Subplot 3
plot(pcsel$DatumConv, as.numeric(pcsel$Sub_metering_1), 
     pch=1, type="n",
     ylab="Energy sub metering",
     xlab="")
lines(pcsel$DatumConv, as.numeric(pcsel$Sub_metering_1), col="black")
lines(pcsel$DatumConv, as.numeric(pcsel$Sub_metering_2), col="red")
lines(pcsel$DatumConv, as.numeric(pcsel$Sub_metering_3), col="blue")
legend("topright", c("Sub metering 1","Sub metering 2", "Sub metering 3"),
       col=c("black","red","blue"), lty=1)

## Subplot 4
plot(pcsel$DatumConv, pcsel$Global_reactive_power,
     ylab="Global_reactive_power",
     xlab="datetime", type="n") 
lines(pcsel$DatumConv, as.numeric(pcsel$Global_reactive_power), col="black")
dev.off()



