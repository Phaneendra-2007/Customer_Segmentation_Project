# Customer Segmentation using K-Means Clustering

library(ggplot2)

# Load Dataset
data <- read.csv("Mall_Customers.csv")

# Display Dataset
head(data)

# Select Features
customer_data <- data[, c("Annual.Income..k..", "Spending.Score..1.100.")]

# Scale Data
customer_data <- scale(customer_data)

# Apply K-Means Clustering
set.seed(123)
kmeans_result <- kmeans(customer_data, centers = 5)

# Add Cluster Labels
data$Cluster <- as.factor(kmeans_result$cluster)

# Display Cluster Centers
print(kmeans_result$centers)

# Visualization
png("cluster_plot.png")

ggplot(data,
       aes(x = Annual.Income..k..,
           y = Spending.Score..1.100.,
           color = Cluster)) +
  geom_point(size = 3) +
  labs(title = "Customer Segmentation Using K-Means Clustering",
       x = "Annual Income",
       y = "Spending Score") +
  theme_minimal()

dev.off()

print("Project Completed Successfully")