# Load data and reformat data frame
EPC <- read.table("household_power_consumption.txt", header=T, stringsAsFactors=F, sep=";", na.strings="?")
EPC1 <- EPC[EPC$Date == "1/2/2007",]
EPC2 <- EPC[EPC$Date == "2/2/2007",]
EPC <- rbind(EPC1, EPC2)
DateTime <- as.POSIXct(paste(EPC$Date, EPC$Time), format="%d/%m/%Y %H:%M:%S") 
EPC <- cbind(DateTime,EPC[,3:ncol(EPC)])

# Plot 4
png(filename="plot4.png")
par(mfrow=(c(2,2)))
plot(EPC$Global_active_power~EPC$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(EPC$Voltage~EPC$DateTime, type="l", ylab="Voltage", xlab="datetime")
plot(EPC$Sub_metering_1~EPC$DateTime, type="l", ylim=range(c(EPC$Sub_metering_1,EPC$Sub_metering_2,EPC$Sub_metering_3)), xlab="", ylab="Energy sub metering")
par(new=T)
plot(EPC$Sub_metering_2~EPC$DateTime, type="l", col="red", ylim=range(c(EPC$Sub_metering_1,EPC$Sub_metering_2,EPC$Sub_metering_3)),xlab="",ylab="")
par(new=T)
plot(EPC$Sub_metering_3~EPC$DateTime, type="l", col="blue", ylim=range(c(EPC$Sub_metering_1,EPC$Sub_metering_2,EPC$Sub_metering_3)),xlab="",ylab="")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
plot(EPC$Global_reactive_power~EPC$DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()