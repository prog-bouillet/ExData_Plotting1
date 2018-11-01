
lines <- grep("^[12]{1}/2/2007",readLines("household_power_consumption.txt"),fixed=FALSE)

dat <- read.table("household_power_consumption.txt", header=FALSE, sep=";", na = "?", nrows=length(lines), skip=lines[1]-1)
a<-strsplit(readLines("household_power_consumption.txt",1),";")
names(dat) <- a[[1]]


png(filename = "plot2.png", width = 480, height = 480)

xtime<-strptime(paste(as.character(dat$Date),dat$Time),format="%d/%m/%Y %H:%M:%S")

plot(xtime,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

dev.off()