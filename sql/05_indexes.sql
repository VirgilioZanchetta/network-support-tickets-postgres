-- Index to improve searches by site
CREATE INDEX idx_tickets_site
ON support.tickets (site_name);

-- Index to optimize searches by activity type
CREATE INDEX idx_tickets_activity
ON support.tickets (activity_type);

-- Index to speed up status-based queries
CREATE INDEX idx_tickets_status
ON support.tickets (status);

-- Index to support date range queries
CREATE INDEX idx_tickets_opened_at
ON support.tickets (opened_at);