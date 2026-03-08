########################################
# Breast Cancer Data Mining Assignment
# Author: Your Name
# Date: YYYY-MM-DD
# Description: Data Exploration, k-NN Model Building,
#              Prediction, and Evaluation
########################################

# ------------------------------
# Step 0: Load Required Packages
# ------------------------------
install.packages("kknn")
install.packages("caret")
library(kknn)
library(caret)

# ------------------------------
# Step 1: Load the Dataset
# ------------------------------
# Set working directory to where you saved wdbc.data
data <- read.csv("wdbc.data", header = FALSE)

# Assign column names
colnames(data) <- c(
  "ID", "Diagnosis",
  "Radius_mean", "Texture_mean", "Perimeter_mean", "Area_mean", "Smoothness_mean",
  "Compactness_mean", "Concavity_mean", "ConcavePoints_mean", "Symmetry_mean", "FractalDimension_mean",
  "Radius_SE", "Texture_SE", "Perimeter_SE", "Area_SE", "Smoothness_SE",
  "Compactness_SE", "Concavity_SE", "ConcavePoints_SE", "Symmetry_SE", "FractalDimension_SE",
  "Radius_worst", "Texture_worst", "Perimeter_worst", "Area_worst", "Smoothness_worst",
  "Compactness_worst", "Concavity_worst", "ConcavePoints_worst", "Symmetry_worst", "FractalDimension_worst"
)

# ------------------------------
# Step 2: Explore Data
# ------------------------------
head(data)
str(data)
summary(data)
sum(is.na(data))  # Check for missing values

# Distribution of diagnosis
table(data$Diagnosis)

# ------------------------------
# Step 3: Data Visualization
# ------------------------------
# Bar plot of diagnosis
barplot(table(data$Diagnosis),
        main = "Diagnosis Distribution",
        col = c("lightblue", "salmon"),
        ylab = "Number of Cases")

# Scatter plot example: Radius_mean vs Texture_mean
plot(data$Radius_mean, data$Texture_mean,
     col = ifelse(data$Diagnosis == "M", "red", "green"),
     pch = 19,
     xlab = "Radius Mean",
     ylab = "Texture Mean",
     main = "Radius vs Texture by Diagnosis")
legend("topright", legend = c("Benign", "Malignant"), col = c("green","red"), pch=19)

# ------------------------------
# Step 4: Prepare Data for Modeling
# ------------------------------
# Convert Diagnosis to factor
data$Diagnosis <- as.factor(data$Diagnosis)

# Remove ID column
data$ID <- NULL

# ------------------------------
# Step 5: Train-Test Split
# ------------------------------
set.seed(123)
trainIndex <- createDataPartition(data$Diagnosis, p = 0.7, list = FALSE)
train <- data[trainIndex, ]
test <- data[-trainIndex, ]

cat("Training set size:", nrow(train), "\n")
cat("Testing set size:", nrow(test), "\n")

# ------------------------------
# Step 6: Train k-NN Model
# ------------------------------
# Using kknn package, choose k = 5
knn_model <- kknn(Diagnosis ~ ., train, test, k = 5, kernel = "rectangular")
summary(knn_model)

# ------------------------------
# Step 7: Make Predictions
# ------------------------------
pred <- fitted(knn_model)
head(pred, 10)  # Show first 10 predictions

# ------------------------------
# Step 8: Evaluate Model
# ------------------------------
conf_matrix <- table(Actual = test$Diagnosis, Predicted = pred)
print(conf_matrix)

# Performance Metrics
TP <- conf_matrix["M","M"]
TN <- conf_matrix["B","B"]
FP <- conf_matrix["B","M"]
FN <- conf_matrix["M","B"]

accuracy <- (TP + TN) / sum(conf_matrix)
precision <- TP / (TP + FP)
recall <- TP / (TP + FN)
f1_score <- 2 * (precision * recall) / (precision + recall)

cat("Accuracy:", round(accuracy, 4), "\n")
cat("Precision:", round(precision, 4), "\n")
cat("Recall:", round(recall, 4), "\n")
cat("F1-Score:", round(f1_score, 4), "\n")

