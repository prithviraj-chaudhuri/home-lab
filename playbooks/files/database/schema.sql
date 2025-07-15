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


-- SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET idle_in_transaction_session_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SELECT pg_catalog.set_config('search_path', '', false);
-- SET check_function_bodies = false;
-- SET xmloption = content;
-- SET client_min_messages = warning;
-- SET row_security = off;

-- SET default_table_access_method = heap;

-- --
-- -- Name: passenger; Type: TABLE; Schema: public; Owner: -
-- --

-- CREATE TABLE public.passenger (
--     passengerid integer NOT NULL,
--     survived double precision,
--     pclass integer,
--     name text,
--     sex text,
--     age double precision,
--     sibsp integer,
--     parch integer,
--     ticket text,
--     fare double precision,
--     cabin text,
--     embarked text,
--     wikiid double precision,
--     name_wiki text,
--     age_wiki double precision,
--     hometown text,
--     boarded text,
--     destination text,
--     lifeboat text,
--     body text,
--     class integer
-- );

-- INSERT INTO public.passenger
-- (passengerid, survived, pclass, name, sex, age, sibsp, parch, ticket, fare,
--  cabin, embarked, wikiid, name_wiki, age_wiki, hometown, boarded, destination,
--  lifeboat, body, class)
-- VALUES
-- (1, 0, 3, 'Braund, Mr. Owen Harris', 'male', 22, 1, 0, 'A/5 21171', 7.25,
--  NULL, 'S', 691, 'Braund, Mr. Owen Harris', 22, 'Bridgerule, Devon, England', 'Southampton',
--  'Qu''Appelle Valley, Saskatchewan, Canada', NULL, NULL, 3),

-- (2, 1, 1, 'Cumings, Mrs. John Bradley (Florence Briggs Thayer)', 'female', 38, 1, 0,
--  'PC 17599', 71.2833, 'C85', 'C', 90, 'Cumings, Mrs. Florence Briggs (née Thayer)',
--  35, 'New York, New York, US', 'Cherbourg', 'New York, New York, US', '4', NULL, 1),

-- (3, 1, 3, 'Heikkinen, Miss. Laina', 'female', 26, 0, 0, 'STON/O2. 3101282', 7.925,
--  NULL, 'S', 865, 'Heikkinen, Miss Laina', 26, 'Jyväskylä, Finland', 'Southampton',
--  'New York City', '14?', NULL, 3),

-- (4, 1, 1, 'Futrelle, Mrs. Jacques Heath (Lily May Peel)', 'female', 35, 1, 0,
--  '113803', 53.1, 'C123', 'S', 127, 'Futrelle, Mrs. Lily May (née Peel)',
--  35, 'Scituate, Massachusetts, US', 'Southampton', 'Scituate, Massachusetts, US',
--  'D', NULL, 1),

-- (5, 0, 3, 'Allen, Mr. William Henry', 'male', 35, 0, 0, '373450', 8.05,
--  NULL, 'S', 627, 'Allen, Mr. William Henry', 35, 'Birmingham, West Midlands, England',
--  'Southampton', 'New York City', NULL, NULL, 3),

-- (6, 0, 3, 'Moran, Mr. James', 'male', NULL, 0, 0, '330877', 8.4583,
--  NULL, 'Q', 785, 'Doherty, Mr. William John (aka "James Moran")', 22,
--  'Cork, Ireland', 'Queenstown', 'New York City', NULL, NULL, 3),

-- (7, 0, 1, 'McCarthy, Mr. Timothy J', 'male', 54, 0, 0, '17463', 51.8625,
--  'E46', 'S', 200, 'McCarthy, Mr. Timothy J.', 54, 'Dorchester, Massachusetts, US',
--  'Southampton', 'Dorchester, Massachusetts, US', NULL, '175MB', 1),

-- (8, 0, 3, 'Palsson, Master. Gosta Leonard', 'male', 2, 3, 1, '349909', 21.075,
--  NULL, 'S', 1108, 'Pålsson, Master Gösta Leonard', 2, 'Bjuv, Skåne, Sweden',
--  'Southampton', 'Chicago, Illinois, US', NULL, NULL, 3),

