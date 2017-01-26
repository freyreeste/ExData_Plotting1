# reading the data for ploting
        data<- "household_power_consumption.txt"
        EPC <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
                subSetEPC <- EPC[EPC$Date %in% c("1/2/2007","2/2/2007") ,] # Subseting only the period needed

# data is stored as factors then we need to convert the data
        GAP <- as.numeric(subSetEPC$Global_active_power)# as numbers
       
#plotting Data #1

        png("plot1.png", width=480, height=480) # Construct the plot and save it to a PNG file 
        hist(GAP, ylab="Frequency", xlab="Global Active Power(Kilowatts)",col="red", main="Global Active Power") # Render a histogram 
        dev.off() # Close graphic device