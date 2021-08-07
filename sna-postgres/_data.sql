--
-- PostgreSQL database cluster dump
--

-- Started on 2021-08-06 16:34:22 EDT

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE admin;
ALTER ROLE admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION NOBYPASSRLS PASSWORD 'md5f6fdffe48c908deb0f4c3bd36c032e72';
CREATE ROLE brent;
ALTER ROLE brent WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE "sna-db-user";
ALTER ROLE "sna-db-user" WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5c3f4b7eafbaca29e0cb3febef404bb03';






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-08-06 16:34:22 EDT

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

-- Completed on 2021-08-06 16:34:22 EDT

--
-- PostgreSQL database dump complete
--

--
-- Database "brent" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-08-06 16:34:22 EDT

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
-- TOC entry 3244 (class 1262 OID 16385)
-- Name: brent; Type: DATABASE; Schema: -; Owner: brent
--

CREATE DATABASE brent WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE brent OWNER TO brent;

\connect brent

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

-- Completed on 2021-08-06 16:34:23 EDT

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-08-06 16:34:23 EDT

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

-- Completed on 2021-08-06 16:34:23 EDT

--
-- PostgreSQL database dump complete
--

--
-- Database "sna" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

-- Started on 2021-08-06 16:34:23 EDT

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
-- TOC entry 3288 (class 1262 OID 16387)
-- Name: sna; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE sna WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE sna OWNER TO postgres;

\connect sna

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
-- TOC entry 206 (class 1259 OID 16571)
-- Name: NetworkProvider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."NetworkProvider" (
    "NetworkId" integer NOT NULL,
    "ProviderId" integer NOT NULL
);


ALTER TABLE public."NetworkProvider" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16396)
-- Name: Networks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Networks" (
    "NetworkId" integer NOT NULL,
    "Name" text NOT NULL
);


ALTER TABLE public."Networks" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16399)
-- Name: Network_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Networks" ALTER COLUMN "NetworkId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Network_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 200 (class 1259 OID 16388)
-- Name: Providers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Providers" (
    "ProviderId" integer NOT NULL,
    "Name" text
);


ALTER TABLE public."Providers" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16391)
-- Name: Provider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Providers" ALTER COLUMN "ProviderId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Provider_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 204 (class 1259 OID 16455)
-- Name: old_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.old_customers (
    "CustomerId" integer NOT NULL,
    "Name" text NOT NULL
);


ALTER TABLE public.old_customers OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16463)
-- Name: customers_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.old_customers ALTER COLUMN "CustomerId" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."customers_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3282 (class 0 OID 16571)
-- Dependencies: 206
-- Data for Name: NetworkProvider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."NetworkProvider" ("NetworkId", "ProviderId") FROM stdin;
1	1
2	1
1	2
1	3
1	5
1	6
\.


--
-- TOC entry 3278 (class 0 OID 16396)
-- Dependencies: 202
-- Data for Name: Networks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Networks" ("NetworkId", "Name") FROM stdin;
1	Network Uno
2	Network Dos
3	Network Tres
4	Network Numero Quatro
\.


--
-- TOC entry 3276 (class 0 OID 16388)
-- Dependencies: 200
-- Data for Name: Providers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Providers" ("ProviderId", "Name") FROM stdin;
1	Dr. Brent
2	Dr, Knop
3	Dr. Foo
4	Dr. Bar
5	Dr. 6c656
6	Dr. ffbf4
\.


--
-- TOC entry 3280 (class 0 OID 16455)
-- Dependencies: 204
-- Data for Name: old_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.old_customers ("CustomerId", "Name") FROM stdin;
1	Oscar Health
2	United Healthcare
\.


--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 203
-- Name: Network_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Network_id_seq"', 4, true);


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 201
-- Name: Provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Provider_id_seq"', 6, true);


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 205
-- Name: customers_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."customers_Id_seq"', 1, false);


--
-- TOC entry 3141 (class 2606 OID 16575)
-- Name: NetworkProvider PK_NetworkProvider_NetworkId_ProviderId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NetworkProvider"
    ADD CONSTRAINT "PK_NetworkProvider_NetworkId_ProviderId" PRIMARY KEY ("NetworkId", "ProviderId");


--
-- TOC entry 3137 (class 2606 OID 16557)
-- Name: Networks PK_Networks_NetworkId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Networks"
    ADD CONSTRAINT "PK_Networks_NetworkId" PRIMARY KEY ("NetworkId");


--
-- TOC entry 3135 (class 2606 OID 16565)
-- Name: Providers PK_Providers_ProviderId; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Providers"
    ADD CONSTRAINT "PK_Providers_ProviderId" PRIMARY KEY ("ProviderId");


--
-- TOC entry 3139 (class 2606 OID 16462)
-- Name: old_customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.old_customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY ("CustomerId");


--
-- TOC entry 3142 (class 1259 OID 16576)
-- Name: fki_FK_NetworkProvider_Networks_NetworkId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_NetworkProvider_Networks_NetworkId" ON public."NetworkProvider" USING btree ("NetworkId");


--
-- TOC entry 3143 (class 1259 OID 16577)
-- Name: fki_FK_NetworkProvider_Providers_ProviderId; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_FK_NetworkProvider_Providers_ProviderId" ON public."NetworkProvider" USING btree ("ProviderId");


--
-- TOC entry 3144 (class 2606 OID 16578)
-- Name: NetworkProvider FK_NetworkProvider_Networks_NetworkId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NetworkProvider"
    ADD CONSTRAINT "FK_NetworkProvider_Networks_NetworkId" FOREIGN KEY ("NetworkId") REFERENCES public."Networks"("NetworkId") NOT VALID;


--
-- TOC entry 3145 (class 2606 OID 16583)
-- Name: NetworkProvider FK_NetworkProvider_Providers_ProviderId; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."NetworkProvider"
    ADD CONSTRAINT "FK_NetworkProvider_Providers_ProviderId" FOREIGN KEY ("ProviderId") REFERENCES public."Providers"("ProviderId") NOT VALID;


--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE "NetworkProvider"; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."NetworkProvider" TO "sna-db-user";


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE "Networks"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."Networks" TO "sna-db-user";


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 203
-- Name: SEQUENCE "Network_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Network_id_seq" TO "sna-db-user";


--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE "Providers"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public."Providers" TO "sna-db-user";


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 201
-- Name: SEQUENCE "Provider_id_seq"; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public."Provider_id_seq" TO "sna-db-user";


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE old_customers; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.old_customers TO "sna-db-user";


-- Completed on 2021-08-06 16:34:23 EDT

--
-- PostgreSQL database dump complete
--

-- Completed on 2021-08-06 16:34:23 EDT

--
-- PostgreSQL database cluster dump complete
--

