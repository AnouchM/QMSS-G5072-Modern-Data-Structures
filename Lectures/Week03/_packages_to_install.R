# Packages to install for week 3

# Load packages.
packages <- c("remedy","citr","tidyverse","reprex","addinexamples","readxl")

packages <- lapply(packages, FUN = function(x) {
  if(!require(x, character.only = TRUE)) {
    install.packages(x)
    library(x, character.only = TRUE)
  }
}
)