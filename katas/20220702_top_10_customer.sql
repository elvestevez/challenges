SELECT c.customer_id, c.email, 
  COUNT(*) payments_count, 
  --SUM(p.amount) total_amount
  CAST(SUM(p.amount) AS FLOAT) total_amount
FROM CUSTOMER c
  INNER JOIN payment p ON p.customer_id = c.customer_id
GROUP BY c.customer_id, c.email
ORDER BY total_amount DESC
LIMIT 10

