## Visualising data with ggplot2

#load ggplot

library(ggplot2)
library(tidyverse)


#load data

surveys_complete <- read_csv("data_raw/surveys_complete.csv")

#create a plot

ggplot(data=surveys_complete)


ggplot(data=surveys_complete, mapping = aes(x=weight, y=hindfoot_length))

ggplot(data= surveys_complete, mapping = aes(x=weight, y=hindfoot_length))+ geom_point()


#Assign a plot to a object

surveys_plot <- ggplot(data= surveys_complete, mapping =aes(x=weight, y=hindfoot_length))

surveys_plot

view(surveys_plot)

#Challenge 1
#Change the mappings so weight is on the y-axis and hindfoot_length is on the y-axis

surveys_plot <- ggplot(data= surveys_complete, mapping =aes(y=weight, x=hindfoot_length))



#Draw the plot
surveys_plot +
  geom_point()


#Challenges
#Challenge 2 How would you create a histogram of weights?

challenge2 <- ggplot(data= surveys_complete, mapping = aes(weight)) + geom_histogram()
challenge2

ggplot(data=surveys_complete, aes(x=weight)) + geom_histogram(binwidth=10)


#Challenge 3 Use what you just learned to create a scatter plot of weight over species_id with the plot type showing in different colours. 
#Is this a good way to show this type of data?
#Challenge 4 Notice how the boxplot layer is behind the jitter layer? What do you need to change in the code to put the boxplot in front of the points such that it’s not hidden?
  

