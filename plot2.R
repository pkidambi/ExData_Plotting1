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

# Create a dataframe mydata4 which clubs the date and the time column and name 
# the column as date_time
mydata4 <- data.frame(as.POSIXct(paste(mydata3$Date, mydata3$Time), format="%Y-%m-%d %H:%M:%S"))
colnames(mydata4) <- "date_time"

# plot 2 - plot of global_active_power vs date_time and save it in plot2.png.
# default size of png is 480*480
plot(mydata4$date_time, mydata3$Global_active_power, type = "l", ylab = "Global 
     Active Power (kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()