--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answers; Type: TABLE; Schema: public; Owner: josh
--

CREATE TABLE answers (
    id integer NOT NULL,
    answer character varying(200) NOT NULL,
    question_id integer NOT NULL,
    isanswer boolean NOT NULL
);


ALTER TABLE answers OWNER TO josh;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: josh
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE answers_id_seq OWNER TO josh;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: josh
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: category; Type: TABLE; Schema: public; Owner: josh
--

CREATE TABLE category (
    id integer NOT NULL,
    category_type character varying(30) NOT NULL
);


ALTER TABLE category OWNER TO josh;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: josh
--

CREATE SEQUENCE category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE category_id_seq OWNER TO josh;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: josh
--

ALTER SEQUENCE category_id_seq OWNED BY category.id;


--
-- Name: currency; Type: TABLE; Schema: public; Owner: josh
--

CREATE TABLE currency (
    player_id integer NOT NULL,
    amount integer DEFAULT 1000 NOT NULL
);


ALTER TABLE currency OWNER TO josh;

--
-- Name: game_session; Type: TABLE; Schema: public; Owner: josh
--

CREATE TABLE game_session (
    id integer NOT NULL,
    player_id integer NOT NULL,
    session_start timestamp without time zone DEFAULT now(),
    session_end timestamp without time zone
);


ALTER TABLE game_session OWNER TO josh;

--
-- Name: game_session_id_seq; Type: SEQUENCE; Schema: public; Owner: josh
--

CREATE SEQUENCE game_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE game_session_id_seq OWNER TO josh;

--
-- Name: game_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: josh
--

ALTER SEQUENCE game_session_id_seq OWNED BY game_session.id;


--
-- Name: item_value; Type: TABLE; Schema: public; Owner: josh
--

CREATE TABLE item_value (
    id integer NOT NULL,
    value_amount integer NOT NULL
);


ALTER TABLE item_value OWNER TO josh;

--
-- Name: item_value_id_seq; Type: SEQUENCE; Schema: public; Owner: josh
--

CREATE SEQUENCE item_value_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE item_value_id_seq OWNER TO josh;

--
-- Name: item_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: josh
--

ALTER SEQUENCE item_value_id_seq OWNED BY item_value.id;


--
-- Name: player; Type: TABLE; Schema: public; Owner: josh
--

CREATE TABLE player (
    id integer NOT NULL,
    firstname character varying(25) NOT NULL,
    lastname character varying(30) NOT NULL,
    username character varying(30) NOT NULL,
    password character varying(100) NOT NULL
);


ALTER TABLE player OWNER TO josh;

--
-- Name: player_id_seq; Type: SEQUENCE; Schema: public; Owner: josh
--

CREATE SEQUENCE player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE player_id_seq OWNER TO josh;

--
-- Name: player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: josh
--

ALTER SEQUENCE player_id_seq OWNED BY player.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: josh
--

CREATE TABLE questions (
    id integer NOT NULL,
    question character varying(200) NOT NULL,
    category_id integer,
    value_id integer
);


ALTER TABLE questions OWNER TO josh;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: josh
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE questions_id_seq OWNER TO josh;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: josh
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: josh
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: category id; Type: DEFAULT; Schema: public; Owner: josh
--

ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);


--
-- Name: game_session id; Type: DEFAULT; Schema: public; Owner: josh
--

ALTER TABLE ONLY game_session ALTER COLUMN id SET DEFAULT nextval('game_session_id_seq'::regclass);


--
-- Name: item_value id; Type: DEFAULT; Schema: public; Owner: josh
--

ALTER TABLE ONLY item_value ALTER COLUMN id SET DEFAULT nextval('item_value_id_seq'::regclass);


--
-- Name: player id; Type: DEFAULT; Schema: public; Owner: josh
--

