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

## launch PNG graphics device  (by dafault the dimensions are 480X480 pixels)
png(file="plot1.png")

## construct plot 1
with(Data_Subset, hist(Global_active_power, col="red", main="Global Active Power", 
xlab="Global Active Power (kilowatts)"))

## close PNG file device
dev.off()
