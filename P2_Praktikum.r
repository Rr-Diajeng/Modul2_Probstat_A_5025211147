#1a
#data x
x <- c(78,75,67,77,70,72,78,74,77)

#data y
y <- c(100,95,70,90,90,90,89,90,100)

#Dilakukan perhitungan standar deviasi
standarDeviasi_Before <- sd(x)
standarDeviasi_After <- sd(y)


#1b
#Mencari nilai t(p-value) dengan t-test
t.test(x, y, paired = FALSE)

#1c
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE)

#2
#2b
install.packages("BSDA")
library (BSDA)
# diketahui
rata2 <- 23500
standar_deviasi <- 3900
pemilik_mobil <- 100

#hasil
tsum.test(mean.x= rata2, sd(standar_deviasi),
          n.x = pemilik_mobil, var.equal = FALSE)

#2c
data.mean <- 23500
data.a <- 20000
data.sd <- 3900
data.n <- 100

z <- (data.mean - data.a) / (data.sd/ sqrt(data.n))
2 * pnorm(-abs(z))

#3

#3b
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, alternative = "greater", var.equal = TRUE)

#3c
install.packages("mosaic")
library(mosaic)

plotDist(dist = 't', df = 2, col = 'Orange')

#3d
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

#4
oneWayAnova = read.table(file = "D:\\Download\\onewayanova.txt", header = TRUE) 
attach(oneWayAnova)
names(oneWayAnova)

#4a
oneWayAnova$Group <- as.factor(oneWayAnova$Group)
oneWayAnova$Group = factor(oneWayAnova$Group, labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(oneWayAnova$Group)

#membagi 3 group
Group1 <- subset(oneWayAnova, Group == "Kucing Oren")
Group2 <- subset(oneWayAnova, Group == "Kucing Hitam")
Group3 <- subset(oneWayAnova, Group == "Kucing Putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)

#4b
bartlett.test(Length~Group, data = oneWayAnova)

#4c
model1 = lm(Length~Group, data = oneWayAnova)
anova(model1)

#4e
TukeyHSD(aov(model1))

#4f
install.packages("ggplot2")
library("ggplot2")
ggplot(oneWayAnova, aes(x = Group, y = Length)) +
  geom_boxplot(color = c("#00AFBB", "#E7B800", "#FC4E07")) +
  scale_x_discrete() + xlab("Group") + ylab("Length (cm)")

#5
install.packages("multcompView")
install.packages("readr")
install.packages("ggplot2")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

GTL <- read.csv(file = "D:\\Download\\GTL.csv")
head(GTL)
str(GTL)

#5a
qplot(x = Temp, y = Light, geom = "point", data = GTL) + facet_grid(.~Glass, labeller = label_both)

#5b
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

#5c

data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#5d

tukey <- TukeyHSD(anova)
print(tukey)

#5e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
