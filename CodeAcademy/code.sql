SELECT * 
FROM survey
LIMIT 10;

SELECT question, COUNT(DISTINCT user_id)
 FROM survey
 GROUP BY question;
 
 SELECT *
 FROM quiz
 LIMIT 5;
 
 SELECT *
 FROM home_try_on
 LIMIT 5;
 
 SELECT * 
 FROM purchase
 LIMIT 5;

SELECT COUNT(DISTINCT user_id)
FROM quiz;

SELECT COUNT(DISTINCT user_id)
FROM home_try_on;
  
SELECT COUNT(*), SUM(number_of_pairs = '3 pairs'), SUM(number_of_pairs = '5 pairs')
FROM home_try_on;

WITH three_pairs AS (SELECT DISTINCT quiz.user_id,
 home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
 home_try_on.number_of_pairs, purchase.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz
 LEFT JOIN home_try_on
 	ON quiz.user_id = home_try_on.user_id
 LEFT JOIN purchase
 	ON purchase.user_id = quiz.user_id) 
  
SELECT COUNT(*) AS 'Three Pairs Purchase'
FROM three_pairs 
WHERE number_of_pairs = '3 pairs' AND is_purchase = 1;

WITH five_pairs AS (SELECT DISTINCT quiz.user_id,
 home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
 home_try_on.number_of_pairs, purchase.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz
 LEFT JOIN home_try_on
 	ON quiz.user_id = home_try_on.user_id
 LEFT JOIN purchase
 	ON purchase.user_id = quiz.user_id) 

SELECT COUNT(*) AS 'Five Pairs Purchase'
FROM five_pairs 
WHERE number_of_pairs = '5 pairs' AND is_purchase = 1;

SELECT COUNT(*) AS '# Quiz Color', color
FROM quiz
GROUP BY color
ORDER BY 1 DESC;

SELECT COUNT(*) "# Quiz Style", style
FROM quiz
GROUP BY style
ORDER BY 1 DESC;

SELECT COUNT(*) "# Quiz Fit", fit
FROM quiz
GROUP BY fit
ORDER BY 1 DESC;

SELECT COUNT(*) "# Quiz Shape", shape
FROM quiz
GROUP BY shape
ORDER BY 1 DESC;

SELECT COUNT(*) AS '# Purchased', color
FROM purchase
GROUP BY color
ORDER BY 1 DESC;

SELECT COUNT(*) AS "# Purchased", price
FROM purchase
GROUP BY price
ORDER BY 1 DESC;

SELECT COUNT(*) AS "# Purchased", model_name
FROM purchase
GROUP by model_name
ORDER BY 1 DESC;

SELECT COUNT(*) AS "# Purchased", style
FROM purchase
GROUP by style
ORDER BY 1 DESC;

