# Exploratory-Data-Analysis---Course-Project-2

NOTE: Work and supporting documents are shown at the bottom. 
Introduction

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.
Data

The data for this assignment are available from the course web site as a single zip file:

    Data for Peer Assessment [29Mb]

The zip file contains two files:

PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

     fips      SCC Pollutant Emissions  type year
     4  09001 10100401  PM25-PRI    15.714 POINT 1999
     8  09001 10100404  PM25-PRI   234.178 POINT 1999
    12 09001 10100501  PM25-PRI     0.128 POINT 1999
    16 09001 10200401  PM25-PRI     2.036 POINT 1999
    20 09001 10200504  PM25-PRI     0.388 POINT 1999
    24 09001 10200602  PM25-PRI     1.490 POINT 1999

    fips: A five-digit number (represented as a string) indicating the U.S. county
    SCC: The name of the source as indicated by a digit string (see source code classification table)
    Pollutant: A string indicating the pollutant
    Emissions: Amount of PM2.5 emitted, in tons
    type: The type of source (point, non-point, on-road, or non-road)
    year: The year of emissions recorded

Source Classification Code Table (Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings int he Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:

This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

as long as each of those files is in your current working directory (check by calling dir() and see if those files are in the listing).
# Assignment

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.
Making and Submitting Plots

For each plot you should

    Construct the plot and save it to a PNG file.
    Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You should also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)
    Upload the PNG file on the Assignment submission page
    Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.
    
# Questions

You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.
## Question 1

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

read NEI and SCC data


      NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
      SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")

Aggrigate total by year

      TotalByYear <- aggregate(Emissions ~ year, NEI, FUN=sum)

Plot the aggrigated values

      png('plot1.png')
      barplot(height=TotalByYear$Emissions, names.arg=TotalByYear$year, xlab="Year",col="red", ylab=expression('Total PM'[2.5]*'  Emission (Tons)'),main=expression('Total PM'[2.5]*' Emissions by Year'))
      dev.off()

 ![alt text](https://github.com/andualemb/Exploratory-Data-Analysis---Course-Project-2/blob/master/plot1.png)


## Answer 1 
#### The plotted data show that total PM2.5 emmission has declined from 1999 to 2008

## Question 2
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.



Read NEI and SCC data


      NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
      SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")

subset the Baltimore data

      BaltimoreCityNEI  <- NEI[NEI$fips=="24510", ]

aggrigate Baltimore's total by year

      TotalByYear <- aggregate(Emissions ~ year, BaltimoreCityNEI, sum)

      png('plot2.png')
      barplot(height=TotalByYear$Emissions, names.arg=TotalByYear$year, xlab="Year",col="red", ylab=expression('Total PM'[2.5]*'    Emission (Tons)'),main=expression('Total PM'[2.5]*' Emmission in Baltimore City, MD by Year'))
     dev.off()
     
 ![alt text](https://github.com/andualemb/Exploratory-Data-Analysis---Course-Project-2/blob/master/plot2.png)   
     
## Answer 2
 
#### Plotted data show that emmission in Baltimore is trending downwards but there was an increase in 2005. 




## Question 3

3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.



Read NEI and SCC data


      NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
      SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")

     library(ggplot2)

subset the Baltimore data

      BaltimoreCityNEI  <- NEI[NEI$fips=="24510", ]

Aggrigate Baltimore's total by year and type

      TotalByYearAndType <- aggregate(Emissions ~ year + type, BaltimoreCityNEI, sum)


      png("plot3.png", width=640, height=480)
      g <- ggplot(BaltimoreCityNEI,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("Total PM"[2.5]*" Emissions in Baltimore City 1999-2008 by Source Type"))

      print(g)
      dev.off()
      
 ![alt text](https://github.com/andualemb/Exploratory-Data-Analysis---Course-Project-2/blob/master/plot3.png)   
      
## Answer 3
#### Plotted data show that point emmission has trended higher from 1999 to 2005 and declined in 2008





## Question 4

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?



Read NEI and SCC data


      NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
      SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")

Merge the NEI data and SCC data sets 

       NEISCC <- merge(NEI, SCC, by="SCC")

      library(ggplot2)

Subset the oal combustion-related sources data 

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
      
 ![alt text](https://github.com/andualemb/Exploratory-Data-Analysis---Course-Project-2/blob/master/plot4.png)   

## Answer 4
#### Plotted data show that Coal emmission has decreased through the years




## Question 5
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?



Read NEI and SCC data


      NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
      SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")



      library(ggplot2)

Subset the Baltimore data and ON-ROAD type in NEI

      BaltimoreCityNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

Aggrigate Baltimore's total by year and type

      TotalByYear <- aggregate(Emissions ~ year, BaltimoreCityNEI, sum)



      png("plot5.png", width=840, height=480)
      g <- ggplot(TotalByYear, aes(factor(year), Emissions))
      g <- g + geom_bar(stat="identity", fill = "red") +
        xlab("Year") +
        ylab(expression('Total PM'[2.5]*' Emissions (Tons)')) +
        ggtitle('Total Emissions From Motor Vehiclein Baltimore City, Maryland from 1999 to 2008')
      print(g)
      dev.off()
      
 ![alt text](https://github.com/andualemb/Exploratory-Data-Analysis---Course-Project-2/blob/master/plot5.png)   

## Answer 5
#### PM2.5 Plotted data show emmision from motor vehicles in Baltimore is decressing. 





## Question 6
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?




Read NEI and SCC data


      NEI <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/summarySCC_PM25.rds")
      SCC <- readRDS("C:/Users/abekele/Documents/Corsera/Exploratory Data Analysis/EPA Files/Source_Classification_Code.rds")


      library(ggplot2)

Subset the Baltimore and Los Angeles data for ON-ROAD type in NEI

      subsetNEI <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]



Aggrigate the Baltimore and Los Angeles data for ON-ROAD type in NEI

      TotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)

Aggrigate the Baltimore data for ON-ROAD type in NEI
      
      TotalByYearAndFips$fips[TotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"

Aggrigate the Los Angeles data for ON-ROAD type in NEI
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
      
 ![alt text](https://github.com/andualemb/Exploratory-Data-Analysis---Course-Project-2/blob/master/plot6.png)   

## Answer 6
#### Plotted data show that Los Angeles has seen the biggest drop in emmissions in absloute terms but the total emmission in Baltimore is lower that LA 
