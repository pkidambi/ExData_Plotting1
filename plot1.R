
# Read the data into mydata
mydata <- read.table("C:\\Users\\CECS-INT\\Desktop\\R_programs\\household_power_consumption.txt"
                     , header=T, sep=";", stringsAsFactors = FALSE)

# Convert the date in mydata to class date and format %d/%m/%Y
mydata$Date <- as.Date(mydata$Date, format = "%d/%m/%Y") 

# create DATE 1 and DATE 2 which indicate the dates of interest 
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

# figure out all the rows in mydata which contain either DATE 1 or DATE 2 and 
# store the logical values in get.rows
get.rows   <- mydata$Date >= DATE1 & mydata$Date <= DATE2

# filter mydata for the dates of interest rows and store the new data in mydata3
mydata3 <- mydata[get.rows, ]


# plot 1 - histogram of global_active_power vs frequency and save it in plot1.png.
# default size of png is 480*480
hist(as.numeric(mydata3$Global_active_power), col = "red", xlab = "Global 
     Active Power (kilowatts)", ylab = "Frequency",main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()