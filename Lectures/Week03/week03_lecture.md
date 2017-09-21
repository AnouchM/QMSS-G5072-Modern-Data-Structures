# Week 3 - Tidyverse
Thomas Brambor  
September 20, 2017  






## Roadmap

- Some admin stuff
- Tips and Tricks
- Introduction to the Tidyverse
    - Data transformation with `dplyr`
    - Reshaping of data frames with `tidyr`

# Administrative

## Class Repository turning private

<img src="images/secret.jpeg" width="80%" />

## Class Repository turning private

<img src="images/members_only.jpg" width="80%" />

## Homework 1

- Grades will be submitted via coursework's gradebook.
- Comments from TAs will be given via GitHub.
- Late submissions get docked for each day late.

## Online Discussion Forum

- Please minimize emails! Use the discussion forum on coursework.  
- **discussion** tab vs. integrated **piazza** tab. Preferences?  
- Post a minimally reproducible example (see below).

<img src="images/coursework_discussions.png" width="100%" />

## Github 

- Questions? Comments?
- [Github Tables](https://help.github.com/articles/organizing-information-with-tables/) (also see below)

        | Command | Description |
        | --- | --- |
        | git status | List all new or modified files |
        | git diff | Show file differences that haven't been staged |
        
| Command | Description |
| --- | --- |
| git status | List all new or modified files |
| git diff | Show file differences that haven't been staged |

# Tips and Tricks

## Make RMarkdown (even) easier

[`remedy`](https://github.com/ThinkR-open/remedy) provides addins to facilitate writing in markdown with RStudio.

<img src="images/remedy_example.gif" width="100%" />

## Ugh, making a table

<img src="images/remedy_table.gif" width="100%" />

## Citations in RMarkdown

Use BibTeX? Search and insert references with just a few keystrokes with the [citr](https://github.com/crsh/citr) add-in. 

<img src="images/citr_demo.gif" width="90%" />

## Git in RStudio

RStudio can directly interact with Git (and GitHub) to [version control your projects](http://jnmaloof.github.io/BIS180L_web/2017/04/20/1-Git-in-R/).

<img src="images/rstudio_git.png" width="90%" />

# Introduction to the Tidyverse

## Resources for the Tidyverse

- **Website**: tidyverse.org  
- **Package**: Install the complete tidyverse with:
`install.packages("tidyverse")`  
- **Book**: Wickham, H., & Grolemund, G. (2017). [R for Data Science: Import, Tidy, Transform, Visualize, and Model Data](http://r4ds.had.co.nz) (1st ed.). O’Reilly Media.
- **Additional Resources to Learn**:
    - RStudio Webinars on [Data Wrangling](https://www.rstudio.com/resources/webinars/data-wrangling-with-r-and-rstudio/), the [tidyverse](https://www.rstudio.com/resources/videos/data-science-in-the-tidyverse/) etc.
    - [Data Wranglin Cheat Sheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)

## I am stuck

<img src="images/cat_help.jpg" width="40%" />

- [stackoverflow.com](https://stackoverflow.com/questions/tagged/r). Please make sure to [tag your question](https://stackoverflow.com/help/tagging) with R and tidyverse so that the right people are more likely to see it.
- [RStudio Community Forum on Tidyverse](https://community.rstudio.com/c/tidyverse)

## I need help... from the TA

If you ask for help from a TA, it is easiest if they can reproduce the error you see.

Make a **repr**educible **ex**ample 

The [package `reprex`](http://reprex.tidyverse.org) helps to do that.

## ReprEx

<img src="images/reprex.png" width="100%" />

## ReprEx {.build}

Here is the code in questions. Error message appears after third line.

```r
y <- c(1,2,5,6,8)  
mean(y)  
summ(y)  
```

And here is the reproducible example:

``` r
y <- c(1,2,5,6,8)  
mean(y)  
#> [1] 4.4
summ(y) 
#> Error in summ(y): could not find function "summ"
```

# The `%>%` operator

<img src="images/magrittr.png" width="50%" />

## The `%>%` operator

- Not required but extremely convenient. Makes code more readable.
- http://magrittr.tidyverse.org/

```{}
filter(data, variable == numeric_value)
```

or

```{}
data %>% filter(variable == numeric_value)
```

## The `%>%` operator {.smaller .build}

```
arrange(
    summarize(
            filter(data, variable == "numeric_value"),
            Total = sum(variable)
     ),
    desc(Total)
)
```
```
a <- filter(data, variable == "numeric_value")
b <- summarise(a, Total = sum(variable))
c <- arrange(b, desc(Total))
```
```
data %>%
        filter(variable == "value") %>%
        summarise(Total = sum(variable)) %>%
        arrange(desc(Total))
```

Same results but the %>% operator is more efficient and legible.

# Tidyverse

## Tidyverse {.columns-2}

**Core Packages**

- `ggplot2` (graphics)
- `tibble` (data frames and tables)
- `tidyr` (make tidy)
- `readr` (read in tabular formats)
- `purrr` (functional programming)
- `dplyr` (manipulate data)

<img src="./images/tidy-logos.png" style="height: auto; width: 100%">

## How do we get it?

To get all the tidyverse packages, you can install it with a single command:


```r
install.packages(tidyverse)
```

## Overall Workflow

![Data science exploration general workflow](./images/data-science.png)

Let's try to follow the workflow by reading in some excel data, cleaning it, and preparing for visualization. 



```r
library(tidyverse) # Import tidyverse
```

# Data processing with `dplyr`

 - a package that transforms data

## Read in Data

![Import and wrangle data](./images/data-science-wrangle.png)

## Sample Dataset A

![Dataset A](./images/datasetA.png)

## Sample Dataset B

![Dataset B](./images/datasetB.png)

## Let's Read in the Data {.smaller}


```r
# Using the readxl package to read in Excel files
library(readxl)
rawData <- read_excel(path = "data/data_example1.xlsx", # Path to file
                    sheet = 2, # We want the second sheet
                    skip = 1, # Skip the first row
                    na = "NA") # Missing characters are "NA"
```

## Take a Look at the Data {.smaller}


```r
head(rawData) # Tibble shows small bit of the data
```

```
## # A tibble: 6 x 9
##    subject   age gender treatment startWeight endWeight timeElapsed
##      <chr> <dbl>  <chr>     <chr>       <dbl>     <dbl>       <dbl>
## 1 TPID1258    75 Female Treatment        76.7        NA          71
## 2 TPID1032    73   Male   Control        99.4      99.9          30
## 3 TPID0594    66   Male Treatment        51.0      84.2          75
## 4 TPID1788    64 Female Treatment        91.7      95.7          52
## 5 TPID0957    78   Male Treatment        51.0      64.4          37
## 6 TPID1695    73 Female   Control        98.5      95.5          37
## # ... with 2 more variables: staffID1 <chr>, staffID2 <chr>
```

## Another Way to Look at Data {.smaller}


```r
rawData
```

```
## # A tibble: 72 x 9
##     subject   age gender treatment startWeight endWeight timeElapsed
##       <chr> <dbl>  <chr>     <chr>       <dbl>     <dbl>       <dbl>
##  1 TPID1258    75 Female Treatment        76.7        NA          71
##  2 TPID1032    73   Male   Control        99.4      99.9          30
##  3 TPID0594    66   Male Treatment        51.0      84.2          75
##  4 TPID1788    64 Female Treatment        91.7      95.7          52
##  5 TPID0957    78   Male Treatment        51.0      64.4          37
##  6 TPID1695    73 Female   Control        98.5      95.5          37
##  7 TPID1673    72   Male   Control       118.0     115.0          32
##  8 TPID0410    77   Male Treatment        91.7      77.4          69
##  9 TPID0065    88 Female   Control        83.1      85.0          45
## 10 TPID1918    76   Male Treatment        82.7      71.5          67
## # ... with 62 more rows, and 2 more variables: staffID1 <chr>,
## #   staffID2 <chr>
```

## The Tidyverse is all about verbs and pipes

Let's look at a typical tidyverse operation. 


```r
cleanData <- rawData %>%
  filter(gender == "Male") %>%
  mutate(diffWeight = startWeight - endWeight,
         weightChangePerDay = diffWeight / timeElapsed)
```

We'll take this apart bit by bit.

## Take a Look at the transformed data {.smaller}


```r
# We filtered for "Males" and "mutated" some data
cleanData
```

```
## # A tibble: 42 x 11
##     subject   age gender treatment startWeight endWeight timeElapsed
##       <chr> <dbl>  <chr>     <chr>       <dbl>     <dbl>       <dbl>
##  1 TPID1032    73   Male   Control        99.4      99.9          30
##  2 TPID0594    66   Male Treatment        51.0      84.2          75
##  3 TPID0957    78   Male Treatment        51.0      64.4          37
##  4 TPID1673    72   Male   Control       118.0     115.0          32
##  5 TPID0410    77   Male Treatment        91.7      77.4          69
##  6 TPID1918    76   Male Treatment        82.7      71.5          67
##  7 TPID0390    79   Male   Control        81.2        NA          56
##  8 TPID1434    82   Male   Control        51.0      87.2          50
##  9 TPID0965    66   Male Treatment        51.0      72.5          40
## 10 TPID0531    73   Male   Control        74.2      74.7          77
## # ... with 32 more rows, and 4 more variables: staffID1 <chr>,
## #   staffID2 <chr>, diffWeight <dbl>, weightChangePerDay <dbl>
```

## Pipes let you go from start to finish


```r
# Reminder of what we did
cleanData <- rawData %>%
  filter(gender == "Male") %>%
  mutate(diffWeight = startWeight - endWeight,
         weightChangePerDay = diffWeight / timeElapsed)
```

Remember `%>%`, the pipe character?

It lets you take the output of one function and make it the input of another function.


```r
cleanData <- rawData %>%
  filter(gender == "Male")
```

When you chain multiple functions together, you are building a **pipeline**.

## Some basic verbs for manipulating data

The nice thing about the tidyverse is that most of the functions are defined as verbs that you do to data.

- `filter()` - remove rows according to a criteria
- `select()` - select columns by name
- `mutate()` - calculate new column variables by manipulating data
- `arrange()` - sort data by columns
- `summarize()` - compute summary statistics

## `dplyr::filter()` {.smaller .build}

`filter()` lets you select rows according to a criteria. You can use `|` (OR) and `&` (AND) to chain together logical statements.

<img src="images/filter.png" width="95%" />


```r
filteredData <- rawData %>%
  filter(gender == "Male")

filteredData[1:4, ] # Filtered for just "Male"
```

```
## # A tibble: 4 x 9
##    subject   age gender treatment startWeight endWeight timeElapsed
##      <chr> <dbl>  <chr>     <chr>       <dbl>     <dbl>       <dbl>
## 1 TPID1032    73   Male   Control        99.4      99.9          30
## 2 TPID0594    66   Male Treatment        51.0      84.2          75
## 3 TPID0957    78   Male Treatment        51.0      64.4          37
## 4 TPID1673    72   Male   Control       118.0     115.0          32
## # ... with 2 more variables: staffID1 <chr>, staffID2 <chr>
```

## `dplyr::filter()` 

How would we also filter the dataset for patients who had `startWeights` greater than 150?

Note that any statement or function that produces a boolean vector (such as `is.na(variablename)`) can be used here.

## `dplyr::select()` {.smaller .build}

`select()` lets you select columns in your dataset. You can also rename them by passing in the new name as an equals statement:

<img src="images/select.png" width="95%" />


```r
selectedData <- filteredData %>% 
  # Rename patientID to patient, select startWeight, endWeight, diffWeight
  select(patient = subject, startWeight, endWeight)

head(selectedData) 
```

```
## # A tibble: 6 x 3
##    patient startWeight endWeight
##      <chr>       <dbl>     <dbl>
## 1 TPID1032        99.4      99.9
## 2 TPID0594        51.0      84.2
## 3 TPID0957        51.0      64.4
## 4 TPID1673       118.0     115.0
## 5 TPID0410        91.7      77.4
## 6 TPID1918        82.7      71.5
```

## `dplyr::select()`

Rather than specifying all columns you want to select, you can also select variables based on their names.

+ `starts_with()`: starts with a prefix
+ `ends_with()`: ends with a prefix
+ `contains()`: contains a literal string
+ `matches()`: matches a regular expression
+ `num_range()`: a numerical range like x01, x02, x03.
+ `one_of()`: variables in character vector.
+ `everything()`: all variables.

## `dplyr::mutate()` {.smaller .build}

`mutate()` is a powerful command to help transform data and add it as a new column into the `data.frame`.

<img src="images/mutate.png" width="95%" />


```r
# Calculate a new variable based on other variables
mutatedData <- rawData %>%
  mutate(diffWeight = startWeight - endWeight)
mutatedData[1:4, ] %>% select(startWeight, endWeight, diffWeight)
```

```
## # A tibble: 4 x 3
##   startWeight endWeight diffWeight
##         <dbl>     <dbl>      <dbl>
## 1        76.7        NA         NA
## 2        99.4      99.9       -0.5
## 3        51.0      84.2      -33.2
## 4        91.7      95.7       -4.0
```

## `dplyr::mutate()` {.smaller .build}

Once you've defined a new column with `mutate()`, you can use it just like any other variable:


```r
# Add a column with the same value for each entry
mutatedData <- mutatedData %>% mutate(site = "Site1") %>%
  mutate(weightLossPerDay = diffWeight / timeElapsed)

head(mutatedData)
```

```
## # A tibble: 6 x 12
##    subject   age gender treatment startWeight endWeight timeElapsed
##      <chr> <dbl>  <chr>     <chr>       <dbl>     <dbl>       <dbl>
## 1 TPID1258    75 Female Treatment        76.7        NA          71
## 2 TPID1032    73   Male   Control        99.4      99.9          30
## 3 TPID0594    66   Male Treatment        51.0      84.2          75
## 4 TPID1788    64 Female Treatment        91.7      95.7          52
## 5 TPID0957    78   Male Treatment        51.0      64.4          37
## 6 TPID1695    73 Female   Control        98.5      95.5          37
## # ... with 5 more variables: staffID1 <chr>, staffID2 <chr>,
## #   diffWeight <dbl>, site <chr>, weightLossPerDay <dbl>
```

## `dplyr::mutate()` {.smaller}

`Mutate` can alse be used to modify existing variables or delete variables:


```r
rawData %>%
  mutate(subject = NULL,
  startWeight_in_pounds = startWeight * 2.20462 # convert to pounds
)
```

```
## # A tibble: 72 x 9
##      age gender treatment startWeight endWeight timeElapsed staffID1
##    <dbl>  <chr>     <chr>       <dbl>     <dbl>       <dbl>    <chr>
##  1    75 Female Treatment        76.7        NA          71       S4
##  2    73   Male   Control        99.4      99.9          30       S2
##  3    66   Male Treatment        51.0      84.2          75       S3
##  4    64 Female Treatment        91.7      95.7          52       S1
##  5    78   Male Treatment        51.0      64.4          37       S3
##  6    73 Female   Control        98.5      95.5          37       S4
##  7    72   Male   Control       118.0     115.0          32       S1
##  8    77   Male Treatment        91.7      77.4          69       S4
##  9    88 Female   Control        83.1      85.0          45       S4
## 10    76   Male Treatment        82.7      71.5          67       S4
## # ... with 62 more rows, and 2 more variables: staffID2 <chr>,
## #   startWeight_in_pounds <dbl>
```

## Chaining it all together with pipes {.smaller}


```r
cleanData <- rawData %>%
  filter(gender == "Male") %>%
  mutate(diffWeight = startWeight - endWeight,
         weightChangePerDay = diffWeight / timeElapsed)
head(cleanData)
```

```
## # A tibble: 6 x 11
##    subject   age gender treatment startWeight endWeight timeElapsed
##      <chr> <dbl>  <chr>     <chr>       <dbl>     <dbl>       <dbl>
## 1 TPID1032    73   Male   Control        99.4      99.9          30
## 2 TPID0594    66   Male Treatment        51.0      84.2          75
## 3 TPID0957    78   Male Treatment        51.0      64.4          37
## 4 TPID1673    72   Male   Control       118.0     115.0          32
## 5 TPID0410    77   Male Treatment        91.7      77.4          69
## 6 TPID1918    76   Male Treatment        82.7      71.5          67
## # ... with 4 more variables: staffID1 <chr>, staffID2 <chr>,
## #   diffWeight <dbl>, weightChangePerDay <dbl>
```

## `dplyr::summarize()`

Now, we have clean data. How can we calculate summaries such as means and standard deviations by treatment?

<img src="images/summarise.png" width="95%" />

## Summarizing Data 


```r
summarizedData <- cleanData %>% group_by(treatment) %>%
  summarize(meanLoss = mean(weightChangePerDay, na.rm = TRUE),
            sdLoss = sd(weightChangePerDay, na.rm = TRUE))

summarizedData
```

```
## # A tibble: 2 x 3
##   treatment    meanLoss    sdLoss
##       <chr>       <dbl>     <dbl>
## 1   Control -0.21382864 0.3921459
## 2 Treatment -0.09279719 0.4220616
```

In order to do this we use two functions here: `group_by()` and `summarize()`. You can think of `group_by` as separating the data out into smaller data.frames (separated by the variable), and then with `summarize`, we perform an operation on them.

## `dplyr::summarize()` - Useful functions

There are several useful functions that can be used with `summarize()`:

- Center: `mean()`, `median()`
- Spread: `sd()`, `IQR()`
- Range: `min()`, `max()`, `quantile()`
- Position: `first()`, `last()`, `nth()`
- Count: `n()`, `n_distinct()`
- Logical: `any()`, `all()`

## Sorting the data

<img src="images/arrange.png" width="120%" />

<img src="images/desc.png" width="120%" />

## Sorting the data {.smaller}


```r
cleanData %>% arrange(desc(startWeight))
```

```
## # A tibble: 42 x 11
##     subject   age gender treatment startWeight endWeight timeElapsed
##       <chr> <dbl>  <chr>     <chr>       <dbl>     <dbl>       <dbl>
##  1 TPID1673    72   Male   Control       118.0     115.0          32
##  2 TPID0706    80   Male Treatment       111.0      96.7          76
##  3 TPID0483    65   Male Treatment       104.0      98.1          32
##  4 TPID1157    83   Male Treatment       101.0      98.4          60
##  5 TPID1032    73   Male   Control        99.4      99.9          30
##  6 TPID1417    77   Male Treatment        97.7        NA          40
##  7 TPID1359    74   Male   Control        96.1      95.0          73
##  8 TPID0123    71   Male   Control        94.7      96.2          53
##  9 TPID1554    68   Male   Control        93.6      91.7          30
## 10 TPID1310    79   Male Treatment        92.9      89.8          30
## # ... with 32 more rows, and 4 more variables: staffID1 <chr>,
## #   staffID2 <chr>, diffWeight <dbl>, weightChangePerDay <dbl>
```

## Start Exploring the Data! -- Just not here :-( {.smaller}


```r
cleanData %>% ggplot(aes(x = age, y = diffWeight,
                         color = treatment)) +
    geom_point() + facet_wrap(~ staffID1)
```

<img src="images/unnamed-chunk-33-1.png" width="80%" />

# Reshaping Data with `tidyr`

  `tidyr` - a package that reshapes the layout of dataframes

## What is Tidy Data?

[According to Jeff Leek](https://leanpub.com/datastyle), tidy data has the following properties:

1. Each variable should have its own column.
2. Each observation of that variable should be in its own row
3. One table for each "kind" of variable (e.g. data on finance and health)
4. Multiple tables should have an identifier column to let you join them together.

<img src="./images/tidy-data.png" style="height: 70%; width: 80%">

## Why Tidy Data?

In short, most R packages expect tidy data in one form or another. 

Specifically: tidy data makes it easy to:

- Manipulate into different forms (reshaping/summarizing)
- Join with other tidy data
- Visualize
- Load into databases, etc.

Much of your time as an analyst is spent getting data into a form that you can analyse.

## Reshaping Data

Oftentimes, you will need to change the format of the data. This might include:

<img src="images/tidyr_basic_functions.png" width="100%" />

## Types of Data

**Problem**: Some of the column names are not names of variables, but values of a variable.


```r
table1
```

```
## # A tibble: 6 x 4
##       country  year  cases population
##         <chr> <int>  <int>      <int>
## 1 Afghanistan  1999    745   19987071
## 2 Afghanistan  2000   2666   20595360
## 3      Brazil  1999  37737  172006362
## 4      Brazil  2000  80488  174504898
## 5       China  1999 212258 1272915272
## 6       China  2000 213766 1280428583
```

## Types of Data {.smaller}

**Problem**: Information for observations are spread across several rows.


```r
table2
```

```
## # A tibble: 12 x 4
##        country  year       type      count
##          <chr> <int>      <chr>      <int>
##  1 Afghanistan  1999      cases        745
##  2 Afghanistan  1999 population   19987071
##  3 Afghanistan  2000      cases       2666
##  4 Afghanistan  2000 population   20595360
##  5      Brazil  1999      cases      37737
##  6      Brazil  1999 population  172006362
##  7      Brazil  2000      cases      80488
##  8      Brazil  2000 population  174504898
##  9       China  1999      cases     212258
## 10       China  1999 population 1272915272
## 11       China  2000      cases     213766
## 12       China  2000 population 1280428583
```

## Types of Data

**Problem**: Information for two variables (cases and population) are contained in a single column.


```r
table3
```

```
## # A tibble: 6 x 3
##       country  year              rate
## *       <chr> <int>             <chr>
## 1 Afghanistan  1999      745/19987071
## 2 Afghanistan  2000     2666/20595360
## 3      Brazil  1999   37737/172006362
## 4      Brazil  2000   80488/174504898
## 5       China  1999 212258/1272915272
## 6       China  2000 213766/1280428583
```

## Types of Data {.smaller}

**Problem**: Variables are spread across different datasets.


```r
# Spread across two tibbles
table4a  # cases
```

```
## # A tibble: 3 x 3
##       country `1999` `2000`
## *       <chr>  <int>  <int>
## 1 Afghanistan    745   2666
## 2      Brazil  37737  80488
## 3       China 212258 213766
```

```r
table4b  # population
```

```
## # A tibble: 3 x 3
##       country     `1999`     `2000`
## *       <chr>      <int>      <int>
## 1 Afghanistan   19987071   20595360
## 2      Brazil  172006362  174504898
## 3       China 1272915272 1280428583
```

# Tutorial: Reshaping Data in R

## Gather {.smaller}

<img src="images/gather.png" width="30%" />

      Function:       gather(data, key, value, ..., na.rm = FALSE, convert = FALSE)
      Same as:        data %>% gather(key, value, ..., na.rm = FALSE, convert = FALSE)
      
      Arguments:
              data:           data frame
              key:            column name representing new variable
              value:          column name representing variable values
              ...:            names of columns to gather (or not gather)
              na.rm:          option to remove observations with missing values 
                              (represented by NAs)
              convert:        if TRUE will automatically convert values to logical, 
                              integer, numeric, complex or 
                              factor as appropriate

## Gather {.smaller}

<img src="images/gather.png" width="30%" />


```r
table4a # cases
```

```
## # A tibble: 3 x 3
##       country `1999` `2000`
## *       <chr>  <int>  <int>
## 1 Afghanistan    745   2666
## 2      Brazil  37737  80488
## 3       China 212258 213766
```

- The set of _columns that represent values, not variables_. In this example, those are the columns 1999 and 2000.
- The _name of the variable whose values form the column names_. It is called the **key**, and here it is year.
- The _name of the variable whose values are spread over the cells_. They are called **value**, and here it’s the number of cases.

## Gather {.smaller}

<img src="images/gather.png" width="30%" />


```r
table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
```

```
## # A tibble: 6 x 3
##       country  year  cases
##         <chr> <chr>  <int>
## 1 Afghanistan  1999    745
## 2      Brazil  1999  37737
## 3       China  1999 212258
## 4 Afghanistan  2000   2666
## 5      Brazil  2000  80488
## 6       China  2000 213766
```

## Gather {.smaller}

<img src="images/gather.png" width="30%" />

<img src="images/gather_table4a.png" width="100%" />

## Gather {.smaller}

<img src="images/gather.png" width="30%" />

These all produce the same results:


```r
table4a %>% gather(Year, cases, `1999`:`2000`)
table4a %>% gather(Year, cases, `1999`, `2000`)
table4a %>% gather(Year, cases, 2:3)
table4a %>% gather(Year, cases, -country)
```

## Gather {.smaller}

<img src="images/gather.png" width="30%" />

We can `gather()` table4b the same way. 


```r
table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")
```

```
## # A tibble: 6 x 3
##       country  year population
##         <chr> <chr>      <int>
## 1 Afghanistan  1999   19987071
## 2      Brazil  1999  172006362
## 3       China  1999 1272915272
## 4 Afghanistan  2000   20595360
## 5      Brazil  2000  174504898
## 6       China  2000 1280428583
```

## Gather and Join {.smaller}

To combine the tidied versions of table4a and table4b into a single tibble, we need to use `dplyr::left_join()` (more on joins later).


```r
tidy4a <- table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
tidy4b <- table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")
left_join(tidy4a, tidy4b)
```

```
## # A tibble: 6 x 4
##       country  year  cases population
##         <chr> <chr>  <int>      <int>
## 1 Afghanistan  1999    745   19987071
## 2      Brazil  1999  37737  172006362
## 3       China  1999 212258 1272915272
## 4 Afghanistan  2000   2666   20595360
## 5      Brazil  2000  80488  174504898
## 6       China  2000 213766 1280428583
```

## Spread {.smaller}

<img src="images/spread.png" width="30%" />

      Function:       spread(data, key, value, fill = NA, convert = FALSE)
      Same as:        data %>% spread(key, value, fill = NA, convert = FALSE)
      
      Arguments:
              data:           data frame
              key:            column values to convert to multiple columns
              value:          single column values to convert to multiple columns' values 
              fill:           If there isn't a value for every combination of the 
                              other variables and the key column, this value will be 
                              substituted
              convert:        if TRUE will automatically convert values to logical, 
                              integer, numeric, complex or factor as appropriate
       
## Spread {.smaller}

<img src="images/spread.png" width="30%" />


```r
table2 
```

```
## # A tibble: 12 x 4
##        country  year       type      count
##          <chr> <int>      <chr>      <int>
##  1 Afghanistan  1999      cases        745
##  2 Afghanistan  1999 population   19987071
##  3 Afghanistan  2000      cases       2666
##  4 Afghanistan  2000 population   20595360
##  5      Brazil  1999      cases      37737
##  6      Brazil  1999 population  172006362
##  7      Brazil  2000      cases      80488
##  8      Brazil  2000 population  174504898
##  9       China  1999      cases     212258
## 10       China  1999 population 1272915272
## 11       China  2000      cases     213766
## 12       China  2000 population 1280428583
```

- an observation is a country in a year, but _each observation is spread across two rows_.

We only need two parameters to use `spread()`:  
- The _column that contains variable names_, the **key** column. Here, it’s type.
- The _column that contains values forms multiple variables_, the value **column**. Here it’s count.

## Spread {.smaller}

<img src="images/spread.png" width="30%" />


```r
spread(table2, key = type, value = count)
```

```
## # A tibble: 6 x 4
##       country  year  cases population
## *       <chr> <int>  <int>      <int>
## 1 Afghanistan  1999    745   19987071
## 2 Afghanistan  2000   2666   20595360
## 3      Brazil  1999  37737  172006362
## 4      Brazil  2000  80488  174504898
## 5       China  1999 212258 1272915272
## 6       China  2000 213766 1280428583
```

## Spread {.smaller}

<img src="images/spread.png" width="30%" />

<img src="images/spread_table2.png" width="100%" />

## Separate {.smaller}

<img src="images/separate.png" width="30%" />

Splits a single variable (column) into multiple variables (columns).

    Function:       separate(data, col, into, sep = " ", remove = TRUE, convert = FALSE)
    Same as:        data %>% separate(col, into, sep = " ", remove = TRUE, convert = FALSE)
    
    Arguments:
            data:           data frame
            col:            column name representing current variable
            into:           names of variables representing new variables
            sep:            how to separate current variable (char, num, or symbol)
            remove:         if TRUE, remove input column from output data frame
            convert:        if TRUE will automatically convert values to logical, 
            integer, numeric, complex or factor as appropriate

## Separate {.smaller}

<img src="images/separate.png" width="30%" />


```r
table3
```

```
## # A tibble: 6 x 3
##       country  year              rate
## *       <chr> <int>             <chr>
## 1 Afghanistan  1999      745/19987071
## 2 Afghanistan  2000     2666/20595360
## 3      Brazil  1999   37737/172006362
## 4      Brazil  2000   80488/174504898
## 5       China  1999 212258/1272915272
## 6       China  2000 213766/1280428583
```

- The `rate` column contains both `cases` and `population` variables, and we need to split it into two variables.  
- `separate()` takes the name of the column to separate, and the names of the columns to separate into

## Separate {.smaller}

<img src="images/separate.png" width="30%" />


```r
table3 %>% 
  separate(rate, into = c("cases", "population"))
```

```
## # A tibble: 6 x 4
##       country  year  cases population
## *       <chr> <int>  <chr>      <chr>
## 1 Afghanistan  1999    745   19987071
## 2 Afghanistan  2000   2666   20595360
## 3      Brazil  1999  37737  172006362
## 4      Brazil  2000  80488  174504898
## 5       China  1999 212258 1272915272
## 6       China  2000 213766 1280428583
```

## Separate {.smaller}

<img src="images/separate.png" width="30%" />

<img src="images/separate_table3.png" width="100%" />

## Separate {.smaller}

<img src="images/separate.png" width="30%" />

By default, `separate()` works on any non-alphanumeric character it finds. 

But we can also specify how to separate:


```r
table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/")
```

```
## # A tibble: 6 x 4
##       country  year  cases population
## *       <chr> <int>  <chr>      <chr>
## 1 Afghanistan  1999    745   19987071
## 2 Afghanistan  2000   2666   20595360
## 3      Brazil  1999  37737  172006362
## 4      Brazil  2000  80488  174504898
## 5       China  1999 212258 1272915272
## 6       China  2000 213766 1280428583
```

Note: This is really a regular expression, a topic we will return to later in much more detail.

## Unite {.smaller}

<img src="images/unite.png" width="30%" />

Combines multiple variables (columns) into a single variable (column). Not as commonly used, but good to know it exists.

    Function:       unite(data, col, ..., sep = " ", remove = TRUE)
    Same as:        data %>% unite(col, ..., sep = " ", remove = TRUE)
    
    Arguments:
            data:           data frame
            col:            column name of new "merged" column
            ...:            names of columns to merge
            sep:            separator to use between merged values
            remove:         if TRUE, remove input column from output data frame

## Unite {.smaller}

<img src="images/unite.png" width="30%" />


```r
table5
```

```
## # A tibble: 6 x 4
##       country century  year              rate
## *       <chr>   <chr> <chr>             <chr>
## 1 Afghanistan      19    99      745/19987071
## 2 Afghanistan      20    00     2666/20595360
## 3      Brazil      19    99   37737/172006362
## 4      Brazil      20    00   80488/174504898
## 5       China      19    99 212258/1272915272
## 6       China      20    00 213766/1280428583
```

## Unite {.smaller}

<img src="images/unite.png" width="30%" />


```r
table5 %>% 
  unite(new, century, year)
```

```
## # A tibble: 6 x 3
##       country   new              rate
## *       <chr> <chr>             <chr>
## 1 Afghanistan 19_99      745/19987071
## 2 Afghanistan 20_00     2666/20595360
## 3      Brazil 19_99   37737/172006362
## 4      Brazil 20_00   80488/174504898
## 5       China 19_99 212258/1272915272
## 6       China 20_00 213766/1280428583
```

## Additional Resources {.smaller}

This lecture merely touches on the basics that these two packages - `dplyr` and `tidyr` can do. There are several other resources you can check out to learn more. 

+ R Studio's [Data wrangling with R and RStudio webinar](http://www.rstudio.com/resources/webinars/)
+ R Studio's [Data wrangling GitHub repository](https://github.com/rstudio/webinars/blob/master/2015-01/wrangling-webinar.pdf)
+ R Studio's [Data wrangling cheat sheet](http://www.rstudio.com/resources/cheatsheets/)
+ Hadley Wickham’s dplyr tutorial at useR! 2014, [Part 1](http://www.r-bloggers.com/hadley-wickhams-dplyr-tutorial-at-user-2014-part-1/)
+ Hadley Wickham’s dplyr tutorial at useR! 2014, [Part 2](http://www.r-bloggers.com/hadley-wickhams-dplyr-tutorial-at-user-2014-part-2/)
+ Hadley Wickham's paper on [Tidy Data](http://vita.had.co.nz/papers/tidy-data.html)

## Don't forget the [cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)

<img src="images/data-wrangling-cheatsheet_p1.png" width="90%" />

## Don't forget the [cheat sheet](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf)


<img src="images/data-wrangling-cheatsheet_p2.png" width="90%" />



