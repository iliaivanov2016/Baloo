CREATE USER baloo WITH PASSWORD 'Gblfhfcs!6';
GRANT ALL PRIVILEGES ON DATABASE baloo_db TO baloo;
ALTER DATABASE baloo_db OWNER TO baloo;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR NULL DEFAULT NULL,
                       email VARCHAR NULL DEFAULT NULL,
                       phone VARCHAR NULL DEFAULT NULL,
                       password VARCHAR NULL DEFAULT NULL,
                       is_admin BIT DEFAULT 0::BIT,
                       created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);
CREATE INDEX ON users(created);
CREATE UNIQUE INDEX ON users(email);
CREATE UNIQUE INDEX ON users(phone);
CREATE UNIQUE INDEX ON users(name);

ALTER USER baloo WITH PASSWORD 'your_new_secure_password';

-- 2. Grant usage on the public schema
GRANT USAGE ON SCHEMA public TO baloo;

-- 3. Grant all privileges on the users table specifically
GRANT ALL PRIVILEGES ON TABLE users TO baloo;

-- 4. (Optional but highly recommended) Grant access to sequences
-- This prevents errors when 'baloo' tries to insert new rows with auto-incrementing IDs
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA public TO baloo;
