-- 1. Who is the top host by total reviews and where is the listing?
SELECT host_id, host_name, neighbourhood, neighbourhood_group, SUM(number_of_reviews) as total_Reviews FROM ab_nyc
GROUP BY (host_id, host_name, neighbourhood, neighbourhood_group)
ORDER BY SUM(number_of_reviews) DESC
LIMIT 1;
-- Maya is the top host with a total of 2273 reviews and she is based in East Elmshurst, Queens.

-- 2. How does Maya's average price per night compare to the rest of the area?
SELECT ROUND(AVG(price),2) as avg_price_per_night FROM ab_nyc
WHERE host_id = 37312959;
-- Maya charges $42.60 per night on average.

SELECT ROUND(AVG(price),2) as avg_price_per_night FROM ab_nyc
WHERE neighbourhood_group = 'Queens' AND neighbourhood = 'East Elmhurst';
-- The average in the area is $81.18 and so nearly double that of Maya's average price per night.

-- 3. Which NYC neighbourhood is most popular by total bookings and how many were there?
SELECT neighbourhood_group, COUNT(*) as total_bookings FROM ab_nyc
GROUP BY(neighbourhood_group)
ORDER BY COUNT(name) DESC;
-- Manhattan was the most popular NYC neighbourhood with a total of 21652 bookings.

-- 4. Which room type was most popular in Manhattan?
SELECT room_type, COUNT(*) as total_listings FROM ab_nyc
WHERE neighbourhood_group = 'Manhattan'
GROUP BY(room_type)
ORDER BY COUNT(*) DESC;
-- Entire home/apt was the most popular room type in Manhattan with a total of 13193 bookings accounting for 60.9%.

-- 5. What was the average price per night for an entire home/apt in Manhattan?
SELECT neighbourhood_group, room_type, ROUND(AVG(price),2) as avg_price_per_night FROM ab_nyc
WHERE neighbourhood_group = 'Manhattan' AND room_type = 'Entire home/apt'
GROUP BY(neighbourhood_group, room_type);
-- $249.24 per night is the average for entire home/apt bookings in Manhattan
