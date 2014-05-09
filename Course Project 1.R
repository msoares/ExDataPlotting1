# Load the data
data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?") # All the data
dias <- data$Date=="1/2/2007"|data$Date=="2/2/2007" # create index for the desired dates
datanew <- subset(data,dias) # subset
Sys.setlocale(category = "LC_TIME", locale = "C") # Fix locale; thanks, Ya-Ting Chan!
Sys.setlocale(category = "LC_ALL", locale = "") # Fix locale; thanks, Ya-Ting Chan!
datanew$Date  <- as.Date(x,"%d/%m/%Y") # convert dates
head(datanew)

# Make the plots
# plot 1
par(mfrow=c(1,1)) # Clean canvas
hist(datanew$Global_active_power,main="Global Active Power",col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png") # Opens PNG file
dev.off() # closes graphic device

# plot 2
par(mfrow=c(1,1)) # Clean canvas
plot(datanew$Global_active_power,pch=26,xaxt="n",ylab="Global Active Power (kilowatts)",xlab="") # scatterplot with invisible dots
lines(datanew$Global_active_power) # Add line
axis(1, at=c(0,1441,2900),labels=c("Thu", "Fri", "Sat"))  # adds X axis

dev.copy(png,file="plot2.png") # Opens PNG file
dev.off() # closes graphic device

# plot 3
par(mfrow=c(1,1)) # Clean canvas
plot(datanew$Sub_metering_1,pch=26,xaxt="n",ylab="Energy sub metering",xlab="") # scatterplot with invisible dots
lines(datanew$Sub_metering_1,type="s") # Add line
points(datanew$Sub_metering_2,pch=26) # scatterplot with invisible dots
lines(datanew$Sub_metering_2,type="s",col="red") # Add red line
points(datanew$Sub_metering_3,pch=26) # scatterplot with invisible dots
lines(datanew$Sub_metering_3,type="s",col="blue") # Add blue line
axis(1, at=c(0,1441,2900),labels=c("Thu", "Fri", "Sat"))  # adds X axis
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

dev.copy(png,file="plot3.png") # Opens PNG file
dev.off() # closes graphic device

# plot 4
par(mfrow=c(2,2)) # Split canvas
plot(datanew$Global_active_power,xaxt="n",pch=26,ylab="Global Active Power",xlab="") # scatterplot with invisible dots
lines(datanew$Global_active_power) # Add line
axis(1, at=c(0,1441,2900),labels=c("Thu", "Fri", "Sat"))  # adds X axis

plot(datanew$Voltage,pch=26,xaxt="n",ylab="Voltage",xlab="datetime") # scatterplot with invisible dots
lines(datanew$Voltage) # Add line
axis(1, at=c(0,1441,2900),labels=c("Thu", "Fri", "Sat"))  # adds X axis

plot(datanew$Sub_metering_1,xaxt="n",pch=26,ylab="Energy sub metering",xlab="") # scatterplot with invisible dots
lines(datanew$Sub_metering_1,type="s") # Add line
points(datanew$Sub_metering_2,pch=26) # scatterplot with invisible dots
lines(datanew$Sub_metering_2,type="s",col="red") # Add red line
points(datanew$Sub_metering_3,pch=26) # scatterplot with invisible dots
lines(datanew$Sub_metering_3,type="s",col="blue") # Add blue line
axis(1, at=c(0,1441,2900),labels=c("Thu", "Fri", "Sat"))  # adds X axis
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","red","blue"))

with(datanew,plot(Global_reactive_power,xaxt="n",pch=26,xlab="datetime")) # scatterplot with invisible dots
lines(datanew$Global_reactive_power) # Add line
axis(1, at=c(0,1441,2900),labels=c("Thu", "Fri", "Sat"))  # adds X axis

dev.copy(png,file="plot4.png") # Opens PNG file
dev.off() # closes graphic device