# Explanation of SQL queries used

### 1. Who is the top host by total reviews and where is the listing?<BR>

````sql 
SELECT host_id, host_name, neighbourhood, neighbourhood_group, SUM(number_of_reviews) as total_Reviews FROM ab_nyc
GROUP BY (host_id, host_name, neighbourhood, neighbourhood_group)
ORDER BY SUM(number_of_reviews) DESC
LIMIT 1;
````  
  
  
  
### 2. How does Maya's average price per night compare to the rest of the area?<BR>
 
````sql
SELECT ROUND(AVG(price),2) as avg_price_per_night FROM ab_nyc
WHERE host_id = 37312959;
````  


````sql
SELECT ROUND(AVG(price),2) as avg_price_per_night FROM ab_nyc
WHERE neighbourhood_group = 'Queens' AND neighbourhood = 'East Elmhurst';
````  
  

  
### 3. Which NYC neighbourhood is most popular by total bookings and how many were there?<BR>
  
````sql
SELECT neighbourhood_group, COUNT(*) as total_bookings FROM ab_nyc
GROUP BY(neighbourhood_group)
ORDER BY COUNT(name) DESC;  
````  

  
  
### 4. Which room type was most popular in Manhattan?<BR>
 
````sql
SELECT room_type, COUNT(*) as total_listings FROM ab_nyc
WHERE neighbourhood_group = 'Manhattan'
GROUP BY(room_type)
ORDER BY COUNT(*) DESC;  
````  

  
  
### 5. What was the average price per night for an entire home/apt in Manhattan?<BR>

````sql
SELECT neighbourhood_group, room_type, ROUND(AVG(price),2) as avg_price_per_night FROM ab_nyc
WHERE neighbourhood_group = 'Manhattan' AND room_type = 'Entire home/apt'
GROUP BY(neighbourhood_group, room_type);
````  
  
