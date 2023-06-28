CREATE TABLE IF NOT EXISTS config (id INTEGER PRIMARY KEY, name TEXT, value TEXT);

INSERT INTO
    config (id, name, value)
VALUES
    (1, 'server-key', 'fake-key'),
    (13, 'server-host', 'fake-host');