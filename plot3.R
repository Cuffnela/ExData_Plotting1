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
# colored series by sub metering
# sub_metering 1 = black, sub_metering_2 = red, sub_metering_3 = blue

#open png graphics device
png(filename = "plot3.png")
plot(data$DateTime, data$Sub_metering_1, col="black", type="l", xlab="", 
     ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#close graphics device
dev.off()