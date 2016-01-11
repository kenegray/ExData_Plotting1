#get 1st day of data
library(sqldf)
data1<- read.csv.sql("hpc2.csv", sql="select * from file where Date = '1/2/2007'", header = TRUE, sep = ",")
#get 2nd day of data
data2<- read.csv.sql("hpc2.csv", sql="select * from file where Date = '2/2/2007'", header = TRUE, sep = ",")
#combine them
data<- rbind(data1,data2)


data$Date<- as.Date(data$Date,format="%d/%m/%Y")
datetm<- paste(as.Date(data$Date), data$Time)
data$Datetime<- as.POSIXct(datetm)
colours<- c("black","red","blue")
words<- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

library(datasets)
png(file="plot4.png")
par(mfrow=c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
  plot(data[, 3] ~ data[,10],type="l", xlab="",ylab = "Global Active Power (kilowatts)")

  plot(data[, 5] ~ data[,10],type="l", xlab="",ylab = "Global Active Power (kilowatts)")
  plot(data$Sub_metering_1 ~data$Datetime,type="l", xlab="",ylab = "Global Active Power (kilowatts)")
                lines(Sub_metering_2 ~data$Datetime,col='Red')
                lines(Sub_metering_3~data$Datetime,col='Blue')
                legend("topright",col = colours,legend = words,lty=1,lwd=5)

  plot(data[, 4] ~ data[,10],type="l", xlab="",ylab = "Global Recieve Power (kilowatts)")
                })

dev.off()




