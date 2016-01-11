#get 1st day of data
data1<- read.csv.sql("hpc2.csv", sql="select * from file where Date = '1/2/2007'", header = TRUE, sep = ",")
#get 2nd day of data
data2<- read.csv.sql("hpc2.csv", sql="select * from file where Date = '2/2/2007'", header = TRUE, sep = ",")
#combine them
data<- rbind(data1,data2)

library(datasets)
#with(data, plot(Global_active_power,))

png(file="plot1.png",width = 480, height = 480)
hist(data$Global_active_power, col = "Red",main = "Global Acitve Power",xlab = "Global Active Power (kilowatts)")
dev.off()

