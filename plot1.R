
lines <- grep("^[12]{1}/2/2007",readLines("household_power_consumption.txt"),fixed=FALSE)

dat <- read.table("household_power_consumption.txt", header=FALSE, sep=";", na = "?", nrows=length(lines), skip=lines[1]-1)
a<-strsplit(readLines("household_power_consumption.txt",1),";")
names(dat) <- a[[1]]

png(filename = "plot1.png", width = 480, height = 480)

hist(dat$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

dev.off()