###        ###
### Base R ###----
###        ###


#### Base R: Help & Packages----

# Get help of a particular function

?max # (or press F1)

# Search  help files for a word or phrase.

help.search("weighted mean") 

# Find help for a package

help(package = "rvest") 

# Download and install a package from CRAN

install.packages("rvest")

# Load the package into the session, making all its functions available to use

library(rvest)

# Use a particular function from a package

rvest::html_element() # 'package_name'::'function'

#Load a built-in data set into the environment

data(iris)

# See built-in data sets

data()




#### Base R: Variables | Read and Write data----

# Assign variables & Data Types

x <- "hello" # Character
x <- 42      # numeric
x = 42.3    # numeric
x <- 2L     # Integer. (the L tells R to store this as an integer)
x <- 1+4i   # Complex number
x <- true   # Logical

# Converting between common data types in R.
as.logical # Convert to logical
as.numeric # convert to numeric
as.character # Convert to character
as.factor # Convert to factor

# '<-' used to assign variables anywhere. Assign Locally. Use alt+-
# '=' variable assignment only allowed at the top level
# '<<-' superassignment. Used to assign globally or permanently. Function 'assign()' can also be used

df <- read.table("file.txt") # read a delimited text file
write.table(df, "file.txt") # write a delimited text file
df <- read.table("file.csv") # read a comma separated value file
write.csv(df, "file.csv") # write a comma separated value file
load("file.RData") # read an R data file, a file type special for R
save(df, file = "file.Rdata") # write an R data file, a file type special for R
ls() # List all variables in the environment
rm(x) # Remove x from the environment
rm(list = ls()) # Remove all variables from the environment



#### Base R: Strings and Factors----

paste(x, y, sep = ' ') # join multiple vectors together, separated by what's inside "sep"
  paste("Hello",2,"worlds",sep=" ") # Can also input values directly
paste(x, collapse = ' ') # Join elements of a vector together
toupper(x) # Convert to uppercase
toupper(x) # Convert to lowercase
nchar(x) # nr of characters in a String
grep(pattern, x) # Search for matches of "pattern" in x
gsub(pattern, replace, x) # Replace matches of "pattern" in "x" with "replace"
sub(pattern, replace, x) # Replace matches of "pattern" in "x" with "replace"

# The sub() function will replace the first occurrence leaving the other as it is. On the other hand
# The gsub() function will replace all the strings or values with the input strings.

example <- "The Earth surface is round. Earth has dinosaurs"

sub("Earth","Planetary",example)
gsub("Earth","Planetary",example)

# You can also use Regular Expressions (Regex)

example <- "NOW Oct22'21 700 C"

q <- sub("^(\\S*\\s+\\S+).*","\\1",example) 

# https://regex101.com/

  ## Anchors ##
# ^ -> 	Start of string or start of line depending on multiline mode. (But when [^inside brackets], it means "not")
# $ -> 	End of string or end of line depending on multiline mode.
# ( subexpression) -> group a sub expression

  ## Characters ##
# \s -> Whitespace Character
# \S -> One character that is not a whitespace character
# . -> Any character except the line break (ex. "a.c" = abc)
# \. -> A period ("\" escapes special characters)
# \d -> one digit from 0 to 9
# \w -> "word character": ASCII letter, digit or underscore
# \W -> 	One character that is not a word character
# \D -> 	One character that is not a digit
# (?i) -> Case-sensitive mode ex. (?i)Monday -> monDAY
# (?x) -> Free-spacing mode or comment mode or whitespace mode. Space ust be in [] to be considered

  ## Quantifiers ##
# * -> Zero or more times
  # \\s* -> matches sequence of one or more white space characters
# + -> One or more times
  # \\S+ -> matches sequence of one or more characters
# ? -> Once or none
# {3} -> Exactly 3 times
# {3, } -> 3 or more times
# {2,4} -> 2 to 4 times

  ## Character Class ##
