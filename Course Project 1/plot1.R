#------------------------------------------------------------------------------#
#plot1.png

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

#Now, we will convert a factor to an integer/numeric number without loss of information

House_1$Global_active_power <- as.numeric(paste(House_1$Global_active_power))

# Create png file for Plot 1

png(filename = "plot1.png", 
    width = 480, 
    height = 480)

hist(House_1$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", 
     main = "Global Active Power")

dev.off()
