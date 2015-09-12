# Exploratory Data Analysis project 1 plot 4

download_data = function() {
    "Downloading and unpacking datafile"
    # file variables
    file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    file_dest <- "data/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    file_dir <- "data/household_power_consumption.txt"
    # creat dir if not exist
    if (!file.exists("data")) {
        message("Creating data directory...")
        dir.create("data")
    }
    # download data if not exist
    if (!file.exists(file_dest)) {
        message("Downloading data...")
        download.file(url=file_url, destfile=file_dest)
        unzip(file_dest, exdir="data")
    }
}

subset_data = function() {
    "Subsetting existing data"
    message("Subsetting data...")
    dataFile <- "./data/household_power_consumption.txt"
    data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
    subsetted <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
    subsetted
}

plotting_data = function(df) {
    "Plotting converted data"
    message("Making plot...")
    datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    global_active_power <- as.numeric(df$Global_active_power)
    global_reactive_power <- as.numeric(df$Global_reactive_power)
    voltage <- as.numeric(df$Voltage)
    # submeterings
    sub_metering1 <- as.numeric(df$Sub_metering_1)
    sub_metering2 <- as.numeric(df$Sub_metering_2)
    sub_metering3 <- as.numeric(df$Sub_metering_3)
    # painting all in order on pics
    par(mfrow = c(2, 2))
    # powers voltage plot
    plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
    # submeterings plot
    plot(datetime, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
    lines(datetime, sub_metering2, type="l", col="red")
    lines(datetime, sub_metering3, type="l", col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
    # reactive
    plot(datetime, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    # now in png
    dev.copy(png, file="plot4.png", height=480, width=480)
    dev.off()
}

paint = function() {
    "Main function"
    download_data()
    subsetted <- subset_data()
    plotting_data(subsetted)
    message("Plotting complete. Look for file plot4.png in your project directory.")
}