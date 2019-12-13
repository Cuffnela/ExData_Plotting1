################################################################################
#                                                                              #
# Coursera Project                                                             #
# Exploratory Data Analysis Week 1                                             #
# Data Science with Johns Hopkins                                              #
#                                                                              #
################################################################################

# read data in from file
################################################################################
data<-read.table("household_power_consumption.txt",
                 colClasses="character",sep=";",header=FALSE, skip = 66637, 
                 nrows = 2879)
vars<-read.table("household_power_consumption.txt",
                 colClasses="character",sep=";",header=FALSE, nrows = 1)
names(data)<-vars

# create combined Datetime variable
data$DateTime<-paste(data$Date, data$Time)
# convert Date and Time variables to Date/Time classes
data$DateTime<-strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
################################################################################

# Requirements
# png 480px by 480px
# Day of the Week vs. Global Active Power
#open png graphics device
png(filename = "plot2.png")
plot(data$DateTime, data$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()