# Subscription-Analysis
A case study for HelloFresh, a meal prep service. This case study focuses on forecasting and analyzing subscription, customer support and product data.

Business Task:

What is the forecasted increase in customers and how does that affect customer support and revenue?

About the Dataset:

The data set is sourced from [kaggle.com](https://www.kaggle.com/datasets/5181bcd48fba8c7499605c6bfe96a330eed508ecbdad865889871de8aa307c94)

Kaggle has an open public data policy and is mostly used for sharing datasets within the community. The data set is up-to-date, relevant and contains no user private information. Data is gathered by a third party and has been inspected to ensure no biases have been met.

### Data Cleaning:

Excel has been used to name columns and fill missing fields, such as turning NA into a blank DateTime for formatting.
  
Bigquerry was used to perform SQL. Data was entered into Bigquerry via CSV upload after it was cleaned and transformed by first turning blank DateTime fields into null values. Next DateTime fields were split into newly created dates and time columns for both signups and cancellations. Customer age-demographic groups, cancellation periods, total active customers, total revenue, total cancellations, cancellations for 2021, signups for 2021 and revenue for 2021 columns were all created. 

### Analysis and Data exploration:

SQL was used to explore relationships between support calls and cancellation times within a week of each other, no correlation was found between them. 
Support inquiries and their time of day were analyzed to find high customer support calls dates.
Age demographic groups were explored to identify outliers and clientele age ranges.
Total revenue, active customers, signups and cancellations were investigated to determine the best factors for forecasting the upcoming year's data.

### Data Visualization:

Tableau was used as a visualization tool. CSV files were uploaded, unioned and adequately formatted. Data were explored once again and compared to SQL database to ensure data quality.
Key Performance Indicators were determined and calculated fields were made for the following, total revenue of 2021, total active customers, signups of 2021, and cancellations of 2021.
Visualizations were made and the forecasting model of additive was determined to represent the data in the best way.

## Trends:

There were 164,419 signups in 2021, 55,918 cancellations, 396,611 total active users and yearly revenue of $43,230,599. Trends I discovered included the following:

1) As customers increase so does the likely hood of cancellations but the important note is that the signup rate grows at a larger volume than the cancellations.

2) Annual subscription is more popular and generates a higher, more reliable income stream. 

3) The summer months, starting in April and continuing until the end of September show a dramatic increase in customer support inquiries.

4) Forecasting predicts that the company will continue to grow at a rate of 30,000 to 50,000 customers per quarter. 

5) The majority of clients are in their 50s and 60s slightly trending towards more males.

## Recommendations:
The recommendations I have for HelloFresh are the following:

1) Increase customer support staff during the first quarter, and train and prepare them for the forecasted increase in support calls and emails in the summer months. 

2) Target middle-aged demographic for advertising and possibly pricing deals. 

3) Encourage the sales team to push annual sales and possibly promote the option of allowing monthly subscriptions to convert to annual or discounted prices.

Thank you for reading! Please see here for [SQL code and queries](https://github.com/adallan/Subscription-Analysis/blob/main/Subscription.sql)
Please see link for [projects dashboard](https://public.tableau.com/app/profile/alexander.allan/viz/HelloFreshSubscriptionsandCustomerSupport/Subscriptiondashbaord)
