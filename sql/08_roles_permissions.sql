-- Create roles for access control

-- Read-only role (e.g., reporting users)
CREATE ROLE support_readonly;

-- Operational role (can read and insert data)
CREATE ROLE support_operator;

-- Grant schema usage
GRANT USAGE ON SCHEMA support TO support_readonly;
GRANT USAGE ON SCHEMA support TO support_operator;

-- Grant permissions on tables
GRANT SELECT ON ALL TABLES IN SCHEMA support
TO support_readonly;

GRANT SELECT, INSERT, UPDATE ON support.tickets
TO support_operator;

-- Ensure future tables get permissions automatically
ALTER DEFAULT PRIVILEGES IN SCHEMA support
GRANT SELECT ON TABLES TO support_readonly;

ALTER DEFAULT PRIVILEGES IN SCHEMA support
GRANT SELECT, INSERT, UPDATE ON TABLES
TO support_operator;