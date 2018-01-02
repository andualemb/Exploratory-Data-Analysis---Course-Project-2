#6. Compare emissions from motor vehicle sources in Baltimore City with emissions 
#from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?



#We will use the "aggrigate" function of r to Splits the data into subsets, 
#compute summary statistics for each year, and the subset function to look 
#into just Baltimore and Los Angeles data and plot the result in a ggplot2.

# read NEI and SCC data


NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")


library(ggplot2)

#subset the Baltimore and Los Angeles data for ON-ROAD type in NEI

subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]



#aggrigate the Baltimore and Los Angeles data for ON-ROAD type in NEI


TotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)

#aggrigate the Baltimore data for ON-ROAD type in NEI
TotalByYearAndFips$fips[TotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"

#aggrigate the Los Angeles data for ON-ROAD type in NEI
TotalByYearAndFips$fips[TotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(TotalByYearAndFips, aes(factor(year), Emissions, fill=fips))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  xlab("year") +
  ylab(expression('Total PM'[2.5]*' Emissions (Tons)')) +
  ggtitle('Comparrision of Total Emissions From Motor Vehicle in Baltimore City, MD and Los Angeles, CA by Year')
print(g)
dev.off()

#Los Angeles has seen the biggest drop in emmissions in absloute terms but the total emmission in Baltimore is lower that LA 
