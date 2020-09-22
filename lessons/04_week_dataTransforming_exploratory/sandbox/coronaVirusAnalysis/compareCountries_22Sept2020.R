# Date: 22 Sept 2020
# What is this? Code to track the infections of COVID-19 for comparison between countries

rm(list = ls()) # clear out the variables in memory


# install the libraries if they are not already on your machine.
#install.packages("tidyverse")
#install.packages("plotly")

library(tidyverse)
library(plotly)


# note: set your local directory to the one that contains the data file.
# code ref: https://community.rstudio.com/t/loading-an-rda-file-into-r/45984/4

# data ref: https://github.com/RamiKrispin/coronavirus/blob/master/data/coronavirus.rda
# Use GitHub's DOWNLOAD button to get the latest version of the data.

# is the file is in the working directory.
#dataFile <- "coronavirus.rda"
#load(dataFile)


# If you have to search for the file, then use this code.
# file.exists(dataFile)
 myFile <- file.choose()
 load(myFile)


 
# What countries do I have data for analysis?
unique(coronavirus$country)
 
# What providences do I have data for analysis?
unique(coronavirus$province)

# View the data
view(coronavirus)




#### Plotting data ####

# ensure all country data is same length by pulling data from same dataset.
# isolate all the case and date information to create smaller tables that we will use.

# filter out a subset of the data. This data matches the specified country and the term "confirmed" for type. Then plot these filter results. X-axis is time, y-axis is confirmed c cases.


#### #### #### #### #### #### 
# Sweden
#### #### #### #### #### #### 

swedenDat <- coronavirus %>% filter(country == "Sweden", province =="", type == "confirmed") %>% select(date,cases,type)
names(swedenDat) <- c("swedenDate","swedenCases")

ggplot(swedenDat, aes(swedenDate, swedenCases)) +  geom_line(color = "red" ) + ylab("Sweden Cumulative confirmed cases") 



#### #### #### #### #### #### 
# France
#### #### #### #### #### #### 


franceDat <- coronavirus %>% filter(country == "France", province =="", type == "confirmed") %>% select(date,cases,type)
names(franceDat) <- c("franceDate","franceCases")

ggplot(franceDat, aes(franceDate, franceCases)) +  geom_line(color = "red" ) + ylab("France Cumulative confirmed cases") 



#### #### #### #### #### #### 
# US
#### #### #### #### #### #### 


usDat <- coronavirus %>% filter(country == "US", province =="", type == "confirmed") %>% select(date,cases,type)
names(usDat) <- c("usDate","usCases")

ggplot(usDat, aes(usDate, usCases)) +  geom_line(color = "red" ) + ylab("US Cumulative confirmed cases") 


#### #### #### #### #### #### 
# Italy
#### #### #### #### #### #### 

italyDat <- coronavirus %>% filter(country == "Italy", province =="", type == "confirmed") %>% select(date,cases,type)
names(italyDat) <- c("italyDate","italyCases")

ggplot(italyDat, aes(italyDate, italyCases)) +  geom_line(color = "red" ) + ylab("Italy Cumulative confirmed cases") 


#### #### #### #### #### #### 
# Canada
#### #### #### #### #### #### 

canadaDat <- coronavirus %>% filter(country == "Canada", type == "confirmed") %>% select(date,cases,type)
#Note: we do not add a filter for the "province" column in the data. We do for other countries.
names(canadaDat) <- c("canadaDate","canadaCases")

ggplot(canadaDat, aes(x = canadaDate, y = canadaCases)) +  geom_line(color = "purple" ) + ylab("Canada Cumulative confirmed cases") 


#### Compare countries ####

# Establish the traces (sub data sets) for plotly.
# Each country needs a trace to hold its data for plotting

trace_0 <- c(swedenDat$swedenCases)
trace_1 <- c(franceDat$franceCases)
trace_2 <- c(usDat$usCases)
trace_3 <- c(italyDat$italyCases)
trace_4 <- c(canadaDat$canadaCases)

# Establish the x-axis
x <- c(1:length(trace_0)) # need an x-axis so we will use the dates, note all these traces should be the same length.

# add the traces from each country to the main plot's data set
myData <- data.frame(x, trace_0, trace_1, trace_2, trace_3, trace_4)


# the code to create the plot from the individual traces
p <- plot_ly(myData, x = ~x, y = ~trace_0, name = "Sweden", type = 'scatter', mode = 'markers') %>% 
  add_trace( x = ~x,y = ~trace_1, name = "France", type = 'scatter', mode = 'markers') %>% 
  add_trace( x = ~x, y = ~trace_2, name = "US", type = 'scatter', mode = 'markers') %>%
  add_trace( x = ~x, y = ~trace_3, name = "Italy", type = 'scatter', mode = 'markers') %>%
  add_trace( x = ~x, y = ~trace_4, name = "Canada", type = 'scatter', mode = 'markers')

# show the plot
p

