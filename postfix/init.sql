CREATE TABLE IF NOT EXISTS virtual_domains (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS virtual_users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    domain_id INTEGER NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    CONSTRAINT fk_domain
        FOREIGN KEY (domain_id)
        REFERENCES virtual_domains(id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS virtual_aliases (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    domain_id INT NOT NULL,
    source TEXT NOT NULL,
    destination TEXT NOT NULL,
    CONSTRAINT fk_domain
        FOREIGN KEY (domain_id)
        REFERENCES virtual_domains(id)
        ON DELETE CASCADE
);