ALTER TABLE ONLY player ALTER COLUMN id SET DEFAULT nextval('player_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: josh
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY answers (id, answer, question_id, isanswer) FROM stdin;
119	JdbcTemplate	30	t
120	DatabaseDrive	30	f
121	ConnectDatabase	30	f
122	Postgres	30	f
123	Setting Port number, Database connection, and other properties	31	t
124	Storing notes	31	f
2	Oracle	6	t
3	IBM	6	f
4	Red Hat	6	f
125	Holding Class Names	31	f
6	Intel	6	f
1	JVM	5	t
7	C++	5	f
8	.Net	5	f
9	Nothing	5	f
10	public static void main(String[] args)	4	t
12	public void main(String arg)	4	f
13	public static void run(String[] args)	4	f
14	public static void start(String[] args)	4	f
15	for() and while()	2	t
16	iterate()	2	f
17	through()	2	f
18	scan()	2	f
20	print()	1	f
21	console.write()	1	f
22	console.log()	1	f
19	System.out.print()	1	t
24	<tbody></tbody>	7	f
25	<thead></thead>	7	f
29	<legend></legend>	8	t
30	<define></define>	8	f
31	<caption></caption>	8	f
32	<h1></h1>	8	f
34	<link>	9	t
35	<source>	9	f
36	<meta>	9	f
38	<style>	9	f
39	body tags	10	f
40	html tags	10	f
41	semantic	10	t
42	non-semantic	10	f
43	<run></run>	11	f
44	<script></script>	11	t
45	<source></source>	11	f
46	<link>	11	f
23	<table></table>	7	f
26	<tr></tr>	7	t
47	{}	12	t
48	[]	12	f
49	<>	12	f
50	()	12	f
51	font-style:	13	f
52	font-color:	13	f
53	color:	13	t
54	font-fill:	13	f
56	stick:	14	f
57	fix:	14	f
58	set:	14	f
55	position:	14	t
59	margin:	15	t
60	space:	15	f
61	border:	15	f
62	set-margin:	15	f
63	Setting a color with transparency.	16	t
64	Setting background color.	16	f
65	Setting font color.	16	f
66	Setting radius of background	16	f
67	Arrow Syntax	17	t
68	Lambda	17	f
69	Array	17	f
70	Go function	17	f
71	stopReload()	18	f
73	noRefresh()	18	f
74	stopDefault()	18	f
72	preventDefault()	18	t
75	jQuery	19	t
76	Angular	19	f
77	Meteor	19	f
78	React	19	f
80	addListener();	20	f
81	onChange();	20	f
82	onClick();	20	f
79	addEventListener();	20	t
83	appendChild();	21	t
84	append();	21	f
85	appendElement();	21	f
86	appendToParent();	21	f
87	<html xmlns:th="http://www.thymeleaf.org">	22	t
88	<!DOCTYPE html>	22	f
89	<thymeleafTemplate/>	22	f
90	<meta xmlns:th="http://www.thymeleaf.org">	22	f
91	text=""	23	f
92	th:text=""	23	t
93	th:insert=""	23	f
94	th:replace=""	23	f
95	th:loop	24	f
96	th:each	24	t
97	th:for	24	f
98	th:while	24	f
99	th:object	25	t
100	th:properties	25	f
101	th:pojo	25	f
102	th:item	25	f
103	They must have a closing tag or self-closing	26	t
104	All tags must be left open.	26	f
105	None of the above	26	f
106	All tags must be in plain text.	26	f
107	@SpringBootApplication	27	t
108	@Boot	27	f
109	@SpringStarter	27	f
110	@RunTime	27	f
111	@PostMapping	28	t
112	@GetMapping	28	f
113	@Post	28	f
114	@Get	28	f
115	String	29	t
116	Integer	29	f
117	Java Object	29	f
118	Boolean	29	f
126	Holding sql queries	31	f
127	.py .pyc	32	t
128	.txt	32	f
129	.python	32	f
130	.run	32	f
131	print()	33	t
132	console()	33	f
133	log()	33	f
134	write()	33	f
135	def <functionName>():	34	t
136	function <functionName>(){}	34	f
137	def <functionName>(){}	34	f
138	method <functionName>(){}	34	f
139	Dictionary	35	f
140	Hash Map	35	f
141	Array List	35	f
142	Set	35	f
143	Linus Torvalds	36	f
144	Bill Gates	36	f
145	Guido van Rossum	36	f
146	Thomas Edison	36	f
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('answers_id_seq', 146, true);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY category (id, category_type) FROM stdin;
1	Java
2	Html
3	Css
4	Python
5	Spring
6	Thymeleaf
7	JavaScript
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('category_id_seq', 7, true);


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY currency (player_id, amount) FROM stdin;
1	1200
2	1000
\.


--
-- Data for Name: game_session; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY game_session (id, player_id, session_start, session_end) FROM stdin;
1	1	2017-04-16 17:43:04.248368	\N
2	1	2017-04-16 17:45:38.371551	\N
3	1	2017-04-16 17:46:39.160443	\N
4	1	2017-04-16 19:32:30.342867	\N
5	1	2017-04-16 19:33:01.620431	\N
6	1	2017-04-16 19:34:19.811906	\N
7	1	2017-04-16 19:34:32.314334	\N
8	1	2017-04-16 19:34:37.700597	\N
9	1	2017-04-16 19:34:41.086731	\N
10	1	2017-04-16 19:34:58.537439	\N
11	1	2017-04-16 19:35:02.168678	\N
12	1	2017-04-16 19:35:13.691767	\N
13	1	2017-04-16 19:35:31.132351	\N
14	1	2017-04-16 19:35:39.65295	\N
15	1	2017-04-16 19:35:45.369935	\N
16	1	2017-04-16 19:35:54.716788	\N
17	1	2017-04-16 19:35:58.7999	\N
18	1	2017-04-16 19:36:07.515434	\N
19	1	2017-04-16 19:36:46.482595	\N
20	1	2017-04-16 19:37:03.07853	\N
21	1	2017-04-16 19:41:09.238799	\N
22	1	2017-04-16 19:41:15.710427	\N
23	1	2017-04-16 19:42:17.073803	\N
24	1	2017-04-16 19:44:41.947329	\N
25	1	2017-04-16 19:44:47.475774	\N
26	1	2017-04-16 19:44:50.756606	\N
27	1	2017-04-16 19:44:55.245198	\N
28	1	2017-04-16 19:44:58.640866	\N
29	1	2017-04-16 19:45:07.138029	\N
30	1	2017-04-16 19:45:19.680054	\N
31	1	2017-04-16 19:45:27.104878	\N
32	1	2017-04-16 19:45:30.597526	\N
33	1	2017-04-16 19:45:35.057018	\N
34	1	2017-04-16 19:45:38.596884	\N
35	1	2017-04-16 19:45:46.787307	\N
36	1	2017-04-16 19:46:49.311587	\N
37	1	2017-04-16 19:47:00.29155	\N
38	1	2017-04-16 19:47:14.442204	\N
39	1	2017-04-16 19:47:18.319272	\N
40	1	2017-04-16 19:47:31.725244	\N
41	1	2017-04-16 19:47:46.109646	\N
42	1	2017-04-16 19:48:51.648652	\N
43	1	2017-04-16 19:48:55.049763	\N
44	1	2017-04-16 19:49:20.632047	\N
45	1	2017-04-16 19:49:26.919732	\N
46	1	2017-04-16 19:49:46.246504	\N
47	1	2017-04-16 19:51:33.245085	\N
48	1	2017-04-16 19:57:10.794481	\N
49	1	2017-04-16 19:57:15.263098	\N
50	1	2017-04-16 19:57:27.576236	\N
51	1	2017-04-16 19:57:46.916657	\N
52	1	2017-04-16 19:57:51.304797	\N
53	1	2017-04-16 19:58:13.860485	\N
54	1	2017-04-16 19:58:28.332428	\N
55	1	2017-04-16 19:58:34.060864	\N
56	1	2017-04-16 19:58:45.607196	\N
57	1	2017-04-16 19:58:50.957995	\N
58	1	2017-04-16 19:59:08.428905	\N
59	1	2017-04-16 20:00:54.47921	\N
60	1	2017-04-16 20:03:42.886617	\N
61	1	2017-04-16 20:15:43.913293	\N
62	1	2017-04-16 22:24:26.069348	\N
63	1	2017-04-16 22:25:21.278892	\N
64	1	2017-04-17 00:25:33.317461	\N
65	1	2017-04-17 00:26:29.96931	\N
66	1	2017-04-17 00:26:56.195178	\N
67	1	2017-04-17 00:27:48.350542	\N
68	1	2017-04-17 00:28:17.801372	\N
69	1	2017-04-17 00:29:39.687581	\N
70	1	2017-04-17 00:30:23.653894	\N
71	1	2017-04-17 00:30:35.147024	\N
\.


--
-- Name: game_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('game_session_id_seq', 71, true);


--
-- Data for Name: item_value; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY item_value (id, value_amount) FROM stdin;
1	100
2	200
3	300
4	400
5	500
6	600
7	700
8	800
9	900
10	1000
\.


--
-- Name: item_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('item_value_id_seq', 10, true);


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY player (id, firstname, lastname, username, password) FROM stdin;
1	Ted	Bundy	tb1234	tb1234
2	Demo	Demo	Demo	Demo
\.


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('player_id_seq', 2, true);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY questions (id, question, category_id, value_id) FROM stdin;
1	This is how you would make things show in the console. 	1	2
2	This is how you would iterate through something.	1	4
4	You need this to start a java application.	1	8
7	This tag is used to declare a row in a table.	2	2
8	This tag defines a caption for the <fieldset> element.	2	4
9	This is where you declare you styling sheet	2	8
10	<form>, <table>, and <article> are examples of.	2	10
11	The element that contains scripting statements.	2	6
12	You would use me to wrap all of the styling of a element in.	3	2
13	This is used to change the color of font.	3	4
18	This is how you would prevent a page from reloading.	7	4
19	A framework that uses $ to select elements.	7	6
20	To add a listener to an element on a page you would use this function.	7	8
21	To add an element to an element you would use this.	7	10
22	This needs to be inserted at the top of a html page	6	2
25	I would be use to call only the property name of an Object	6	8
26	All tag must be what when using Thymeleaf.	6	10
27	I am needed in the Class with the Main method to work.	5	2
28	This Annotation allows you to send and receive data at specific URLs	5	4
30	When connecting to a Database you might use what class.	5	8
31	Application.properties can be good for what.	5	10
32	The file extension.	4	2
34	The proper way to make a function is.	4	6
35	An item that holds keys and values.	4	8
36	The person who Developed it.	4	10
5	The environment is need to run an application.	1	10
3	Connecting a Class to another Class without making a new instance.	5	6
6	The company that maintains Java is known as who.	1	6
14	What Styling tag would you use to fix an Element to a certain place.	3	6
15	To add space between two elements you would add...	3	8
16	rgba() can be used for what...	3	10
17	what is this an example of ()=>	7	2
23	This would be used to insert text into an element.	6	4
24	You would use this to loop through an Array of objects in a Html page.	6	6
29	A method that is used to load a page must return what type of object.	5	6
33	To show output in the console you would use.	4	4
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('questions_id_seq', 36, true);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: game_session game_session_pkey; Type: CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY game_session
    ADD CONSTRAINT game_session_pkey PRIMARY KEY (id);


--
-- Name: item_value item_value_pkey; Type: CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY item_value
    ADD CONSTRAINT item_value_pkey PRIMARY KEY (id);


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: answers_id_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX answers_id_unique ON answers USING btree (id);


--
-- Name: category_category_type_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX category_category_type_unique ON category USING btree (category_type);


--
-- Name: category_id_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX category_id_unique ON category USING btree (id);


--
-- Name: currency_play_id_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX currency_play_id_unique ON currency USING btree (player_id);


--
-- Name: game_session_id_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX game_session_id_unique ON game_session USING btree (id);


--
-- Name: item_value_id_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX item_value_id_unique ON item_value USING btree (id);


--
-- Name: item_value_value_amount_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX item_value_value_amount_unique ON item_value USING btree (value_amount);


--
-- Name: player_id_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX player_id_unique ON player USING btree (id);


--
-- Name: questions_id_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX questions_id_unique ON questions USING btree (id);


--
-- Name: questions_question_unique; Type: INDEX; Schema: public; Owner: josh
--

CREATE UNIQUE INDEX questions_question_unique ON category USING btree (category_type);


--
-- Name: answers answers_questions_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_questions_id_fk FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- Name: currency currency_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_player_id_fkey FOREIGN KEY (player_id) REFERENCES player(id);


--
-- Name: game_session game_session_player_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY game_session
    ADD CONSTRAINT game_session_player_id_fk FOREIGN KEY (player_id) REFERENCES player(id);


--
-- Name: questions questions_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_category_id_fkey FOREIGN KEY (category_id) REFERENCES category(id);


--
-- Name: questions questions_item_value_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: josh
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_item_value_id_fk FOREIGN KEY (value_id) REFERENCES item_value(id);


--
-- PostgreSQL database dump complete
--

