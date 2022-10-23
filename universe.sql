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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation_type text,
    abbreviation character varying(8),
    named_stars character varying(40)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_const_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_const_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_const_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_const_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_const_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(40),
    galaxy_types text,
    diameter integer,
    distance_from_earth_ly integer,
    year_of_discovery numeric
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
    name character varying(30) NOT NULL,
    distance_from_earth_ly integer,
    year_of_discovery integer,
    diameter numeric,
    planet_id integer NOT NULL
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
    distance_from_earth_ly integer,
    planet_type text,
    has_life boolean,
    is_spherical boolean,
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
    constellation character varying(40),
    star_types text,
    diameter integer,
    distance_fromearth_ly integer,
    year_of_discovery numeric,
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_const_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'uiosarn', 'laeorinv', 'abb', 'aoieunv');
INSERT INTO public.constellation VALUES (2, 'yzarn', 'laeorinv', 'abb', 'aoieunv');
INSERT INTO public.constellation VALUES (3, 'pzarn', 'laeorinv', 'abb', 'aoieunv');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 'nearist', -7, 0, NULL);
INSERT INTO public.galaxy VALUES (2, 'Large magellanic Cloud', 'Dorado/Mensa', 'nearist', -7, 0, NULL);
INSERT INTO public.galaxy VALUES (3, 'Small magellanic Cloud', 'Tucana', 'nearist', 3, 200, NULL);
INSERT INTO public.galaxy VALUES (4, 'Adndromeda', 'Andromeda', 'nearist', 3, 3, NULL);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Triangulum', 'nearist', 6, 3, NULL);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Centaurus', 'nearist', 7, 13, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'qoiuer', 8, 2007, 7, 1);
INSERT INTO public.moon VALUES (2, 'jaioiro', 1, 2002, 7, 2);
INSERT INTO public.moon VALUES (3, 'qweoiro', 5, 2000, 8, 3);
INSERT INTO public.moon VALUES (4, 'qiwyrvno', 6, 1980, 9, 4);
INSERT INTO public.moon VALUES (5, 'lerzer', 8, 1970, 3, 5);
INSERT INTO public.moon VALUES (6, 'zemsdr', 9, 1983, 3, 6);
INSERT INTO public.moon VALUES (8, 'qweror', 10, 1993, 3, 6);
INSERT INTO public.moon VALUES (10, 'uiryor', 10, 1993, 3, 1);
INSERT INTO public.moon VALUES (11, 'umbdr', 13, 1993, 3, 5);
INSERT INTO public.moon VALUES (12, 'fdhbdr', 13, 1993, 3, 6);
INSERT INTO public.moon VALUES (13, 'ghhbdr', 13, 1993, 3, 4);
INSERT INTO public.moon VALUES (14, 'ghhbdlkjhgfaserr', 13, 1993, 3, 3);
INSERT INTO public.moon VALUES (16, 'gerr', 13, 1993, 3, 4);
INSERT INTO public.moon VALUES (17, 'wererr', 13, 1993, 3, 4);
INSERT INTO public.moon VALUES (19, 'qiwtm', 13, 1993, 3, 6);
INSERT INTO public.moon VALUES (20, 'qnaez', 13, 1993, 3, 6);
INSERT INTO public.moon VALUES (21, 'oerez', 13, 1999, 3, 5);
INSERT INTO public.moon VALUES (22, 'xxrez', 13, 1999, 3, 5);
INSERT INTO public.moon VALUES (23, 'bxmz', 13, 1999, 3, 5);
INSERT INTO public.moon VALUES (24, 'iuwnvq', 14, 2004, 3, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'eian', 80, 'markus', false, true, 1);
INSERT INTO public.planet VALUES (2, 'zian', 30, 'lauss', false, true, 2);
INSERT INTO public.planet VALUES (3, 'nian', 90, 'btens', false, true, 3);
INSERT INTO public.planet VALUES (4, 'mlan', 70, 'klens', false, true, 4);
INSERT INTO public.planet VALUES (5, 'flan', 20, 'vlbns', false, true, 5);
INSERT INTO public.planet VALUES (6, 'qban', 10, 'gzbns', false, true, 6);
INSERT INTO public.planet VALUES (8, 'oqwuln', 10, 'gzbns', false, true, 1);
INSERT INTO public.planet VALUES (9, 'wuln', 10, 'gzbns', false, true, 4);
INSERT INTO public.planet VALUES (10, 'piuuln', 10, 'gzbns', false, true, 4);
INSERT INTO public.planet VALUES (11, 'iuuln', 10, 'gzbns', false, true, 4);
INSERT INTO public.planet VALUES (12, 'qweuln', 10, 'gzbns', false, true, 4);
INSERT INTO public.planet VALUES (13, 'aisn', 10, 'gzbns', false, true, 4);
INSERT INTO public.planet VALUES (14, 'polsn', 10, 'gzbns', false, true, 5);
INSERT INTO public.planet VALUES (15, 'pogln', 10, 'gzbns', false, true, 3);
INSERT INTO public.planet VALUES (16, 'nalsp', 10, 'gzbns', false, true, 2);
INSERT INTO public.planet VALUES (17, 'xalwp', 10, 'jzbns', false, true, 2);
INSERT INTO public.planet VALUES (18, 'ealcp', 10, 'jzbns', false, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'lorem', 'ipsum', 'token', 8, 1, 2000, 1);
INSERT INTO public.star VALUES (2, 'liraoio', 'ipsum', 'token', 8, 1, 2000, 3);
INSERT INTO public.star VALUES (3, 'aoio', 'eirsum', 'token', 87, 56, 20, 2);
INSERT INTO public.star VALUES (4, 'aloio', 'ebsum', 'token', 7, 6, 120, 4);
INSERT INTO public.star VALUES (5, 'alhqieo', 'ntsim', 'token', 17, 8, 10, 5);
INSERT INTO public.star VALUES (6, 'alrdqieo', 'nzaim', 'token', 13, 6, 9, 6);


--
-- Name: constellation_const_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_const_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_namee_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_namee_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: moon moon_planet_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey1 FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star__id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star__id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- Name: star star_galaxy_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey1 FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

