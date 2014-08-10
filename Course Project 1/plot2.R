#------------------------------------------------------------------------------#
#plot2.png

#---------------------------- AMBIENTE R --------------------------------------#

options(prompt = "[] ", 
        continue = "..  ", 
        width = 70,
        useFancyQuotes = FALSE, 
        digits = 3, 
        warn = 1)


#-------------------------- LUGAR DE TRABAJO ----------------------------------#

setwd("G:/JC/Coursera/Data Science/Exploratory Data Analysis/Week 1/Project N°1 [10082014]") #
getwd()
dir()

#Reading data house_power_consumption

House <- read.table("household_power_consumption.txt", 
                    sep=";", 
                    head = TRUE)

#We will only be using data from the dates 2007-02-01 and 2007-02-02

House_1 <- subset(House, Date == '1/2/2007' | Date == '2/2/2007')

#Now, we will convert a factor to an integer / numeric number without loss of information

House_1$Global_active_power <- as.numeric((unclass(House_1$Global_active_power)))

# Format the date and time of the data

House_1$DateTime <- paste(House_1$Date, House_1$Time)
House_1$Date <- as.Date(House_1$Date, format="%d/%m/%Y")
House_1$DateTime <- strptime(House_1$DateTime, "%d/%m/%Y %H:%M:%S")

# Create png file for Plot 2
png(filename = "plot2.png", 
    width = 480, 
    height = 480)

plot(House_1$DateTime, 
     House_1$Global_active_power/500, #Rescale
     type = "l", 
     xlab = "", 
     ylab= "Global Active Power (kilowatts)", 
     main = ""
)

dev.off()
