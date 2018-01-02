#1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

#We will use the "aggrigate" function of r to Splits the data into subsets, 
#compute summary statistics for each year, and plot the result using barplot.

# read NEI and SCC data


NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")

#aggrigate total by year

TotalByYear <- aggregate(Emissions ~ year, NEI, FUN=sum)

#plot the aggrigated values

png('plot1.png')
barplot(height=TotalByYear$Emissions, names.arg=TotalByYear$year, xlab="Year",col="red", ylab=expression('Total PM'[2.5]*' Emission (Tons)'),main=expression('Total PM'[2.5]*' Emissions by Year'))
dev.off()

# the data shows that total PM2.5 emmission has declined from 1999 to 2008