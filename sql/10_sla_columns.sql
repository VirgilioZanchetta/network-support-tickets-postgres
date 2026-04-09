-- Add SLA-related columns to tickets

ALTER TABLE support.tickets
ADD COLUMN sla_hours NUMERIC(5,2) DEFAULT 4.00, -- agreed SLA target
ADD COLUMN resolution_hours NUMERIC(5,2),
ADD COLUMN sla_met BOOLEAN;

-- Calculate resolution time in hours
UPDATE support.tickets
SET resolution_hours =
    EXTRACT(EPOCH FROM (closed_at - opened_at)) / 3600
WHERE closed_at IS NOT NULL;

-- Evaluate if SLA was met
UPDATE support.tickets
SET sla_met =
    CASE
        WHEN resolution_hours IS NOT NULL
         AND resolution_hours <= sla_hours THEN TRUE
        ELSE FALSE
    END;