# [ . ] -> One of the characters in the brackets. ex. [AEIOU] -> One uppercase vowel
        # ex. T[ao]p -> Tap or Top
# - -> range indicator ex. [a-z] -> One lowercase letter
        # ex. [e-t] -> 	One of the characters in the range from e to t
# [^x] -> One character that is not x
# [^x-y] -> One of the characters not in the range from x to y
# [\d\D] -> One character that is a digit or a non-digit
# [\x41] ->	Matches the character at hexadecimal position 41 in the ASCII table, i.e. A

factor(x) # Turn a vector into a factor. can lever the levels and the order
cut(x, breaks = 4) # Turn a numeric vector into a factor by 'cutting' into sections



#### Base R: Vectors | Lists | Matrices----

x <- c("This","is","bananas") # character vector
x <- 1:7 # Integer sequence. Can be an inverted sequence i.e. 7:1
x <- seq(1,5,0.5) # Complex sequence -- seq(begin,end,steps)
x <- rep(3:5,times=2) # Repeat a sequence n times -- rep(begin,end,times)
x <- rep(3:5,each=2) # Repeat elements of a vector

# Vector Elements

# Get elements by index.
x[3] # Get third element. Vector elements start in 1
x[c(1,3)] # Get elements nº1 and nº3
x[-3] # Get all elements except nº3
x[1:3] # Get elements 1 to 3
x[-(1:3)] # Get all elements except 1:3

# Get by value
x[x == 3] # Get elements which are equal to 2
x[x < 4] # Get elements where x is '<' less than | '>' greater than | '<=' less or equal than | '>=' equal or greater than
x[x %in% c(3,4)] # Get elements that are in the set

# Get by name
x['banana'] # Get elements with the given name


# Vector Functions

sort(x) # Returns x sorted. Predefined as ascending
rev(x) # Returns x reversed
table(x) # Shows the counts of each value in the vector
unique(x) # Shows unique values in the vector


# Lists - R-object which can contain many different types of elements inside it like vectors,
#functions and even another list inside it

x <- list(c(2,5,3),21.3,sin,"banana")
length(x) # Nr elements in a list

x[[2]] # Get second element of the list
x[2] # Get new list with second element
x$abc # Get element with the name "abc"
x['abc']# New list with only elements named "abc"


# Matrices - All columns in a matrix must have the same mode(numeric, character, etc.) and the same length

x <- matrix(1:20, nrow = 4, ncol = 4)
length(x) # Nr elements in a matrice

x[3,] # Select a row: matrix[row,column]
x[,3] # Select a column
x[2,3] # Select an element
t(x) # Transpose a matrix
x * x # Element-wise multiplication
x %*% x # Matrix multiplication. Square matrix needed
x %o% x  # Outer product
    x[1,] %o% x[,3] # Can be made with vectors
diag(x) # Vector with diagonal
rowSums(x) # Vector with sum of rows
colSums(x) # Vector with sum of columns
rowMeans(x) # Vector with average of row values
colMeans(x) # vector with average of column values


# Array - Arrays are similar to matrices but can have more than two dimensions

a <- c(1,2,3,4) # numeric vector
b <- c("red", "white", "red", NA) # character vector
c <- c(TRUE,TRUE,TRUE,FALSE) # logic vector

# Create a data frame
d <- data.frame(a,b,c) # data frame (array) composed of three vectors

d$a # choose column by name

cbind(a,x) # Combine matrices/arrays horizontally. Attach x after a
# WARNING: If one has column names (a) and the other doesn't (x), first row of x will be the column names

rbind(a,x) # Combine matrices/arrays vertically. Attach x after a
# Nr of columns must be the same

head(a) # See up to the 10 first rows of a
tail(a) # See last 10 rows of a
str(a) # Display structure of array, including variable types
View(a) # Display the full data frame
# Get dimensions of an object
dim(iris) # nr of rows and nr of columns
names(iris) # Get names of columns

