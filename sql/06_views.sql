-- View for open tickets
CREATE VIEW support.v_open_tickets AS
SELECT
    ticket_id,
    site_name,
    activity_type,
    opened_at,
    useful_hours,
    status
FROM support.tickets
WHERE status = 'Open';

-- View for tickets summary by site
CREATE VIEW support.v_tickets_by_site AS
SELECT
    site_name,
    COUNT(*) AS total_tickets,
    SUM(useful_hours) AS total_useful_hours
FROM support.tickets
GROUP BY site_name;

-- View for average effort by activity
CREATE VIEW support.v_avg_effort_by_activity AS
SELECT
    activity_type,
    COUNT(*) AS total_tickets,
    AVG(useful_hours) AS avg_useful_hours
FROM support.tickets
GROUP BY activity_type;