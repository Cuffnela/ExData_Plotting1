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

# convert Date and Time variables to Date/Time classes
data$Date<-as.Date(data$Date)
data$Time<-strptime(data$Time, "%H:%M:%S")

################################################################################

# Requirments
# PNG file 480px by 480px
# Plot1 Global Active Power (kilowatts) histogram with red bars

#open png graphics device
png(filename = "plot1.png")
with(data, hist(as.numeric(Global_active_power), col="red", 
                xlab = "Global Active Power (kilowatts)",
                main="Global Active Power"))
dev.off()