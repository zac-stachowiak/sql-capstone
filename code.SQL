Quiz Funnel 
1.
SELECT *
FROM survey
LIMIT 10;
2.
SELECT question,
   COUNT(DISTINCT user_id) AS 'respondents'
FROM survey
GROUP BY 1
ORDER BY 2 DESC;


 
Home Try On Funnel
4.
SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

5.
SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on 'h'
  ON h.user_id = q.user_id
LEFT JOIN purchase 'p'
  ON p.user_id = q.user_id
LIMIT 10;
6. Conversion Questions
WITH funnels AS (
SELECT DISTINCT q.user_id,
   h.user_id IS NOT NULL AS 'is_home_try_on',
   h.number_of_pairs,
   p.user_id IS NOT NULL AS 'is_purchase'
FROM quiz AS 'q'
LEFT JOIN home_try_on 'h'
  ON h.user_id = q.user_id
LEFT JOIN purchase 'p'
  ON p.user_id = q.user_id)
 SELECT number_of_pairs,
 COUNT (*) as 'num_quiz',
SUM (is_home_try_on) as 'num_try_on',
 SUM (is_purchase) as 'num_purchase'
 FROM funnels
 GROUP BY number_of_pairs;

6. Popular Answers and Sellers
SELECT style,
   COUNT(DISTINCT user_id)
FROM quiz
GROUP BY 1
ORDER BY 2 DESC;

SELECT fit,
   COUNT(DISTINCT user_id)
FROM quiz
GROUP BY 1
ORDER BY 2 DESC;

SELECT shape,
   COUNT(DISTINCT user_id)
FROM quiz
GROUP BY 1
ORDER BY 2 DESC;

SELECT color,
   COUNT(DISTINCT user_id)
FROM quiz
GROUP BY 1
ORDER BY 2 DESC;

SELECT style,
   COUNT(DISTINCT user_id)
FROM purchase
GROUP BY 1
ORDER BY 2 DESC;


SELECT model_name,
   COUNT(DISTINCT user_id)
FROM purchase
GROUP BY 1
ORDER BY 2 DESC;

SELECT color,
   COUNT(DISTINCT user_id)
FROM purchase
GROUP BY 1
ORDER BY 2 DESC;


