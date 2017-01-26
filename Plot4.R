# reading the data for ploting
        data<- "household_power_consumption.txt"
        EPC <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
                subSetEPC <- EPC[EPC$Date %in% c("1/2/2007","2/2/2007") ,] # Subseting only the period needed

# data is stored as factors then we need to convert the data properly
        datetime <- strptime(paste(subSetEPC$Date, subSetEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
        GAP <- as.numeric(subSetEPC$Global_active_power)# as numbers
        subMetering1 <- as.numeric(subSetEPC$Sub_metering_1)# as numbers
        subMetering2 <- as.numeric(subSetEPC$Sub_metering_2)# as numbers
        subMetering3 <- as.numeric(subSetEPC$Sub_metering_3)# as numbers
        GRP<- as.numeric(subSetEPC$Global_reactive_power)# as numbers
        volt<- as.numeric(subSetEPC$Voltage) # as numbers

#plotting Data #4

        png("plot4.png", width=480, height=480) # Construct the plot and save it to a PNG file
        par(mfrow = c(2, 2)) # 2 rows by 2 columns plot
                plot(datetime, GAP, type="l", ylab="Global Active Power (Kilowatts)", xlab="")
        
                plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")
                
                plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="") 
                        lines(datetime, subMetering2, type="l", col="red")
                        lines(datetime, subMetering3, type="l", col="blue")
                                legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
        
                plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        dev.off() # Close graphic device