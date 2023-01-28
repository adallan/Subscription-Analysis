# Collection of aggregations and queries made.
---------------------------------------------------------------------------------------------------------------------
# Step 1: Updating empty DateTime to a NULL value for easier query syntax.

UPDATE `buoyant-genre-370301.HelloFresh_Customer.customer_product_data`
SET cancel_date_time = NULL
WHERE cancel_date_time = '0000-00-00 00:00:00'
---------------------------------------------------------------------------------------------------------------------
# Step 2: Extraction of date and time from both signups and cancellations.
# Step 3: This query is used for the creation of a new table.

SELECT 
  EXTRACT(TIME FROM signup_date_time) as signup_time, 
  EXTRACT(DATE FROM signup_date_time) as sign_up_date,
  EXTRACT(TIME FROM CAST(cancel_date_time as datetime)) as cancel_time, 
  EXTRACT(DATE FROM CAST(cancel_date_time as datetime)) as cancel_date,
  customer_id, product, customer_num
FROM `buoyant-genre-370301.HelloFresh_Customer.customer_product_data`
ORDER BY cancel_date ASC

---------------------------------------------------------------------------------------------------------------------
# Step 4: Exploration of cancellation times.

SELECT customer_id, cancel_date, cancel_time,
  (SELECT COUNT(customer_id) FROM `buoyant-genre-370301.HelloFresh_Customer.customer_subscriptions` WHERE cancel_time BETWEEN '00:00:00' AND '06:00:00') as midnight_to_six,
  (SELECT COUNT(customer_id) FROM `buoyant-genre-370301.HelloFresh_Customer.customer_subscriptions` WHERE cancel_time BETWEEN '06:00:01' AND '12:00:00') as six_to_noon,
  (SELECT COUNT(customer_id) FROM `buoyant-genre-370301.HelloFresh_Customer.customer_subscriptions` WHERE cancel_time BETWEEN '12:00:01' AND '18:00:00') as noon_to_six,
  (SELECT COUNT(customer_id) FROM `buoyant-genre-370301.HelloFresh_Customer.customer_subscriptions` WHERE cancel_time > '18:00:00') as after_six,
FROM `buoyant-genre-370301.HelloFresh_Customer.customer_subscriptions`
WHERE cancel_date IS NOT NULL
GROUP BY customer_id, cancel_date, cancel_time

---------------------------------------------------------------------------------------------------------------------
# Step 5: Calculating total net sales.

SELECT
SUM(CASE 
  WHEN product = 'prd_1' THEN 1200
  END) as costing_p1,
  SUM(CASE 
  WHEN product = 'prd_2' THEN (125*12)
  END) as costing_p2,
FROM `buoyant-genre-370301.HelloFresh_Customer.customer_subscriptions`
WHERE cancel_date IS NULL

---------------------------------------------------------------------------------------------------------------------
# Step 6: Inspection of 2021's signups, cancellations and counting of active users.

SELECT DISTINCT COUNT(sign_up_date)
FROM `buoyant-genre-370301.HelloFresh_Customer.customer_subscriptions` 
WHERE sign_up_date BETWEEN '2021-01-01' AND '2021-12-31'

SELECT DISTINCT COUNT(customer_id)
FROM `buoyant-genre-370301.HelloFresh_Customer.customer_subscriptions`
WHERE cancel_date IS NULL

SELECT COUNT(cancel_date) as cancelations
FROM `buoyant-genre-370301.HelloFresh_Customer.customer_subscriptions` 
WHERE cancel_date IS NOT NULL AND cancel_date BETWEEN '2021-01-01' AND '2021-12-31'
---------------------------------------------------------------------------------------------------------------------
#Step 7: Identifying if there is a correlation between support calls and cancellations within a week afterwards.

SELECT case_date, cancel_date, case_time, cancel_time,reason 
FROM `buoyant-genre-370301.HelloFresh_Customer.customer_support` as support
JOIN
`buoyant-genre-370301.HelloFresh_Customer.cancelation_view` as cancelled
ON support.customer_id = cancelled.customer_id
WHERE cancel_date BETWEEN case_date AND DATE_ADD(case_date, INTERVAL 7 DAY)
