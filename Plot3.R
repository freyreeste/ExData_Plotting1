# reading the data for ploting
        data<- "household_power_consumption.txt"
        EPC <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
                subSetEPC <- EPC[EPC$Date %in% c("1/2/2007","2/2/2007") ,] # Subseting only the period needed

# data is stored as factors then we need to convert the data
        datetime <- strptime(paste(subSetEPC$Date, subSetEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
        globalActivePower <- as.numeric(subSetEPC$Global_active_power)# as numbers
        subMetering1 <- as.numeric(subSetEPC$Sub_metering_1)# as numbers
        subMetering2 <- as.numeric(subSetEPC$Sub_metering_2)# as numbers
        subMetering3 <- as.numeric(subSetEPC$Sub_metering_3)# as numbers

#plotting Data #3

        png("plot3.png", width=480, height=480) # Construct the plot and save it to a PNG file 
        plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="") 
                lines(datetime, subMetering2, type="l", col="red")
                lines(datetime, subMetering3, type="l", col="blue")
                legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
        dev.off() # Close graphic device