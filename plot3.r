#3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot 
#answer this question.


#We will use the "aggrigate" function of r to Splits the data into subsets, 
#compute summary statistics for each year, and the subset function to look 
#into just the Baltimore data and plot the result in a ggplot2.

# read NEI and SCC data


NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")



library(ggplot2)

#subset the Baltimore data

BaltimoreCityNEI  <- NEI[NEI$fips=="24510", ]

#aggrigate Baltimore's total by year and type

TotalByYearAndType <- aggregate(Emissions ~ year + type, BaltimoreCityNEI, sum)



png("plot3.png", width=640, height=480)
ggp <- ggplot(BaltimoreCityNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("Total PM"[2.5]*" Emissions in Baltimore City 1999-2008 by Source Type"))

print(ggp)
dev.off()

# Point emmission has trended higher from 1999 to 2008
