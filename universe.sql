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
-- Name: exploration; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.exploration (
    exploration_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mission_description text,
    launch_date date NOT NULL,
    mission_status character varying(50) NOT NULL
);


ALTER TABLE public.exploration OWNER TO freecodecamp;

--
-- Name: exploration_exploration_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.exploration_exploration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exploration_exploration_id_seq OWNER TO freecodecamp;

--
-- Name: exploration_exploration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.exploration_exploration_id_seq OWNED BY public.exploration.exploration_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    num_stars integer NOT NULL,
    is_observable boolean NOT NULL,
    distance_from_earth numeric
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    radius numeric,
    is_inhabitable boolean NOT NULL,
    has_atmosphere boolean NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    num_moons integer NOT NULL,
    size integer,
    is_habitable boolean NOT NULL
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    num_planets integer NOT NULL,
    temperature numeric,
    is_sun boolean NOT NULL
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
-- Name: exploration exploration_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration ALTER COLUMN exploration_id SET DEFAULT nextval('public.exploration_exploration_id_seq'::regclass);


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
-- Data for Name: exploration; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.exploration VALUES (1, 'Mars Mission 1', 'First exploration of Mars surface', '2025-03-15', 'Planned');
INSERT INTO public.exploration VALUES (2, 'Saturn Probe', 'A mission to study Saturn’s rings', '2027-06-01', 'Ongoing');
INSERT INTO public.exploration VALUES (3, 'Jupiter Flyby', 'A flyby mission to capture Jupiter’s atmosphere and moons', '2024-09-21', 'Completed');
INSERT INTO public.exploration VALUES (4, 'Moon Exploration', 'Lunar surface study and sample collection', '2026-05-05', 'Planned');
INSERT INTO public.exploration VALUES (5, 'Venus Lander', 'Sending a lander to Venus to study its surface', '2028-12-12', 'Planned');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000, true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000, true, 2500000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 1000000, true, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 500000000, true, 3000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 100000000, true, 5000000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 200000000, true, 4000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737.1, false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11.2, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6.2, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 3, 1821.6, false, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 1560.8, false, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 2634.1, false, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 2410.3, false, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 2575, false, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 764.6, false, false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 4, 252.1, false, true);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 1353.4, false, true);
INSERT INTO public.moon VALUES (12, 'Miranda', 8, 235.8, false, false);
INSERT INTO public.moon VALUES (13, 'Ariel', 8, 578.9, false, false);
INSERT INTO public.moon VALUES (14, 'Umbriel', 8, 584.7, false, false);
INSERT INTO public.moon VALUES (15, 'Titania', 8, 788.4, false, false);
INSERT INTO public.moon VALUES (16, 'Oberon', 8, 761.4, false, false);
INSERT INTO public.moon VALUES (17, 'Luna', 10, 5200, false, false);
INSERT INTO public.moon VALUES (18, 'Coruscant', 12, 1200, true, true);
INSERT INTO public.moon VALUES (19, 'Pandora', 11, 500, true, true);
INSERT INTO public.moon VALUES (21, 'Europea', 2, 1560, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 12742, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, 6779, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 79, 139820, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 82, 116460, false);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 0, 12104, false);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 0, 4879, false);
INSERT INTO public.planet VALUES (7, 'Neptune', 1, 14, 49528, false);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 27, 50724, false);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 2, 1, 12400, true);
INSERT INTO public.planet VALUES (10, 'Gliese 581g', 3, 1, 12000, true);
INSERT INTO public.planet VALUES (11, 'Proxima b', 6, 0, 11300, true);
INSERT INTO public.planet VALUES (12, 'LHS 1140 b', 5, 0, 22000, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 8, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 5, 9940, false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 4, 5790, false);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 2, 3500, false);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 3, 3042, false);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 7, 11000, false);


--
-- Name: exploration_exploration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.exploration_exploration_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: exploration exploration_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration
    ADD CONSTRAINT exploration_mission_name_key UNIQUE (name);


--
-- Name: exploration exploration_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.exploration
    ADD CONSTRAINT exploration_pkey PRIMARY KEY (exploration_id);


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

