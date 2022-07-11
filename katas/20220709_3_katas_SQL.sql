-- kata 1
SELECT date(created_at) as day, description, count(id)
FROM events
WHERE name = 'trained'
GROUP BY date(created_at), description
ORDER BY day;


-- kata 2
SELECT capital
FROM countries
WHERE continent in ('Africa', 'Afrika')
  AND country like 'E%'
ORDER BY capital
LIMIT 3;


-- kata 3
SELECT 
  date(s.transaction_date) as "day",
  d.name as department,
  COUNT(s.id) as sale_count
FROM department d
    INNER JOIN sale s on d.id = s.department_id
group by date(s.transaction_date), d.name
order by "day" asc;
