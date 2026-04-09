CREATE TABLE support.tickets (
    ticket_id SERIAL PRIMARY KEY,
    site_name VARCHAR(50) NOT NULL,
    activity_type VARCHAR(60) NOT NULL,
    opened_at TIMESTAMP NOT NULL,
    closed_at TIMESTAMP,
    useful_hours NUMERIC(5,2),
    status VARCHAR(20) NOT NULL
);