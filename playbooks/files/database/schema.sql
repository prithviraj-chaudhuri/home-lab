-- Database: home-lab

-- DROP DATABASE IF EXISTS "home-lab";

-- CREATE DATABASE "home-lab"
--     WITH
--     OWNER = "ansible-user"
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'en_US.utf8'
--     LC_CTYPE = 'en_US.utf8'
--     LOCALE_PROVIDER = 'libc'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;

-- Database: resume-builder

-- DROP DATABASE IF EXISTS "resume-builder";

-- CREATE DATABASE "resume-builder"
--     WITH
--     OWNER = "ansible-user"
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'en_US.utf8'
--     LC_CTYPE = 'en_US.utf8'
--     LOCALE_PROVIDER = 'libc'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1
--     IS_TEMPLATE = False;

-- USE "resume-builder";

-- CREATE EXTENSION IF NOT EXISTS vector;

-- CREATE TABLE documents (
--     id SERIAL PRIMARY KEY,
--     text TEXT NOT NULL,
--     embedding vector(1538) -- vector data
-- );

-- ALTER TABLE IF EXISTS public.documents
--     ADD COLUMN metadata character varying(256);

-- CREATE INDEX ON documents USING hnsw (embedding vector_cosine_ops);