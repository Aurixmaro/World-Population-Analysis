library(ggplot2)

#CHART 1

data <- data.frame(
  CONTINENT = c('Asia', 'Europe', 'Oceania', 'Africa', 'South America', 'North America'),
  Number_of_Countries = c(46, 44, 16, 53, 12, 23)
)

ggplot(data, aes(x = Number_of_Countries, y = CONTINENT, fill = CONTINENT)) +
  geom_bar(stat = "identity", color = "black", width = 0.7) +  
  geom_text(aes(label = Number_of_Countries), hjust = -0.2, size = 4) +  
  labs(x = "Number of Countries", y = "Continent") +
  ggtitle("Number of countries on continents") +
  theme_minimal() +
  theme(legend.position = "none")  

#CHART 2
 
data <- data.frame(
  Population = c(1413142846, 1399179585, 339665118, 279476346, 247653551, 230842743, 218689757, 167184465, 141698923, 129875529),
  Country = c("China", "India", "United States", "Indonesia", "Pakistan", "Nigeria", "Brazil", "Bangladesh", "Russia", "Mexico")
)
ggplot(data, aes(x = reorder(Country, -Population), y = Population, fill = Country)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = Population), vjust = -0.5, size = 2) + 
  labs(x = "Kraj", y = "Population", fill = "Country") +
  ggtitle("Top 10 Population") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 3

data <- data.frame(
  Population = c(1000, 9852, 11639, 21779, 31597, 34892, 39993, 54817, 74656, 80966),
  Country = c("Holy See (Vatican City)", "India", "Nauru", "Tuvalu", "Palau", "Monaco", "San Marino", "Liechtenstein", "Saint Kitts and Nevis", "Dominica")
)
result <- ggplot(data, aes(x = reorder(Country, Population), y = Population)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = Population), vjust = -0.3, size = 3) +
  labs(x = "Country", y = "Population", fill = "Country") +
  ggtitle("Top 10 worst population") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 4

data <- data.frame(
  Area = c(17098242, 9984670, 9833517, 9596960, 8515770, 7741220, 3287263, 2780400, 2724900, 2381740),
  Country = c("Russia", "Canada", "United States", "China", "Brazil", "Australia", "India", "Argentina", "Kazakhstan", "Algeria")
)

data <- data[order(-data$Area), ]
data <- data[data$Area > 0, ]
chart <- ggplot(data, aes(x = reorder(Country, -Area), y = Area)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = Area), vjust = -0.3, size = 3) +
  labs(x = "Country", y = "Area", fill = "Country") +
  ggtitle("Country Area") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 5

data <- data.frame(
  Area = c(0.49, 2, 21, 26, 61, 160, 181, 261, 316),
  Country = c("Holy See (Vatican City)", "Monaco", "Nauru", "Tuvalu", "San Marino", "Liechtenstein", "Marshall Islands", "Saint Kitts and Nevis", "Malta")
)

chart <- ggplot(data, aes(x = reorder(Country, Area), y = Area)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = Area ), vjust = -0.3, size = 3) +
  labs(x = "Country", y = "Area", fill = "Country") +
  ggtitle("Country Area)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 6

data <- data.frame(
  GrowthRate = c(6.39, 4.78, 3.66, 3.59, 3.36, 3.34, 3.31, 3.22, 3.13, 3.05),
  Country = c("Syria", "South Sudan", "Niger", "Burundi", "Equatorial Guinea", "Angola", "Benin", "Uganda", "Congo, Democratic Republic", "Chad")
)

chart <- ggplot(data, aes(x = reorder(Country, GrowthRate), y = GrowthRate)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = sprintf("%.2f", GrowthRate)), vjust = -0.3, size = 3) +
  labs(x = "Country", y = "Growth_rate", fill = "Country") +
  ggtitle("Top 10 population growth rate") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

  #CHART 7

data <- data.frame(
  GrowthRate = c(-1.14, -1.13, -1.04, -1.01, -0.74, -0.70, -0.66, -0.63, -0.52, -0.47),
  Country = c("Moldova", "Latvia", "Lithuania", "Romania", "Estonia", "Micronesia, Federated States of", "Bulgaria", "Serbia", "Ukraine", "Croatia")
)

chart <- ggplot(data, aes(x = reorder(Country, GrowthRate), y = GrowthRate)) +
  geom_bar(stat = "identity", fill = "purple", color = "black") +
  geom_text(aes(label = sprintf("%.2f", GrowthRate)), vjust = 0.3, size = 3) +
  labs(x = "Country", y = "Growth_rate", fill = "Kraj") +
  ggtitle("Top 10 worst population growth rate") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#CHART 8

data <- data.frame(
  Country = c("Niger", "Angola", "Benin", "Mali", "Uganda", "Chad", "Congo DR", "Somalia", "South Sudan", "Mozambique"),
  BirthRate = c(46.86, 41.42, 40.72, 40.54, 40.27, 39.85, 39.64, 37.71, 37.07, 36.94)
)

chart <- ggplot(data, aes(x = reorder(Country, -BirthRate), y = BirthRate)) +
  geom_bar(stat = "identity", fill = "purple", color = "black", size = 1) +
  geom_text(aes(label = sprintf("%.2f", BirthRate)), vjust = -0.5, size = 3, fontface = "bold") +
  labs(x = "Country", y = "Birth_rate") +
  ggtitle("TOP 10 population birth rate") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10, face = "bold"),
    axis.text.y = element_text(size = 10),
    axis.title = element_text(size = 12, face = "bold"),
    plot.title = element_text(size = 14, face = "bold")
  )

#CHART 9 

data <- data.frame(
  Country = c("Monaco", "Andorra", "Japan", "Korea South", "Italy", "Spain", "Greece", "Bulgaria", "Portugal", "Slovenia"),
  BirthRate = c(6.61, 6.87, 6.90, 6.95, 7.00, 7.12, 7.52, 7.97, 7.99, 8.12)
)

chart <- ggplot(data, aes(x = reorder(Country, -BirthRate), y = BirthRate)) +
  geom_bar(stat = "identity", fill = "purple", color = "black", size = 1) +
  geom_text(aes(label = sprintf("%.2f", BirthRate)), vjust = -0.5, size = 3, fontface = "bold") +
  labs(x = "Country", y = "Birth Rate") +
  ggtitle("Top 10 worst birth rate") +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10, face = "bold"),
    axis.text.y = element_text(size = 10),
    axis.title = element_text(size = 12, face = "bold"),
    plot.title = element_text(size = 14, face = "bold")
  )
