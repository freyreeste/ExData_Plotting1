# reading the data for ploting
        data<- "household_power_consumption.txt"
        EPC <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
                subSetEPC <- EPC[EPC$Date %in% c("1/2/2007","2/2/2007") ,] # Subseting only the period needed

# data is stored as factors then we need to convert the data
        datetime <- strptime(paste(subSetEPC$Date, subSetEPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
        GAP <- as.numeric(subSetEPC$Global_active_power)# as numbers
        

#plotting Data #2

        png("plot2.png", width=480, height=480) # Construct the plot and save it to a PNG file 
        plot(datetime, GAP, type="l", ylab="Global Active Power (Kilowatts)", xlab="") 
        dev.off() # Close graphic device