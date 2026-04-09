-- Audit table to track changes on tickets

CREATE TABLE support.ticket_audit (
    audit_id SERIAL PRIMARY KEY,
    ticket_id INT,
    operation_type VARCHAR(10), -- INSERT, UPDATE, DELETE
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    old_status VARCHAR(20),
    new_status VARCHAR(20)
);

-- Function to log ticket changes
CREATE OR REPLACE FUNCTION support.log_ticket_changes()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        INSERT INTO support.ticket_audit
        (ticket_id, operation_type, old_status, new_status)
        VALUES
        (OLD.ticket_id, TG_OP, OLD.status, NEW.status);
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to call audit function on updates
CREATE TRIGGER trg_ticket_audit
AFTER UPDATE ON support.tickets
FOR EACH ROW
EXECUTE FUNCTION support.log_ticket_changes();