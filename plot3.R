## read data in and take subset of 2007-02-01 and 2007-02-02
path <- "household_power_consumption.txt"
Data <- read.table(path, header=TRUE, na.strings="?", sep=";")
Data_Subset <- Data[(Data$Date=="1/2/2007"|Data$Date =="2/2/2007"),]

## create Date/Time class variable from Date and Time variables
Data_Subset$Date_Time <- strptime(paste(Data_Subset$Date, Data_Subset$Time),
 "%d/%m/%Y %H:%M:%S")

## get rid of old Date and Time columns and reorder
Data_Subset <- Data_Subset[,c(3:10)]
Data_Subset <- Data_Subset[,c(8,1:7)]

## create Weekday column that specifies day of week for each date
Data_Subset$Weekday <- weekdays(Data_Subset$Date_Time)

## launch PNG graphics device (by dafault the dimensions are 480X480 pixels)
png(file="plot3.png")

##construct plot 3

with(Data_Subset, {
	
	plot(Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", xaxt="n")
	par(new=F)
	lines(Sub_metering_2, type="l",col="red", xlab="", ylab="Energy sub metering", xaxt="n")
	par(new=F)
	lines(Sub_metering_3, col="blue", xlab="", ylab="Energy sub metering", xaxt="n")
	
})

axis(1, at=c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## close PNG file device
dev.off()