subset(iris, Sepal.Length > 5, select = c(Sepal.Length, Sepal.Width))
# Get a subset of the data based on a condition
# select is used to select the columns we want to see

#### Base R: Functions and Logic

# for loop
for (variable in sequence){
  "Do something "
}

# example:
for (i in 1:4){
  j <- i + 10 
  print(j) 
}

  
# while loop
while (condition){
  "Do something" 
}

# example: While data frame isn't empty remove first line of df
while(!empty(df)){
  df=as.data.frame(df[-1,])
}


# if statement. else if and else isn't obligatory
if (condition){
  "Do something "
} else if (condition) {
  "Do something different "
} else {
  " Do smonething else"
}

# example:
if (i > 3){ 
  print("Yes") 
} else { 
  print("No") 
}


# Create functions
square <- function(x){ 
squared <- x*x 
return(squared) 
}

# another example:
min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

# another example:
normalize <- function(x,min,max,df){
  m=((max-min))
  min=min(df$price)
  max=max(df$price)
  y=m*x+min
  return (y)
}


#### Conditions

a == b # Are Equal
a != b # Not equal
a > b # Greater than
a < b # Lesser than
a >= b # Greater than or equal to
a <= b # Lesser than or equal to
is.na(a) # Is missing value
is.null(a) # Is NULL value




#### Base R: Math Functions and Statistics----

log(x) # Natural log
sum(x) # Sum
exp(x) # Exponential
mean(x) # Mean
max(x) # Largest element
median(x) # Median
min(x) # Smallest element
quantile(x) # Percentage quantiles (same as fivenum() function)
summary(x) # Summaries of results, given for each column, if using a data frame
range(x) # Gives minumim and maximum of all given arguments
IQR(x) # Interquantile Range
round(x, n) # Round to n decimal places
rank(x) # Rank of elements
signif(x, n) # Round to n significant figures
var(x) # The variance
cor(x, y) # Correlation
sd(x) # The standard deviation

lm(y ~ x, data=df) # Linear model

glm(y ~ x, data=df) # Generalised linear model

summary(iris) # Get mode information on the model

t.test(x, y) # Perform a t-test for difference between means

pairwise.t.test(x, g, p.adjust.method) # Perform a t-test for paired data

prop.test(x, n, p) # Test for a difference between proportions

aov("formula specifying the model","data") # Analysis of variance

  #### Distributions
  ## NORMAL
rnorm() # Random variaties
dnorm() # Density function
pnorm() # Cumulative distribution
qnorm() # Quantile
  ## Poisson
rpois() # Random variaties
dpois() # Density function
ppois() # Cumulative distribution
qpois() # Quantile
  ## Binomial
rbinom() # Random variaties
dbinom() # Density function
pbinom() # Cumulative distribution
qbinom() # Quantile
  ## Uniform
runif() # Random variaties
dunif() # Density function
punif() # Cumulative distribution
qunif() # Quantile

# Random number between 0 and 1. 5 Obervations
runif(5)
# Random number between 4 and 7. 2 Obervations
runif(2,min = 4, max = 7)



#### Base R: Other ----

# Prompt information from user and assign o variable

my.name <- readline(prompt="Enter name: ")
my.age <- readline(prompt="Enter age: ")
# convert character into integer
my.age <- as.integer(my.age)
print(paste("Hi,", my.name, "next year you will be", my.age+1, "years old."))

# Multiple prompts in a single line
{name <- readline(prompt="Enter your name: ");age <- readline(prompt="Enter your age: ");
  paste("Hey ",name,", are you ",age," years old?",sep="")}

# Example uses "menu" from package utils
# Create an interactive menu
# Switch evaluates an expression and chooses arguments accordingly switch(EXPR, 1st_Arg, 2nd_Arg, 3rd_Arg,...)
switch(menu(c("Yes","No")) + 1,
       cat("Ok, don't answer"),"Good, I was right!","Oh, I was wrong!")

