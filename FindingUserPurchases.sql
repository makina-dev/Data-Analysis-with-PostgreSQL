-- Finding User Purchases
-- Write a query that'll identify returning active users. A returning active user is a user that has made a second purchase within 7 days of any other of their purchases. Output a list of user_ids of these returning active users.



select DISTINCT a.user_id from 
amazon_transactions a JOIN amazon_transactions b 
ON a.user_id = b.user_id AND
a.id != b.id AND
b.created_at>=a.created_at AND
b.created_at<=a.created_at + INTERVAL '7 day'
ORDER BY a.user_id
    