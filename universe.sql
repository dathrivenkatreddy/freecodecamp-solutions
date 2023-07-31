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
-- Name: connect; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.connect (
    connect_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.connect OWNER TO freecodecamp;

--
-- Name: connect_con_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.connect_con_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connect_con_id_seq OWNER TO freecodecamp;

--
-- Name: connect_con_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.connect_con_id_seq OWNED BY public.connect.connect_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age integer NOT NULL,
    size numeric(4,1),
    description text,
    active boolean,
    spiral boolean
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
    name character varying(60) NOT NULL,
    radius numeric(4,1),
    distance_from_planet numeric(4,1),
    description text,
    habitable boolean,
    tidal_locked boolean,
    planet_id integer
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
    name character varying(60) NOT NULL,
    radius numeric(4,1) NOT NULL,
    distance_from_star numeric(4,1),
    description text,
    inhabited boolean,
    has_water boolean,
    star_id integer
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
    name character varying(60) NOT NULL,
    age integer NOT NULL,
    mass numeric(4,1),
    description text,
    habitable boolean,
    supernova boolean,
    galaxy_id integer
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
-- Name: connect connect_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.connect ALTER COLUMN connect_id SET DEFAULT nextval('public.connect_con_id_seq'::regclass);


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
-- Data for Name: connect; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.connect VALUES (1, 'hello', 1);
INSERT INTO public.connect VALUES (2, 'world', 2);
INSERT INTO public.connect VALUES (3, 'sike', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'Milky Way', 1000, 100.4, 'Our home Galaxy', true, true);
INSERT INTO public.galaxy VALUES (7, 'Milky Way2', 1000, 100.4, 'Our home Galaxy', true, true);
INSERT INTO public.galaxy VALUES (8, 'Milky Way3', 1000, 100.4, 'Our home Galaxy', true, true);
INSERT INTO public.galaxy VALUES (9, 'Milky Way4', 1000, 100.4, 'Our home Galaxy', true, true);
INSERT INTO public.galaxy VALUES (10, 'Milky Way5', 1000, 100.4, 'Our home Galaxy', true, true);
INSERT INTO public.galaxy VALUES (11, 'Milky Way6', 1000, 100.4, 'Our home Galaxy', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 152.6, 656.6, 'moon burh', true, false, 2);
INSERT INTO public.moon VALUES (2, 'moon2', 152.6, 656.6, 'moon burh', true, false, 3);
INSERT INTO public.moon VALUES (3, 'moon3', 152.6, 656.6, 'moon burh', true, false, 4);
INSERT INTO public.moon VALUES (4, 'moon4', 152.6, 656.6, 'moon burh', true, false, 4);
INSERT INTO public.moon VALUES (5, 'moon5', 152.6, 656.6, 'moon burh', true, false, 4);
INSERT INTO public.moon VALUES (6, 'moon6', 152.6, 656.6, 'moon burh', true, false, 4);
INSERT INTO public.moon VALUES (7, 'moon7', 152.6, 656.6, 'moon burh', true, false, 4);
INSERT INTO public.moon VALUES (8, 'moon8', 152.6, 656.6, 'moon burh', true, false, 4);
INSERT INTO public.moon VALUES (9, 'moon9', 152.6, 656.6, 'moon burh', true, false, 4);
INSERT INTO public.moon VALUES (10, 'moon10', 152.6, 656.6, 'moon burh', true, false, 4);
INSERT INTO public.moon VALUES (11, 'moon11', 152.6, 656.6, 'moon burh', true, false, 6);
INSERT INTO public.moon VALUES (12, 'moon12', 152.6, 656.6, 'moon burh', true, false, 6);
INSERT INTO public.moon VALUES (13, 'moon13', 152.6, 656.6, 'moon burh', true, false, 6);
INSERT INTO public.moon VALUES (14, 'moon14', 152.6, 656.6, 'moon burh', true, false, 6);
INSERT INTO public.moon VALUES (15, 'moon15', 152.6, 656.6, 'moon burh', true, false, 6);
INSERT INTO public.moon VALUES (16, 'moon16', 152.6, 656.6, 'moon burh', true, false, 6);
INSERT INTO public.moon VALUES (17, 'moon17', 152.6, 656.6, 'moon burh', true, false, 6);
INSERT INTO public.moon VALUES (18, 'moon18', 152.6, 656.6, 'moon burh', true, false, 6);
INSERT INTO public.moon VALUES (19, 'moon19', 152.6, 656.6, 'moon burh', true, false, 6);
INSERT INTO public.moon VALUES (20, 'moon20', 152.6, 656.6, 'moon burh', true, false, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 123.3, 123.4, '3rd planet', true, true, 2);
INSERT INTO public.planet VALUES (3, 'Earth2', 123.3, 123.4, '3rd planet', true, true, 3);
INSERT INTO public.planet VALUES (4, 'Earth3', 123.3, 123.4, '3rd planet', true, true, 4);
INSERT INTO public.planet VALUES (5, 'Earth4', 123.3, 123.4, '3rd planet', true, true, 5);
INSERT INTO public.planet VALUES (6, 'Earth5', 123.3, 123.4, '3rd planet', true, true, 6);
INSERT INTO public.planet VALUES (7, 'Earth6', 123.3, 123.4, '3rd planet', true, true, 7);
INSERT INTO public.planet VALUES (8, 'Earth7', 123.3, 123.4, '3rd planet', true, true, 2);
INSERT INTO public.planet VALUES (9, 'Earth8', 123.3, 123.4, '3rd planet', true, true, 3);
INSERT INTO public.planet VALUES (10, 'Earth9', 123.3, 123.4, '3rd planet', true, true, 4);
INSERT INTO public.planet VALUES (11, 'Earth10', 123.3, 123.4, '3rd planet', true, true, 5);
INSERT INTO public.planet VALUES (12, 'Earth11', 123.3, 123.4, '3rd planet', true, true, 6);
INSERT INTO public.planet VALUES (13, 'Earth12', 123.3, 123.4, '3rd planet', true, true, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'sun', 100, 100.3, 'close star', false, true, 6);
INSERT INTO public.star VALUES (3, 'sun2', 100, 100.3, 'close star', false, true, 7);
INSERT INTO public.star VALUES (4, 'sun3', 100, 100.3, 'close star', false, true, 8);
INSERT INTO public.star VALUES (5, 'sun4', 100, 100.3, 'close star', false, true, 9);
INSERT INTO public.star VALUES (6, 'sun5', 100, 100.3, 'close star', false, true, 10);
INSERT INTO public.star VALUES (7, 'sun6', 100, 100.3, 'close star', false, true, 11);


--
-- Name: connect_con_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.connect_con_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: connect connect_age_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.connect
    ADD CONSTRAINT connect_age_key UNIQUE (age);


--
-- Name: connect connect_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.connect
    ADD CONSTRAINT connect_pkey PRIMARY KEY (connect_id);


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