# Using switch in a function
x <- rnorm(10)
center <- function(x) {
  switch((menu(c("mean","median","trimmed"), title = "Which Operation?")),
         mean = mean(x),
         median = median(x),
         trimmed = mean(x, trim = .1))
}
center(x)


# Get first 5 rows of each subset
subset(iris, Species == "setosa")[1:5,]

# Get column "Species" and "Sepal.Length for all lines where Petal.Length < 2
subset(iris, Petal.Length < 2)[,c("Species","Sepal.Length")]

# Simple plot of Petal.Length of iris data set
hist(iris$Petal.Length)
hist(iris$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))

# Separate viewport to fit 3 histograms
par(mfrow=c(1,3))
hist(subset(iris, Species == "setosa")$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))
hist(subset(iris, Species == "versicolor")$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))
hist(subset(iris, Species == "virginica")$Petal.Length,breaks=seq(0,8,l=17),xlim=c(0,8),ylim=c(0,40))

# Create box plot
boxplot(iris$Sepal.Width)
# In a boxplot, the box represents the middle 50% of the observation
# Lowerend at 25%, of Q3 (quartile 1) and Upperend at 75%, or Q3
# Line in the middle represents the median
# whisker extends to the value that is not an outlier (lower and upper)
# Lower wisker is given by subtracting 1.5xIQR to Q1
# Upper wisker is given by adding 1.5xIQR to Q3

# Simple plot with base R
plot(iris$Sepal.Length,
     col='steelblue',
     main='Histogram',
     xlab='Length',
     ylab='Frequency')

# change name of column by column index
colnames(iris)[1] <- "hahaha"



###        ###
### dplyr  ###----
###        ###

# In dplyr each variable is in its own column and each observation/case in its own row
# "%>%" symbol is called pipes: x %>% f(y) becomes f(x, y)

library(dplyr)

# Create new data frame with the summary of the statistics. Can be grouped by variables
summarise(mtcars, avg = mean(cyl)) # mean of mpg
mtcars %>% summarise(avg = mean(cyl)) # Gives the same result has before
# Using the "group_by" the summary can be grouped by a variable, in this case, cyl
mtcars %>% group_by(cyl) %>% summarise(average_mpg = mean(mpg))
# Extract rows that meet logical criteria
  # dplyr
starwars %>% filter(hair_color == "blond", skin_color == "fair") 
  # R
starwars[starwars$hair_color == "blond" & starwars$skin_color == "fair", ]
# Reorder rows
starwars %>% arrange(height, mass)
starwars %>% arrange(desc(height), mass) # desc() to invert order
# Add rows
starwars %>% add_row(starwars[5,])
# Remove rows with duplicate values
starwars %>% distinct(hair_color, .keep_all = TRUE)
# Get rows by index location
starwars %>% slice(5:10)
starwars %>% slice_head(n = 4) # First n rows
starwars %>% slice_tail(n = 4) # Last n rows
starwars %>% slice_sample(n = 4) # Randomly select n rows
starwars %>% slice_sample(prop = 0.2) # Randomly select proportion of rows
starwars %>% slice_max(height) # Selects rows with max (or min) values of a variable
# Extract column values has a vector
starwars %>% pull(height)
# Extracts column as a tabble
starwars %>% select(height)
starwars %>% select(hair_color:eye_color)
starwars %>% select(ends_with("color"))
# Rename variables, dropping all other variables not mentioned
starwars %>% select(home_world = homeworld)
# Rename variables, keeping others
starwars %>% rename(home_world = homeworld)
# Add new column
starwars %>% mutate(BMI = mass / ((height/100)^2)) %>% # Add new column
  select(BMI, mass, height, everything()) # Reorder columns
# transmute - adds new variables and drops existing ones
starwars %>% transmute(BMI = mass / ((height/100)^2))

# lead offsets values by 1 | lag offsets values by -1
x <- slice_sample(tibble(year = 2000:2005, value = (0:5) ^ 2), prop = 1)
mutate(x, previous_year_value = lag(value, order_by = year)) %>% arrange(year)
mutate(x, next_year_value = lead(value, order_by = year)) %>% arrange(year)

