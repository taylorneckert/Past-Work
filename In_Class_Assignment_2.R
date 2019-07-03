
# In this script, we'll learn the basics of R!


library(dplyr)
library(ggplot2)
# R as a calculator
################################################################################

# R can perform ALL mathematical operations
# +, -, *, /, ^, exp(), sqrt(), log(), log10(), abs(), and more




# R is logical
################################################################################

# R can perform ALL logical tests
# <, <=, >, >=, ==, !=, 
# ! = NOT, | = OR, & = AND, %in% = in





# R uses objects 
################################################################################

# Create simple objects
################################

# Creating simple objects
# Create objects using the <- operator
# Objects can be numeric, integer, string, complex, logical, and more





# Create vectors
################################

# Creating numerical vectors
# You can create numeric vectors using c(), seq(), or the : operator




# Creating character (string vectors)
# You can create character vectors using c() and paste()




# Combining vectors
# You can combine vectors using c()




# What happens when you combine a string and character vector?




# Indexing vectors 
################################

# Indexing vectors
# Use []s to index a vector - put the element position in the bracked





# EXERCISE BREAK!
################################################################################

# Basic math
################################

# 1. What is the sum of 856 + 765?
856 + 765

# 2. What is 104 multiplied by 187
104 * 187

# 3. What is 1 divided by 12 + 47
1/(12+47)

#  Vectors
################################

# 4. Create a vector of 1 to 5, save it as object x
x <- (1:5)

# 5. Create a vector of 12, 17, 9, 11, save it as object y
y <- c(12, 17, 9, 11)

# 6. Create a vector of both x and y together
x+y

# 7. Run g<-seq(11,333,3), what is the 68 position in this vector?
g <- seq(11, 333, 3)
g[68]

# 8. How do you call both the 68 position and 79 simultaneously?
g[c(68,79)]

# In this script, we'll learn to read, manipulate, and plot data!


# Read data
##########################################

# Read CSV file using read.csv()
cocainedata <- read.csv("~/Intro to Stastical Packages 615 (Fernandez)/stride_cocaine (1).csv")


# Inspect data
##########################################

# Inspect data
# str(), head(), tail(), nrow(), ncol(), colnames()
str(cocainedata)
head(cocainedata)
tail(cocainedata)
nrow(cocainedata)
ncol(cocainedata)
colnames(cocainedata)


# Subset data with []'s and $'s



# Subset data with subset()

# Some common logic statements: 
# ==, !=, >=, <=, >, <, %in%, is.na(), !is.na(), &, |





# EXERCISE BREAK
##########################################

# Subset cocaine data with both potency and posted price measurements
# using []s and $s and using subset()


cocainedata$Nt.Wt<-as.numeric(gsub(",","",as.character(cocainedata$Nt.Wt)))
cocainedata$Nt.Wt[cocainedata$Nt.Wt==0]<-NA
cocainedata$Post.Price<-as.numeric(gsub(",","",as.character(cocainedata$Post.Price)))
cocainedata$Potency<-as.numeric(gsub(",","",as.character(cocainedata$Potency)))
cdatasub <- subset(cocainedata, select= c(Potency, Post.Price))


# Subset a vector of posted price for Kentucky
# Hint: You can use na.omit() to eliminate NA values

PostedPriceKY <- na.omit(cocainedata$Post.Price[cocainedata$State=="KY"])


# Summarize data
##########################################

# Summary statistics
# sum(), mean(), median(), quantile(), summary(), boxplot()

sum(PostedPriceKY)
mean(PostedPriceKY)
median(PostedPriceKY)
quantile(PostedPriceKY)
summary(PostedPriceKY)
boxplot(PostedPriceKY)



# Add columns to data
##########################################

# create a new column "Price_by_wt" that contains Post Price/(NT Wt)

cocainedata$Price_by_wt <-cocainedata$Post.Price / cocainedata$Nt.Wt


# Export data
##########################################

# Export cleaned data using write.csv()

cleancocainedata <- na.omit(cocainedata)
write.csv(cleancocainedata , file= "~/Intro to Stastical Packages 615 (Fernandez)/cleancocainedata")

# Plot data
##########################################

# Plot Price_by_wt and potency

plot1 <- qplot(Price_by_wt, Potency, data=cocainedata, xlab="Price by Weight", ylab= "Potency")
plot1

# On your own, try to make as pretty a plot as possible!
# Search online about the different arguments used in the plot function

plot2 <- ggplot(cocainedata) + geom_point(aes(x=Price_by_wt, y=Potency, color=Drug, alpha=0.05))+
 labs(title="Price by Weight and Potency of Cocaine", x="Price by Weight", y="Potency") +
  coord_cartesian(xlim=c(0,2000),ylim=c(0,200))
plot2

