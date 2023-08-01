--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    distance_from_earth_in_milions_of_light_years numeric(8,5) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    does_it_shine boolean,
    owned_by_humans boolean
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
    name character varying(30) NOT NULL,
    has_life boolean,
    radius_in_km integer NOT NULL,
    rotation_period_in_days numeric(8,2) NOT NULL,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    does_it_shine boolean
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
-- Name: worm_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.worm_hole (
    galaxy_id integer NOT NULL,
    worm_hole_id integer NOT NULL,
    int1 integer,
    int2 integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.worm_hole OWNER TO freecodecamp;

--
-- Name: worm_hole_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.worm_hole_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worm_hole_hole_id_seq OWNER TO freecodecamp;

--
-- Name: worm_hole_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.worm_hole_hole_id_seq OWNED BY public.worm_hole.worm_hole_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


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
-- Name: worm_hole worm_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole ALTER COLUMN worm_hole_id SET DEFAULT nextval('public.worm_hole_hole_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Very beautiful galaxy!', true, 0.00000);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Very beautiful galaxy!', true, 0.02500);
INSERT INTO public.galaxy VALUES (3, 'Draco II', 'Very beautiful galaxy!', true, 0.07010);
INSERT INTO public.galaxy VALUES (4, 'Tucana III', 'Very beautiful galaxy!', true, 0.07470);
INSERT INTO public.galaxy VALUES (5, 'Segue 1', 'Very beautiful galaxy!', true, 0.07500);
INSERT INTO public.galaxy VALUES (6, 'Hydrus 1', 'Very beautiful galaxy!', true, 0.09000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, false, true);
INSERT INTO public.moon VALUES (2, 'Iapetus', 6, false, false);
INSERT INTO public.moon VALUES (3, 'Titan', 6, false, false);
INSERT INTO public.moon VALUES (4, 'Miranda', 7, false, false);
INSERT INTO public.moon VALUES (5, 'Encelandus', 6, false, false);
INSERT INTO public.moon VALUES (6, 'Umbriel', 6, false, false);
INSERT INTO public.moon VALUES (7, 'Oberon', 6, false, false);
INSERT INTO public.moon VALUES (8, 'Io', 5, false, false);
INSERT INTO public.moon VALUES (9, 'Tritone', 8, false, false);
INSERT INTO public.moon VALUES (10, 'Ganymede', 5, false, false);
INSERT INTO public.moon VALUES (11, 'Europa', 5, false, false);
INSERT INTO public.moon VALUES (12, 'Fake moon 1', 1, true, true);
INSERT INTO public.moon VALUES (13, 'Fake moon 2', 2, true, true);
INSERT INTO public.moon VALUES (14, 'Fake moon 3', 3, true, true);
INSERT INTO public.moon VALUES (15, 'Fake moon 4', 4, true, true);
INSERT INTO public.moon VALUES (16, 'Fake moon 5', 5, true, true);
INSERT INTO public.moon VALUES (17, 'Fake moon 6', 6, true, true);
INSERT INTO public.moon VALUES (18, 'Fake moon 7', 7, true, true);
INSERT INTO public.moon VALUES (19, 'Fake moon 8', 8, true, true);
INSERT INTO public.moon VALUES (20, 'Fake moon 9', 9, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', false, 6051, 243.01, 1);
INSERT INTO public.planet VALUES (1, 'Mercury', false, 2439, 58.65, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 6378, 0.99, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 3393, 1.03, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 71492, 0.41, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 60268, 0.43, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 25559, 0.75, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 24764, 0.80, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 1150, 0.27, 1);
INSERT INTO public.planet VALUES (10, 'Fake_1', true, 1000, 1.00, 1);
INSERT INTO public.planet VALUES (11, 'Fake_2', true, 2000, 2.00, 1);
INSERT INTO public.planet VALUES (12, 'Fake_3', true, 3000, 3.00, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'A very beautiful star!', true);
INSERT INTO public.star VALUES (2, 'Antares', 1, 'A very beautiful star!', true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'A very beautiful star!', true);
INSERT INTO public.star VALUES (4, 'KW Sagittarii', 1, 'A very beautiful star!', true);
INSERT INTO public.star VALUES (5, 'Ky Sygni', 1, 'A very beautiful star!', true);
INSERT INTO public.star VALUES (6, 'UI Scuti', 1, 'A very beautiful star!', true);


--
-- Data for Name: worm_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.worm_hole VALUES (1, 1, 1, 2, 'GRS 1124-683');
INSERT INTO public.worm_hole VALUES (1, 2, 1, 2, 'A0620-00');
INSERT INTO public.worm_hole VALUES (1, 3, 1, 2, 'Cygnys X-1');


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 6, true);


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
-- Name: worm_hole_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.worm_hole_hole_id_seq', 3, true);


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
-- Name: worm_hole worm_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole
    ADD CONSTRAINT worm_hole_name_key UNIQUE (name);


--
-- Name: worm_hole worm_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole
    ADD CONSTRAINT worm_hole_pkey PRIMARY KEY (worm_hole_id);


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
-- Name: worm_hole worm_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.worm_hole
    ADD CONSTRAINT worm_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