# Commulative aggregates
x <- c(3,5,9,2,2,1,6)
cumsum(x)
cummean(x)
cumprod(x)
cummax(x)
cummin(x)
starwars %>% filter(cumany(height > 250)) # All rows after first height value greater than 250
starwars %>% filter(cumall(height <= 250)) # All rows up to first height value greater than 250

# change column order
starwars %>% relocate(sex:homeworld, .before = height)

# change specific values
starwars %>% mutate(hair_color = case_when(
  hair_color == "blond" ~ "blondy", 
  hair_color == "brown" ~ "browny", 
  TRUE ~ hair_color))

# Cascade of operations with pipes (%>%)
# This way, you don't need to save every step of the calculations, getting the last result directly
starwars %>%
  group_by(species, sex) %>%
  select(height, mass) %>%
  summarise(
    height = mean(height, na.rm = TRUE),
    mass = mean(mass, na.rm = TRUE)
  )

starwars %>% select(where(is.numeric)) %>% # Select only numeric columns
  na.omit() %>% # Remove rows that have NA values
  mutate_all(mean)

zScore <- function(x){(x - mean(x)) / sd(x)}
mtcars %>% mutate_at(c("mpg","cyl"),zScore)

rownames_to_column(mtcars)

# Other functions

intersect(1:6,4:8) # Rows that appear in both df
setdiff(1:6,4:8) # Rows that appear in first df but not on the second
union(1:6,4:8) # rows that appear in both df
setequal(1:6,4:8) # Check if both df contain the exact same rows
setequal(mtcars,mtcars)
bind_rows(iris,mtcars) # Returns tables one on top of the other as a single table, by column name
x <- data.frame(a=c(1,2,3),b=c("banana","apple","orange"))
y <- data.frame(a=c(4,2,3),b=c("split","struddle","juice"))
inner_join(x,y,by="a") # Returns all rows of x where there are matches in y
left_join(x,y,by="a") # Returns all rows of x and all columns from x and y. Where there is no match on y, get NA
right_join(x,y,by="a") # Returns all rows of y and all columns from x and y. Where there is no match on x, get NA
full_join(x,y,by="a")
first(x) # Get first column of df
last(x) # Get last column of df
nth(x,2) # Get column n of df
z <- data.frame(a=c(2,3,2,5,6,2,5,9,10),b=c("split","struddle","juice","split","struddle","juice","split","struddle","juice"))
n_distinct(z$a) # get number of unique values



###        ###
### ggplot2 ###----
###        ###

library(ggplot2)

# You need a 1: Data Frame | 2: Coordinate System | 3: Geoms (visual marks that represent data points)

#1

ggplot(data = iris, mapping = aes(x=Sepal.Length , y=Sepal.Width, color = Species))+
  geom_point()

ggplot(data = iris) +
  geom_point(mapping = aes(x=Sepal.Length , y=Sepal.Width, color = Species))

#2

shapes <- data.frame(
  figure = c(0:24),
  x = (0:24 %% 5),
  y = -(0:24 %/% 5))

ggplot(shapes, aes(x, y)) + 
  geom_point(aes(shape = figure), size = 5, fill = "blue") +
  geom_text(aes(label = figure), hjust = 0.5, nudge_x = 0.3) +
  scale_shape_identity() +
  expand_limits(x = 4.1) +
  theme_void()

#3

ggplot(data = iris, mapping = aes(x=Sepal.Length , y=Sepal.Width, color = Species)) + 
  geom_point()+
  geom_density2d()+
  scale_color_manual(values = c("#E7B800", "#FC4E07","#00AFBB"))+
  labs(title="Iris", x="Represents the Sepal Length",y="Represents the Sepal Width")+
  facet_wrap(~Species)

