#2. Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008? Use the base plotting 
#system to make a plot answering this question.

#We will use the "aggrigate" function of r to Splits the data into subsets, 
#compute summary statistics for each year, and the subset function to look 
#into just the Baltimore data and plot the result.

# read NEI and SCC data


NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")


#subset the Baltimore data

BaltimoreCityNEI  <- NEI[NEI$fips=="24510", ]

#aggrigate Baltimore's total by year

TotalByYear <- aggregate(Emissions ~ year, BaltimoreCityNEI, sum)

png('plot2.png')
barplot(height=TotalByYear$Emissions, names.arg=TotalByYear$year, xlab="Year",col="red", ylab=expression('Total PM'[2.5]*' Emission (Tons)'),main=expression('Total PM'[2.5]*' Emmission in Baltimore City, MD by Year'))
dev.off()


# Emmission in Baltimore is trending downwards but there was an increase in 2005. 