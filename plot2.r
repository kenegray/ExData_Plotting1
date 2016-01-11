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


library(datasets)
#with(data)
png(file="plot2.png")
plot(data[, 3] ~ data[,10],type="l", xlab="",ylab = "Global Active Power (kilowatts)")

dev.off()