ggplot(data = iris, mapping = aes(x=Sepal.Length , y=Sepal.Width)) + 
  geom_point(mapping = aes(color = Species))+
  geom_density2d()+
  scale_color_manual(values = c("#E7B800", "#FC4E07","#00AFBB"))+
  labs(title="Iris", x="Represents the Sepal Length",y="Represents the Sepal Width")+
  facet_wrap(~Species)

#4

ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  geom_smooth(mapping = aes(group = Species, linetype = Species), se = FALSE) +
  geom_point(mapping = aes(shape = Species, color = Species), size = 3) +
  scale_shape_manual(values = c(8, 18, 15)) +
  scale_linetype_manual(values = c(1,2,3)) +
  scale_color_viridis_d() +
  theme_minimal() + 
  theme(legend.position = "top")

ggplot(iris, aes(Sepal.Length, Sepal.Width)) +
  stat_smooth(aes(group = Species), method="lm",fullrange=TRUE) +
  geom_point(mapping = aes(shape = Species, color = Species), size = 3) +
  scale_shape_manual(values = c(8, 18, 15)) +
  scale_linetype_manual(values = c(1,2,3)) +
  scale_color_viridis_d() +
  theme_minimal() + 
  theme(legend.position = "top", title = "top")

#5

ggplot(data = diamonds, mapping = aes(x = cut, fill = color))+
  geom_bar(alpha = 1/2, position = "dodge")+
  scale_fill_brewer(palette="Reds")


#6

percentData <- diamonds %>% group_by(color) %>% count(cut) %>%
  mutate(ratio=scales::percent(n/sum(n)))

ggplot(data = diamonds, mapping = aes(x = color, fill = cut))+
  geom_bar(position = "fill")+
  geom_text(data=percentData, aes(y=n,label=ratio), position=position_fill(vjust=0.5))+
  scale_fill_brewer(palette="Blues")+
  coord_flip()

#7

ggplot(iris,mapping = aes(x = Sepal.Length)) +
  geom_histogram(aes(fill = Species), color="#e9ecef", alpha=0.6, position = 'identity', binwidth=0.1)+
  geom_density(aes(color = Species), size = 1.5)+
  scale_fill_manual(values = c("darkred", "steelblue", "darkgreen"))+
  scale_color_manual(values = c("darkred", "steelblue", "darkgreen"))+
  scale_x_continuous(breaks=seq(4,8,0.5))


#8

df <- data.frame(heigth=rep(c("Very Low", "Low", "Medium", "High", "Very High")), 
                 number=c(3,5,4,7,9)) 

ggplot(df, aes(x = "", y = number, fill = heigth)) + 
  geom_bar(width = 1, stat="identity") + coord_polar("y", start=pi / 3) + 
  ggtitle("Pie Chart") +
  labs(x="",y="")+
  scale_fill_viridis_d()

ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, fill = Species)) + 
  geom_bar(width = 0.1, stat="identity") + 
  coord_polar("y", start=pi / 2) + 
  ggtitle("Pie Chart")

ggplot(df, aes(x = heigth, y = number, fill = heigth)) + 
  geom_bar(width = 1, stat="identity") + coord_polar("y", start=pi / 3) + 
  ggtitle("Pie Chart")

ggplot(mtcars, aes(x = factor(1), fill = factor(cyl))) + 
  geom_bar(width = 1) + 
  coord_polar(theta = "y")

ggplot(Orange, aes(x = age, y = factor(circumference), fill = factor(Tree)))+
  geom_bar(width = 0.9, stat="identity", position = "fill") + coord_polar(theta = "y")

ggplot(Orange, aes(x = circumference, y = age, fill = Tree))+
  geom_bar(stat="identity", position = "fill") +
  coord_polar(theta="y")




###           ###
### RSelenium ###----
###           ###

library(RSelenium)

# Make a firefox profile.
fprof <- makeFirefoxProfile(list(browser.download.dir = "/home/manuelfelix/Downloads",
                                 browser.download.folderList = 2L,
                                 browser.download.manager.showWhenStarting = FALSE,
                                 browser.helperApps.neverAsk.openFile = "text/csv;charset=UTF-8",
                                 browser.helperApps.neverAsk.saveToDisk = "text/csv;charset=UTF-8"))

