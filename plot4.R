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


par(mfrow=c(2,2))
# THE FIRST PLOT
plot(household_power_consumption$Date_Time
     , household_power_consumption$Global_active_power
     , ylab = "Global Active Power", xlab = ""
     , type="l")

# THE SECOND PLOT
plot(household_power_consumption$Date_Time
     , household_power_consumption$Voltage
     , ylab = "Voltage", xlab = "datetime"
     , type="l")

# THE THIRD PLOT
plot(household_power_consumption$Date_Time
     , household_power_consumption$Sub_metering_1
     , ylab = "Energy sub metering", xlab=""
     , type="l")
lines(household_power_consumption$Date_Time
      , household_power_consumption$Sub_metering_2
      , col="red")
lines(household_power_consumption$Date_Time
      , household_power_consumption$Sub_metering_3
      , col="blue")

# THE FOURTH PLOT
plot(household_power_consumption$Date_Time
     , household_power_consumption$Global_reactive_power
     , xlab = "datetime", ylab="Global_reactive_power"
     , type="l")


# EXPORT AS A PNG FILE
dev.copy(png,'plot4.png', width = 480, height = 480)
dev.off()
