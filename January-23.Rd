# Author: Pawar, Date: 01/23/2024, Purpose: Perform microarray analysis

# Set the working directory
setwd("/Users/pawar/Desktop/data")

# Load library Affy
library(affy)

# Read the .CEL data files
data <- ReadAffy()

# Visualize data
boxplot(data)

# Perform RMA normalzation
data_norm <- rma(data)

# Extract the expression data 
data_norm_exprs <- exprs(data_norm)

# Plot the normalized dataset
boxplot(data_norm_exprs)

# Take averages for treatment and controls for fold change analysis
Control <- data_norm_exprs[,c(1:2)]
Treatment <- data_norm_exprs[,c(3:4)]

# Take average on control and treatment

Control <- rowMeans(Control)
Treatment <- rowMeans(Treatment)

# Take the fold change
Fold_change <- Treatment - Control

# Interpret these results
# >2 Up-regulated gene
# <-2 Down-regulated gene

# Export the data in CSV file
write.csv(Fold_change, "Fold_change.csv")

#################################

Fold_change <- as.data.frame(Fold_change)

Fold_change[which(Fold_change$Fold_change > 2),]

Fold_change[which(Fold_change$Fold_change < -1),]

 

