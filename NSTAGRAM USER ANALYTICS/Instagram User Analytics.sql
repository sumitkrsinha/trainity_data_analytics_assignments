USE ig_clone
-- QUESTION 1

SELECT * FROM users
ORDER BY created_at LIMIT 5

-- QUESTION 2

SELECT * FROM users
WHERE id NOT IN (SELECT user_id FROM photos)

select count(*) from(SELECT * FROM users
WHERE id NOT IN (SELECT user_id FROM photos))counting

-- QUESTION 3 

SELECT * FROM(SELECT COUNT(user_id) Total_Likes,photo_id FROM likes
GROUP BY photo_id ) win ORDER BY Total_Likes DESC LIMIT 1

SELECT * FROM comments

-- QUESTION 4

SELECT * FROM(SELECT COUNT(photo_id) Times_Used,tag_id FROM photo_tags
GROUP BY tag_id ) MOST ORDER BY Times_Used DESC LIMIT 5

-- QUESTION 5

-- SELECT COUNT(id) number_of_registration, date FROM (SELECT   id, 
-- cast(created_at AS date) date,cast(created_at AS Time) time from users) temp
-- GROUP BY date ORDER BY number_of_registration DESC LIMIT 5

SELECT COUNT(id) number_of_registration, day FROM (SELECT   id, 
DATE_FORMAT(cast(created_at AS date),'%a') day,cast(created_at AS Time) time from users) temp
GROUP BY day ORDER BY number_of_registration DESC LIMIT 5

SELECT COUNT(id) number_of_registration, day, time FROM (SELECT   id, 
DATE_FORMAT(cast(created_at AS date),'%a') day,cast(created_at AS Time) time from users) temp
GROUP BY day ORDER BY number_of_registration DESC LIMIT 1

-- SELECT WEEKDAY(SELECT date FROM(SELECT COUNT(id) number_of_registration, date FROM (SELECT   id, 
-- cast(created_at AS date) date,cast(created_at AS Time) time from users) temp
-- GROUP BY date ORDER BY number_of_registration DESC LIMIT 5) abc)

-- SELECT date FROM(SELECT COUNT(id) number_of_registration, date FROM (SELECT   id, 
-- cast(created_at AS date) date,cast(created_at AS Time) time from users) temp
-- GROUP BY date ORDER BY number_of_registration DESC LIMIT 5) abc

-- SELECT WEEKDAY(SELECT date FROM(SELECT COUNT(id) number_of_registration, date FROM (SELECT   id, 
-- cast(created_at AS date) date,cast(created_at AS Time) time from users) temp
-- GROUP BY date ORDER BY number_of_registration DESC LIMIT 5) abc)abd

-- SELECT COUNT(*) FROM (SELECT COUNT(id) number_of_registration, date FROM (SELECT   id, 
-- cast(created_at AS date) date,cast(created_at AS Time) time from users) temp
-- GROUP BY date ORDER BY number_of_registration) XY

SELECT * FROM follows

SELECT * FROM photo_tags

SELECT * FROM tags

-- QUESTION 4

SELECT * FROM photos
WHERE id = 145
SELECT * FROM users
WHERE id IN(SELECT user_id FROM photos
WHERE id = 145)

-- QUESTION 6

SELECT COUNT(id) posts, user_id FROM photos
GROUP BY user_id ORDER BY posts DESC

SELECT SUM(posts) total_posts, COUNT(user_id) total_users
FROM(SELECT COUNT(id) posts, user_id FROM photos
GROUP BY user_id) sums1

SELECT posts, COUNT(user_id) users  FROM 
(SELECT COUNT(id) posts, user_id FROM photos
GROUP BY user_id ORDER BY posts) table1
GROUP BY posts ORDER BY users DESC

 SELECT total_posts/total_users FROM
 (SELECT SUM(posts) total_posts, COUNT(user_id) total_users FROM
 (SELECT COUNT(id) posts, user_id FROM photos
 GROUP BY user_id) sums1)final
 
 
 
 -- QUESTION 7
 
--  SELECT * FROM likes
--  
--  SELECT COUNT(DISTINCT(photo_id)) FROM likes
--  
--  SELECT user_id, COUNT(photo_id) total FROM likes
--  GROUP BY user_id ORDER BY total DESC
 
 SELECT * FROM( SELECT user_id, COUNT(photo_id) total FROM likes
 GROUP BY user_id ORDER BY total DESC) tab1 
 WHERE total = (SELECT COUNT(DISTINCT(photo_id)) FROM likes)
 
--  SELECT COUNT(user_id) FROM( SELECT * FROM( SELECT user_id, COUNT(photo_id) total FROM likes
--  GROUP BY user_id ORDER BY total DESC) tab1 
--  WHERE total = (SELECT COUNT(DISTINCT(photo_id)) FROM likes))tab
 
 SELECT * FROM users
 WHERE id IN(SELECT user_id FROM(SELECT * FROM( SELECT user_id, COUNT(photo_id) total FROM likes
 GROUP BY user_id ORDER BY total DESC) tab1 
 WHERE total = (SELECT COUNT(DISTINCT(photo_id)) FROM likes))tab2)
 
  -- SELECT COUNT(id) FROM( SELECT * FROM users
--  WHERE id IN(SELECT user_id FROM(SELECT * FROM( SELECT user_id, COUNT(photo_id) total FROM likes
--  GROUP BY user_id ORDER BY total DESC) tab1 
--  WHERE total = (SELECT COUNT(DISTINCT(photo_id)) FROM likes))tab2))tab

