#libraries required
library(readr)
library(ggplot2)
library(reshape2)
library(tidyverse)


location <- "~/Documents/GitHub/R-Assignment-CBB/wdbc.data"
data <- read.csv(location, header = FALSE, sep = ",")

# names of column
name_of_column <- c("ID", "Diagnosis", "Radius_Mean", "Texture_Mean", "Perimeter_Mean", "Area_Mean", "Smoothness_Mean", "Compactness_Mean", "Concavity_Mean", "Concave_Points_Mean", "Symmetry_Mean", "Fractal_Dimension_Mean", "Radius_SE", "Texture_SE", "Perimeter_SE", "Area_SE", "Smoothness_SE", "Compactness_SE", "Concavity_SE", "Concave_Points_SE", "Symmetry_SE", "Fractal_Dimension_SE", "Radius_Worst", "Texture_Worst", "Perimeter_Worst", "Area_Worst", "Smoothness_Worst", "Compactness_Worst", "Concavity_Worst", "Concave_Points_Worst", "Symmetry_Worst", "Fractal_Dimension_Worst")
colName(data) <- name_of_column

#converting M to 1 and B to 0
for(i in seq_along(data$Diagnosis)){
  if (data$Diagnosis[i] == 'M') {
    data$Diagnosis[i] <- 1
  } else {
    data$Diagnosis[i] <- 0
  }
}


#Linear Regression
attach(data)
model <- lm(Diagnosis ~ ., data = data[, c(3:32)])
summary(model)



