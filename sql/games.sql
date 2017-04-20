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
1	2000
8	8400
2	45400
6	1000
7	1000
\.


--
-- Data for Name: game_session; Type: TABLE DATA; Schema: public; Owner: josh
--

COPY game_session (id, player_id, session_start, session_end) FROM stdin;
357	7	2017-04-19 22:23:51.373267	\N
358	2	2017-04-19 22:28:40.165033	\N
359	2	2017-04-19 22:30:21.245954	\N
360	2	2017-04-19 22:30:45.971932	\N
361	2	2017-04-19 22:32:06.397935	\N
362	8	2017-04-19 22:33:08.361151	\N
363	8	2017-04-19 22:38:19.465714	\N
364	8	2017-04-19 22:39:12.227564	\N
365	8	2017-04-19 22:39:18.644024	\N
366	8	2017-04-19 22:39:27.731998	\N
367	8	2017-04-19 22:39:38.210661	\N
368	8	2017-04-19 22:39:43.4801	\N
369	8	2017-04-19 22:40:06.822884	\N
370	8	2017-04-19 22:40:14.297592	\N
371	8	2017-04-19 22:40:27.752302	\N
372	8	2017-04-19 22:40:30.414253	\N
373	8	2017-04-19 22:40:58.363676	\N
374	8	2017-04-19 22:41:38.047032	\N
375	8	2017-04-19 22:41:44.520344	\N
376	8	2017-04-19 22:41:52.981085	\N
377	8	2017-04-19 22:42:01.438463	\N
378	8	2017-04-19 22:42:07.895548	\N
379	8	2017-04-19 22:42:20.38464	\N
380	8	2017-04-19 22:43:05.170474	\N
381	8	2017-04-19 22:43:17.052669	\N
382	8	2017-04-19 22:43:52.710918	\N
383	8	2017-04-19 22:44:20.307443	\N
384	8	2017-04-19 22:44:28.776462	\N
385	8	2017-04-19 22:45:02.421633	\N
386	8	2017-04-19 22:45:07.061817	\N
387	2	2017-04-19 22:46:41.740387	\N
388	8	2017-04-19 22:49:02.529676	\N
389	8	2017-04-19 22:49:11.003057	\N
390	8	2017-04-19 22:49:13.424554	\N
391	8	2017-04-19 22:49:15.848515	\N
392	8	2017-04-19 22:49:19.285155	\N
393	8	2017-04-19 22:49:27.724042	\N
394	8	2017-04-19 22:49:38.238478	\N
395	8	2017-04-19 22:49:42.881996	\N
396	8	2017-04-19 22:49:49.067352	\N
397	8	2017-04-19 22:50:06.601379	\N
398	8	2017-04-19 22:50:22.104397	\N
399	8	2017-04-19 22:50:35.594866	\N
400	8	2017-04-19 22:51:06.633957	\N
401	8	2017-04-19 22:51:08.617465	\N
402	8	2017-04-19 22:51:12.041501	\N
403	8	2017-04-19 22:51:20.542884	\N
404	8	2017-04-19 22:51:50.070308	\N
405	8	2017-04-19 22:51:56.519874	\N
406	8	2017-04-19 22:52:03.959675	\N
407	8	2017-04-19 22:52:11.408821	\N
408	8	2017-04-19 22:52:37.989477	\N
409	8	2017-04-19 22:52:40.398556	\N
410	8	2017-04-19 22:52:49.479078	\N
411	8	2017-04-19 22:52:55.9255	\N
412	8	2017-04-19 22:53:14.465461	\N
413	8	2017-04-19 22:53:33.006917	\N
414	8	2017-04-19 22:53:42.47625	\N
415	8	2017-04-19 22:53:54.01915	\N
416	8	2017-04-19 22:53:58.984111	\N
417	8	2017-04-19 22:54:17.531348	\N
418	8	2017-04-19 22:54:22.983933	\N
419	2	2017-04-19 22:54:34.277224	\N
420	8	2017-04-19 22:56:14.11221	\N
421	8	2017-04-19 22:56:20.565965	\N
422	8	2017-04-19 22:56:26.016719	\N
423	8	2017-04-19 22:56:31.44117	\N
424	8	2017-04-19 22:56:37.899238	\N
425	8	2017-04-19 22:56:45.342384	\N
426	8	2017-04-19 22:56:54.806925	\N
427	8	2017-04-19 22:57:01.245815	\N
428	8	2017-04-19 22:58:12.158219	\N
429	8	2017-04-19 22:58:34.834757	\N
430	8	2017-04-19 22:59:03.942938	\N
431	8	2017-04-19 22:59:13.415826	\N
432	8	2017-04-19 23:00:07.171933	\N
433	8	2017-04-19 23:01:04.954426	\N
434	8	2017-04-19 23:02:20.895972	\N
435	8	2017-04-19 23:02:24.328325	\N
436	8	2017-04-19 23:02:41.900869	\N
437	8	2017-04-19 23:03:04.396856	\N
438	8	2017-04-19 23:03:09.833269	\N
439	8	2017-04-19 23:03:21.304036	\N
440	8	2017-04-19 23:04:13.052244	\N
441	8	2017-04-19 23:04:18.500986	\N
442	8	2017-04-19 23:04:38.039423	\N
443	8	2017-04-19 23:04:45.501183	\N
444	8	2017-04-19 23:04:50.935449	\N
445	8	2017-04-19 23:05:00.397106	\N
446	8	2017-04-19 23:05:25.984494	\N
447	2	2017-04-19 23:05:27.35615	\N
448	8	2017-04-19 23:06:33.878843	\N
449	8	2017-04-19 23:06:45.35628	\N
450	8	2017-04-19 23:06:48.784727	\N
451	8	2017-04-19 23:07:35.503781	\N
452	2	2017-04-19 23:08:05.87671	\N
453	8	2017-04-19 23:08:45.496389	\N
454	2	2017-04-19 23:08:53.483053	\N
455	8	2017-04-19 23:09:17.079333	\N
456	8	2017-04-19 23:09:20.315108	\N
457	8	2017-04-19 23:09:39.627916	\N
458	8	2017-04-19 23:09:56.143225	\N
459	8	2017-04-19 23:10:42.844059	\N
460	8	2017-04-19 23:10:50.311399	\N
461	8	2017-04-19 23:10:57.755835	\N
462	8	2017-04-19 23:11:20.290856	\N
463	8	2017-04-19 23:11:23.027295	\N
464	8	2017-04-19 23:11:40.830171	\N
465	2	2017-04-19 23:12:14.089026	\N
466	8	2017-04-19 23:13:57.311243	\N
467	8	2017-04-19 23:14:00.731088	\N
468	2	2017-04-19 23:14:07.446365	\N
469	8	2017-04-19 23:14:37.433461	\N
470	2	2017-04-19 23:14:39.702347	\N
471	8	2017-04-19 23:16:44.724495	\N
472	8	2017-04-19 23:16:58.214529	\N
473	2	2017-04-19 23:16:59.797613	\N
474	2	2017-04-19 23:17:04.087926	\N
475	8	2017-04-19 23:17:31.87267	\N
476	8	2017-04-19 23:17:40.358514	\N
477	8	2017-04-19 23:18:57.329889	\N
478	8	2017-04-19 23:19:04.780486	\N
479	8	2017-04-19 23:19:34.349008	\N
480	8	2017-04-19 23:20:11.28689	\N
481	8	2017-04-19 23:20:13.420224	\N
482	8	2017-04-19 23:20:38.980866	\N
483	8	2017-04-19 23:20:48.443904	\N
484	8	2017-04-19 23:21:28.078035	\N
485	8	2017-04-19 23:21:31.506483	\N
486	8	2017-04-19 23:22:54.438046	\N
487	2	2017-04-19 23:23:10.658947	\N
488	8	2017-04-19 23:23:46.15416	\N
489	8	2017-04-19 23:23:51.589165	\N
490	8	2017-04-19 23:24:09.119683	\N
491	8	2017-04-19 23:24:13.558561	\N
492	8	2017-04-19 23:24:15.975127	\N
493	8	2017-04-19 23:24:18.375137	\N
494	8	2017-04-19 23:24:22.811511	\N
495	2	2017-04-19 23:24:25.53934	\N
496	2	2017-04-19 23:24:29.534457	\N
497	8	2017-04-19 23:24:41.347249	\N
498	2	2017-04-19 23:24:41.6638	\N
499	8	2017-04-19 23:25:09.922428	\N
500	2	2017-04-19 23:25:10.397675	\N
501	2	2017-04-19 23:25:13.484612	\N
502	8	2017-04-19 23:25:39.52044	\N
503	8	2017-04-19 23:26:28.275075	\N
504	8	2017-04-19 23:26:31.687155	\N
505	8	2017-04-19 23:26:58.242811	\N
506	8	2017-04-19 23:27:01.682256	\N
507	2	2017-04-19 23:27:08.131734	\N
508	2	2017-04-19 23:27:10.816201	\N
509	8	2017-04-19 23:27:29.345477	\N
510	2	2017-04-19 23:27:39.937833	\N
511	8	2017-04-19 23:27:59.911299	\N
512	8	2017-04-19 23:28:01.340527	\N
513	2	2017-04-19 23:28:02.424106	\N
514	8	2017-04-19 23:28:52.171553	\N
515	8	2017-04-19 23:28:59.538708	\N
516	2	2017-04-19 23:29:02.789083	\N
517	8	2017-04-19 23:29:12.036746	\N
518	2	2017-04-19 23:29:13.081665	\N
519	8	2017-04-19 23:29:24.51891	\N
520	2	2017-04-19 23:29:25.742597	\N
521	8	2017-04-19 23:29:35.041787	\N
522	2	2017-04-19 23:29:37.659501	\N
523	8	2017-04-19 23:29:47.498467	\N
524	2	2017-04-19 23:29:49.946962	\N
525	8	2017-04-19 23:30:46.32208	\N
526	8	2017-04-19 23:31:01.816352	\N
527	8	2017-04-19 23:31:26.433346	\N
528	8	2017-04-19 23:31:55.980309	\N
529	8	2017-04-19 23:31:57.385149	\N
530	8	2017-04-19 23:32:08.872434	\N
531	8	2017-04-19 23:32:13.295481	\N
532	2	2017-04-19 23:32:16.287496	\N
533	8	2017-04-19 23:33:15.11366	\N
534	8	2017-04-19 23:33:20.550212	\N
535	2	2017-04-19 23:33:25.614893	\N
536	8	2017-04-19 23:36:04.022425	\N
537	8	2017-04-19 23:36:06.440976	\N
538	2	2017-04-19 23:36:09.671211	\N
539	8	2017-04-19 23:38:28.779555	\N
540	8	2017-04-19 23:38:31.200425	\N
541	8	2017-04-19 23:39:45.08878	\N
542	8	2017-04-19 23:39:56.591996	\N
543	8	2017-04-19 23:40:12.107585	\N
544	8	2017-04-19 23:40:32.622396	\N
545	8	2017-04-19 23:40:48.142091	\N
546	8	2017-04-19 23:40:56.596849	\N
547	8	2017-04-19 23:41:17.157441	\N
548	8	2017-04-19 23:41:19.563224	\N
549	8	2017-04-19 23:41:41.126994	\N
550	8	2017-04-19 23:41:56.83155	\N
551	8	2017-04-19 23:43:22.969103	\N
552	8	2017-04-19 23:43:41.342601	\N
553	8	2017-04-19 23:43:43.533853	\N
554	2	2017-04-19 23:44:01.009603	\N
555	8	2017-04-19 23:44:51.228475	\N
556	8	2017-04-19 23:45:03.715963	\N
557	8	2017-04-19 23:45:10.156316	\N
558	2	2017-04-19 23:45:11.871888	\N
559	2	2017-04-19 23:45:34.905689	\N
560	8	2017-04-19 23:45:44.878932	\N
561	8	2017-04-19 23:45:50.504077	\N
562	8	2017-04-19 23:46:07.727406	\N
563	8	2017-04-19 23:46:18.18484	\N
564	8	2017-04-19 23:46:26.679148	\N
565	8	2017-04-19 23:46:34.119586	\N
566	8	2017-04-19 23:46:36.519638	\N
567	2	2017-04-19 23:46:38.189356	\N
568	8	2017-04-19 23:48:49.923883	\N
569	8	2017-04-19 23:48:55.346362	\N
570	2	2017-04-19 23:48:58.376166	\N
571	8	2017-04-19 23:49:13.884701	\N
572	2	2017-04-19 23:49:16.706946	\N
573	8	2017-04-19 23:53:51.028741	\N
574	8	2017-04-19 23:53:54.454113	\N
575	8	2017-04-19 23:54:03.911543	\N
576	8	2017-04-19 23:54:07.048895	\N
577	2	2017-04-19 23:54:15.993551	\N
578	8	2017-04-19 23:54:41.57361	\N
579	8	2017-04-19 23:55:17.203795	\N
580	8	2017-04-19 23:55:27.660055	\N
581	8	2017-04-19 23:55:35.098094	\N
582	8	2017-04-19 23:55:39.525474	\N
583	8	2017-04-19 23:55:40.145787	\N
584	8	2017-04-19 23:56:08.147216	\N
585	8	2017-04-19 23:56:10.459139	\N
586	8	2017-04-19 23:56:10.565953	\N
587	8	2017-04-19 23:56:41.181104	\N
588	8	2017-04-19 23:56:45.616878	\N
589	8	2017-04-19 23:56:48.03674	\N
590	8	2017-04-19 23:57:11.608962	\N
591	8	2017-04-19 23:57:18.454513	\N
592	8	2017-04-19 23:57:23.889328	\N
593	8	2017-04-19 23:57:41.415569	\N
594	8	2017-04-19 23:57:47.850917	\N
595	8	2017-04-19 23:57:51.864787	\N
596	8	2017-04-19 23:58:29.54397	\N
597	8	2017-04-19 23:58:31.955858	\N
598	8	2017-04-19 23:58:45.471459	\N
599	8	2017-04-19 23:58:48.457866	\N
600	8	2017-04-19 23:59:21.092707	\N
601	8	2017-04-19 23:59:25.521171	\N
602	8	2017-04-19 23:59:27.573949	\N
603	8	2017-04-20 00:00:54.536798	\N
604	8	2017-04-20 00:00:57.965315	\N
605	8	2017-04-20 00:01:21.104416	\N
606	8	2017-04-20 00:01:30.082535	\N
607	8	2017-04-20 00:02:04.79285	\N
608	8	2017-04-20 00:02:07.202901	\N
609	8	2017-04-20 00:02:11.157667	\N
610	8	2017-04-20 00:02:42.828641	\N
611	8	2017-04-20 00:02:55.313526	\N
612	8	2017-04-20 00:03:00.759029	\N
613	8	2017-04-20 00:03:07.208789	\N
614	8	2017-04-20 00:03:12.639706	\N
615	8	2017-04-20 00:03:31.167995	\N
616	8	2017-04-20 00:03:31.512799	\N
617	8	2017-04-20 00:04:57.123075	\N
618	8	2017-04-20 00:05:06.594673	\N
619	8	2017-04-20 00:05:40.255131	\N
620	8	2017-04-20 00:05:42.866445	\N
621	8	2017-04-20 00:06:15.879055	\N
622	8	2017-04-20 00:06:20.319657	\N
623	8	2017-04-20 00:06:23.871512	\N
624	8	2017-04-20 00:06:35.998112	\N
625	8	2017-04-20 00:07:03.013116	\N
626	8	2017-04-20 00:07:06.363925	\N
627	8	2017-04-20 00:07:06.442637	\N
628	8	2017-04-20 00:08:05.228555	\N
629	8	2017-04-20 00:08:27.769603	\N
630	8	2017-04-20 00:08:32.202477	\N
631	8	2017-04-20 00:08:32.918654	\N
632	8	2017-04-20 00:09:20.936876	\N
633	8	2017-04-20 00:09:21.184682	\N
634	8	2017-04-20 00:09:44.487565	\N
635	8	2017-04-20 00:09:46.635515	\N
636	8	2017-04-20 00:11:08.473992	\N
637	8	2017-04-20 00:11:08.851346	\N
638	8	2017-04-20 00:11:23.981116	\N
639	8	2017-04-20 00:11:26.9497	\N
640	8	2017-04-20 00:11:37.477574	\N
641	8	2017-04-20 00:11:37.733544	\N
642	8	2017-04-20 00:11:48.957331	\N
643	8	2017-04-20 00:12:06.465388	\N
644	8	2017-04-20 00:12:09.8898	\N
645	8	2017-04-20 00:12:20.352972	\N
646	8	2017-04-20 00:12:44.92582	\N
647	8	2017-04-20 00:12:47.335377	\N
648	8	2017-04-20 00:12:51.79111	\N
649	8	2017-04-20 00:13:19.320234	\N
650	8	2017-04-20 00:13:25.763815	\N
651	8	2017-04-20 00:13:30.204836	\N
652	8	2017-04-20 00:13:32.615944	\N
653	8	2017-04-20 00:13:32.804684	\N
654	8	2017-04-20 00:13:50.149247	\N
655	8	2017-04-20 00:13:50.284064	\N
656	8	2017-04-20 00:14:05.645444	\N
657	8	2017-04-20 00:14:06.550451	\N
658	2	2017-04-20 00:14:14.417531	\N
659	2	2017-04-20 00:14:30.299582	\N
660	8	2017-04-20 00:15:06.493176	\N
661	2	2017-04-20 00:15:08.086597	\N
662	2	2017-04-20 00:15:18.22369	\N
663	8	2017-04-20 00:15:30.054691	\N
664	8	2017-04-20 00:15:34.483294	\N
665	2	2017-04-20 00:15:34.557923	\N
666	8	2017-04-20 00:16:47.610128	\N
667	8	2017-04-20 00:16:53.875177	\N
668	8	2017-04-20 00:17:05.341128	\N
669	8	2017-04-20 00:17:09.779122	\N
670	8	2017-04-20 00:17:17.242244	\N
671	2	2017-04-20 00:17:19.235249	\N
672	8	2017-04-20 00:17:47.852422	\N
673	2	2017-04-20 00:17:51.825427	\N
674	8	2017-04-20 00:18:23.487928	\N
675	8	2017-04-20 00:18:26.912798	\N
676	2	2017-04-20 00:18:30.8399	\N
677	8	2017-04-20 00:18:45.569831	\N
678	2	2017-04-20 00:18:50.5009	\N
679	8	2017-04-20 00:18:50.893388	\N
680	8	2017-04-20 00:19:12.418807	\N
681	8	2017-04-20 00:19:15.843123	\N
682	8	2017-04-20 00:19:52.496054	\N
683	8	2017-04-20 00:20:14.069637	\N
\.


--
-- Name: game_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('game_session_id_seq', 683, true);


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
2	Demo	Demo	demo	demo
6	Joshua	OBrian	Testie	Testerson
7	bob	log	123test	123test
8	Laura	Smiggles	lsmiggles12	lsmiggles12
\.


--
-- Name: player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: josh
--

SELECT pg_catalog.setval('player_id_seq', 8, true);


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

