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
    user_id integer NOT NULL,
    number_of_guesses integer NOT NULL
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
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1128, 1, 9);
INSERT INTO public.games VALUES (1129, 28, 184);
INSERT INTO public.games VALUES (1130, 28, 734);
INSERT INTO public.games VALUES (1131, 29, 486);
INSERT INTO public.games VALUES (1132, 29, 159);
INSERT INTO public.games VALUES (1133, 28, 556);
INSERT INTO public.games VALUES (1134, 28, 987);
INSERT INTO public.games VALUES (1135, 28, 472);
INSERT INTO public.games VALUES (1136, 30, 735);
INSERT INTO public.games VALUES (1137, 30, 167);
INSERT INTO public.games VALUES (1138, 31, 976);
INSERT INTO public.games VALUES (1139, 31, 69);
INSERT INTO public.games VALUES (1140, 30, 649);
INSERT INTO public.games VALUES (1141, 30, 83);
INSERT INTO public.games VALUES (1142, 30, 330);
INSERT INTO public.games VALUES (1143, 32, 365);
INSERT INTO public.games VALUES (1144, 32, 1000);
INSERT INTO public.games VALUES (1145, 33, 328);
INSERT INTO public.games VALUES (1146, 33, 374);
INSERT INTO public.games VALUES (1147, 32, 321);
INSERT INTO public.games VALUES (1148, 32, 247);
INSERT INTO public.games VALUES (1149, 32, 891);
INSERT INTO public.games VALUES (1150, 34, 53);
INSERT INTO public.games VALUES (1151, 34, 648);
INSERT INTO public.games VALUES (1152, 35, 373);
INSERT INTO public.games VALUES (1153, 35, 613);
INSERT INTO public.games VALUES (1154, 34, 721);
INSERT INTO public.games VALUES (1155, 34, 296);
INSERT INTO public.games VALUES (1156, 34, 274);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Octavio');
INSERT INTO public.users VALUES (2, 'user_1674202220660');
INSERT INTO public.users VALUES (3, 'user_1674202220659');
INSERT INTO public.users VALUES (4, 'user_1674202733455');
INSERT INTO public.users VALUES (5, 'user_1674202733454');
INSERT INTO public.users VALUES (6, 'user_1674202900431');
INSERT INTO public.users VALUES (7, 'user_1674202900430');
INSERT INTO public.users VALUES (8, 'user_1674203030558');
INSERT INTO public.users VALUES (9, 'user_1674203030557');
INSERT INTO public.users VALUES (10, 'user_1674203772052');
INSERT INTO public.users VALUES (11, 'user_1674203772051');
INSERT INTO public.users VALUES (12, 'user_1674204197995');
INSERT INTO public.users VALUES (13, 'user_1674204197994');
INSERT INTO public.users VALUES (14, 'user_1674204382440');
INSERT INTO public.users VALUES (15, 'user_1674204382439');
INSERT INTO public.users VALUES (16, 'user_1674235229962');
INSERT INTO public.users VALUES (17, 'user_1674235229961');
INSERT INTO public.users VALUES (18, 'user_1674235318689');
INSERT INTO public.users VALUES (19, 'user_1674235318688');
INSERT INTO public.users VALUES (20, 'user_1674235412316');
INSERT INTO public.users VALUES (21, 'user_1674235412315');
INSERT INTO public.users VALUES (22, 'user_1674235527687');
INSERT INTO public.users VALUES (23, 'user_1674235527686');
INSERT INTO public.users VALUES (24, 'user_1674236061780');
INSERT INTO public.users VALUES (25, 'user_1674236061779');
INSERT INTO public.users VALUES (26, 'user_1674236200418');
INSERT INTO public.users VALUES (27, 'user_1674236200417');
INSERT INTO public.users VALUES (28, 'user_1674244764353');
INSERT INTO public.users VALUES (29, 'user_1674244764352');
INSERT INTO public.users VALUES (30, 'user_1674245076807');
INSERT INTO public.users VALUES (31, 'user_1674245076806');
INSERT INTO public.users VALUES (32, 'user_1674245150148');
INSERT INTO public.users VALUES (33, 'user_1674245150147');
INSERT INTO public.users VALUES (34, 'user_1674245191618');
INSERT INTO public.users VALUES (35, 'user_1674245191617');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 1156, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 35, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

