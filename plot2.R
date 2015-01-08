# Load data and reformat data frame
EPC <- read.table("household_power_consumption.txt", header=T, stringsAsFactors=F, sep=";", na.strings="?")
EPC1 <- EPC[EPC$Date == "1/2/2007",]
EPC2 <- EPC[EPC$Date == "2/2/2007",]
EPC <- rbind(EPC1, EPC2)
DateTime <- as.POSIXct(paste(EPC$Date, EPC$Time), format="%d/%m/%Y %H:%M:%S") 
EPC <- cbind(DateTime,EPC[,3:ncol(EPC)])

# Plot 2
png(filename="plot2.png")
plot(EPC$Global_active_power~EPC$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()