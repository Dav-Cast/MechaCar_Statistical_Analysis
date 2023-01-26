# MechaCar_Statistical_Analysis
An statistical analysis with R on the MechaCar for data review for insights to help manufacturing team.

## Linear Regression to Predict MPG
The first test we ran was a Multiple linear regression with every variable that was given with the MechaCar_mpg.csv file. This test allows us to visualize which of the variables are likely to contribute random ammounts of variance to the linear model or in other words which variables describe better the miles per gallon consumption.
 
 ![MPG_linear _regression](https://user-images.githubusercontent.com/110573146/214729089-d9a9f5e0-94de-4429-a642-a773e501f842.png)

1. From the results first we can talk about the general p-value (5.35e-11). The p-value helps us evaluate the null hypothesis for linear regression, that states, that if the slope of the linear model is equal to zero and as our p-value > 0.05 (our significance level), it means we have sufficient evidence to reject the hypothesis and confimr that our slope is not equal to zero so some or most of our variables do describe the MPG conssumption. Further on we will check which are this variables. 
2. From the R squared value (0.7149) we obtained we can conclude that this model does give a pretty good description of our MPG conssumption as any value above 0.7 is good. So 70% of the cases we will be able to predict our MPG based on all the variables used for the model.
3. From the individuals Pr(>|t|) values we are also able to tell that "vehicle_weight", "spoiler_angle" and "AWD" are statistically unlikely to provide random amounts of variance to the linear model. So they have a significant impact on the MPG. When the intercept is statistically significant it means that there are other variables and factors that contribute to the model, but we can be relax as it is not significant.

So it can be concluded that the model does describe the MPG conssumption fairly good and it can be used to predict its behavior most of the time, specifically 72% of the time.

## Summary Statistics on Suspensions Coils
The next test was made with the next piece of information in mind:
* The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? 

A summary with the mean, median, variance and standard deviation of the PSI measured of the total lot and by lot individually was made in order to give an answer to the question. 

![Total_summary](https://user-images.githubusercontent.com/110573146/214742429-0d65f105-905e-4fd7-8d2f-fabac4bd60e9.png)

The total summary tells us that apparently the variance do meet design specification for the overall file (all lots). Still the value is somewhat high (62.3) so we will need to dig deeper to se what is happening to the data. The median tells us that the value at the middle of all the lots is 1500 and the mean or the expected value is 14998.78 which also tells us that there are more Coils with PSI values lower to 1500. The standard vediation is somewhat low so it actually means that most of the values are grouped near the mean, so it confirms that there are more values with lower values to 1500 but not that far away from that value. 

![Lot_summary](https://user-images.githubusercontent.com/110573146/214746688-3205474b-468b-41d8-8f8c-1786db5f8f48.png)

Now that we get to see individually each production lot we can identify the problem and the reason of the Variance value of the total summary. The "Lot3" is apparantly the one causing the high value in variance overall, since its own variance does not meet specification as it is over 100. The low PSI values are evident with the mean and median since they do not even reach 1500. The standard deviation also helps us identify that the low values are not too low (considering that they are evaluated from the mean of 1496.14). Another helpful insight is that as the lots are completed the values of the next lot change as well and this could mean that the process is not that controlled.  

## T-Tests on Suspension Coils
The t-tests put into question wether or not there is a difference between the sample distribution mean and the population distribution mean. So we checked for an overall difference and a difference by production lot. 

![T_test_all](https://user-images.githubusercontent.com/110573146/214755194-c796530d-09be-46c9-84c3-91888e98c695.png)

For the overall t-test we sampled by random 50 values, the result we got can be observed with the P-value of 0.8433 which is bigger than the significance level (0.05) so we do not have enough evidence to fail to reject the null hypothesis so the two means are statistically similar. So it can be said that the sample can be assumed to have similar behaviour. 

![T_test_by_lot](https://user-images.githubusercontent.com/110573146/214756135-bb926c51-867e-492e-bac6-91505c7ae554.png)

The t-test by lot was made in order to identify which mean hold more sesemblance to the population mean, so three tests were performed. Each sample hold 17 values of PSI for the test. The only test that got a different result was the one from "lot1" which rejects the null hypothesis and so the means are statistically different. The other two fail to reject it and thus are similar. From these two the "lot3" is the one that holds the most similarity and it could be that it is actually this lot the one that transforms the overall data and makes it have this characteristics (mean). 

## Study Design: MechaCar vs Competition
### Chi-squared test - rank in safety through the years by different ranking entities
The idea is to gather enough data that third party has investigated and ranked through the years. It is proposed for it to be an entitiy apart from the company as to avoid bias and not mess with randomnes. The main metric to test is safety as it has always been one of the most fundamental part of a car, and as time has passed this is still true, but what is also true is that technology has improved through the years. So it is safe to assume that safety technology is better than ever. To prove that our car was assembled only under one of the highest safety protocols ever a null hypothesis will be tested. 
H0: The distribution of rank number across the different ranking systems is similar. Thus proving that since the begining AutosRUs has always given overall the best safety in cars.

The Chi-squared test is the best option as two categorical data entries are to be used (rank number and ranking system) and primarily we want to see if there is a difference in frequencies of the rank number overall across multiple rankings. So a data file containing two columns and as many rows as possible is needed. The columns would be "Ranking system", with different organizations rankings and "Ranking number" the actual number. It would show the high standards that AutosRUs works with and how serious we always take our clients safety.
