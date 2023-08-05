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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    u_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    u_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_u_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_u_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_u_id_seq OWNER TO freecodecamp;

--
-- Name: users_u_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_u_id_seq OWNED BY public.users.u_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users u_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN u_id SET DEFAULT nextval('public.users_u_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 300, 1);
INSERT INTO public.games VALUES (2, 617, 1);
INSERT INTO public.games VALUES (3, 254, 2);
INSERT INTO public.games VALUES (4, 104, 2);
INSERT INTO public.games VALUES (5, 960, 1);
INSERT INTO public.games VALUES (6, 523, 1);
INSERT INTO public.games VALUES (7, 885, 1);
INSERT INTO public.games VALUES (8, 14, 3);
INSERT INTO public.games VALUES (9, 825, 4);
INSERT INTO public.games VALUES (10, 195, 4);
INSERT INTO public.games VALUES (11, 954, 5);
INSERT INTO public.games VALUES (12, 613, 5);
INSERT INTO public.games VALUES (13, 901, 4);
INSERT INTO public.games VALUES (14, 860, 4);
INSERT INTO public.games VALUES (15, 678, 4);
INSERT INTO public.games VALUES (16, 12, 3);
INSERT INTO public.games VALUES (17, 440, 7);
INSERT INTO public.games VALUES (18, 760, 7);
INSERT INTO public.games VALUES (19, 810, 8);
INSERT INTO public.games VALUES (20, 519, 8);
INSERT INTO public.games VALUES (21, 368, 7);
INSERT INTO public.games VALUES (22, 367, 7);
INSERT INTO public.games VALUES (23, 173, 7);
INSERT INTO public.games VALUES (24, 978, 9);
INSERT INTO public.games VALUES (25, 886, 9);
INSERT INTO public.games VALUES (26, 217, 10);
INSERT INTO public.games VALUES (27, 290, 10);
INSERT INTO public.games VALUES (28, 832, 9);
INSERT INTO public.games VALUES (29, 4, 9);
INSERT INTO public.games VALUES (30, 801, 9);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1691234667347');
INSERT INTO public.users VALUES (2, 'user_1691234667346');
INSERT INTO public.users VALUES (3, 'dave');
INSERT INTO public.users VALUES (4, 'user_1691234948654');
INSERT INTO public.users VALUES (5, 'user_1691234948653');
INSERT INTO public.users VALUES (6, '1');
INSERT INTO public.users VALUES (7, 'user_1691235111627');
INSERT INTO public.users VALUES (8, 'user_1691235111626');
INSERT INTO public.users VALUES (9, 'user_1691235143961');
INSERT INTO public.users VALUES (10, 'user_1691235143960');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 30, true);


--
-- Name: users_u_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_u_id_seq', 10, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (u_id);


--
-- Name: games games_u_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_u_id_fkey FOREIGN KEY (u_id) REFERENCES public.users(u_id);


--
-- PostgreSQL database dump complete
--