-- (9, 1, 3, 'Johnson, Mrs. Oscar W (Elisabeth Vilhelmina Berg)', 'female', 27, 0, 2,
--  '347742', 11.1333, NULL, 'S', 902, 'Johnson, Mrs. Elisabeth Vilhelmina (née Berg)',
--  26, 'St. Charles, Illinois, US', 'Southampton', 'St. Charles, Illinois, US',
--  '15', NULL, 3),

-- (10, 1, 2, 'Nasser, Mrs. Nicholas (Adele Achem)', 'female', 14, 1, 0, '237736',
--  30.0708, NULL, 'C', 520, 'Nassr Allah, Mrs. Adal (née Akim)[62][77]', 14,
--  'Zahlé, Lebanon, Ottoman Empire', 'Cherbourg', 'Cleveland, Ohio, US', '?', NULL, 2),

-- (11, 1, 3, 'Sandstrom, Miss. Marguerite Rut', 'female', 4, 1, 1, 'PP 9549',
--  16.7, 'G6', 'S', 1193, 'Sandström, Miss Marguerite Rut', 4,
--  'Motala, Östergötland, Sweden', 'Southampton', 'San Francisco, US', '13', NULL, 3),

-- (12, 1, 1, 'Bonnell, Miss. Elizabeth', 'female', 58, 0, 0, '113783', 26.55,
--  'C103', 'S', 35, 'Bonnell, Miss Elizabeth', 61, 'Youngstown, Ohio, US',
--  'Southampton', 'Youngstown, Ohio, US', '8', NULL, 1),

-- (13, 0, 3, 'Saundercock, Mr. William Henry', 'male', 20, 0, 0, 'A/5. 2151',
--  8.05, NULL, 'S', 1196, 'Saundercock, Mr. William Henry', 19,
--  'St Austell, Cornwall, England', 'Southampton', 'New York City', NULL, NULL, 3),

-- (14, 0, 3, 'Andersson, Mr. Anders Johan', 'male', 39, 1, 5, '347082',
--  31.275, NULL, 'S', 632, 'Andersson, Mr. Anders Johan', 39,
--  'Kisa, Östergötland, Sweden', 'Southampton', 'Winnipeg, Manitoba, Canada', NULL, NULL, 3),

-- (15, 0, 3, 'Vestrom, Miss. Hulda Amanda Adolfina', 'female', 14, 0, 0, '350406',
--  7.8542, NULL, 'S', 1286, 'Veström, Miss Hulda Amanda Adolfina', 14,
--  'Salmunds, Gotland, Sweden', 'Southampton', 'Los Angeles, US', NULL, NULL, 3),

-- (16, 1, 2, 'Hewlett, Mrs. (Mary D Kingcome)', 'female', 55, 0, 0, '248706',
--  16, NULL, 'S', 446, 'Hewlett, Mrs. Mary Dunbar (née Kingcome)', 56,
--  'Lucknow, British India, UK[note 3]', 'Southampton', 'Rapid City, South Dakota, US',
--  '13', NULL, 2),

-- (17, 0, 3, 'Rice, Master. Eugene', 'male', 2, 4, 1, '382652',
--  29.125, NULL, 'Q', 1151, 'Rice, Master Eugene Francis', 2,
--  'Athlone, Westmeath, Ireland', 'Queenstown', 'Spokane, Washington, US', NULL, NULL, 3),

-- (18, 1, 2, 'Williams, Mr. Charles Eugene', 'male', NULL, 0, 0, '244373',
--  13, NULL, 'S', 604, 'Williams, Mr. Charles Eugene', 23,
--  'Harrow, London, England', 'Southampton', 'Chicago, Illinois, US',
--  '14', NULL, 2),

-- (19, 0, 3, 'Vander Planke, Mrs. Julius (Emelia Maria Vandemoortele)', 'female', 31,
--  1, 0, '345763', 18, NULL, 'S', 1280,
--  'Vanderplancke, Mrs. Emelie Maria (née Vandemoortele)', 31,
--  'Pittem, Belgium', 'Southampton', 'Fremont, Ohio, US',
--  NULL, NULL, 3);