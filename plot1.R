setwd("~/ExData_Plotting1")

# First I import the data set and reduce the number of observations
file_name <- "~/ExData_Plotting1/household_power_consumption.txt"
household_power_consumption <- read.csv(file_name
                                        , sep=";"
                                        , na.strings="?")
logical_vector_1 <- as.character(household_power_consumption$Date)=="1/2/2007"
logical_vector_2 <- as.character(household_power_consumption$Date)=='2/2/2007'
household_power_consumption <- household_power_consumption[logical_vector_1 | logical_vector_2, ]
rm(logical_vector_1, logical_vector_2)
# Now I fix the format of the columns
household_power_consumption$Date_Time <- as.POSIXct(
  paste(household_power_consumption$Date, household_power_consumption$Time)
  , format="%d/%m/%Y %H:%M:%S")

household_power_consumption <- household_power_consumption[,c("Global_active_power"
                                                              , "Global_reactive_power"
                                                              ,"Voltage", "Global_intensity"
                                                              , "Sub_metering_1"
                                                              ,"Sub_metering_2"
                                                              , "Sub_metering_3"
                                                              , "Date_Time")]

# Histogram of the global Global Active Power
hist(household_power_consumption$Global_active_power
     , col="red", xlab = "Global Active Power (kilowatts)"
     , ylab = "Frequency", main = "Global Active Power")
dev.copy(png,'plot1.png', width = 480, height = 480)
dev.off()
