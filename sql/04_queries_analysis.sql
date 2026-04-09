SELECT site_name, COUNT(*) AS total_tickets
FROM support.tickets
GROUP BY site_name;

SELECT activity_type, SUM(useful_hours) AS total_hours
FROM support.tickets
GROUP BY activity_type
ORDER BY total_hours DESC;

SELECT *
FROM support.tickets
WHERE status = 'Open';