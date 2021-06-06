--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-06-04 15:43:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 16396)
-- Name: express_users; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA express_users;


ALTER SCHEMA express_users OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 16415)
-- Name: users; Type: TABLE; Schema: express_users; Owner: postgres
--

CREATE TABLE express_users.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(50),
    first_name character varying(50),
    last_name character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE express_users.users OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16413)
-- Name: users_id_seq; Type: SEQUENCE; Schema: express_users; Owner: postgres
--

CREATE SEQUENCE express_users.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE express_users.users_id_seq OWNER TO postgres;

--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 201
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: express_users; Owner: postgres
--

ALTER SEQUENCE express_users.users_id_seq OWNED BY express_users.users.id;


--
-- TOC entry 2851 (class 2604 OID 16418)
-- Name: users id; Type: DEFAULT; Schema: express_users; Owner: postgres
--

ALTER TABLE ONLY express_users.users ALTER COLUMN id SET DEFAULT nextval('express_users.users_id_seq'::regclass);


--
-- TOC entry 2985 (class 0 OID 16415)
-- Dependencies: 202
-- Data for Name: users; Type: TABLE DATA; Schema: express_users; Owner: postgres
--

COPY express_users.users (id, email, password, first_name, last_name, created_at, updated_at) FROM stdin;
3	johndoe@gmail.com	315eb115d98fcbad39ffc5edebd669c9	John	Doe	2021-06-04 15:16:11.489722	2021-06-04 15:16:11.489722
4	janedoe@gmail.com	315eb115d98fcbad39ffc5edebd669c9	Jane	Doe	2021-06-04 15:21:54.385256	2021-06-04 15:21:54.385256
\.


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 201
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: express_users; Owner: postgres
--

SELECT pg_catalog.setval('express_users.users_id_seq', 4, true);


--
-- TOC entry 2853 (class 2606 OID 16420)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: express_users; Owner: postgres
--

ALTER TABLE ONLY express_users.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2021-06-04 15:43:13

--
-- PostgreSQL database dump complete
--

