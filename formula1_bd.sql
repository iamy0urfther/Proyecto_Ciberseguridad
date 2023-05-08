--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

-- Started on 2023-05-07 21:48:44

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
-- TOC entry 3328 (class 1262 OID 16388)
-- Name: Formula1_CRUD; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Formula1_CRUD" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "Formula1_CRUD" OWNER TO postgres;

\connect "Formula1_CRUD"

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16412)
-- Name: pilotos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pilotos (
    id integer NOT NULL,
    nombrecompleto character varying(40) NOT NULL,
    apellido character varying(40) NOT NULL,
    equipo character varying(40) NOT NULL
);

INSERT INTO pilotos (id, nombrecompleto,apellido,equipo)VALUES ('1','Checo','Perez','redbull');
INSERT INTO pilotos (id, nombrecompleto,apellido,equipo)VALUES ('2','Fernando','Alonso','AstonMartin');
INSERT INTO pilotos (id, nombrecompleto,apellido,equipo)VALUES ('3','Max','Verstappen','redbull');


ALTER TABLE public.pilotos OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16411)
-- Name: pilotos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pilotos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pilotos_id_seq OWNER TO postgres;

--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 214
-- Name: pilotos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pilotos_id_seq OWNED BY public.pilotos.id;


--
-- TOC entry 3176 (class 2604 OID 16415)
-- Name: pilotos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pilotos ALTER COLUMN id SET DEFAULT nextval('public.pilotos_id_seq'::regclass);


--
-- TOC entry 3322 (class 0 OID 16412)
-- Dependencies: 215
-- Data for Name: pilotos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pilotos (id, nombrecompleto, apellido, equipo) FROM stdin;
\.


--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 214
-- Name: pilotos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pilotos_id_seq', 7, true);


--
-- TOC entry 3178 (class 2606 OID 16417)
-- Name: pilotos pilotos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pilotos
    ADD CONSTRAINT pilotos_pkey PRIMARY KEY (id);


-- Completed on 2023-05-07 21:48:44

--
-- PostgreSQL database dump complete
--

