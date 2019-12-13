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
# 2 by 2 plot matrix
# plot 2, voltage by datetime
# plot 3, global_reactive_power

#open png graphics device
png(filename="plot4.png")

#setup 2 by 2 plot matrix
par(mfrow=c(2,2))
#plot 2
plot(data$DateTime, data$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab="")
#voltage v. datetime
plot(data$DateTime, data$Voltage, type = "l",ylab="Voltage", xlab="datetime")
#plot 3
plot(data$DateTime, data$Sub_metering_1, col="black", type="l", xlab="", 
     ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
#global_reactive_power v. datetime
plot(data$DateTime, data$Global_reactive_power, type = "l",ylab="Global_reactive_power", xlab="datetime")

#close graphics device
dev.off()