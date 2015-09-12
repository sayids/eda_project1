# Exploratory Data Analysis project 1 plot 2

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
    datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
    global_active_power <- as.numeric(df$Global_active_power)
    hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    dev.copy(png, file="plot2.png", height=480, width=480)
    dev.off()
}