# Start a selenium server and browser
# You may choose the port and extra capabilities (like the browser profile)
# Other browsers may be used. I'm using firefox, which needs geckodriver to run
rd <- rsDriver(browser = "firefox",port=4566L,extraCapabilities = fprof)
# Close the Browser
rd$client$close()
# assign client to a variable
myBrowser <- rd$client
# Open Browser
myBrowser$open()
# Navigate
myBrowser$navigate("https://www.cp.pt/passageiros/pt")
# Get page source
myBrowser$getPageSource()
# Find element in page
myBrowser$findElement(using = 'css selector', "#username")
# Input values
myBrowser$sendKeysToElement(list("myuser", key = "tab"))
myBrowser$findElement(using = 'css selector', "#password")
myBrowser$sendKeysToElement(list("mypass", key = "enter"))
# click elements
myBrowser$findElement(using = 'css selector', "div.col-md-10:nth-child(1) > div:nth-child(1) > div:nth-child(1) > input:nth-child(2)")
myBrowser$clickElement()
# Get URL of current page
myBrowser$getCurrentUrl()
# Refresh page
myBrowser$refresh()





###         ###
### Slacker ###----
###         ###

library(slackr)

slackr_setup(username = "slackr",
             incoming_webhook_url = "https://hooks.slack.com/services/your_hook",
             token = "your_Token")

slackr_msg("The algorythm is starting",channel = "#your_channel")
# Send emojis
slackr_msg(":warning:,:octagonal_sign:", channel = "#your_channel")





###          ###
### Discordr ###----
###          ###

library(discordr)

# connect to webhook
conn_discord <- create_discord_connection(webhook = 'https://discord.com/api/webhooks/yourWebHook', username = 'Username', set_default = TRUE)

# Send file to webhook
discordr::send_webhook_message(myMessage, conn = conn_discord)

# Send message to webhook
discordr::send_webhook_file("/home/manuelfelix/Downloads/myPlot.png",conn = conn_discord)





###        ###
### RTweet ###----
###        ###

library(rtweet)

# You need to create a twitter api app to get the tokens

# Define token
tw_token <-
  rtweet::create_token(
    app = "AppName",
    consumer_key = "asdf",
    consumer_secret = "asdf",
    access_token = "asdf-asdf",
    access_secret = "asdf"
  )

# Get timeline from twitter
get_timeline(user="User_to_get_info",token=tw_token)

# Post a tweet
post_tweet(status=textOfMyTweet,
           media="/home/manuelfelix/Downloads/myPlot.png",
           token=tw_token)




###       ###
### rvest ###----
###       ###

library(rvest)

# Get website html
dune <- read_html("https://www.imdb.com/title/tt1160419/fullcredits/?ref_=tt_ql_cl")
# Get text from tag h1
dune %>% html_elements("h1") %>% html_text2()

dune %>% html_elements(css=".cast_list") %>% html_text2()

dune %>% html_elements(css=".cast_list") %>% html_table()

# More information on the "CP_website_info.R" file on my github





###           ###
### htmltools ###----
###           ###

library(htmltools)

# Create html tags
div("Hello World")
h1("This is a title")
tags$nav("This is the navigation")

# Remove the need for "tags$"
example <- withTags(
  nav(h1("Title of Example"), div("This is just a simple example"), ul(li("First"), li("Second")))
)
# Create Gather tags together
tag_list_1 <- tagList(
  p("Some text"),
  div("Content")
)
# Add new tags
customTag <- tag(
  "test", 
  list(class = "test", p("Custom Tag"))
)
# Save html
save_html(example,"example.html")




###       ###
### shiny ###----
###       ###

# To be added. See other codes in my github that use shiny for some examples



###         ###
### leaflet ###----
###         ###

# To be added. See other codes in my github that use shiny for some examples



