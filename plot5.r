#5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?


#We will use the "aggrigate" function of r to Splits the data into subsets, 
#compute summary statistics for each year, and the subset function to look 
#into just the Baltimore data and plot the result in a ggplot2.

# read NEI and SCC data


NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")



library(ggplot2)

#subset the Baltimore data and ON-ROAD type in NEI

BaltimoreCityNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

#aggrigate Baltimore's total by year and type

TotalByYear <- aggregate(Emissions ~ year, BaltimoreCityNEI, sum)



png("plot5.png", width=840, height=480)
g <- ggplot(TotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill = "red") +
  xlab("Year") +
  ylab(expression('Total PM'[2.5]*' Emissions (Tons)')) +
  ggtitle('Total Emissions From Motor Vehiclein Baltimore City, Maryland from 1999 to 2008')
print(g)
dev.off()


# PM2.5 Emmision from motor vehicles in Baltimore is decressing. 