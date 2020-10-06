# practical_01

# name: # TODO



rm(list = ls()) # remove all variables in memory

#install.packages("tidyverse")
library(tidyverse)

#install.packages("nycflights13")
library(nycflights13)

#install.packages("plotly")
library(plotly)


###################################

# View the dataset, flights
View(flights)


# 1. Show code to view the column header names
names(flights)


# 2. Show code to obtain the first row of the flights data set
flights[1,]


# 3. Show code to obtain the first column ("year") of the flights data set
flights[,c(1:4)]
c(1:4) # gives 1, 2, 3, 4

# 4. Show code to obtain a new variable called, "myData" from the first, second and third rows of the columns, "dep_time", "sched_dep_time" and "dep_delay". Hint: Use numbered sequences. The columns are numbered; 4 through 6 and the rows are numberd 1 through 3. Your code will create a 3 x 3 matrix.
# TODO
flights[c(1:3),c(4:6)]
flights[c(1,2,3),c(4,5,6)]

myRows <- c(3,4,5)
myCols <- c(7,8,9)
flights[myRows, myCols]



# 5. Show code to use filter() to select the rows of data for which the departure delay is greater than 800.
filter(flights, dep_delay > 800)


# 6. Show code to use select() to obtain cols of departure and arrival data (i.e., sched_dep_time, dep_delay, sched_arr_time and arr_time). Hint: to combine these columns, you will beed to create a vector using the vector making function, c().
# TODO
select(flights, c(sched_dep_time, dep_delay, sched_arr_time, arr_time))
names(flights)

###################################

# Plotting

#  7. Show code to use ggplot() and geom_line() to prepare plots of x = Sched_dep_time vs. y = Sched_arr_time, in red. Devise an explanation for his plot's pattern 

?ggplot() 
ggplot(flights) + geom_line(mapping = aes(x = sched_dep_time, y = sched_arr_time), color = "red") + ylab("sched_dep_time vs sched_arr_time")



#  8. Show code to use ggplot() and geom_line() to prepare plots of of x = dep_time vs. y = arr_time, in blue. Devise an explanation for his plot's pattern 
ggplot(flights) + geom_line(mapping = aes(x = dep_time, y = arr_time), color = "blue") + ylab("dep_time vs arr_time")





# 9. Show code to combine both of these ggplot() and geom_line() plots (the red and blue, from above). Explain what you see.
ggplot(flights) + 
  geom_line(mapping = aes(x = sched_dep_time, y = sched_arr_time), color = "red") +
  geom_line(mapping = aes(x = dep_time, y = arr_time), color = "blue") + ylab("RED: sched_dep_time vs sched_arr_time AND BLUE: dep_time vs arr_time")



#  10. Show code to use ggplot() and geom_point() to prepare plots of of x = dep_time vs. y = arr_time, in red Devise an explanation for his plot's pattern 


ggplot(flights) +
  geom_point(mapping = aes(x = dep_time, y = arr_time), color = "red") +
  ylab("dep_tim vs arr_time")







#  11. Show code to use ggplot() and geom_point() to prepare plots of of x = sched_dep_time vs. y = sched_arr_time, in blue. Devise an explanation for his plot's pattern 


ggplot(flights) +
  geom_point(mapping = aes(x = sched_dep_time, y = sched_arr_time), color = "blue") +
  ylab("sched_dep_tim vs sched_arr_time")






# 12. Show code to combine both of these ggplot() and geom_point() plots (the red and blue, from above). Explain what you see.



ggplot(flights) +
  geom_point(mapping = aes(x = dep_time, y = arr_time), color = "red") +
  geom_point(mapping = aes(x = sched_dep_time, y = sched_arr_time), color = "blue") +
  ylab("red: dep_tim vs arr_time, blue: sched_dep_tim vs sched_arr_time")






# 13. Create a dataset for which the sched_dep_time is less than 1000 and then use the plotly library to plot x = dep_tim vs. y = sched_dep_time



dat <- filter(flights, flights$sched_dep_time<1000)

# scatter: Sched_dep_tim vs Sched_dep_time using plotly
p <- ggplot(dat, aes(x = dep_time, y = sched_dep_time)) +
  geom_point(color = "blue" ) +
  ylab("dep_time vs sched_dep_time")

# explain this pattern
p <- ggplotly(p)
p


###################################




###################################
# plotly example code 
###################################


# ref: https://plot.ly/ggplot2/stat_smooth/
#install.packages("plotly")

p <- ggplot(mpg, aes(displ, hwy, color = cty))
p <- p + geom_point() + stat_smooth()
p <- ggplotly(p)
p
