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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    composition text NOT NULL,
    size integer NOT NULL,
    is_potentially_hazardous boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.asteroid ALTER COLUMN asteroid_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.asteroid_asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    number_of_stars integer NOT NULL,
    age_in_billions numeric NOT NULL,
    is_spiral boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    planet_id bigint NOT NULL,
    diameter integer NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    star_id bigint NOT NULL,
    distance_from_star integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id bigint NOT NULL,
    mass integer NOT NULL,
    is_main_sequence boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (1, 'Ceres', 'rocky', 946, false);
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (2, 'Pallas', 'rocky', 512, false);
INSERT INTO public.asteroid OVERRIDING SYSTEM VALUE VALUES (3, 'Vesta', 'rocky', 525, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 100000, 13.51, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 1000000, 10.0, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 40000, 10.0, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Whirlpool', 100000, 6.0, true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Sombrero', 80000, 9.0, false);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Pinwheel', 100000, 13.2, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 1, 3474, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 2, 22, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 2, 12, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Europa', 3, 3121, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Ganymede', 3, 5268, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Callisto', 3, 4820, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Io', 3, 3643, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Titan', 4, 5150, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Rhea', 4, 1528, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Iapetus', 4, 1469, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Dione', 4, 1123, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Tethys', 4, 1062, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Enceladus', 4, 504, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Mimas', 4, 396, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Miranda', 5, 471, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Ariel', 5, 1158, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Umbriel', 5, 1169, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Titania', 5, 1578, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Oberon', 5, 1523, false);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Triton', 6, 2706, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Earth', 1, 149600, true);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Mars', 1, 227900, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Jupiter', 1, 778500, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Kepler-22b', 2, 600000, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Gliese 581g', 3, 20000, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'HD 209458 b', 4, 70000, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Tau Ceti e', 5, 110000, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, '55 Cancri e', 6, 41000, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'TRAPPIST-1d', 1, 39000, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'GJ 1214 b', 2, 13000, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'HD 189733 b', 3, 63000, false);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'WASP-12b', 4, 23000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, 1989, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Sirius', 2, 4023, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Betelgeuse', 3, 1400, false);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Rigel', 4, 2100, false);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Vega', 5, 2020, true);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Proxima Centauri', 6, 144, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

