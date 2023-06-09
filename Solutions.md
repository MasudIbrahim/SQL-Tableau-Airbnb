# Explanation of SQL queries used

### 1. Who is the top host by total reviews and where is the listing?<BR>

````sql 
SELECT host_id, host_name, neighbourhood, neighbourhood_group, SUM(number_of_reviews) as total_Reviews FROM ab_nyc
GROUP BY (host_id, host_name, neighbourhood, neighbourhood_group)
ORDER BY SUM(number_of_reviews) DESC
LIMIT 1;
````  
To find the top host by total reviews we can use the SUM aggregrate function and call it on the column number_of_reviews. The SELECT statement also contains the most relevant columns such as the host_name and neighbourhood(_group). GROUP BY creates summary rows based on the specified columns. ORDER BY allows us to see the largest number first by specifying DESC and finally, LIMIT 1 returns only the top result.  
  
  
### 2. How does Maya's average price per night compare to the rest of the area?<BR>
 
````sql
SELECT ROUND(AVG(price),2) as avg_price_per_night FROM ab_nyc
WHERE host_id = 37312959;
````  
We obtained Maya's host_id from the above query and use that as an identifier due to the name Maya appearing more than once. Using the AVG function on the price column calculates the average and we rounded it to 2 decimal places to signify currency using the ROUND(,x) function. We also use an alias to better name the outputted column.

````sql
SELECT ROUND(AVG(price),2) as avg_price_per_night FROM ab_nyc
WHERE neighbourhood_group = 'Queens' AND neighbourhood = 'East Elmhurst';
````  
This query is essentially the above but the filtering WHERE clause uses different values.  

  
### 3. Which NYC neighbourhood is most popular by total bookings and how many were there?<BR>
  
````sql
SELECT neighbourhood_group, COUNT(*) as total_bookings FROM ab_nyc
GROUP BY(neighbourhood_group)
ORDER BY COUNT(name) DESC;  
````  
We use the COUNT function to calculate the number of rows and as we can use any column the * is sufficient. GROUP BY(neighbour_grop) clusters the different boroughs and returns them in one column. We also use ORDER BY again to return the values from largest to smallest.
  
  
### 4. Which room type was most popular in Manhattan?<BR>
 
````sql
SELECT room_type, COUNT(*) as total_listings FROM ab_nyc
WHERE neighbourhood_group = 'Manhattan'
GROUP BY(room_type)
ORDER BY COUNT(*) DESC;  
````  
This is a slightly amended version of the above query with us specifying Manhattan in the WHERE clause and grouping by the room_type which is relevant to the question.
  
  
### 5. What was the average price per night for an entire home/apt in Manhattan?<BR>

````sql
SELECT neighbourhood_group, room_type, ROUND(AVG(price),2) as avg_price_per_night FROM ab_nyc
WHERE neighbourhood_group = 'Manhattan' AND room_type = 'Entire home/apt'
GROUP BY(neighbourhood_group, room_type);
````  
We add onto the query from above here and specify room_type also  both in the WHERE and GROUP BY clauses. We also again round to 2 decimal places to reflect that the output is a currency.
