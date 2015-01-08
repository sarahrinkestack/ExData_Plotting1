# Load data and reformat data frame
EPC <- read.table("household_power_consumption.txt", header=T, stringsAsFactors=F, sep=";", na.strings="?")
EPC1 <- EPC[EPC$Date == "1/2/2007",]
EPC2 <- EPC[EPC$Date == "2/2/2007",]
EPC <- rbind(EPC1, EPC2)
DateTime <- as.POSIXct(paste(EPC$Date, EPC$Time), format="%d/%m/%Y %H:%M:%S") 
EPC <- cbind(DateTime,EPC[,3:ncol(EPC)])

# Plot 1
png(filename="plot1.png")
hist(EPC$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()