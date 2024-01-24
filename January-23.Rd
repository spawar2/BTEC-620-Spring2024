# Author: Pawar, Date: 01/23/2024, Purpose: Perform microarray analysis

# Set the working directory
setwd("/Users/pawar/Desktop/data")

# Load library Affy
library(affy)

# Read the .CEL data files
data <- ReadAffy()

# Visualize data
boxplot(data)