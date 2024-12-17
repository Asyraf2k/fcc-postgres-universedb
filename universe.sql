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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_sun integer,
    tail_length integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    size numeric,
    has_blackhole boolean NOT NULL,
    discovered boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    diameter bigint,
    has_water boolean NOT NULL,
    is_habitable boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    radius numeric NOT NULL,
    population bigint NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    mass numeric,
    age bigint,
    is_visible boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Swift-Tuttle', 1, 16);
INSERT INTO public.comet VALUES (2, 'Encke', 0, 6);
INSERT INTO public.comet VALUES (3, 'Biela', 3, 8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Whirlpool', 'A grand spiral galaxy located in the constellation Canes Venatici', 100000, true, true);
INSERT INTO public.galaxy VALUES (2, 'Sombrero', 'A spiral galaxy with a prominent dust lane located in the Virgo cluster', 80000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'An elliptical galaxy in the Virgo Cluster with a supermassive black hole at its center', 120000, true, true);
INSERT INTO public.galaxy VALUES (18, 'Milky Way', 'Our home galaxy, a barred spiral galaxy', 105700, true, true);
INSERT INTO public.galaxy VALUES (19, 'Andromeda', 'Nearest major galaxy to the Milky Way', 220000, true, true);
INSERT INTO public.galaxy VALUES (20, 'Triangulum', 'Third-largest galaxy in the Local Group', 60000, false, true);
INSERT INTO public.galaxy VALUES (21, 'Whirlpool Galaxy', 'Spiral galaxy in Canes Venatici constellation', 130000, false, true);
INSERT INTO public.galaxy VALUES (22, 'Sombrero Galaxy', 'Spiral galaxy in Virgo constellation', 30000, false, true);
INSERT INTO public.galaxy VALUES (23, 'Messier 877', 'Giant elliptical galaxy in the Virgo Cluster', 120000, true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Europa', 1, 3121, true, true);
INSERT INTO public.moon VALUES (2, 'Ganymede', 1, 5268, false, false);
INSERT INTO public.moon VALUES (3, 'Titan', 2, 5150, true, false);
INSERT INTO public.moon VALUES (23, 'Moon', 25, 3474, true, true);
INSERT INTO public.moon VALUES (24, 'Phobos', 26, 22, false, false);
INSERT INTO public.moon VALUES (25, 'Deimos', 26, 12, false, false);
INSERT INTO public.moon VALUES (26, 'Io', 27, 3643, true, false);
INSERT INTO public.moon VALUES (27, 'Europaa', 27, 3121, true, true);
INSERT INTO public.moon VALUES (28, 'Ganymedee', 27, 5262, true, false);
INSERT INTO public.moon VALUES (29, 'Callisto', 27, 4800, true, false);
INSERT INTO public.moon VALUES (30, 'Titan212', 28, 5150, true, true);
INSERT INTO public.moon VALUES (31, 'Rhea', 28, 1528, false, false);
INSERT INTO public.moon VALUES (32, 'Iapetus', 28, 1469, false, false);
INSERT INTO public.moon VALUES (33, 'Mimas', 28, 396, false, false);
INSERT INTO public.moon VALUES (34, 'Enceladus', 28, 504, true, true);
INSERT INTO public.moon VALUES (35, 'Triton', 30, 2706, true, false);
INSERT INTO public.moon VALUES (36, 'Charon', 30, 1212, false, false);
INSERT INTO public.moon VALUES (37, 'Miranda', 30, 471, false, false);
INSERT INTO public.moon VALUES (38, 'Ariel', 30, 1158, false, false);
INSERT INTO public.moon VALUES (39, 'Umbriel', 30, 1170, false, false);
INSERT INTO public.moon VALUES (40, 'Titania', 30, 1578, false, false);
INSERT INTO public.moon VALUES (41, 'Oberon', 30, 1523, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Kepler-22b', 1, 10800, 0, false);
INSERT INTO public.planet VALUES (2, 'HD 209458 b', 2, 13700, 0, false);
INSERT INTO public.planet VALUES (3, 'Gliese 581g', 3, 12000, 0, false);
INSERT INTO public.planet VALUES (25, 'Earth', 1, 6371, 8000000000, true);
INSERT INTO public.planet VALUES (26, 'Mars', 1, 3390, 0, false);
INSERT INTO public.planet VALUES (27, 'Venus', 1, 6052, 0, false);
INSERT INTO public.planet VALUES (28, 'Jupiter', 1, 69911, 0, false);
INSERT INTO public.planet VALUES (29, 'Saturn', 1, 58232, 0, false);
INSERT INTO public.planet VALUES (30, 'Neptune', 1, 24622, 0, false);
INSERT INTO public.planet VALUES (47, 'Mercury', 1, 2439, 0, false);
INSERT INTO public.planet VALUES (48, 'Uranus', 1, 25362, 0, false);
INSERT INTO public.planet VALUES (49, 'Pluto', 1, 1188, 0, false);
INSERT INTO public.planet VALUES (50, 'Kepler-222b', 2, 12000, 0, false);
INSERT INTO public.planet VALUES (51, 'Proxima b', 2, 7000, 0, false);
INSERT INTO public.planet VALUES (52, 'Kepler-10c', 2, 10000, 0, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 1, 2000, 800000000, true);
INSERT INTO public.star VALUES (2, 'Rigel', 2, 2100, 700000000, true);
INSERT INTO public.star VALUES (3, 'Antares', 3, 1900, 500000000, false);
INSERT INTO public.star VALUES (7, 'Sun', 1, 1989000000000000000000000000000, 4600000000, true);
INSERT INTO public.star VALUES (8, 'Alpha Centauri A', 1, 2100000000000000000000000000000, 5000000000, true);
INSERT INTO public.star VALUES (9, 'Betelgeuseee', 1, 20000000000000000000000000000000, 10000000, true);
INSERT INTO public.star VALUES (10, 'Siriusss', 1, 2020000000000000000000000000000, 200000000, true);
INSERT INTO public.star VALUES (11, 'Proximaaa Centauri', 1, 250000000000000000000000000000, 4900000000, true);
INSERT INTO public.star VALUES (12, 'Vegaaa', 2, 2100000000000000000000000000000, 430000000, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 23, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 41, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 52, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


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

