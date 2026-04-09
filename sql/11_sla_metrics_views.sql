-- View: Overall SLA compliance
CREATE VIEW support.v_sla_summary AS
SELECT
    COUNT(*) AS total_tickets,
    SUM(CASE WHEN sla_met THEN 1 ELSE 0 END) AS sla_met_count,
    SUM(CASE WHEN sla_met = FALSE THEN 1 ELSE 0 END) AS sla_missed_count,
    ROUND(
        (SUM(CASE WHEN sla_met THEN 1 ELSE 0 END)::NUMERIC / COUNT(*)) * 100,
        2
    ) AS sla_compliance_percent
FROM support.tickets
WHERE closed_at IS NOT NULL;

-- View: SLA compliance by site
CREATE VIEW support.v_sla_by_site AS
SELECT
    site_name,
    COUNT(*) AS total_tickets,
    SUM(CASE WHEN sla_met THEN 1 ELSE 0 END) AS sla_met,
    SUM(CASE WHEN sla_met = FALSE THEN 1 ELSE 0 END) AS sla_missed
FROM support.tickets
WHERE closed_at IS NOT NULL
GROUP BY site_name;

-- View: Mean Time To Resolve (MTTR)
CREATE VIEW support.v_mttr AS
SELECT
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM support.tickets
WHERE closed_at IS NOT NULL;