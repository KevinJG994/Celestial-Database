--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Kevin Jimenez', 1, 4);
INSERT INTO public.users VALUES ('user_1724199740932', 2, 17);
INSERT INTO public.users VALUES ('user_1724199740933', 5, 176);
INSERT INTO public.users VALUES ('user_1724200469014', 2, 742);
INSERT INTO public.users VALUES ('user_1724199792465', 2, 512);
INSERT INTO public.users VALUES ('user_1724200469015', 5, 74);
INSERT INTO public.users VALUES ('user_1724199792466', 5, 318);
INSERT INTO public.users VALUES ('user_1724199851991', 2, 481);
INSERT INTO public.users VALUES ('user_1724199851992', 5, 183);
INSERT INTO public.users VALUES ('user_1724200612684', 2, 33);
INSERT INTO public.users VALUES ('user_1724199948366', 2, 243);
INSERT INTO public.users VALUES ('user_1724200612685', 5, 25);
INSERT INTO public.users VALUES ('user_1724199948367', 5, 291);
INSERT INTO public.users VALUES ('user_1724199985042', 2, 54);
INSERT INTO public.users VALUES ('user_1724199985043', 5, 345);
INSERT INTO public.users VALUES ('user_1724200654125', 2, 583);
INSERT INTO public.users VALUES ('user_1724199987720', 2, 596);
INSERT INTO public.users VALUES ('user_1724200654126', 5, 315);
INSERT INTO public.users VALUES ('user_1724199987721', 5, 148);
INSERT INTO public.users VALUES ('user_1724200038672', 2, 363);
INSERT INTO public.users VALUES ('user_1724200038673', 5, 260);
INSERT INTO public.users VALUES ('', 1, 17);
INSERT INTO public.users VALUES ('user_1724200819762', 2, 201);
INSERT INTO public.users VALUES ('user_1724200283875', 2, 441);
INSERT INTO public.users VALUES ('user_1724200819763', 5, 46);
INSERT INTO public.users VALUES ('pepe', 3, 8);
INSERT INTO public.users VALUES ('user_1724200283876', 5, 12);
INSERT INTO public.users VALUES ('user_1724201032255', 2, 53);
INSERT INTO public.users VALUES ('user_1724201032256', 5, 487);
INSERT INTO public.users VALUES ('user_1724201169211', 2, 61);
INSERT INTO public.users VALUES ('user_1724201169212', 5, 157);
INSERT INTO public.users VALUES ('user_1724201179562', 2, 150);
INSERT INTO public.users VALUES ('user_1724201179563', 5, 58);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

