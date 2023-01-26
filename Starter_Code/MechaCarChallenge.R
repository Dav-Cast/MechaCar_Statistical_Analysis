library(dplyr)

# Read a csv file form the same working directory
mecha_car <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors = F)

# Multiple linear regression 
# generate multiple linear regression model 
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car)

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_car))
# Multiple R-squared:  0.7149
# p-value: 5.35e-11

# Suspension coil summary
suspension_coils <- read.csv(file="Suspension_Coil.csv")

total_summary <- suspension_coils %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

lot_summary <- suspension_coils %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# T-test on suspension coils
# Randomly sample 50 data points
sample_total <- suspension_coils %>% sample_n(50)

# Compare sample versus population means
t.test(sample_total$PSI, mu=mean(suspension_coils$PSI))

# p-value = 0.8433 > 0.05
# our p-value is above our significance level. 
# Therefore, we do not have sufficient evidence to reject the null hypothesis, 
# and we state that the two means are statistically similar.

lot_1 <- subset(suspension_coils, Manufacturing_Lot=="Lot1")
lot_2 <- subset(suspension_coils, Manufacturing_Lot=="Lot2")
lot_3 <- subset(suspension_coils, Manufacturing_Lot=="Lot3")

sample_lot1 <- lot_1 %>% sample_n(17)
sample_lot2 <- lot_2 %>% sample_n(17)
sample_lot3 <- lot_3 %>% sample_n(17)

t.test(sample_lot1$PSI, mu=mean(suspension_coils$PSI))
# p-value = 0.002172
t.test(sample_lot2$PSI, mu=mean(suspension_coils$PSI))
# p-value = 0.09012
t.test(sample_lot3$PSI, mu=mean(suspension_coils$PSI))
# p-value = 0.7994