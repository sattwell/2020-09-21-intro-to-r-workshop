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


#building plots iteratively

ggplot(data= surveys_complete, mapping =aes(x=weight, y= hindfoot_length)) + geom_point(alpha= 0.5)


#add color
ggplot(data= surveys_complete, mapping =aes(x=weight, y= hindfoot_length)) + geom_point(alpha= 0.5, colour="blue")


ggplot(data= surveys_complete, mapping =aes(x=weight, y= hindfoot_length)) + geom_point(alpha= 0.5, aes (colour= species_id))



#Challenge 3 Use what you just learned to create a scatter plot of weight over species_id with the plot type showing in different colours. 
#Is this a good way to show this type of data? No

ggplot(data= surveys_complete, 
       mapping =aes(x=species_id, y= weight)) + 
  geom_jitter(alpha= 0.5, aes (colour= plot_type))


#Boxplots discrete data (species_id) vs continous data (weight)

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(alpha=0)+
  geom_jitter(alpha= 0.3, colour= "tomato")
  
  

#Challenge 4 Notice how the boxplot layer is behind the jitter layer? 

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_jitter(alpha= 0.3, colour= "tomato") +
  geom_boxplot(alpha=0)



##What do you need to change in the code to put the boxplot in front of the points such that it’s not hidden?
  
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_jitter(alpha= 0.3, colour= "tomato") +
  geom_boxplot(alpha=0)
 

#Challenge 5
#Boxplots are useful summaries but hide the shape of the distribution. For example, if there is a bimodal distribution, it would not be observed with a boxplot. An alternative to the boxplot is the violin plot (sometimes known as a beanplot), where the shape (of the density of points) is drawn.

#Replace the box plot with a violin plot
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
 geom_violin(alpha=1, colour="tomato")



#Challenge 6
#So far, we’ve looked at the distribution of weight within species. Make a new plot to explore the distribution of hindfoot_length within each species.
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_jitter(alpha= 0.3, colour= "tomato")+
  geom_boxplot(alpha=0)



#Add color to the data points on your boxplot according to the plot from which the sample was taken (plot_id).
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_jitter(alpha= 0.3, aes(colour= plot_id)) +
  geom_boxplot(alpha=0)


#Hint: Check the class for plot_id. Consider changing the class of plot_id from integer to factor. How and why does this change how R makes the graph?
#changing it permanently in dataframe
class(surveys_complete$plot_id)

surveys_complete$plot_id<- as.factor(surveys_complete$plot_id)

class(surveys_complete$plot_id)

ggplot(data = surveys_complete, mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_jitter(alpha= 0.3, aes( colour= plot_id)) +
  geom_boxplot(alpha=0)  

#change only in the plot
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_jitter(alpha = 0.3, aes(colour = as.factor(plot_id)) + geom_boxplot(alpha = 0))
              


#Challenge 7 In many types of data, it is important to consider the scale of the observations.
#For example, it may be worth changing the scale of the axis to better distribute the observations in the space of the plot. Changing the scale of the axes is done similarly to adding/modifying other components (i.e., by incrementally adding commands). 
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_jitter(alpha= 0.3, aes(colour= as.factor(plot_id))) +
  scale_y_log10()


#Make a scatter plot of species_id on the x-axis and weight on the y-axis with a log10 scale.

#plotting time series dat

#counts per year for each genus

yearly_counts <- surveys_complete%>%
  count(year, genus)

yearly_counts

ggplot(data= yearly_counts, mapping= aes(x=year, y=n))+
  geom_line()

ggplot(data= yearly_counts, mapping= aes(x=year, y=n, group=genus))+
  geom_line()



# Challenge 8
# Modify the code for the yearly counts to colour by genus so we can
# clearly see the counts by genus.




