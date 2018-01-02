#4. Across the United States, how have emissions from coal combustion-related sources 
#changed from 1999-2008?


#We will use the "aggrigate" function of r to Splits the data into subsets, 
#compute summary statistics for each year, and the subset function to look 
#into just the Baltimore data and plot the result in a ggplot2.

# read NEI and SCC data


NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")

# merge the NEI data and SCC data sets 
NEISCC <- merge(NEI, SCC, by="SCC")



library(ggplot2)

#subset the oal combustion-related sources data 

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
CoalNEISCC <- NEISCC[coalMatches, ]

TotalByYear <- aggregate(Emissions ~ year, CoalNEISCC, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(TotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill = "red") +
  xlab("year") +
  
  ylab(expression('Total PM'[2.5]*' Emissions (Tons)')) +
  ggtitle('Total Emissions From Coal Sources From 1999 to 2008')
print(g)
dev.off()

#Coal emmission has decreased through the years