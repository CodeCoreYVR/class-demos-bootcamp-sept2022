--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: sql_lab; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE sql_lab WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_CA.UTF-8' LC_CTYPE = 'en_CA.UTF-8';


\connect sql_lab

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    title character varying,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: enrolments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.enrolments (
    id integer NOT NULL,
    course_id integer,
    student_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    score integer
);


--
-- Name: enrolments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.enrolments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: enrolments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.enrolments_id_seq OWNED BY public.enrolments.id;


--
-- Name: line_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.line_items (
    id integer NOT NULL,
    product_id integer,
    order_id integer,
    price double precision,
    quantity integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: line_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.line_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: line_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.line_items_id_seq OWNED BY public.line_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    completed_on timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying,
    description text,
    price double precision,
    sale_price double precision,
    remaining_quantity integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying,
    student_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: students; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    email character varying,
    phone_number character varying,
    age integer,
    registration_date timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: enrolments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrolments ALTER COLUMN id SET DEFAULT nextval('public.enrolments_id_seq'::regclass);


--
-- Name: line_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.line_items ALTER COLUMN id SET DEFAULT nextval('public.line_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.courses (id, title, description, created_at, updated_at) FROM stdin;
1	Fundamental coherent middleware	Fugiat est odio ea sunt. Veniam id quae voluptatem. Quasi tempora est harum officiis illum explicabo. In consequatur dolorum tenetur eveniet debitis eaque. Et rem voluptatibus voluptas aliquid distinctio est.	2018-04-23 13:49:19.355246	2018-04-23 13:49:19.355246
2	Streamlined directional paradigm	Itaque libero enim similique aut. Sit perspiciatis et sunt. Aliquid officia ex. Explicabo voluptatem voluptate eos ea deleniti repellat. Voluptatem quod aut.	2018-04-23 13:49:19.358043	2018-04-23 13:49:19.358043
3	Enterprise-wide disintermediate artificial intelligence	Et eius id est. Omnis facere in. Exercitationem sit sapiente possimus vitae iure officia. Illum consequatur iusto corporis veniam molestiae quam officia. Quos deserunt ducimus nesciunt ea odio consectetur.	2018-04-23 13:49:19.36009	2018-04-23 13:49:19.36009
4	Advanced empowering encryption	Doloremque officia adipisci. Hic similique omnis doloremque pariatur. Soluta qui iusto explicabo. Sed suscipit omnis velit sit.	2018-04-23 13:49:19.362081	2018-04-23 13:49:19.362081
5	Digitized 24 hour customer loyalty	Nam quod delectus sed ad. Ut rerum est at sit reiciendis. Est a eos nesciunt. Nemo quia mollitia nulla et ipsa laboriosam.	2018-04-23 13:49:19.364074	2018-04-23 13:49:19.364074
6	Self-enabling global application	Et est deleniti qui. Magni exercitationem in reiciendis possimus. Numquam rerum ut illum quia magnam repudiandae perspiciatis.	2018-04-23 13:49:19.366035	2018-04-23 13:49:19.366035
7	Synergized homogeneous definition	Corporis dolores quaerat necessitatibus est explicabo eius. Ut est adipisci voluptatem voluptates deserunt quia quia. Eveniet at consequatur porro. Quis eveniet quia sit et labore.	2018-04-23 13:49:19.367999	2018-04-23 13:49:19.367999
8	Customer-focused even-keeled utilisation	Non provident mollitia perferendis omnis rerum. Possimus cupiditate quia qui eos molestiae. Perspiciatis qui quam. Velit quae qui. Optio aliquid enim omnis quis ipsa eum iste.	2018-04-23 13:49:19.370174	2018-04-23 13:49:19.370174
9	Progressive tertiary open architecture	Nihil sed beatae et officia explicabo. Ut dolores et. In illum autem rem. Debitis doloremque eius ratione voluptas et consequatur.	2018-04-23 13:49:19.372215	2018-04-23 13:49:19.372215
10	Enhanced stable moratorium	Doloribus quia eaque vero. Quas sed neque. Dignissimos et et dolorem dolores culpa sunt.	2018-04-23 13:49:19.374213	2018-04-23 13:49:19.374213
11	De-engineered eco-centric solution	Similique quae optio ab assumenda perferendis temporibus odio. Doloremque consectetur laudantium corrupti exercitationem qui. Maiores molestiae asperiores blanditiis nobis harum.	2018-04-23 13:49:19.376231	2018-04-23 13:49:19.376231
12	Adaptive zero administration alliance	Esse consequuntur qui veritatis. Vitae tempora fuga explicabo ea illo est. Autem accusantium vitae laudantium deleniti dicta placeat fuga. Eos soluta qui consequuntur temporibus quam.	2018-04-23 13:49:19.378234	2018-04-23 13:49:19.378234
13	Team-oriented coherent function	Sunt hic sapiente voluptatem. Veritatis ut porro occaecati vel voluptatum. Ad ab ut.	2018-04-23 13:49:19.380351	2018-04-23 13:49:19.380351
14	Focused systemic website	Officiis consequatur debitis perspiciatis id odio praesentium. Pariatur consequuntur nam consectetur nesciunt est et maxime. Eos est sunt. Et reiciendis sapiente dicta sit.	2018-04-23 13:49:19.382382	2018-04-23 13:49:19.382382
15	Secured zero administration parallelism	Repudiandae quae expedita ipsam animi. Nulla suscipit quaerat quibusdam repudiandae distinctio voluptas. Blanditiis sint mollitia maiores. Sunt ratione dolor.	2018-04-23 13:49:19.384581	2018-04-23 13:49:19.384581
16	Operative web-enabled instruction set	Vel deserunt voluptas reprehenderit itaque. Blanditiis aut perspiciatis maiores saepe. Saepe sed ullam id qui qui aut. Possimus maxime fugit est enim veritatis at molestiae. Voluptas cum et animi.	2018-04-23 13:49:19.392468	2018-04-23 13:49:19.392468
17	Multi-channelled neutral intranet	Quisquam distinctio nihil neque quo sapiente qui sequi. Occaecati voluptas odio reiciendis ipsa repudiandae. Consequatur illo corporis qui voluptas voluptatem. Doloribus dolores nulla. Ut optio ut.	2018-04-23 13:49:19.394466	2018-04-23 13:49:19.394466
18	Cloned high-level firmware	At officia accusamus est maxime amet. Nam id ea quisquam et. Non qui enim. Voluptatibus veniam maiores numquam assumenda reprehenderit optio omnis. Reiciendis sit natus nemo.	2018-04-23 13:49:19.396421	2018-04-23 13:49:19.396421
19	Cross-group systematic algorithm	Ea necessitatibus quia cupiditate in et. Nam mollitia quam. Sed dolorem rem omnis.	2018-04-23 13:49:19.398383	2018-04-23 13:49:19.398383
20	Open-architected mobile framework	Ex aliquam in. In omnis a et adipisci fugit. Assumenda tenetur modi ut labore.	2018-04-23 13:49:19.400207	2018-04-23 13:49:19.400207
21	Progressive zero administration standardization	Dolore autem laborum. Nostrum omnis repellendus corporis suscipit omnis sint iste. Aperiam tempora ut nihil in accusamus quam repellendus. Facere harum minus culpa id adipisci iusto. Dignissimos totam ullam laborum ipsa aspernatur sed et.	2018-04-23 13:49:19.402124	2018-04-23 13:49:19.402124
22	Ergonomic attitude-oriented leverage	In perferendis qui dolor. At nobis corporis accusantium quia eos eum. Iste dignissimos illum quos velit. Ut totam voluptatem dolor velit earum doloribus quam. Tempore molestias est corrupti.	2018-04-23 13:49:19.404312	2018-04-23 13:49:19.404312
23	Self-enabling impactful monitoring	Numquam nobis fugiat praesentium est pariatur necessitatibus. Accusantium voluptas quam dolores ratione ad. Deserunt officiis non. Placeat accusantium soluta voluptatum repellat. Ea officia asperiores earum consectetur voluptatum.	2018-04-23 13:49:19.406376	2018-04-23 13:49:19.406376
24	Integrated human-resource alliance	Eos dicta omnis qui et odio. Ut repellat voluptatum aut tenetur et et. Laudantium sunt in architecto. Rem dolorem est fugit.	2018-04-23 13:49:19.408312	2018-04-23 13:49:19.408312
25	Inverse full-range application	Error at minus. Fugit similique placeat. A magnam omnis enim veritatis sit enim odit.	2018-04-23 13:49:19.410124	2018-04-23 13:49:19.410124
26	Centralized well-modulated solution	Provident perferendis voluptas dolores. Quae nihil est officiis harum minima eum. Ab dolores deleniti distinctio exercitationem laborum.	2018-04-23 13:49:19.411955	2018-04-23 13:49:19.411955
27	Secured client-server challenge	Rem nam quia itaque placeat in quia. Adipisci corrupti totam necessitatibus excepturi. Repellat ipsum delectus optio. Et iste laudantium qui nam iusto id tempore. Nulla ea sunt est quas autem.	2018-04-23 13:49:19.413845	2018-04-23 13:49:19.413845
28	Networked bandwidth-monitored extranet	Ea nulla sit debitis. Id sint repudiandae autem modi sit. Tempore rerum quis est voluptas ut quidem.	2018-04-23 13:49:19.415698	2018-04-23 13:49:19.415698
29	Expanded encompassing projection	Aut officiis voluptatem. Dolore optio nihil. Aliquam est iste accusamus in et voluptatem. Et nobis voluptatum aut corrupti. Beatae quo aut.	2018-04-23 13:49:19.417566	2018-04-23 13:49:19.417566
30	Adaptive non-volatile paradigm	Et maxime voluptatem facere. Laudantium voluptatem molestiae. Deleniti accusantium qui et est earum. Et dicta est assumenda nesciunt dolorem. Autem molestias aut fugiat.	2018-04-23 13:49:19.419687	2018-04-23 13:49:19.419687
31	Sharable disintermediate projection	Ut qui ex saepe autem. Voluptatem laboriosam mollitia quo eos. Rerum sunt fuga voluptas.	2018-04-23 13:49:19.421623	2018-04-23 13:49:19.421623
32	Enterprise-wide modular installation	Eligendi vero praesentium. Commodi quos occaecati enim. Similique quis voluptatem possimus. Qui voluptas corporis nulla. Doloribus perspiciatis corrupti sit autem nostrum.	2018-04-23 13:49:19.423649	2018-04-23 13:49:19.423649
33	Optional incremental knowledge user	Earum aliquid magnam eum eaque. Ut consequatur consequatur vero nemo et deleniti aliquam. Ipsa omnis esse velit distinctio facilis ipsam.	2018-04-23 13:49:19.425582	2018-04-23 13:49:19.425582
34	Customizable motivating protocol	Sunt deleniti qui facere est sequi eos doloremque. Error libero vel voluptatem. Dolorem quia pariatur aperiam. Sed aut nisi.	2018-04-23 13:49:19.427541	2018-04-23 13:49:19.427541
35	Function-based client-server extranet	Nihil et culpa et ex vel voluptas. Id officiis et assumenda omnis eligendi minus voluptatem. Omnis et sequi aut dolorem accusantium voluptatum fugit.	2018-04-23 13:49:19.42996	2018-04-23 13:49:19.42996
36	Implemented dynamic open system	Est voluptatem pariatur iure quos ad fuga. Aperiam minus aut ex et nam. Aliquam facere repudiandae minus sapiente numquam vero.	2018-04-23 13:49:19.431935	2018-04-23 13:49:19.431935
37	Pre-emptive solution-oriented website	Sunt excepturi dolor officia voluptatem. Quibusdam ab suscipit dicta ut. Aut accusamus animi itaque aliquam.	2018-04-23 13:49:19.433784	2018-04-23 13:49:19.433784
38	Horizontal contextually-based paradigm	Quibusdam eos corrupti hic omnis est. Voluptates omnis dolor voluptatum repudiandae velit dolores. Nulla reprehenderit tempore qui placeat dolore. Earum quod sed optio et deserunt quo ut. Corporis accusamus ex molestias.	2018-04-23 13:49:19.435735	2018-04-23 13:49:19.435735
39	Compatible impactful groupware	Vero voluptatum hic beatae deserunt voluptas explicabo. Blanditiis quaerat molestiae facere sint dolor iste. Itaque ipsam aliquid omnis consequatur quaerat. Repellendus et rerum.	2018-04-23 13:49:19.43772	2018-04-23 13:49:19.43772
40	Assimilated incremental framework	Saepe enim nam exercitationem dolores. Explicabo omnis in assumenda hic. Aliquid culpa est quo dolor omnis. Perferendis et est fuga voluptas aut expedita.	2018-04-23 13:49:19.440228	2018-04-23 13:49:19.440228
41	Multi-layered explicit installation	Non assumenda aut eligendi. Eius expedita corporis adipisci ratione fugiat harum. Perspiciatis ratione voluptatem in dolorem. Amet perspiciatis nam dicta.	2018-04-23 13:49:19.442463	2018-04-23 13:49:19.442463
42	Mandatory dedicated pricing structure	Iusto praesentium itaque et laborum nihil dicta rerum. In doloribus sequi ea voluptas a. Quasi dolor facilis recusandae dolorem.	2018-04-23 13:49:19.444405	2018-04-23 13:49:19.444405
43	Reduced well-modulated implementation	Omnis vel ad cupiditate. Officia aut ipsa nulla amet voluptatem. Facere quis quaerat eius a dignissimos voluptas. Voluptas consequatur ut ratione.	2018-04-23 13:49:19.446347	2018-04-23 13:49:19.446347
44	Compatible client-server local area network	Autem deserunt nihil voluptatibus quia. Velit sed cupiditate asperiores earum. Ipsum maiores quae consequuntur. Repellendus nobis qui ullam quia. Similique quia maiores vel ab nemo.	2018-04-23 13:49:19.448346	2018-04-23 13:49:19.448346
45	Decentralized actuating definition	Qui quos consequatur. Iste sit qui animi natus at. Voluptates neque dolorum distinctio nostrum perferendis atque. Blanditiis quo sit autem dolorum.	2018-04-23 13:49:19.450296	2018-04-23 13:49:19.450296
46	Pre-emptive 3rd generation focus group	Omnis quaerat ipsa illo nesciunt enim nihil. Illum qui iure. Nulla ex suscipit eum sit. Eligendi a vitae culpa eveniet.	2018-04-23 13:49:19.452361	2018-04-23 13:49:19.452361
47	Compatible user-facing core	Nesciunt occaecati laborum consectetur eaque. Eum ea adipisci non. Fuga quo molestias sit. Exercitationem inventore quidem voluptatum eos qui consequatur. Mollitia et et vero at.	2018-04-23 13:49:19.454412	2018-04-23 13:49:19.454412
48	Cloned upward-trending matrix	Error harum quas et laborum. A beatae tenetur mollitia voluptates. Sint voluptatibus aut reprehenderit quibusdam quia rem dolorem. Ducimus consectetur pariatur et commodi accusamus consequatur.	2018-04-23 13:49:19.456589	2018-04-23 13:49:19.456589
49	Reactive disintermediate hierarchy	Id quaerat iste et blanditiis consequatur ut autem. Nemo est veniam quidem quod. Facere quibusdam voluptatem possimus aut nisi molestiae. Vel dolorem assumenda quia quaerat mollitia.	2018-04-23 13:49:19.458586	2018-04-23 13:49:19.458586
50	Assimilated fault-tolerant approach	Quia nemo quia. Eos ullam doloremque iste similique sed. Consequatur non inventore. Cumque est expedita.	2018-04-23 13:49:19.460551	2018-04-23 13:49:19.460551
51	Adaptive attitude-oriented capability	Ullam iusto reiciendis consectetur. Quaerat quia et adipisci explicabo. Est quis est qui at iusto.	2018-04-23 13:49:19.462508	2018-04-23 13:49:19.462508
52	Intuitive context-sensitive budgetary management	Et pariatur excepturi repudiandae mollitia hic nulla commodi. In et eum. Dolorem accusantium porro optio non culpa fugiat eveniet. Unde eligendi neque praesentium consectetur voluptas.	2018-04-23 13:49:19.464554	2018-04-23 13:49:19.464554
53	Profound zero tolerance analyzer	Ipsa qui ut iusto totam consectetur. Natus dolore sed. Consectetur fugiat culpa ut voluptatum expedita. Eaque ab facere placeat repellendus.	2018-04-23 13:49:19.466585	2018-04-23 13:49:19.466585
54	Decentralized background project	Ipsa deserunt cupiditate sunt. Quia dicta eos quos. Aspernatur sed deserunt et aliquam velit.	2018-04-23 13:49:19.468585	2018-04-23 13:49:19.468585
55	Decentralized discrete artificial intelligence	Odit necessitatibus nam. Vel vero nulla et quia fuga. Qui enim dolorem quo. Distinctio quo dolor. Ut quae veritatis dolores commodi qui magnam velit.	2018-04-23 13:49:19.470609	2018-04-23 13:49:19.470609
56	User-friendly dynamic application	Quis velit illo rem. Corrupti in iste et similique. Natus ut laudantium.	2018-04-23 13:49:19.472462	2018-04-23 13:49:19.472462
57	Streamlined directional framework	Qui excepturi eos et voluptatibus nam porro. Possimus similique est maiores nulla modi aut. Rem et ut ut in eius aperiam officia. Qui ipsa doloremque quia.	2018-04-23 13:49:19.474298	2018-04-23 13:49:19.474298
58	Polarised mobile installation	Non excepturi ex in architecto eum et. Et ut totam odit molestias reiciendis nobis voluptatum. Unde voluptas aut aut qui laboriosam quo voluptatem. Ut autem cupiditate cumque ut architecto pariatur. Iusto illum ut.	2018-04-23 13:49:19.476164	2018-04-23 13:49:19.476164
59	Configurable contextually-based protocol	Vel aut accusamus et laboriosam. Possimus esse et. Molestiae est ipsum dolore sit et in. Repellendus sequi sint illum veniam. Molestiae aut eum facere distinctio.	2018-04-23 13:49:19.478038	2018-04-23 13:49:19.478038
60	Profit-focused motivating forecast	Natus esse facere nostrum. Nihil voluptatem sed ut molestiae et at quas. Nam et iusto facilis blanditiis excepturi alias.	2018-04-23 13:49:19.479826	2018-04-23 13:49:19.479826
61	Horizontal radical hierarchy	Necessitatibus quia dignissimos aliquid ut. Neque similique dolor quis rerum est. Sint sit quae dolores voluptatem.	2018-04-23 13:49:19.481897	2018-04-23 13:49:19.481897
62	Realigned maximized adapter	Facilis nihil rerum. Rerum modi corrupti voluptates consequatur aperiam. Sint vitae nobis quas nesciunt adipisci. Nemo nihil laboriosam nam saepe maxime sit aut.	2018-04-23 13:49:19.483779	2018-04-23 13:49:19.483779
63	Visionary intermediate budgetary management	Minus et quia tenetur quia. Tenetur est nisi libero est corrupti accusamus nostrum. Corrupti minima aspernatur. Omnis hic blanditiis. Ad voluptatibus non in.	2018-04-23 13:49:19.48584	2018-04-23 13:49:19.48584
64	Customizable zero defect utilisation	Necessitatibus quia asperiores quod molestiae commodi atque quia. Quis ullam est. Eligendi et perspiciatis quod nihil consequatur. Aut exercitationem ex eum reprehenderit. Soluta quibusdam qui aperiam perferendis.	2018-04-23 13:49:19.487859	2018-04-23 13:49:19.487859
65	User-centric systemic function	Odio assumenda at eos ullam dolor architecto. Laborum pariatur suscipit quo cum fugit enim dolores. Sunt maiores nesciunt vel recusandae est optio.	2018-04-23 13:49:19.489792	2018-04-23 13:49:19.489792
66	Total content-based knowledge user	Repellendus fugiat amet ut. Nobis reiciendis iusto delectus blanditiis error impedit et. Ducimus nesciunt esse veritatis rerum explicabo sed voluptas. Non inventore similique fugiat.	2018-04-23 13:49:19.491758	2018-04-23 13:49:19.491758
134	Cross-group client-driven flexibility	Earum delectus et quos hic quia. Ut nihil et molestiae. Provident aut qui.	2018-04-23 13:49:19.627964	2018-04-23 13:49:19.627964
67	Phased optimizing local area network	Magnam omnis voluptatum. Et consectetur similique molestiae. Aut cum illum. Aperiam consequatur tempora dolores numquam et quia.	2018-04-23 13:49:19.493695	2018-04-23 13:49:19.493695
68	Persevering next generation synergy	Aut delectus ut voluptatem cupiditate. Eveniet amet vitae. Consequatur sapiente autem officiis velit qui ut voluptas. Temporibus eligendi architecto expedita sit. Enim laudantium dignissimos provident placeat atque non.	2018-04-23 13:49:19.495772	2018-04-23 13:49:19.495772
69	Business-focused next generation task-force	Pariatur et voluptatem quia. Voluptas corporis qui aut magnam eligendi quisquam. Sunt repudiandae exercitationem unde. Eos voluptatem dolor sint rem molestiae praesentium.	2018-04-23 13:49:19.497739	2018-04-23 13:49:19.497739
70	Devolved composite framework	Rerum fugit voluptatem quia at libero sunt. Sit distinctio voluptatem ut reprehenderit quam repudiandae ratione. Eos id natus excepturi aliquid autem. Voluptatem dolore id hic sequi. Saepe est sed repellat molestiae.	2018-04-23 13:49:19.499739	2018-04-23 13:49:19.499739
71	Balanced analyzing concept	Et asperiores officiis natus. Et aut voluptas aliquam et. A necessitatibus cupiditate qui itaque ut sed tempore.	2018-04-23 13:49:19.501688	2018-04-23 13:49:19.501688
72	Decentralized grid-enabled service-desk	Quam nostrum officiis voluptatum consequatur accusantium aut. Earum odio et commodi aut ducimus. Exercitationem deserunt incidunt facere temporibus nulla. Dolores quod qui deleniti officiis.	2018-04-23 13:49:19.503731	2018-04-23 13:49:19.503731
73	Switchable full-range productivity	Officiis sint quod ut suscipit. Sed et mollitia omnis. Dolorem reprehenderit quibusdam nemo id iste est. Eum qui est necessitatibus itaque omnis nihil. Quas id aut.	2018-04-23 13:49:19.50576	2018-04-23 13:49:19.50576
74	Quality-focused didactic superstructure	Aliquid odio nobis autem omnis. Minima dolores impedit. Earum nisi voluptate esse ut in perspiciatis. Officia ut doloremque provident tempore. Vel consequuntur et.	2018-04-23 13:49:19.508036	2018-04-23 13:49:19.508036
75	Operative intangible moratorium	Qui natus et dolorem quisquam quidem et consequatur. Velit quisquam autem voluptate distinctio dicta officia possimus. Libero alias dolores molestiae optio qui sunt.	2018-04-23 13:49:19.509893	2018-04-23 13:49:19.509893
76	Expanded multimedia workforce	Quia similique veritatis et eos expedita optio necessitatibus. Possimus aut fuga et. Sunt hic praesentium nam. Quam atque sint officiis enim non et et.	2018-04-23 13:49:19.511753	2018-04-23 13:49:19.511753
77	Organic systematic open system	Atque repellendus eos id culpa perspiciatis aspernatur. Non impedit consequatur voluptas et. Alias minima occaecati cupiditate et facere ut ab. Optio autem omnis ex. Error culpa qui repellat at aliquam eos.	2018-04-23 13:49:19.513619	2018-04-23 13:49:19.513619
78	Synergistic object-oriented utilisation	Est laboriosam quam id ipsum non. Molestiae magni nulla. Ut cupiditate voluptatibus aut alias cumque. Odio pariatur voluptatem cupiditate. Vero sed et nesciunt possimus.	2018-04-23 13:49:19.515525	2018-04-23 13:49:19.515525
79	Expanded attitude-oriented analyzer	Quia est ea sit voluptas mollitia sunt. Voluptatem cum sapiente deleniti saepe. Consectetur est quia molestiae adipisci. Aut ut rerum doloribus error.	2018-04-23 13:49:19.517396	2018-04-23 13:49:19.517396
80	User-centric empowering success	Pariatur explicabo sit distinctio maiores. At veritatis culpa. Omnis reiciendis sint dignissimos vel possimus. Architecto accusantium quos sint iste optio itaque.	2018-04-23 13:49:19.519336	2018-04-23 13:49:19.519336
81	Exclusive background structure	Voluptate et eius corporis. In eaque iste ipsum maiores qui voluptate. Dicta laborum fuga velit maiores ipsa sunt.	2018-04-23 13:49:19.521355	2018-04-23 13:49:19.521355
82	Balanced holistic policy	Molestiae eaque aspernatur. Est ea aut officia. Quia doloribus quas quia esse non.	2018-04-23 13:49:19.523257	2018-04-23 13:49:19.523257
83	Virtual human-resource function	Rem enim eum. Dicta incidunt ducimus voluptas aut voluptates. Voluptatem asperiores sed animi cum. Illum in a molestiae et exercitationem ut dolores. Ut aut ut itaque quo.	2018-04-23 13:49:19.525269	2018-04-23 13:49:19.525269
84	Configurable local infrastructure	Totam sapiente nisi tempore fugiat qui quia. Enim voluptatum vitae deserunt aut quisquam ducimus eum. Minus at est nemo animi qui iusto officia.	2018-04-23 13:49:19.527271	2018-04-23 13:49:19.527271
85	Devolved foreground process improvement	Suscipit vero et iste eum illum deserunt. Ipsam repellendus neque nobis. Iste blanditiis soluta.	2018-04-23 13:49:19.529146	2018-04-23 13:49:19.529146
86	Phased solution-oriented extranet	Repellat corrupti rerum sed saepe. Sit aut asperiores eum voluptas. Dolor possimus tenetur aut magni similique atque rerum.	2018-04-23 13:49:19.531173	2018-04-23 13:49:19.531173
87	Realigned high-level service-desk	Atque autem at. Et et sit odio aliquam in. Alias doloribus et dignissimos consequatur.	2018-04-23 13:49:19.533226	2018-04-23 13:49:19.533226
88	Monitored zero administration customer loyalty	Deserunt officiis esse perferendis. Nobis dignissimos quis necessitatibus architecto in unde corrupti. Hic vel sint id quia omnis molestiae.	2018-04-23 13:49:19.535156	2018-04-23 13:49:19.535156
89	Cloned encompassing time-frame	Illo excepturi eos provident. Cumque nihil reprehenderit fugiat sed blanditiis voluptatem. Corporis tempora iste.	2018-04-23 13:49:19.537039	2018-04-23 13:49:19.537039
90	Quality-focused 6th generation portal	Consequatur tenetur possimus voluptas fuga. Aut earum amet voluptate et vel illum aspernatur. Dolore ut libero rerum sequi reiciendis. Corrupti sed est voluptatem esse.	2018-04-23 13:49:19.538896	2018-04-23 13:49:19.538896
91	Mandatory transitional knowledge base	Commodi asperiores et ut voluptatem. Voluptatibus dolorum nesciunt quidem quis pariatur. Veritatis id architecto omnis pariatur. Asperiores voluptatem quisquam debitis consequatur praesentium nesciunt voluptatum. Molestias est et ipsam id incidunt.	2018-04-23 13:49:19.540837	2018-04-23 13:49:19.540837
92	Synchronised bottom-line knowledge base	Saepe minima et modi atque consequatur. Quaerat ut et aliquid et. Cumque hic numquam est. Saepe optio minima.	2018-04-23 13:49:19.542756	2018-04-23 13:49:19.542756
93	Decentralized discrete application	Omnis sit voluptatem voluptatibus veniam ut vitae. Officia est tempore dicta. Sed saepe vero iure assumenda est reiciendis. Eligendi beatae minima. Similique quibusdam et fuga labore.	2018-04-23 13:49:19.544661	2018-04-23 13:49:19.544661
94	Adaptive context-sensitive conglomeration	Blanditiis officia et. Quia dolores odio. Corrupti est ab ut voluptatem.	2018-04-23 13:49:19.546512	2018-04-23 13:49:19.546512
95	Exclusive mobile encryption	Nisi incidunt in ex omnis ut. Ad aut odio delectus eveniet ut veritatis beatae. Tenetur omnis assumenda voluptatum eveniet sit id. Ut sequi ipsa facilis ut deserunt. Nesciunt illum voluptas quo non corrupti.	2018-04-23 13:49:19.548428	2018-04-23 13:49:19.548428
96	Monitored directional system engine	Perferendis quos odio sint. Aut incidunt maiores sed quo. Cupiditate distinctio illo voluptas dolor deserunt. Harum aut nam in quo molestiae et non.	2018-04-23 13:49:19.550301	2018-04-23 13:49:19.550301
97	Progressive foreground throughput	Saepe odit laboriosam. Dolorum possimus aliquam accusantium laborum. Architecto maxime magni iste pariatur id praesentium. Magni non est sint nisi.	2018-04-23 13:49:19.552243	2018-04-23 13:49:19.552243
98	Self-enabling systematic task-force	Blanditiis quidem possimus distinctio animi ratione quas. Rem quasi tempore ut tempora ea voluptas sunt. Et quaerat et molestiae ut facere dolorem impedit.	2018-04-23 13:49:19.55419	2018-04-23 13:49:19.55419
99	Seamless even-keeled archive	Enim laudantium vel ea. Et veritatis non laboriosam nisi. Molestiae explicabo soluta et eligendi labore.	2018-04-23 13:49:19.556079	2018-04-23 13:49:19.556079
135	Streamlined hybrid matrix	Vel at nobis non quibusdam eos qui vitae. Dolorem modi quo ipsa. Ea aut quia et in labore vero aperiam.	2018-04-23 13:49:19.629988	2018-04-23 13:49:19.629988
100	Realigned encompassing product	Fugiat laborum quia voluptatem illum totam repudiandae vel. Facilis numquam ipsam. Odio minima autem quos aspernatur voluptatem quaerat. Non qui quo reprehenderit iure et totam.	2018-04-23 13:49:19.558217	2018-04-23 13:49:19.558217
101	Monitored content-based core	Ut repellendus velit in ullam veniam quo. Itaque saepe laboriosam delectus dolore. Sunt sint necessitatibus corporis cum.	2018-04-23 13:49:19.560239	2018-04-23 13:49:19.560239
102	Multi-layered intangible adapter	Quam laborum qui ut ut aut sed voluptatem. Modi nihil voluptates veniam non. Numquam dolorem perspiciatis quia possimus. Provident veniam cum doloremque consequatur repellat.	2018-04-23 13:49:19.562245	2018-04-23 13:49:19.562245
103	Integrated neutral instruction set	Cupiditate debitis nisi explicabo rem voluptatem qui amet. Et unde earum qui perspiciatis libero. Corrupti est quaerat modi est molestiae ut.	2018-04-23 13:49:19.564212	2018-04-23 13:49:19.564212
104	Realigned bifurcated leverage	Nam omnis deleniti sint quia voluptas. Dolorem tempora dolor qui id quibusdam. Sapiente id et saepe.	2018-04-23 13:49:19.566205	2018-04-23 13:49:19.566205
105	User-friendly 3rd generation toolset	Fuga asperiores voluptates quis animi sequi id officia. Maiores sequi doloremque tempore porro optio. Omnis atque repellendus et. Et ducimus quo natus vitae neque. Ipsam ab fugit tenetur aut.	2018-04-23 13:49:19.568241	2018-04-23 13:49:19.568241
106	Proactive stable forecast	Consequuntur voluptate accusantium voluptatibus. In omnis voluptate rerum minima. Consequatur unde quia fugit laboriosam ut dolor.	2018-04-23 13:49:19.570435	2018-04-23 13:49:19.570435
107	Diverse interactive implementation	Sed distinctio dolores sint corporis accusantium. Sequi dolorem et occaecati. Mollitia aperiam eos reiciendis non explicabo dolor.	2018-04-23 13:49:19.572397	2018-04-23 13:49:19.572397
108	Implemented impactful framework	Quia et et tenetur id eum. Ex veritatis ratione iure optio ut dolor aut. Eaque ullam sit voluptatem in ducimus quo.	2018-04-23 13:49:19.574401	2018-04-23 13:49:19.574401
109	Persevering 3rd generation open architecture	Aspernatur cum a et eaque illo aut sit. Libero ipsum cupiditate fuga repellendus iusto. In quisquam odit eaque vero quia quod.	2018-04-23 13:49:19.576404	2018-04-23 13:49:19.576404
110	Robust mobile challenge	Voluptas ut velit reiciendis. In ullam est aliquid. Eaque rerum perspiciatis aliquid consectetur minima ad.	2018-04-23 13:49:19.578359	2018-04-23 13:49:19.578359
111	Re-engineered didactic monitoring	A placeat sed eos qui quas. Qui culpa sint. Dignissimos qui sed temporibus sapiente. Recusandae quos minima quam.	2018-04-23 13:49:19.580325	2018-04-23 13:49:19.580325
112	Reduced secondary application	Qui quos eos sed sint architecto nulla voluptatibus. Nesciunt dolores velit. Hic aut exercitationem.	2018-04-23 13:49:19.582268	2018-04-23 13:49:19.582268
113	Multi-layered real-time intranet	Possimus ut nam repellendus incidunt at magni. Repudiandae nemo pariatur quaerat necessitatibus omnis nostrum. Provident temporibus facere omnis accusamus corporis sint velit. Praesentium nesciunt consequatur ipsam aspernatur cumque voluptas explicabo. Dolorem nobis et et nam deserunt perferendis qui.	2018-04-23 13:49:19.584519	2018-04-23 13:49:19.584519
114	Synergistic client-server architecture	Dolores sint recusandae dolorem praesentium iste laudantium cupiditate. Necessitatibus quidem est ut est dolor hic ullam. Odit distinctio officiis iusto molestias. Non mollitia dolorem eos et voluptate repudiandae. Tempora odio iste ut.	2018-04-23 13:49:19.58664	2018-04-23 13:49:19.58664
115	Team-oriented cohesive firmware	Tempore labore molestiae adipisci. Minima cumque dicta nihil natus maxime et rerum. Corrupti eveniet et rerum quia officiis mollitia eum. Corrupti error et placeat veniam.	2018-04-23 13:49:19.58869	2018-04-23 13:49:19.58869
116	Up-sized multimedia neural-net	Voluptas non in ut. Sapiente aut id ut eligendi qui voluptate doloremque. Porro natus quis voluptatem odio dolorem ducimus. Repellat sit dicta voluptate voluptatum. Unde et reiciendis modi sit harum.	2018-04-23 13:49:19.590726	2018-04-23 13:49:19.590726
117	Open-source systemic emulation	Quisquam culpa est aut voluptatem amet consequatur. Consequuntur in sed a praesentium sequi. Voluptas veniam accusantium sit. Impedit dicta ut sapiente. Numquam dolorum sed qui nesciunt.	2018-04-23 13:49:19.592793	2018-04-23 13:49:19.592793
118	Multi-layered uniform contingency	Optio alias beatae fugit id quidem. Qui ut velit distinctio vel expedita minima tempora. Sit ut dicta unde est quis. Qui enim numquam.	2018-04-23 13:49:19.594899	2018-04-23 13:49:19.594899
119	Organized leading edge website	Magnam pariatur dicta. Et sint sed impedit et minima sed alias. Blanditiis soluta dignissimos ut quo.	2018-04-23 13:49:19.596951	2018-04-23 13:49:19.596951
120	Intuitive responsive model	Quisquam quia autem in blanditiis. Rerum iure quaerat ratione officia. Est accusamus est sapiente perspiciatis necessitatibus. Minus dignissimos tenetur nisi voluptatibus.	2018-04-23 13:49:19.598932	2018-04-23 13:49:19.598932
121	Integrated neutral emulation	Dolor qui quaerat eos. Nisi error quia praesentium debitis nemo officia aut. At vel cupiditate architecto labore blanditiis.	2018-04-23 13:49:19.600902	2018-04-23 13:49:19.600902
122	Up-sized static pricing structure	Consequuntur blanditiis et. Et delectus unde quasi. Non voluptatum quod et omnis. Fuga dolor id sed dolorum omnis. Ipsam deserunt laboriosam explicabo rerum in cumque id.	2018-04-23 13:49:19.602963	2018-04-23 13:49:19.602963
123	Total neutral Graphic Interface	Et rerum praesentium eveniet a soluta aut. Facilis laborum non quia et cum. Laboriosam ut nesciunt. Commodi amet eos enim voluptas a. Quis ut quia cum molestiae.	2018-04-23 13:49:19.60547	2018-04-23 13:49:19.60547
124	Versatile global orchestration	Error adipisci eligendi eum. Occaecati eum autem provident voluptatibus. Vero nostrum exercitationem deserunt repellat aspernatur itaque quia. Sit quia eos.	2018-04-23 13:49:19.607886	2018-04-23 13:49:19.607886
125	Customizable interactive workforce	Quam expedita quia voluptatibus autem soluta voluptatem. Aut sit cumque ex debitis quis consectetur error. Modi tenetur in qui dolorum.	2018-04-23 13:49:19.61004	2018-04-23 13:49:19.61004
126	Optimized heuristic protocol	Et minus qui aut saepe. Placeat et quia ut cupiditate. Sunt vel adipisci ullam consequatur.	2018-04-23 13:49:19.612071	2018-04-23 13:49:19.612071
127	Profit-focused grid-enabled approach	Dolor esse voluptatem maxime. Explicabo dolores rerum. Rerum quaerat numquam ad et impedit sed corporis. Et ut totam sint suscipit in adipisci quisquam.	2018-04-23 13:49:19.614048	2018-04-23 13:49:19.614048
128	Synergized human-resource portal	Earum aut nihil ullam praesentium et unde iste. Eius enim veritatis et beatae consequuntur. Aut perferendis alias ex voluptas quo omnis non.	2018-04-23 13:49:19.616061	2018-04-23 13:49:19.616061
129	Function-based mission-critical policy	Blanditiis sint quisquam voluptas ab dolores. Sit et consequatur qui. Id exercitationem corporis consequatur aspernatur ad.	2018-04-23 13:49:19.618003	2018-04-23 13:49:19.618003
130	Cross-group interactive projection	Minus aut nisi illum a et consequatur. Iure incidunt voluptas nobis ut et. Consequatur qui quia laborum iure autem fugiat vero. Qui atque quos soluta dolor enim beatae. Aperiam consectetur dolorem totam sed.	2018-04-23 13:49:19.620055	2018-04-23 13:49:19.620055
131	User-centric client-server groupware	Ducimus voluptates repellendus. Enim asperiores earum tempore iusto. Non est est voluptatum minima in perspiciatis aut.	2018-04-23 13:49:19.622024	2018-04-23 13:49:19.622024
132	Reverse-engineered mission-critical architecture	Ducimus ullam a consequatur dolorum minus est tenetur. Occaecati esse voluptas. Architecto nostrum ea voluptatem. Est est consequatur voluptatem quisquam labore officia omnis. Praesentium et quae sed expedita.	2018-04-23 13:49:19.624044	2018-04-23 13:49:19.624044
133	Upgradable zero tolerance utilisation	Est a et ipsam sit officia soluta nihil. Qui aut vel quia. Et nihil tempora modi.	2018-04-23 13:49:19.626013	2018-04-23 13:49:19.626013
136	Organic leading edge monitoring	Magni repudiandae assumenda illum eum. Quo inventore maxime sed corrupti nihil quibusdam quisquam. Accusantium recusandae quae repellat ullam corrupti. Autem error qui. Sapiente fugiat iusto voluptate sed voluptatibus.	2018-04-23 13:49:19.632065	2018-04-23 13:49:19.632065
137	Triple-buffered tertiary hierarchy	Quas in iure sed possimus ratione. Eos rerum aut. Quam necessitatibus magnam. Ut officiis soluta sapiente quo. Dolorem eos facilis inventore.	2018-04-23 13:49:19.634134	2018-04-23 13:49:19.634134
138	Configurable secondary moratorium	Delectus cumque cupiditate et perspiciatis ut. Aliquid veniam ut. Quia dicta sint facere rerum nemo. Aut non asperiores. Consequatur eos corrupti mollitia eveniet explicabo dolores.	2018-04-23 13:49:19.636451	2018-04-23 13:49:19.636451
139	Secured homogeneous info-mediaries	Cum rerum ad eligendi sequi aut ipsum. Non et nemo dolorum nisi perferendis itaque vel. Sunt et omnis aut minima. Sed dolor saepe expedita non magnam inventore commodi.	2018-04-23 13:49:19.638499	2018-04-23 13:49:19.638499
140	Realigned heuristic hardware	Laudantium modi ut rerum sunt totam corporis. Dolorem vero assumenda aut sint facilis. Sed omnis ut aliquam doloribus soluta. Quia nobis sunt doloribus amet dolorem. Alias numquam corrupti.	2018-04-23 13:49:19.640747	2018-04-23 13:49:19.640747
141	Extended bandwidth-monitored protocol	Tenetur natus quisquam dolor excepturi deserunt. Recusandae suscipit aut eos sit. Sint at quibusdam a suscipit. Veritatis neque eveniet optio. Dolores pariatur commodi non eveniet nihil provident et.	2018-04-23 13:49:19.642828	2018-04-23 13:49:19.642828
142	Digitized value-added orchestration	Cumque occaecati voluptas. Deleniti doloribus odit repellendus. Minus odio qui ratione et. Reprehenderit illum ea libero. Provident accusantium omnis laborum.	2018-04-23 13:49:19.644843	2018-04-23 13:49:19.644843
143	Networked fault-tolerant forecast	Ut omnis quasi iure. Error voluptatem voluptatem officia. Totam cumque blanditiis eaque asperiores facilis eveniet sequi.	2018-04-23 13:49:19.64679	2018-04-23 13:49:19.64679
144	Upgradable object-oriented artificial intelligence	Repellendus modi nobis exercitationem ut a non. Qui eos nisi ut error minima soluta quod. Repellat dolores ducimus sit expedita mollitia corporis sint.	2018-04-23 13:49:19.648716	2018-04-23 13:49:19.648716
145	Multi-channelled hybrid methodology	Nemo quod perspiciatis. Dolores beatae laudantium. Enim consectetur ea quam explicabo natus.	2018-04-23 13:49:19.650692	2018-04-23 13:49:19.650692
146	Cross-group fresh-thinking hardware	Et quae id. Ipsum ut et explicabo provident aliquam iste dolor. Quis ab et.	2018-04-23 13:49:19.652738	2018-04-23 13:49:19.652738
147	Customer-focused bi-directional projection	Omnis labore molestiae. Qui est ad blanditiis. Nostrum perspiciatis voluptatem molestias eum cupiditate.	2018-04-23 13:49:19.654848	2018-04-23 13:49:19.654848
148	Innovative systematic info-mediaries	Nesciunt in totam quidem neque. Est esse iste. Nam non aut inventore. Ad ipsum consequatur enim dolores. Velit sed quia qui.	2018-04-23 13:49:19.656889	2018-04-23 13:49:19.656889
149	Future-proofed system-worthy hierarchy	Numquam suscipit cupiditate beatae consequuntur. Ab et eius aut impedit enim dolorem. Vitae dolor sit repellat et consequuntur quod quos. Incidunt et autem. Dolores quia ratione in aut est ullam ea.	2018-04-23 13:49:19.658883	2018-04-23 13:49:19.658883
150	Adaptive clear-thinking orchestration	Est corporis fuga. Natus consequuntur soluta et voluptate qui quidem nostrum. Consequatur corporis et.	2018-04-23 13:49:19.661015	2018-04-23 13:49:19.661015
151	Right-sized encompassing analyzer	Aut quis totam nesciunt ullam ut sed. Provident perspiciatis ipsa velit illum. Sed molestias libero. Saepe neque natus consequatur. Nobis delectus maxime sint veniam libero excepturi.	2018-04-23 13:49:19.663051	2018-04-23 13:49:19.663051
152	Multi-tiered background complexity	Rem illo dolorem quaerat. Officia aut animi aperiam blanditiis ipsam quia. Accusantium quidem id corrupti. Tempora cupiditate est vel voluptatem nam. Quis accusamus quo nulla laborum nemo est.	2018-04-23 13:49:19.665048	2018-04-23 13:49:19.665048
153	Ergonomic local encryption	Nisi ut ea quod assumenda. Temporibus eos dolores harum ea voluptatem modi. Ipsum et omnis. Assumenda aut sequi repellendus deleniti laborum.	2018-04-23 13:49:19.667078	2018-04-23 13:49:19.667078
154	Inverse attitude-oriented encryption	Ex aspernatur optio assumenda omnis omnis praesentium. Magnam sed ducimus voluptas est aut itaque. Esse quae natus qui voluptas. Voluptas et nobis.	2018-04-23 13:49:19.670145	2018-04-23 13:49:19.670145
155	Multi-layered regional knowledge user	Magni ducimus nostrum adipisci alias tenetur omnis. Aut aliquid est. Molestiae necessitatibus mollitia voluptas culpa dolores quis debitis. Eligendi alias qui distinctio impedit assumenda. Ipsa veritatis explicabo sit.	2018-04-23 13:49:19.672245	2018-04-23 13:49:19.672245
156	Configurable reciprocal project	Excepturi quia cumque sed dignissimos veritatis. Consectetur rerum omnis mollitia accusamus qui dolorem. Ut illum eius.	2018-04-23 13:49:19.674209	2018-04-23 13:49:19.674209
157	Organic zero administration contingency	Tempore laborum quae. Est consequatur suscipit quisquam. Omnis illo non provident eum rerum accusamus. Reiciendis quia deserunt aperiam rerum ut placeat.	2018-04-23 13:49:19.67629	2018-04-23 13:49:19.67629
158	Self-enabling 3rd generation website	Eos eveniet ut consequatur et iure. Et doloribus assumenda ab molestiae eaque non. Amet dolores fuga facere rerum quia. Ut dolor dignissimos voluptates non odit. Laboriosam delectus nulla harum.	2018-04-23 13:49:19.678347	2018-04-23 13:49:19.678347
159	Programmable transitional concept	Et et vel. Ipsa deleniti id. Saepe pariatur quia. Commodi sit ut ullam ut maiores.	2018-04-23 13:49:19.680383	2018-04-23 13:49:19.680383
160	Vision-oriented heuristic capability	Vel amet deleniti voluptate. Voluptatem error ab dolores perspiciatis repellendus voluptatum ut. Odio voluptatem dolores ut. Nihil quia dolorum laboriosam perferendis.	2018-04-23 13:49:19.682407	2018-04-23 13:49:19.682407
161	User-centric static hierarchy	Rem quidem mollitia laboriosam. Error dolor dolor et non quo minus. Reiciendis non nihil odit. Dolorem necessitatibus amet.	2018-04-23 13:49:19.684429	2018-04-23 13:49:19.684429
162	Configurable exuding function	Voluptas quas sunt distinctio sint hic consequatur. Cupiditate dolor dolores vero nihil. Corporis ipsa necessitatibus doloremque sed ad sed. Eveniet molestias dolorem vel quia autem. Est expedita eum veniam dolore.	2018-04-23 13:49:19.686872	2018-04-23 13:49:19.686872
163	Profound neutral projection	Beatae a quam eum voluptatibus aliquid et non. Molestiae nesciunt officia repellendus quos est. Quis sed consequuntur. Perferendis ea esse consectetur excepturi ratione.	2018-04-23 13:49:19.688984	2018-04-23 13:49:19.688984
164	Future-proofed value-added success	Dolorem sit ut perferendis. Neque voluptas et accusantium. Et temporibus dicta. Dolor soluta provident iure ea ad incidunt eveniet.	2018-04-23 13:49:19.690947	2018-04-23 13:49:19.690947
165	Synergistic bottom-line analyzer	Rem reprehenderit sit inventore blanditiis sit. Et aut id quis consequatur. Ipsam consequatur at ad hic et deserunt alias. Vel voluptatum perspiciatis et officiis. Quia maiores optio quia corrupti nostrum illum sit.	2018-04-23 13:49:19.693098	2018-04-23 13:49:19.693098
166	Centralized responsive migration	Illo explicabo consequatur doloribus. Amet quasi ut id. Pariatur dolorum asperiores sunt sapiente modi magni. Omnis recusandae aut aut cum qui ut enim. Eius iste sed.	2018-04-23 13:49:19.69525	2018-04-23 13:49:19.69525
167	Multi-tiered 24 hour infrastructure	Omnis molestias optio est id quis tenetur aut. Veniam natus quaerat nihil corrupti. Vitae sunt eveniet ut deserunt qui.	2018-04-23 13:49:19.697328	2018-04-23 13:49:19.697328
168	Extended motivating orchestration	Nemo iusto molestiae et dolores occaecati ab delectus. Tempora aliquam veritatis enim aut mollitia. Ut alias reiciendis sed aliquam voluptas. Maxime repellat rem. Et nesciunt ut enim dolores ut.	2018-04-23 13:49:19.699331	2018-04-23 13:49:19.699331
169	Sharable motivating alliance	Quam est autem dicta sequi facere. Mollitia magnam autem autem nobis excepturi. Eveniet est aspernatur ut dolor. Perspiciatis rerum vel deserunt.	2018-04-23 13:49:19.701384	2018-04-23 13:49:19.701384
170	Adaptive intermediate model	Qui aut in et velit. Neque asperiores et repudiandae atque ipsam dolore. Tenetur laudantium earum itaque necessitatibus. Quae a suscipit facilis repudiandae magnam.	2018-04-23 13:49:19.704192	2018-04-23 13:49:19.704192
171	De-engineered 5th generation functionalities	Maiores eos aut occaecati mollitia voluptas est sequi. Vero reiciendis debitis. Quis error nemo. Enim laudantium odit fugiat ut. Sapiente velit temporibus eveniet.	2018-04-23 13:49:19.706485	2018-04-23 13:49:19.706485
172	Progressive holistic methodology	Ut corporis quia numquam tempore occaecati. Qui nostrum rerum hic. Provident odit sed molestiae expedita facere et. Laboriosam maxime rerum quam maiores dolores.	2018-04-23 13:49:19.708484	2018-04-23 13:49:19.708484
173	Exclusive solution-oriented monitoring	Vero in maxime molestiae modi dicta laborum repellat. Autem qui ad dolore nisi quidem. Ipsam aut atque accusantium hic.	2018-04-23 13:49:19.710348	2018-04-23 13:49:19.710348
174	Synergistic user-facing circuit	Quas eos voluptatem voluptates. Aperiam debitis quaerat sed nulla similique doloribus. At sunt facere eos maxime in tenetur aut. Nulla id laudantium quia suscipit perspiciatis et alias.	2018-04-23 13:49:19.712475	2018-04-23 13:49:19.712475
175	Extended 4th generation forecast	Et et et sint molestiae animi quidem. Non id cupiditate incidunt molestias. Mollitia voluptatem eius. Voluptatem sed sit ut. Fuga voluptatum reiciendis.	2018-04-23 13:49:19.714418	2018-04-23 13:49:19.714418
176	Persevering zero defect portal	Id et iure aut explicabo eius maiores. Placeat dolores voluptatem assumenda incidunt dolorem molestiae. Maxime et cupiditate consequuntur. Fugiat eaque et sint. Nostrum et saepe.	2018-04-23 13:49:19.716351	2018-04-23 13:49:19.716351
177	Sharable zero defect framework	Molestias ducimus et iste facilis sunt laboriosam est. Odio dignissimos voluptatibus. Sit corporis dolores deleniti ex minima maiores. Odit aspernatur sed voluptas ullam sit quidem est.	2018-04-23 13:49:19.718469	2018-04-23 13:49:19.718469
178	Organic 5th generation neural-net	Sint aliquid sit velit laboriosam voluptatibus suscipit reiciendis. Et laboriosam optio hic est nulla. Aperiam voluptates magnam. Consequuntur cupiditate dolores soluta. Quibusdam libero beatae unde neque tenetur iure.	2018-04-23 13:49:19.720618	2018-04-23 13:49:19.720618
179	User-friendly uniform local area network	Deleniti sed qui velit. Ut porro excepturi laborum accusantium. Delectus ut ut quo debitis repellendus sunt autem. Exercitationem ut molestiae ipsum ea libero.	2018-04-23 13:49:19.722619	2018-04-23 13:49:19.722619
180	Object-based leading edge capacity	Consequatur qui quod earum sint illo iste unde. Reprehenderit dolorum quasi optio. Quidem et ad officia eius ullam atque at. Aut accusamus odit aliquam in sed ab enim. Non perferendis placeat minima.	2018-04-23 13:49:19.724664	2018-04-23 13:49:19.724664
181	Horizontal analyzing neural-net	Qui tenetur rerum facilis rerum corrupti. Velit quo laboriosam neque velit quia eos et. Ea magni sed et sint voluptatem. Harum dignissimos quia doloremque est neque. Dolorem id qui voluptatem veritatis qui maiores illo.	2018-04-23 13:49:19.726619	2018-04-23 13:49:19.726619
182	Virtual asynchronous definition	Voluptates omnis iste et odit. Asperiores nam dolor et alias esse. Saepe voluptates illum aut explicabo accusantium nostrum fugit. Vel veniam dignissimos aut odit qui velit ducimus. Aut natus aliquam consequatur.	2018-04-23 13:49:19.728675	2018-04-23 13:49:19.728675
183	Proactive multimedia adapter	Labore animi ex eligendi recusandae voluptatem facere. Vitae iusto dolorum et velit sit. Fugiat eos corporis eum similique. Dignissimos voluptas eum earum corrupti ea sint.	2018-04-23 13:49:19.730668	2018-04-23 13:49:19.730668
184	Grass-roots hybrid artificial intelligence	Cum in odit. Et hic ipsum dignissimos omnis asperiores. Tempore libero autem. Est illum sit quis qui. Sit odit vero voluptas.	2018-04-23 13:49:19.732678	2018-04-23 13:49:19.732678
185	Open-architected zero tolerance superstructure	Iste totam ullam est odio. Eaque suscipit nam expedita eum voluptatibus. Voluptatem totam excepturi corrupti.	2018-04-23 13:49:19.734623	2018-04-23 13:49:19.734623
186	Monitored heuristic local area network	Porro ipsam animi unde. Dolorem voluptatem molestiae. Officia aut qui cumque adipisci sed. Eligendi necessitatibus veritatis tenetur illo.	2018-04-23 13:49:19.736873	2018-04-23 13:49:19.736873
187	Polarised client-driven intranet	Libero ut occaecati culpa mollitia. Rerum sed ex atque dolor sequi laudantium vel. Pariatur sit a labore sunt vel rerum temporibus. Ut molestiae at ullam est officiis ipsum et.	2018-04-23 13:49:19.738949	2018-04-23 13:49:19.738949
188	Optimized interactive extranet	Nobis provident natus aspernatur. Omnis consequatur porro. Officia numquam quisquam. Vitae magni quaerat est est suscipit.	2018-04-23 13:49:19.740962	2018-04-23 13:49:19.740962
189	Realigned asynchronous success	Quae inventore voluptas pariatur soluta magni explicabo laudantium. Praesentium molestiae enim. Voluptate laborum aut. Laboriosam ipsa esse quo ut recusandae rerum nobis. Quis ab voluptas eius mollitia nemo.	2018-04-23 13:49:19.742957	2018-04-23 13:49:19.742957
190	Stand-alone attitude-oriented superstructure	Ullam accusantium sed voluptatibus dolore. Ut saepe nulla est fugit non voluptates. Rerum quibusdam porro reiciendis non dolores doloremque. Non consequuntur asperiores nemo inventore.	2018-04-23 13:49:19.744958	2018-04-23 13:49:19.744958
191	Focused value-added challenge	Eum quos veniam. In et consectetur facere et et. Voluptas at veniam molestias.	2018-04-23 13:49:19.746884	2018-04-23 13:49:19.746884
192	Synergistic fresh-thinking parallelism	Possimus modi velit dolorem nihil ut odit suscipit. Itaque aliquid temporibus sit sint autem optio rem. Sit possimus quis. Veritatis aliquid id sit at consectetur velit laborum. Rem id debitis necessitatibus eum minus natus.	2018-04-23 13:49:19.748964	2018-04-23 13:49:19.748964
193	Progressive asynchronous service-desk	Harum molestiae fugit iure atque nisi tempora occaecati. Nulla repudiandae animi. Magnam aspernatur velit aut dolorum esse. Officia perspiciatis dolorem voluptas.	2018-04-23 13:49:19.750929	2018-04-23 13:49:19.750929
194	Focused solution-oriented orchestration	Vitae sapiente beatae. Maxime vitae delectus magnam rem. Saepe earum et quia incidunt fugiat fugit.	2018-04-23 13:49:19.752962	2018-04-23 13:49:19.752962
195	Grass-roots zero defect initiative	Maxime est ut sed voluptate at. Molestias aut quisquam nobis earum. Eaque minima non omnis.	2018-04-23 13:49:19.754852	2018-04-23 13:49:19.754852
196	Compatible upward-trending software	Molestias et molestiae eligendi. Odio quia quod quis autem. Est ut ut et minus eaque.	2018-04-23 13:49:19.756794	2018-04-23 13:49:19.756794
197	Devolved dedicated superstructure	Qui totam quas id facilis earum. Ut perferendis fugit rerum cum. Ut voluptate sit est. Velit beatae quas incidunt quae. Provident illum temporibus.	2018-04-23 13:49:19.758826	2018-04-23 13:49:19.758826
198	Re-engineered static success	Molestias distinctio quas dolor quam ex eum. Vero totam aut ea adipisci. Hic possimus sit ut.	2018-04-23 13:49:19.760709	2018-04-23 13:49:19.760709
199	Object-based scalable Graphic Interface	Voluptatem earum quisquam. Quo accusantium ut impedit nesciunt omnis voluptate dicta. Blanditiis porro facilis non adipisci sed eius.	2018-04-23 13:49:19.762701	2018-04-23 13:49:19.762701
200	Proactive zero defect workforce	Nihil sit dolores beatae numquam possimus reprehenderit quam. Repellat explicabo ut eum velit iste ipsa aut. Dolor quia ut et. Eligendi ut aliquid ea quos est blanditiis cupiditate.	2018-04-23 13:49:19.764779	2018-04-23 13:49:19.764779
\.


--
-- Data for Name: enrolments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.enrolments (id, course_id, student_id, created_at, updated_at, score) FROM stdin;
1	128	1	2018-04-23 13:49:19.769728	2018-04-23 13:49:19.769728	47
2	14	1	2018-04-23 13:49:19.773152	2018-04-23 13:49:19.773152	57
3	107	1	2018-04-23 13:49:19.775479	2018-04-23 13:49:19.775479	87
4	101	2	2018-04-23 13:49:19.778453	2018-04-23 13:49:19.778453	74
5	156	2	2018-04-23 13:49:19.780745	2018-04-23 13:49:19.780745	58
6	91	2	2018-04-23 13:49:19.782933	2018-04-23 13:49:19.782933	76
7	93	4	2018-04-23 13:49:19.786731	2018-04-23 13:49:19.786731	76
8	128	4	2018-04-23 13:49:19.788863	2018-04-23 13:49:19.788863	80
9	84	4	2018-04-23 13:49:19.791087	2018-04-23 13:49:19.791087	98
10	110	4	2018-04-23 13:49:19.793119	2018-04-23 13:49:19.793119	34
11	140	5	2018-04-23 13:49:19.795978	2018-04-23 13:49:19.795978	86
12	153	6	2018-04-23 13:49:19.798923	2018-04-23 13:49:19.798923	72
13	6	6	2018-04-23 13:49:19.800991	2018-04-23 13:49:19.800991	93
14	179	6	2018-04-23 13:49:19.80328	2018-04-23 13:49:19.80328	40
15	126	8	2018-04-23 13:49:19.806718	2018-04-23 13:49:19.806718	78
16	11	8	2018-04-23 13:49:19.80882	2018-04-23 13:49:19.80882	58
17	83	10	2018-04-23 13:49:19.812287	2018-04-23 13:49:19.812287	55
18	115	11	2018-04-23 13:49:19.815633	2018-04-23 13:49:19.815633	36
19	167	11	2018-04-23 13:49:19.817748	2018-04-23 13:49:19.817748	36
20	70	11	2018-04-23 13:49:19.820107	2018-04-23 13:49:19.820107	82
21	68	13	2018-04-23 13:49:19.823675	2018-04-23 13:49:19.823675	78
22	21	13	2018-04-23 13:49:19.825657	2018-04-23 13:49:19.825657	73
23	22	13	2018-04-23 13:49:19.827572	2018-04-23 13:49:19.827572	82
24	21	13	2018-04-23 13:49:19.829565	2018-04-23 13:49:19.829565	50
25	131	14	2018-04-23 13:49:19.832204	2018-04-23 13:49:19.832204	85
26	90	14	2018-04-23 13:49:19.83411	2018-04-23 13:49:19.83411	57
27	121	15	2018-04-23 13:49:19.836839	2018-04-23 13:49:19.836839	60
28	62	16	2018-04-23 13:49:19.839623	2018-04-23 13:49:19.839623	66
29	146	16	2018-04-23 13:49:19.841851	2018-04-23 13:49:19.841851	52
30	185	19	2018-04-23 13:49:19.845891	2018-04-23 13:49:19.845891	56
31	94	19	2018-04-23 13:49:19.847968	2018-04-23 13:49:19.847968	51
32	140	19	2018-04-23 13:49:19.850112	2018-04-23 13:49:19.850112	61
33	113	20	2018-04-23 13:49:19.853311	2018-04-23 13:49:19.853311	68
34	136	21	2018-04-23 13:49:19.856474	2018-04-23 13:49:19.856474	63
35	153	21	2018-04-23 13:49:19.858534	2018-04-23 13:49:19.858534	46
36	21	21	2018-04-23 13:49:19.860631	2018-04-23 13:49:19.860631	53
37	72	21	2018-04-23 13:49:19.862723	2018-04-23 13:49:19.862723	61
38	16	22	2018-04-23 13:49:19.865717	2018-04-23 13:49:19.865717	73
39	105	24	2018-04-23 13:49:19.86957	2018-04-23 13:49:19.86957	40
40	57	24	2018-04-23 13:49:19.87158	2018-04-23 13:49:19.87158	73
41	146	24	2018-04-23 13:49:19.873629	2018-04-23 13:49:19.873629	84
42	102	24	2018-04-23 13:49:19.875651	2018-04-23 13:49:19.875651	35
43	130	25	2018-04-23 13:49:19.878357	2018-04-23 13:49:19.878357	59
44	65	25	2018-04-23 13:49:19.88034	2018-04-23 13:49:19.88034	88
45	67	27	2018-04-23 13:49:19.883523	2018-04-23 13:49:19.883523	76
46	64	27	2018-04-23 13:49:19.885613	2018-04-23 13:49:19.885613	59
47	150	28	2018-04-23 13:49:19.888411	2018-04-23 13:49:19.888411	86
48	83	28	2018-04-23 13:49:19.890528	2018-04-23 13:49:19.890528	45
49	190	29	2018-04-23 13:49:19.893498	2018-04-23 13:49:19.893498	92
50	176	29	2018-04-23 13:49:19.89544	2018-04-23 13:49:19.89544	42
51	145	32	2018-04-23 13:49:19.89924	2018-04-23 13:49:19.89924	82
52	23	32	2018-04-23 13:49:19.901323	2018-04-23 13:49:19.901323	87
53	83	32	2018-04-23 13:49:19.903545	2018-04-23 13:49:19.903545	74
54	179	36	2018-04-23 13:49:19.908077	2018-04-23 13:49:19.908077	30
55	148	37	2018-04-23 13:49:19.910765	2018-04-23 13:49:19.910765	58
56	146	37	2018-04-23 13:49:19.912766	2018-04-23 13:49:19.912766	67
57	112	38	2018-04-23 13:49:19.915384	2018-04-23 13:49:19.915384	31
58	39	39	2018-04-23 13:49:19.918676	2018-04-23 13:49:19.918676	73
59	46	39	2018-04-23 13:49:19.920876	2018-04-23 13:49:19.920876	38
60	71	39	2018-04-23 13:49:19.923	2018-04-23 13:49:19.923	37
61	131	39	2018-04-23 13:49:19.925015	2018-04-23 13:49:19.925015	62
62	172	41	2018-04-23 13:49:19.92833	2018-04-23 13:49:19.92833	78
63	70	41	2018-04-23 13:49:19.930304	2018-04-23 13:49:19.930304	57
64	33	42	2018-04-23 13:49:19.932989	2018-04-23 13:49:19.932989	32
65	43	42	2018-04-23 13:49:19.934936	2018-04-23 13:49:19.934936	82
66	184	43	2018-04-23 13:49:19.937751	2018-04-23 13:49:19.937751	91
67	41	43	2018-04-23 13:49:19.939914	2018-04-23 13:49:19.939914	36
68	18	44	2018-04-23 13:49:19.94281	2018-04-23 13:49:19.94281	93
69	15	45	2018-04-23 13:49:19.945543	2018-04-23 13:49:19.945543	74
70	109	45	2018-04-23 13:49:19.947544	2018-04-23 13:49:19.947544	76
71	6	45	2018-04-23 13:49:19.949578	2018-04-23 13:49:19.949578	53
72	102	45	2018-04-23 13:49:19.951897	2018-04-23 13:49:19.951897	65
73	46	46	2018-04-23 13:49:19.954875	2018-04-23 13:49:19.954875	80
74	72	46	2018-04-23 13:49:19.9569	2018-04-23 13:49:19.9569	57
75	177	47	2018-04-23 13:49:19.959555	2018-04-23 13:49:19.959555	70
76	13	47	2018-04-23 13:49:19.966472	2018-04-23 13:49:19.966472	48
77	91	48	2018-04-23 13:49:19.969743	2018-04-23 13:49:19.969743	74
78	192	48	2018-04-23 13:49:19.971923	2018-04-23 13:49:19.971923	30
79	57	48	2018-04-23 13:49:19.973946	2018-04-23 13:49:19.973946	30
80	93	48	2018-04-23 13:49:19.976004	2018-04-23 13:49:19.976004	41
81	103	49	2018-04-23 13:49:19.978672	2018-04-23 13:49:19.978672	90
82	132	49	2018-04-23 13:49:19.980641	2018-04-23 13:49:19.980641	43
83	152	50	2018-04-23 13:49:19.983231	2018-04-23 13:49:19.983231	84
84	45	50	2018-04-23 13:49:19.985242	2018-04-23 13:49:19.985242	54
85	151	50	2018-04-23 13:49:19.987436	2018-04-23 13:49:19.987436	84
86	63	51	2018-04-23 13:49:19.990063	2018-04-23 13:49:19.990063	65
87	74	51	2018-04-23 13:49:19.991995	2018-04-23 13:49:19.991995	42
88	90	52	2018-04-23 13:49:19.994629	2018-04-23 13:49:19.994629	77
89	55	52	2018-04-23 13:49:19.996698	2018-04-23 13:49:19.996698	78
90	35	52	2018-04-23 13:49:19.998732	2018-04-23 13:49:19.998732	65
91	25	52	2018-04-23 13:49:20.000777	2018-04-23 13:49:20.000777	78
92	5	53	2018-04-23 13:49:20.004191	2018-04-23 13:49:20.004191	35
93	149	53	2018-04-23 13:49:20.006593	2018-04-23 13:49:20.006593	95
94	23	53	2018-04-23 13:49:20.008823	2018-04-23 13:49:20.008823	92
95	103	53	2018-04-23 13:49:20.010968	2018-04-23 13:49:20.010968	41
96	151	54	2018-04-23 13:49:20.01373	2018-04-23 13:49:20.01373	89
97	126	54	2018-04-23 13:49:20.015807	2018-04-23 13:49:20.015807	92
98	139	55	2018-04-23 13:49:20.018729	2018-04-23 13:49:20.018729	91
99	98	57	2018-04-23 13:49:20.022374	2018-04-23 13:49:20.022374	49
100	65	57	2018-04-23 13:49:20.024338	2018-04-23 13:49:20.024338	63
101	172	57	2018-04-23 13:49:20.026326	2018-04-23 13:49:20.026326	37
102	96	57	2018-04-23 13:49:20.028399	2018-04-23 13:49:20.028399	50
103	84	58	2018-04-23 13:49:20.030982	2018-04-23 13:49:20.030982	43
104	65	58	2018-04-23 13:49:20.033039	2018-04-23 13:49:20.033039	75
105	83	59	2018-04-23 13:49:20.035817	2018-04-23 13:49:20.035817	74
106	37	59	2018-04-23 13:49:20.037876	2018-04-23 13:49:20.037876	72
107	50	60	2018-04-23 13:49:20.04082	2018-04-23 13:49:20.04082	59
108	159	60	2018-04-23 13:49:20.042951	2018-04-23 13:49:20.042951	42
109	16	60	2018-04-23 13:49:20.044992	2018-04-23 13:49:20.044992	31
110	78	62	2018-04-23 13:49:20.048251	2018-04-23 13:49:20.048251	40
111	24	62	2018-04-23 13:49:20.05025	2018-04-23 13:49:20.05025	59
112	26	62	2018-04-23 13:49:20.052397	2018-04-23 13:49:20.052397	53
113	21	63	2018-04-23 13:49:20.055167	2018-04-23 13:49:20.055167	73
114	175	63	2018-04-23 13:49:20.057216	2018-04-23 13:49:20.057216	92
115	85	63	2018-04-23 13:49:20.059146	2018-04-23 13:49:20.059146	42
116	120	63	2018-04-23 13:49:20.061063	2018-04-23 13:49:20.061063	51
117	14	64	2018-04-23 13:49:20.063613	2018-04-23 13:49:20.063613	99
118	4	64	2018-04-23 13:49:20.065551	2018-04-23 13:49:20.065551	95
119	193	65	2018-04-23 13:49:20.068094	2018-04-23 13:49:20.068094	71
120	69	65	2018-04-23 13:49:20.070195	2018-04-23 13:49:20.070195	65
121	163	66	2018-04-23 13:49:20.072979	2018-04-23 13:49:20.072979	91
122	33	67	2018-04-23 13:49:20.076071	2018-04-23 13:49:20.076071	43
123	156	67	2018-04-23 13:49:20.078022	2018-04-23 13:49:20.078022	65
124	75	68	2018-04-23 13:49:20.080576	2018-04-23 13:49:20.080576	51
125	58	68	2018-04-23 13:49:20.082539	2018-04-23 13:49:20.082539	45
126	16	68	2018-04-23 13:49:20.084438	2018-04-23 13:49:20.084438	50
127	33	70	2018-04-23 13:49:20.088392	2018-04-23 13:49:20.088392	49
128	160	70	2018-04-23 13:49:20.090352	2018-04-23 13:49:20.090352	93
129	196	71	2018-04-23 13:49:20.092918	2018-04-23 13:49:20.092918	31
130	157	71	2018-04-23 13:49:20.094824	2018-04-23 13:49:20.094824	53
131	174	71	2018-04-23 13:49:20.096881	2018-04-23 13:49:20.096881	95
132	39	74	2018-04-23 13:49:20.100897	2018-04-23 13:49:20.100897	88
133	134	75	2018-04-23 13:49:20.103826	2018-04-23 13:49:20.103826	79
134	151	75	2018-04-23 13:49:20.105804	2018-04-23 13:49:20.105804	62
135	169	75	2018-04-23 13:49:20.107744	2018-04-23 13:49:20.107744	44
136	106	76	2018-04-23 13:49:20.110338	2018-04-23 13:49:20.110338	90
137	186	76	2018-04-23 13:49:20.112313	2018-04-23 13:49:20.112313	65
138	83	76	2018-04-23 13:49:20.114197	2018-04-23 13:49:20.114197	93
139	162	76	2018-04-23 13:49:20.116149	2018-04-23 13:49:20.116149	62
140	153	77	2018-04-23 13:49:20.119004	2018-04-23 13:49:20.119004	60
141	191	77	2018-04-23 13:49:20.121119	2018-04-23 13:49:20.121119	94
142	77	77	2018-04-23 13:49:20.123251	2018-04-23 13:49:20.123251	58
143	150	77	2018-04-23 13:49:20.125345	2018-04-23 13:49:20.125345	74
144	19	78	2018-04-23 13:49:20.128083	2018-04-23 13:49:20.128083	58
145	46	80	2018-04-23 13:49:20.1314	2018-04-23 13:49:20.1314	82
146	87	80	2018-04-23 13:49:20.133356	2018-04-23 13:49:20.133356	92
147	97	81	2018-04-23 13:49:20.13612	2018-04-23 13:49:20.13612	36
148	127	83	2018-04-23 13:49:20.139481	2018-04-23 13:49:20.139481	55
149	86	84	2018-04-23 13:49:20.14214	2018-04-23 13:49:20.14214	81
150	25	84	2018-04-23 13:49:20.144087	2018-04-23 13:49:20.144087	38
151	193	84	2018-04-23 13:49:20.146021	2018-04-23 13:49:20.146021	71
152	106	85	2018-04-23 13:49:20.14863	2018-04-23 13:49:20.14863	65
153	23	86	2018-04-23 13:49:20.151348	2018-04-23 13:49:20.151348	65
154	74	86	2018-04-23 13:49:20.153458	2018-04-23 13:49:20.153458	58
155	43	86	2018-04-23 13:49:20.155459	2018-04-23 13:49:20.155459	45
156	35	87	2018-04-23 13:49:20.158081	2018-04-23 13:49:20.158081	40
157	118	87	2018-04-23 13:49:20.16003	2018-04-23 13:49:20.16003	42
158	188	87	2018-04-23 13:49:20.161975	2018-04-23 13:49:20.161975	87
159	33	87	2018-04-23 13:49:20.164029	2018-04-23 13:49:20.164029	68
160	148	88	2018-04-23 13:49:20.166681	2018-04-23 13:49:20.166681	40
161	191	88	2018-04-23 13:49:20.168696	2018-04-23 13:49:20.168696	36
162	185	89	2018-04-23 13:49:20.171464	2018-04-23 13:49:20.171464	80
163	156	89	2018-04-23 13:49:20.173557	2018-04-23 13:49:20.173557	68
164	67	89	2018-04-23 13:49:20.175856	2018-04-23 13:49:20.175856	58
165	156	90	2018-04-23 13:49:20.178616	2018-04-23 13:49:20.178616	70
166	128	90	2018-04-23 13:49:20.18064	2018-04-23 13:49:20.18064	48
167	130	90	2018-04-23 13:49:20.182601	2018-04-23 13:49:20.182601	63
168	182	90	2018-04-23 13:49:20.184633	2018-04-23 13:49:20.184633	47
169	35	91	2018-04-23 13:49:20.187445	2018-04-23 13:49:20.187445	92
170	128	91	2018-04-23 13:49:20.189426	2018-04-23 13:49:20.189426	52
171	132	91	2018-04-23 13:49:20.191517	2018-04-23 13:49:20.191517	81
172	132	91	2018-04-23 13:49:20.193557	2018-04-23 13:49:20.193557	76
173	175	92	2018-04-23 13:49:20.196281	2018-04-23 13:49:20.196281	41
174	52	92	2018-04-23 13:49:20.1983	2018-04-23 13:49:20.1983	37
175	172	92	2018-04-23 13:49:20.200431	2018-04-23 13:49:20.200431	42
176	112	92	2018-04-23 13:49:20.202523	2018-04-23 13:49:20.202523	70
177	167	93	2018-04-23 13:49:20.205406	2018-04-23 13:49:20.205406	84
178	122	94	2018-04-23 13:49:20.208354	2018-04-23 13:49:20.208354	48
179	86	95	2018-04-23 13:49:20.211309	2018-04-23 13:49:20.211309	52
180	182	95	2018-04-23 13:49:20.213589	2018-04-23 13:49:20.213589	42
181	110	95	2018-04-23 13:49:20.215694	2018-04-23 13:49:20.215694	98
182	187	98	2018-04-23 13:49:20.21976	2018-04-23 13:49:20.21976	31
183	61	98	2018-04-23 13:49:20.221831	2018-04-23 13:49:20.221831	87
184	142	99	2018-04-23 13:49:20.224578	2018-04-23 13:49:20.224578	90
185	130	99	2018-04-23 13:49:20.226711	2018-04-23 13:49:20.226711	30
186	190	99	2018-04-23 13:49:20.228799	2018-04-23 13:49:20.228799	75
187	57	99	2018-04-23 13:49:20.230878	2018-04-23 13:49:20.230878	51
188	160	100	2018-04-23 13:49:20.233625	2018-04-23 13:49:20.233625	59
189	20	100	2018-04-23 13:49:20.235711	2018-04-23 13:49:20.235711	59
190	196	101	2018-04-23 13:49:20.23891	2018-04-23 13:49:20.23891	58
191	67	101	2018-04-23 13:49:20.241325	2018-04-23 13:49:20.241325	86
192	48	101	2018-04-23 13:49:20.243725	2018-04-23 13:49:20.243725	81
193	170	101	2018-04-23 13:49:20.246154	2018-04-23 13:49:20.246154	42
194	132	102	2018-04-23 13:49:20.249106	2018-04-23 13:49:20.249106	53
195	81	102	2018-04-23 13:49:20.251292	2018-04-23 13:49:20.251292	77
196	198	102	2018-04-23 13:49:20.253675	2018-04-23 13:49:20.253675	46
197	86	102	2018-04-23 13:49:20.255681	2018-04-23 13:49:20.255681	66
198	200	103	2018-04-23 13:49:20.258452	2018-04-23 13:49:20.258452	38
199	53	104	2018-04-23 13:49:20.261069	2018-04-23 13:49:20.261069	65
200	90	104	2018-04-23 13:49:20.263014	2018-04-23 13:49:20.263014	72
201	103	104	2018-04-23 13:49:20.264942	2018-04-23 13:49:20.264942	84
202	193	104	2018-04-23 13:49:20.266953	2018-04-23 13:49:20.266953	92
203	87	105	2018-04-23 13:49:20.269675	2018-04-23 13:49:20.269675	80
204	171	106	2018-04-23 13:49:20.27244	2018-04-23 13:49:20.27244	91
205	180	106	2018-04-23 13:49:20.274455	2018-04-23 13:49:20.274455	53
206	107	107	2018-04-23 13:49:20.277393	2018-04-23 13:49:20.277393	54
207	7	107	2018-04-23 13:49:20.27966	2018-04-23 13:49:20.27966	48
208	170	107	2018-04-23 13:49:20.28168	2018-04-23 13:49:20.28168	69
209	108	107	2018-04-23 13:49:20.283678	2018-04-23 13:49:20.283678	95
210	121	108	2018-04-23 13:49:20.286448	2018-04-23 13:49:20.286448	54
211	63	108	2018-04-23 13:49:20.288518	2018-04-23 13:49:20.288518	61
212	182	108	2018-04-23 13:49:20.290585	2018-04-23 13:49:20.290585	57
213	144	109	2018-04-23 13:49:20.293372	2018-04-23 13:49:20.293372	85
214	179	111	2018-04-23 13:49:20.297077	2018-04-23 13:49:20.297077	48
215	100	111	2018-04-23 13:49:20.299512	2018-04-23 13:49:20.299512	42
216	26	112	2018-04-23 13:49:20.302693	2018-04-23 13:49:20.302693	45
217	44	112	2018-04-23 13:49:20.304939	2018-04-23 13:49:20.304939	66
218	187	112	2018-04-23 13:49:20.307085	2018-04-23 13:49:20.307085	93
219	120	113	2018-04-23 13:49:20.309941	2018-04-23 13:49:20.309941	96
220	198	113	2018-04-23 13:49:20.312038	2018-04-23 13:49:20.312038	79
221	119	113	2018-04-23 13:49:20.314063	2018-04-23 13:49:20.314063	62
222	50	113	2018-04-23 13:49:20.316014	2018-04-23 13:49:20.316014	52
223	123	114	2018-04-23 13:49:20.318828	2018-04-23 13:49:20.318828	30
224	146	115	2018-04-23 13:49:20.321649	2018-04-23 13:49:20.321649	51
225	130	115	2018-04-23 13:49:20.323638	2018-04-23 13:49:20.323638	76
226	139	115	2018-04-23 13:49:20.325625	2018-04-23 13:49:20.325625	85
227	75	115	2018-04-23 13:49:20.327657	2018-04-23 13:49:20.327657	46
228	13	116	2018-04-23 13:49:20.330381	2018-04-23 13:49:20.330381	95
229	20	116	2018-04-23 13:49:20.332287	2018-04-23 13:49:20.332287	32
230	188	117	2018-04-23 13:49:20.335373	2018-04-23 13:49:20.335373	90
231	138	118	2018-04-23 13:49:20.338262	2018-04-23 13:49:20.338262	90
232	177	118	2018-04-23 13:49:20.340349	2018-04-23 13:49:20.340349	88
233	145	118	2018-04-23 13:49:20.342502	2018-04-23 13:49:20.342502	44
234	196	118	2018-04-23 13:49:20.344467	2018-04-23 13:49:20.344467	48
235	129	119	2018-04-23 13:49:20.347146	2018-04-23 13:49:20.347146	66
236	186	119	2018-04-23 13:49:20.349242	2018-04-23 13:49:20.349242	38
237	104	119	2018-04-23 13:49:20.351266	2018-04-23 13:49:20.351266	36
238	15	120	2018-04-23 13:49:20.354308	2018-04-23 13:49:20.354308	49
239	96	120	2018-04-23 13:49:20.35632	2018-04-23 13:49:20.35632	35
240	120	120	2018-04-23 13:49:20.358285	2018-04-23 13:49:20.358285	82
241	195	121	2018-04-23 13:49:20.36088	2018-04-23 13:49:20.36088	79
242	133	121	2018-04-23 13:49:20.362883	2018-04-23 13:49:20.362883	30
243	167	122	2018-04-23 13:49:20.365441	2018-04-23 13:49:20.365441	49
244	74	122	2018-04-23 13:49:20.367369	2018-04-23 13:49:20.367369	66
245	63	123	2018-04-23 13:49:20.370336	2018-04-23 13:49:20.370336	91
246	81	123	2018-04-23 13:49:20.372382	2018-04-23 13:49:20.372382	33
247	123	123	2018-04-23 13:49:20.374447	2018-04-23 13:49:20.374447	82
248	35	123	2018-04-23 13:49:20.376514	2018-04-23 13:49:20.376514	76
249	78	124	2018-04-23 13:49:20.37924	2018-04-23 13:49:20.37924	34
250	24	124	2018-04-23 13:49:20.381289	2018-04-23 13:49:20.381289	94
251	79	124	2018-04-23 13:49:20.383431	2018-04-23 13:49:20.383431	54
252	184	124	2018-04-23 13:49:20.385934	2018-04-23 13:49:20.385934	62
253	37	125	2018-04-23 13:49:20.388768	2018-04-23 13:49:20.388768	83
254	40	125	2018-04-23 13:49:20.390831	2018-04-23 13:49:20.390831	51
255	136	125	2018-04-23 13:49:20.392817	2018-04-23 13:49:20.392817	55
256	135	126	2018-04-23 13:49:20.395444	2018-04-23 13:49:20.395444	76
257	19	126	2018-04-23 13:49:20.397385	2018-04-23 13:49:20.397385	83
258	55	126	2018-04-23 13:49:20.399347	2018-04-23 13:49:20.399347	48
259	192	127	2018-04-23 13:49:20.401962	2018-04-23 13:49:20.401962	78
260	105	128	2018-04-23 13:49:20.40491	2018-04-23 13:49:20.40491	86
261	32	129	2018-04-23 13:49:20.407661	2018-04-23 13:49:20.407661	93
262	119	132	2018-04-23 13:49:20.411523	2018-04-23 13:49:20.411523	78
263	35	132	2018-04-23 13:49:20.413479	2018-04-23 13:49:20.413479	91
264	73	132	2018-04-23 13:49:20.415415	2018-04-23 13:49:20.415415	67
265	17	134	2018-04-23 13:49:20.418921	2018-04-23 13:49:20.418921	66
266	82	134	2018-04-23 13:49:20.420993	2018-04-23 13:49:20.420993	50
267	88	135	2018-04-23 13:49:20.423667	2018-04-23 13:49:20.423667	51
268	178	135	2018-04-23 13:49:20.425639	2018-04-23 13:49:20.425639	99
269	15	135	2018-04-23 13:49:20.427726	2018-04-23 13:49:20.427726	82
270	167	136	2018-04-23 13:49:20.430429	2018-04-23 13:49:20.430429	100
271	166	136	2018-04-23 13:49:20.432404	2018-04-23 13:49:20.432404	87
272	43	136	2018-04-23 13:49:20.434349	2018-04-23 13:49:20.434349	94
273	186	136	2018-04-23 13:49:20.43661	2018-04-23 13:49:20.43661	100
274	153	137	2018-04-23 13:49:20.439335	2018-04-23 13:49:20.439335	53
275	16	138	2018-04-23 13:49:20.441976	2018-04-23 13:49:20.441976	41
276	161	138	2018-04-23 13:49:20.443983	2018-04-23 13:49:20.443983	53
277	103	138	2018-04-23 13:49:20.445917	2018-04-23 13:49:20.445917	67
278	103	139	2018-04-23 13:49:20.448462	2018-04-23 13:49:20.448462	47
279	20	142	2018-04-23 13:49:20.452308	2018-04-23 13:49:20.452308	47
280	164	143	2018-04-23 13:49:20.455078	2018-04-23 13:49:20.455078	88
281	112	143	2018-04-23 13:49:20.457127	2018-04-23 13:49:20.457127	38
282	37	143	2018-04-23 13:49:20.459116	2018-04-23 13:49:20.459116	70
283	89	143	2018-04-23 13:49:20.461058	2018-04-23 13:49:20.461058	62
284	179	144	2018-04-23 13:49:20.463796	2018-04-23 13:49:20.463796	53
285	83	144	2018-04-23 13:49:20.465743	2018-04-23 13:49:20.465743	35
286	22	145	2018-04-23 13:49:20.468466	2018-04-23 13:49:20.468466	91
287	37	145	2018-04-23 13:49:20.470552	2018-04-23 13:49:20.470552	87
288	166	146	2018-04-23 13:49:20.474105	2018-04-23 13:49:20.474105	41
289	18	146	2018-04-23 13:49:20.476127	2018-04-23 13:49:20.476127	57
290	59	146	2018-04-23 13:49:20.478144	2018-04-23 13:49:20.478144	92
291	5	147	2018-04-23 13:49:20.481015	2018-04-23 13:49:20.481015	52
292	42	148	2018-04-23 13:49:20.483774	2018-04-23 13:49:20.483774	96
293	12	148	2018-04-23 13:49:20.486027	2018-04-23 13:49:20.486027	97
294	192	148	2018-04-23 13:49:20.488043	2018-04-23 13:49:20.488043	56
295	77	148	2018-04-23 13:49:20.490046	2018-04-23 13:49:20.490046	84
296	37	150	2018-04-23 13:49:20.493341	2018-04-23 13:49:20.493341	49
297	195	150	2018-04-23 13:49:20.495338	2018-04-23 13:49:20.495338	66
298	167	152	2018-04-23 13:49:20.498523	2018-04-23 13:49:20.498523	47
299	100	152	2018-04-23 13:49:20.500466	2018-04-23 13:49:20.500466	68
300	51	152	2018-04-23 13:49:20.50257	2018-04-23 13:49:20.50257	48
301	70	154	2018-04-23 13:49:20.506249	2018-04-23 13:49:20.506249	82
302	63	155	2018-04-23 13:49:20.509249	2018-04-23 13:49:20.509249	67
303	88	155	2018-04-23 13:49:20.511267	2018-04-23 13:49:20.511267	59
304	32	155	2018-04-23 13:49:20.513309	2018-04-23 13:49:20.513309	82
305	63	156	2018-04-23 13:49:20.515941	2018-04-23 13:49:20.515941	46
306	74	156	2018-04-23 13:49:20.518085	2018-04-23 13:49:20.518085	40
307	8	156	2018-04-23 13:49:20.520232	2018-04-23 13:49:20.520232	81
308	38	157	2018-04-23 13:49:20.523004	2018-04-23 13:49:20.523004	49
309	105	157	2018-04-23 13:49:20.525003	2018-04-23 13:49:20.525003	83
310	56	157	2018-04-23 13:49:20.526963	2018-04-23 13:49:20.526963	70
311	197	157	2018-04-23 13:49:20.52893	2018-04-23 13:49:20.52893	49
312	181	158	2018-04-23 13:49:20.535769	2018-04-23 13:49:20.535769	41
313	143	158	2018-04-23 13:49:20.538012	2018-04-23 13:49:20.538012	89
314	117	158	2018-04-23 13:49:20.540106	2018-04-23 13:49:20.540106	82
315	49	158	2018-04-23 13:49:20.542041	2018-04-23 13:49:20.542041	60
316	174	159	2018-04-23 13:49:20.544656	2018-04-23 13:49:20.544656	70
317	112	159	2018-04-23 13:49:20.546632	2018-04-23 13:49:20.546632	70
318	127	159	2018-04-23 13:49:20.548531	2018-04-23 13:49:20.548531	39
319	180	161	2018-04-23 13:49:20.551721	2018-04-23 13:49:20.551721	100
320	171	161	2018-04-23 13:49:20.553963	2018-04-23 13:49:20.553963	71
321	174	162	2018-04-23 13:49:20.556756	2018-04-23 13:49:20.556756	62
322	41	164	2018-04-23 13:49:20.560291	2018-04-23 13:49:20.560291	32
323	29	164	2018-04-23 13:49:20.562253	2018-04-23 13:49:20.562253	86
324	75	164	2018-04-23 13:49:20.564184	2018-04-23 13:49:20.564184	67
325	185	164	2018-04-23 13:49:20.56623	2018-04-23 13:49:20.56623	73
326	60	165	2018-04-23 13:49:20.569028	2018-04-23 13:49:20.569028	96
327	158	165	2018-04-23 13:49:20.571334	2018-04-23 13:49:20.571334	92
328	83	165	2018-04-23 13:49:20.573434	2018-04-23 13:49:20.573434	50
329	169	167	2018-04-23 13:49:20.57685	2018-04-23 13:49:20.57685	45
330	163	168	2018-04-23 13:49:20.579502	2018-04-23 13:49:20.579502	65
331	73	168	2018-04-23 13:49:20.58183	2018-04-23 13:49:20.58183	50
332	178	169	2018-04-23 13:49:20.584557	2018-04-23 13:49:20.584557	75
333	101	169	2018-04-23 13:49:20.586694	2018-04-23 13:49:20.586694	54
334	60	170	2018-04-23 13:49:20.589407	2018-04-23 13:49:20.589407	66
335	42	171	2018-04-23 13:49:20.591967	2018-04-23 13:49:20.591967	98
336	125	171	2018-04-23 13:49:20.593882	2018-04-23 13:49:20.593882	72
337	1	172	2018-04-23 13:49:20.596585	2018-04-23 13:49:20.596585	60
338	200	172	2018-04-23 13:49:20.598583	2018-04-23 13:49:20.598583	96
339	164	172	2018-04-23 13:49:20.600926	2018-04-23 13:49:20.600926	48
340	166	173	2018-04-23 13:49:20.60369	2018-04-23 13:49:20.60369	80
341	100	173	2018-04-23 13:49:20.606095	2018-04-23 13:49:20.606095	50
342	26	173	2018-04-23 13:49:20.608198	2018-04-23 13:49:20.608198	49
343	38	174	2018-04-23 13:49:20.611161	2018-04-23 13:49:20.611161	39
344	153	175	2018-04-23 13:49:20.613772	2018-04-23 13:49:20.613772	90
345	91	175	2018-04-23 13:49:20.615798	2018-04-23 13:49:20.615798	58
346	149	175	2018-04-23 13:49:20.617754	2018-04-23 13:49:20.617754	93
347	174	176	2018-04-23 13:49:20.620454	2018-04-23 13:49:20.620454	74
348	156	176	2018-04-23 13:49:20.622394	2018-04-23 13:49:20.622394	46
349	41	176	2018-04-23 13:49:20.624325	2018-04-23 13:49:20.624325	58
350	194	176	2018-04-23 13:49:20.626252	2018-04-23 13:49:20.626252	32
351	91	178	2018-04-23 13:49:20.629513	2018-04-23 13:49:20.629513	77
352	163	178	2018-04-23 13:49:20.631451	2018-04-23 13:49:20.631451	77
353	97	179	2018-04-23 13:49:20.634078	2018-04-23 13:49:20.634078	80
354	166	180	2018-04-23 13:49:20.637083	2018-04-23 13:49:20.637083	45
355	112	180	2018-04-23 13:49:20.639149	2018-04-23 13:49:20.639149	66
356	62	181	2018-04-23 13:49:20.64201	2018-04-23 13:49:20.64201	84
357	4	181	2018-04-23 13:49:20.644147	2018-04-23 13:49:20.644147	50
358	77	182	2018-04-23 13:49:20.647004	2018-04-23 13:49:20.647004	53
359	132	183	2018-04-23 13:49:20.649795	2018-04-23 13:49:20.649795	93
360	180	183	2018-04-23 13:49:20.651891	2018-04-23 13:49:20.651891	47
361	98	183	2018-04-23 13:49:20.654046	2018-04-23 13:49:20.654046	87
362	114	183	2018-04-23 13:49:20.656311	2018-04-23 13:49:20.656311	66
363	3	184	2018-04-23 13:49:20.659058	2018-04-23 13:49:20.659058	41
364	69	185	2018-04-23 13:49:20.661881	2018-04-23 13:49:20.661881	48
365	35	185	2018-04-23 13:49:20.663926	2018-04-23 13:49:20.663926	44
366	195	185	2018-04-23 13:49:20.665974	2018-04-23 13:49:20.665974	35
367	64	185	2018-04-23 13:49:20.667999	2018-04-23 13:49:20.667999	80
368	48	187	2018-04-23 13:49:20.672187	2018-04-23 13:49:20.672187	88
369	41	187	2018-04-23 13:49:20.674213	2018-04-23 13:49:20.674213	79
370	10	187	2018-04-23 13:49:20.67622	2018-04-23 13:49:20.67622	30
371	84	187	2018-04-23 13:49:20.67823	2018-04-23 13:49:20.67823	50
372	144	189	2018-04-23 13:49:20.681391	2018-04-23 13:49:20.681391	81
373	104	189	2018-04-23 13:49:20.683316	2018-04-23 13:49:20.683316	96
374	19	189	2018-04-23 13:49:20.685524	2018-04-23 13:49:20.685524	74
375	135	189	2018-04-23 13:49:20.687818	2018-04-23 13:49:20.687818	72
376	96	192	2018-04-23 13:49:20.691769	2018-04-23 13:49:20.691769	96
377	10	192	2018-04-23 13:49:20.694028	2018-04-23 13:49:20.694028	53
378	167	192	2018-04-23 13:49:20.69603	2018-04-23 13:49:20.69603	36
379	54	193	2018-04-23 13:49:20.69879	2018-04-23 13:49:20.69879	64
380	187	197	2018-04-23 13:49:20.703483	2018-04-23 13:49:20.703483	68
381	189	198	2018-04-23 13:49:20.70674	2018-04-23 13:49:20.70674	80
382	3	198	2018-04-23 13:49:20.708848	2018-04-23 13:49:20.708848	68
383	125	198	2018-04-23 13:49:20.71098	2018-04-23 13:49:20.71098	55
384	78	198	2018-04-23 13:49:20.713222	2018-04-23 13:49:20.713222	58
385	68	199	2018-04-23 13:49:20.715836	2018-04-23 13:49:20.715836	61
386	59	199	2018-04-23 13:49:20.717816	2018-04-23 13:49:20.717816	66
387	49	199	2018-04-23 13:49:20.720165	2018-04-23 13:49:20.720165	51
388	44	200	2018-04-23 13:49:20.722874	2018-04-23 13:49:20.722874	54
389	31	200	2018-04-23 13:49:20.724804	2018-04-23 13:49:20.724804	43
390	76	200	2018-04-23 13:49:20.72675	2018-04-23 13:49:20.72675	72
391	98	200	2018-04-23 13:49:20.728683	2018-04-23 13:49:20.728683	39
392	32	201	2018-04-23 13:49:20.731246	2018-04-23 13:49:20.731246	42
393	157	201	2018-04-23 13:49:20.733169	2018-04-23 13:49:20.733169	81
394	158	201	2018-04-23 13:49:20.735154	2018-04-23 13:49:20.735154	45
395	25	202	2018-04-23 13:49:20.738039	2018-04-23 13:49:20.738039	97
396	81	202	2018-04-23 13:49:20.740065	2018-04-23 13:49:20.740065	53
397	32	202	2018-04-23 13:49:20.742064	2018-04-23 13:49:20.742064	43
398	124	203	2018-04-23 13:49:20.744781	2018-04-23 13:49:20.744781	36
399	96	203	2018-04-23 13:49:20.746736	2018-04-23 13:49:20.746736	92
400	142	203	2018-04-23 13:49:20.748657	2018-04-23 13:49:20.748657	43
401	26	204	2018-04-23 13:49:20.751313	2018-04-23 13:49:20.751313	86
402	109	204	2018-04-23 13:49:20.753355	2018-04-23 13:49:20.753355	87
403	101	204	2018-04-23 13:49:20.755346	2018-04-23 13:49:20.755346	62
404	173	204	2018-04-23 13:49:20.757393	2018-04-23 13:49:20.757393	87
405	66	205	2018-04-23 13:49:20.760289	2018-04-23 13:49:20.760289	32
406	129	205	2018-04-23 13:49:20.762467	2018-04-23 13:49:20.762467	74
407	94	205	2018-04-23 13:49:20.764609	2018-04-23 13:49:20.764609	88
408	104	205	2018-04-23 13:49:20.766611	2018-04-23 13:49:20.766611	61
409	40	208	2018-04-23 13:49:20.771139	2018-04-23 13:49:20.771139	36
410	179	208	2018-04-23 13:49:20.773258	2018-04-23 13:49:20.773258	81
411	48	208	2018-04-23 13:49:20.775225	2018-04-23 13:49:20.775225	79
412	61	210	2018-04-23 13:49:20.778574	2018-04-23 13:49:20.778574	57
413	80	210	2018-04-23 13:49:20.780583	2018-04-23 13:49:20.780583	81
414	44	211	2018-04-23 13:49:20.783241	2018-04-23 13:49:20.783241	96
415	24	211	2018-04-23 13:49:20.785209	2018-04-23 13:49:20.785209	50
416	200	211	2018-04-23 13:49:20.787338	2018-04-23 13:49:20.787338	30
417	160	211	2018-04-23 13:49:20.789389	2018-04-23 13:49:20.789389	63
418	187	212	2018-04-23 13:49:20.792138	2018-04-23 13:49:20.792138	86
419	196	212	2018-04-23 13:49:20.794116	2018-04-23 13:49:20.794116	73
420	152	213	2018-04-23 13:49:20.796721	2018-04-23 13:49:20.796721	44
421	1	213	2018-04-23 13:49:20.798675	2018-04-23 13:49:20.798675	95
422	112	215	2018-04-23 13:49:20.80182	2018-04-23 13:49:20.80182	91
423	36	215	2018-04-23 13:49:20.80413	2018-04-23 13:49:20.80413	52
424	74	216	2018-04-23 13:49:20.806935	2018-04-23 13:49:20.806935	86
425	73	217	2018-04-23 13:49:20.809563	2018-04-23 13:49:20.809563	95
426	70	218	2018-04-23 13:49:20.812179	2018-04-23 13:49:20.812179	90
427	43	218	2018-04-23 13:49:20.814257	2018-04-23 13:49:20.814257	39
428	149	219	2018-04-23 13:49:20.816926	2018-04-23 13:49:20.816926	87
429	72	219	2018-04-23 13:49:20.820109	2018-04-23 13:49:20.820109	54
430	23	219	2018-04-23 13:49:20.822329	2018-04-23 13:49:20.822329	39
431	180	219	2018-04-23 13:49:20.824342	2018-04-23 13:49:20.824342	65
432	185	220	2018-04-23 13:49:20.826936	2018-04-23 13:49:20.826936	67
433	16	220	2018-04-23 13:49:20.82888	2018-04-23 13:49:20.82888	85
434	118	220	2018-04-23 13:49:20.830837	2018-04-23 13:49:20.830837	60
435	42	221	2018-04-23 13:49:20.833494	2018-04-23 13:49:20.833494	44
436	30	221	2018-04-23 13:49:20.83556	2018-04-23 13:49:20.83556	44
437	13	221	2018-04-23 13:49:20.837625	2018-04-23 13:49:20.837625	34
438	81	221	2018-04-23 13:49:20.83997	2018-04-23 13:49:20.83997	48
439	14	222	2018-04-23 13:49:20.842952	2018-04-23 13:49:20.842952	39
440	177	222	2018-04-23 13:49:20.845023	2018-04-23 13:49:20.845023	85
441	91	222	2018-04-23 13:49:20.847162	2018-04-23 13:49:20.847162	75
442	181	222	2018-04-23 13:49:20.849193	2018-04-23 13:49:20.849193	62
443	150	223	2018-04-23 13:49:20.852054	2018-04-23 13:49:20.852054	98
444	106	223	2018-04-23 13:49:20.854252	2018-04-23 13:49:20.854252	80
445	42	223	2018-04-23 13:49:20.856316	2018-04-23 13:49:20.856316	61
446	74	224	2018-04-23 13:49:20.859048	2018-04-23 13:49:20.859048	96
447	9	225	2018-04-23 13:49:20.861747	2018-04-23 13:49:20.861747	58
448	33	225	2018-04-23 13:49:20.864109	2018-04-23 13:49:20.864109	32
449	3	225	2018-04-23 13:49:20.866326	2018-04-23 13:49:20.866326	100
450	170	225	2018-04-23 13:49:20.868445	2018-04-23 13:49:20.868445	87
451	93	226	2018-04-23 13:49:20.871219	2018-04-23 13:49:20.871219	56
452	152	227	2018-04-23 13:49:20.873863	2018-04-23 13:49:20.873863	93
453	96	227	2018-04-23 13:49:20.875926	2018-04-23 13:49:20.875926	89
454	138	227	2018-04-23 13:49:20.877978	2018-04-23 13:49:20.877978	43
455	71	228	2018-04-23 13:49:20.880923	2018-04-23 13:49:20.880923	38
456	150	229	2018-04-23 13:49:20.883689	2018-04-23 13:49:20.883689	32
457	124	229	2018-04-23 13:49:20.885882	2018-04-23 13:49:20.885882	32
458	103	229	2018-04-23 13:49:20.887997	2018-04-23 13:49:20.887997	44
459	18	230	2018-04-23 13:49:20.890891	2018-04-23 13:49:20.890891	44
460	116	230	2018-04-23 13:49:20.893091	2018-04-23 13:49:20.893091	52
461	138	230	2018-04-23 13:49:20.895057	2018-04-23 13:49:20.895057	33
462	55	230	2018-04-23 13:49:20.896995	2018-04-23 13:49:20.896995	66
463	28	231	2018-04-23 13:49:20.899575	2018-04-23 13:49:20.899575	32
464	191	231	2018-04-23 13:49:20.901506	2018-04-23 13:49:20.901506	71
465	115	232	2018-04-23 13:49:20.904476	2018-04-23 13:49:20.904476	39
466	163	232	2018-04-23 13:49:20.906562	2018-04-23 13:49:20.906562	51
467	136	232	2018-04-23 13:49:20.908637	2018-04-23 13:49:20.908637	39
468	57	233	2018-04-23 13:49:20.91142	2018-04-23 13:49:20.91142	36
469	173	237	2018-04-23 13:49:20.916208	2018-04-23 13:49:20.916208	97
470	163	237	2018-04-23 13:49:20.918315	2018-04-23 13:49:20.918315	48
471	181	238	2018-04-23 13:49:20.921096	2018-04-23 13:49:20.921096	38
472	4	238	2018-04-23 13:49:20.92306	2018-04-23 13:49:20.92306	64
473	139	238	2018-04-23 13:49:20.924963	2018-04-23 13:49:20.924963	53
474	55	239	2018-04-23 13:49:20.92751	2018-04-23 13:49:20.92751	89
475	149	241	2018-04-23 13:49:20.930713	2018-04-23 13:49:20.930713	77
476	104	241	2018-04-23 13:49:20.932694	2018-04-23 13:49:20.932694	50
477	101	241	2018-04-23 13:49:20.934819	2018-04-23 13:49:20.934819	70
478	40	241	2018-04-23 13:49:20.936933	2018-04-23 13:49:20.936933	35
479	188	243	2018-04-23 13:49:20.940314	2018-04-23 13:49:20.940314	83
480	112	244	2018-04-23 13:49:20.943133	2018-04-23 13:49:20.943133	34
481	99	244	2018-04-23 13:49:20.94517	2018-04-23 13:49:20.94517	53
482	36	245	2018-04-23 13:49:20.947885	2018-04-23 13:49:20.947885	59
483	78	246	2018-04-23 13:49:20.950508	2018-04-23 13:49:20.950508	34
484	14	247	2018-04-23 13:49:20.953497	2018-04-23 13:49:20.953497	57
485	20	247	2018-04-23 13:49:20.955542	2018-04-23 13:49:20.955542	54
486	172	248	2018-04-23 13:49:20.958206	2018-04-23 13:49:20.958206	72
487	48	249	2018-04-23 13:49:20.960851	2018-04-23 13:49:20.960851	50
488	106	249	2018-04-23 13:49:20.962791	2018-04-23 13:49:20.962791	47
489	138	249	2018-04-23 13:49:20.964743	2018-04-23 13:49:20.964743	76
490	177	250	2018-04-23 13:49:20.967362	2018-04-23 13:49:20.967362	64
491	47	251	2018-04-23 13:49:20.970241	2018-04-23 13:49:20.970241	30
492	110	251	2018-04-23 13:49:20.972515	2018-04-23 13:49:20.972515	50
493	99	251	2018-04-23 13:49:20.974639	2018-04-23 13:49:20.974639	51
494	48	251	2018-04-23 13:49:20.976706	2018-04-23 13:49:20.976706	39
495	191	252	2018-04-23 13:49:20.979463	2018-04-23 13:49:20.979463	67
496	40	252	2018-04-23 13:49:20.981605	2018-04-23 13:49:20.981605	32
497	167	252	2018-04-23 13:49:20.983659	2018-04-23 13:49:20.983659	74
498	40	252	2018-04-23 13:49:20.985788	2018-04-23 13:49:20.985788	55
499	70	253	2018-04-23 13:49:20.988517	2018-04-23 13:49:20.988517	53
500	63	253	2018-04-23 13:49:20.990496	2018-04-23 13:49:20.990496	62
501	46	254	2018-04-23 13:49:20.993131	2018-04-23 13:49:20.993131	67
502	112	254	2018-04-23 13:49:20.995311	2018-04-23 13:49:20.995311	59
503	166	254	2018-04-23 13:49:20.997297	2018-04-23 13:49:20.997297	32
504	83	254	2018-04-23 13:49:20.999239	2018-04-23 13:49:20.999239	61
505	132	255	2018-04-23 13:49:21.001985	2018-04-23 13:49:21.001985	49
506	115	255	2018-04-23 13:49:21.004086	2018-04-23 13:49:21.004086	30
507	14	255	2018-04-23 13:49:21.006146	2018-04-23 13:49:21.006146	33
508	92	256	2018-04-23 13:49:21.009018	2018-04-23 13:49:21.009018	85
509	55	257	2018-04-23 13:49:21.011704	2018-04-23 13:49:21.011704	35
510	116	257	2018-04-23 13:49:21.014023	2018-04-23 13:49:21.014023	55
511	135	257	2018-04-23 13:49:21.01643	2018-04-23 13:49:21.01643	97
512	77	258	2018-04-23 13:49:21.019292	2018-04-23 13:49:21.019292	51
513	108	259	2018-04-23 13:49:21.022262	2018-04-23 13:49:21.022262	90
514	153	259	2018-04-23 13:49:21.024469	2018-04-23 13:49:21.024469	86
515	165	259	2018-04-23 13:49:21.026518	2018-04-23 13:49:21.026518	45
516	157	259	2018-04-23 13:49:21.02855	2018-04-23 13:49:21.02855	59
517	138	260	2018-04-23 13:49:21.031242	2018-04-23 13:49:21.031242	86
518	152	260	2018-04-23 13:49:21.033222	2018-04-23 13:49:21.033222	73
519	32	260	2018-04-23 13:49:21.035202	2018-04-23 13:49:21.035202	78
520	160	261	2018-04-23 13:49:21.038224	2018-04-23 13:49:21.038224	50
521	10	262	2018-04-23 13:49:21.041091	2018-04-23 13:49:21.041091	34
522	11	262	2018-04-23 13:49:21.043129	2018-04-23 13:49:21.043129	33
523	164	262	2018-04-23 13:49:21.045103	2018-04-23 13:49:21.045103	87
524	179	262	2018-04-23 13:49:21.047255	2018-04-23 13:49:21.047255	62
525	140	265	2018-04-23 13:49:21.051554	2018-04-23 13:49:21.051554	77
526	62	265	2018-04-23 13:49:21.054094	2018-04-23 13:49:21.054094	96
527	136	265	2018-04-23 13:49:21.056165	2018-04-23 13:49:21.056165	47
528	84	265	2018-04-23 13:49:21.058244	2018-04-23 13:49:21.058244	54
529	49	266	2018-04-23 13:49:21.061081	2018-04-23 13:49:21.061081	30
530	145	266	2018-04-23 13:49:21.0635	2018-04-23 13:49:21.0635	35
531	146	267	2018-04-23 13:49:21.067116	2018-04-23 13:49:21.067116	45
532	161	268	2018-04-23 13:49:21.070061	2018-04-23 13:49:21.070061	70
533	99	268	2018-04-23 13:49:21.072547	2018-04-23 13:49:21.072547	87
534	36	268	2018-04-23 13:49:21.074742	2018-04-23 13:49:21.074742	35
535	159	269	2018-04-23 13:49:21.077522	2018-04-23 13:49:21.077522	73
536	169	269	2018-04-23 13:49:21.079925	2018-04-23 13:49:21.079925	58
537	127	269	2018-04-23 13:49:21.082348	2018-04-23 13:49:21.082348	33
538	87	270	2018-04-23 13:49:21.085439	2018-04-23 13:49:21.085439	41
539	164	270	2018-04-23 13:49:21.087624	2018-04-23 13:49:21.087624	64
540	56	270	2018-04-23 13:49:21.089716	2018-04-23 13:49:21.089716	76
541	29	271	2018-04-23 13:49:21.092471	2018-04-23 13:49:21.092471	73
542	147	271	2018-04-23 13:49:21.094528	2018-04-23 13:49:21.094528	51
543	38	271	2018-04-23 13:49:21.096762	2018-04-23 13:49:21.096762	55
544	43	272	2018-04-23 13:49:21.099605	2018-04-23 13:49:21.099605	62
545	86	272	2018-04-23 13:49:21.101693	2018-04-23 13:49:21.101693	38
546	128	272	2018-04-23 13:49:21.107794	2018-04-23 13:49:21.107794	63
547	131	273	2018-04-23 13:49:21.110542	2018-04-23 13:49:21.110542	31
548	60	274	2018-04-23 13:49:21.113115	2018-04-23 13:49:21.113115	89
549	35	274	2018-04-23 13:49:21.115061	2018-04-23 13:49:21.115061	72
550	133	277	2018-04-23 13:49:21.118866	2018-04-23 13:49:21.118866	84
551	57	277	2018-04-23 13:49:21.121109	2018-04-23 13:49:21.121109	33
552	140	278	2018-04-23 13:49:21.123931	2018-04-23 13:49:21.123931	81
553	80	278	2018-04-23 13:49:21.125873	2018-04-23 13:49:21.125873	48
554	113	278	2018-04-23 13:49:21.127866	2018-04-23 13:49:21.127866	83
555	114	278	2018-04-23 13:49:21.129798	2018-04-23 13:49:21.129798	88
556	188	279	2018-04-23 13:49:21.132392	2018-04-23 13:49:21.132392	57
557	94	279	2018-04-23 13:49:21.13429	2018-04-23 13:49:21.13429	78
558	12	279	2018-04-23 13:49:21.136597	2018-04-23 13:49:21.136597	40
559	39	279	2018-04-23 13:49:21.138565	2018-04-23 13:49:21.138565	43
560	103	280	2018-04-23 13:49:21.141191	2018-04-23 13:49:21.141191	98
561	124	280	2018-04-23 13:49:21.143145	2018-04-23 13:49:21.143145	53
562	73	280	2018-04-23 13:49:21.145159	2018-04-23 13:49:21.145159	79
563	136	281	2018-04-23 13:49:21.147913	2018-04-23 13:49:21.147913	55
564	193	281	2018-04-23 13:49:21.149979	2018-04-23 13:49:21.149979	72
565	147	281	2018-04-23 13:49:21.152026	2018-04-23 13:49:21.152026	46
566	162	282	2018-04-23 13:49:21.154725	2018-04-23 13:49:21.154725	93
567	135	283	2018-04-23 13:49:21.15732	2018-04-23 13:49:21.15732	34
568	189	284	2018-04-23 13:49:21.159926	2018-04-23 13:49:21.159926	60
569	105	284	2018-04-23 13:49:21.161956	2018-04-23 13:49:21.161956	83
570	86	284	2018-04-23 13:49:21.163906	2018-04-23 13:49:21.163906	83
571	37	285	2018-04-23 13:49:21.166468	2018-04-23 13:49:21.166468	83
572	66	285	2018-04-23 13:49:21.168511	2018-04-23 13:49:21.168511	49
573	111	285	2018-04-23 13:49:21.170543	2018-04-23 13:49:21.170543	55
574	38	285	2018-04-23 13:49:21.172651	2018-04-23 13:49:21.172651	91
575	135	286	2018-04-23 13:49:21.175535	2018-04-23 13:49:21.175535	35
576	61	286	2018-04-23 13:49:21.177592	2018-04-23 13:49:21.177592	93
577	195	286	2018-04-23 13:49:21.179597	2018-04-23 13:49:21.179597	34
578	10	286	2018-04-23 13:49:21.181532	2018-04-23 13:49:21.181532	31
579	87	287	2018-04-23 13:49:21.1841	2018-04-23 13:49:21.1841	39
580	50	287	2018-04-23 13:49:21.18617	2018-04-23 13:49:21.18617	98
581	180	287	2018-04-23 13:49:21.188248	2018-04-23 13:49:21.188248	91
582	12	287	2018-04-23 13:49:21.190336	2018-04-23 13:49:21.190336	97
583	28	288	2018-04-23 13:49:21.192981	2018-04-23 13:49:21.192981	86
584	96	288	2018-04-23 13:49:21.194942	2018-04-23 13:49:21.194942	76
585	141	288	2018-04-23 13:49:21.196872	2018-04-23 13:49:21.196872	94
586	180	288	2018-04-23 13:49:21.198887	2018-04-23 13:49:21.198887	68
587	20	289	2018-04-23 13:49:21.201661	2018-04-23 13:49:21.201661	52
588	99	289	2018-04-23 13:49:21.203837	2018-04-23 13:49:21.203837	70
589	48	289	2018-04-23 13:49:21.205845	2018-04-23 13:49:21.205845	44
590	113	289	2018-04-23 13:49:21.207786	2018-04-23 13:49:21.207786	32
591	137	290	2018-04-23 13:49:21.210353	2018-04-23 13:49:21.210353	77
592	64	290	2018-04-23 13:49:21.212259	2018-04-23 13:49:21.212259	45
593	114	290	2018-04-23 13:49:21.214176	2018-04-23 13:49:21.214176	48
594	96	290	2018-04-23 13:49:21.216077	2018-04-23 13:49:21.216077	35
595	162	291	2018-04-23 13:49:21.218655	2018-04-23 13:49:21.218655	39
596	180	291	2018-04-23 13:49:21.220632	2018-04-23 13:49:21.220632	73
597	143	291	2018-04-23 13:49:21.222733	2018-04-23 13:49:21.222733	65
598	95	292	2018-04-23 13:49:21.225654	2018-04-23 13:49:21.225654	55
599	57	292	2018-04-23 13:49:21.22768	2018-04-23 13:49:21.22768	85
600	149	292	2018-04-23 13:49:21.229706	2018-04-23 13:49:21.229706	30
601	43	292	2018-04-23 13:49:21.231748	2018-04-23 13:49:21.231748	98
602	71	293	2018-04-23 13:49:21.234838	2018-04-23 13:49:21.234838	80
603	108	293	2018-04-23 13:49:21.237194	2018-04-23 13:49:21.237194	31
604	181	293	2018-04-23 13:49:21.239258	2018-04-23 13:49:21.239258	54
605	177	293	2018-04-23 13:49:21.241199	2018-04-23 13:49:21.241199	68
606	22	294	2018-04-23 13:49:21.243926	2018-04-23 13:49:21.243926	56
607	24	294	2018-04-23 13:49:21.245834	2018-04-23 13:49:21.245834	71
608	59	294	2018-04-23 13:49:21.247755	2018-04-23 13:49:21.247755	92
609	35	294	2018-04-23 13:49:21.249573	2018-04-23 13:49:21.249573	42
610	154	295	2018-04-23 13:49:21.252517	2018-04-23 13:49:21.252517	98
611	109	295	2018-04-23 13:49:21.25466	2018-04-23 13:49:21.25466	36
612	179	296	2018-04-23 13:49:21.257435	2018-04-23 13:49:21.257435	78
613	3	296	2018-04-23 13:49:21.259598	2018-04-23 13:49:21.259598	36
614	163	296	2018-04-23 13:49:21.261602	2018-04-23 13:49:21.261602	57
615	83	297	2018-04-23 13:49:21.264297	2018-04-23 13:49:21.264297	34
616	1	297	2018-04-23 13:49:21.26625	2018-04-23 13:49:21.26625	100
617	166	297	2018-04-23 13:49:21.268292	2018-04-23 13:49:21.268292	100
618	57	297	2018-04-23 13:49:21.270347	2018-04-23 13:49:21.270347	50
619	136	298	2018-04-23 13:49:21.272957	2018-04-23 13:49:21.272957	87
620	166	298	2018-04-23 13:49:21.274884	2018-04-23 13:49:21.274884	85
621	160	299	2018-04-23 13:49:21.277619	2018-04-23 13:49:21.277619	64
622	76	299	2018-04-23 13:49:21.279775	2018-04-23 13:49:21.279775	42
623	26	299	2018-04-23 13:49:21.281953	2018-04-23 13:49:21.281953	33
624	164	300	2018-04-23 13:49:21.2848	2018-04-23 13:49:21.2848	94
625	34	300	2018-04-23 13:49:21.287003	2018-04-23 13:49:21.287003	48
626	43	302	2018-04-23 13:49:21.290282	2018-04-23 13:49:21.290282	56
627	21	302	2018-04-23 13:49:21.292223	2018-04-23 13:49:21.292223	42
628	15	302	2018-04-23 13:49:21.294152	2018-04-23 13:49:21.294152	76
629	12	303	2018-04-23 13:49:21.296726	2018-04-23 13:49:21.296726	49
630	164	303	2018-04-23 13:49:21.298638	2018-04-23 13:49:21.298638	31
631	50	303	2018-04-23 13:49:21.300567	2018-04-23 13:49:21.300567	93
632	140	303	2018-04-23 13:49:21.302704	2018-04-23 13:49:21.302704	30
633	114	305	2018-04-23 13:49:21.306287	2018-04-23 13:49:21.306287	77
634	164	305	2018-04-23 13:49:21.30838	2018-04-23 13:49:21.30838	57
635	68	305	2018-04-23 13:49:21.31045	2018-04-23 13:49:21.31045	56
636	131	306	2018-04-23 13:49:21.313273	2018-04-23 13:49:21.313273	89
637	106	306	2018-04-23 13:49:21.315353	2018-04-23 13:49:21.315353	79
638	32	306	2018-04-23 13:49:21.317396	2018-04-23 13:49:21.317396	83
639	74	307	2018-04-23 13:49:21.320176	2018-04-23 13:49:21.320176	56
640	4	307	2018-04-23 13:49:21.322196	2018-04-23 13:49:21.322196	43
641	11	307	2018-04-23 13:49:21.324167	2018-04-23 13:49:21.324167	56
642	192	308	2018-04-23 13:49:21.326784	2018-04-23 13:49:21.326784	43
643	38	309	2018-04-23 13:49:21.330859	2018-04-23 13:49:21.330859	44
644	145	309	2018-04-23 13:49:21.332985	2018-04-23 13:49:21.332985	63
645	85	310	2018-04-23 13:49:21.335791	2018-04-23 13:49:21.335791	51
646	129	311	2018-04-23 13:49:21.338788	2018-04-23 13:49:21.338788	51
647	53	311	2018-04-23 13:49:21.34125	2018-04-23 13:49:21.34125	97
648	174	311	2018-04-23 13:49:21.343302	2018-04-23 13:49:21.343302	70
649	131	311	2018-04-23 13:49:21.345257	2018-04-23 13:49:21.345257	77
650	62	312	2018-04-23 13:49:21.347917	2018-04-23 13:49:21.347917	40
651	11	312	2018-04-23 13:49:21.349897	2018-04-23 13:49:21.349897	90
652	171	314	2018-04-23 13:49:21.353392	2018-04-23 13:49:21.353392	56
653	166	314	2018-04-23 13:49:21.355489	2018-04-23 13:49:21.355489	33
654	190	315	2018-04-23 13:49:21.358111	2018-04-23 13:49:21.358111	90
655	163	315	2018-04-23 13:49:21.360064	2018-04-23 13:49:21.360064	74
656	56	315	2018-04-23 13:49:21.362007	2018-04-23 13:49:21.362007	81
657	141	315	2018-04-23 13:49:21.36396	2018-04-23 13:49:21.36396	75
658	163	316	2018-04-23 13:49:21.366583	2018-04-23 13:49:21.366583	58
659	141	316	2018-04-23 13:49:21.368582	2018-04-23 13:49:21.368582	96
660	51	316	2018-04-23 13:49:21.370843	2018-04-23 13:49:21.370843	44
661	16	316	2018-04-23 13:49:21.37292	2018-04-23 13:49:21.37292	87
662	124	317	2018-04-23 13:49:21.375811	2018-04-23 13:49:21.375811	66
663	90	317	2018-04-23 13:49:21.377848	2018-04-23 13:49:21.377848	77
664	33	317	2018-04-23 13:49:21.379943	2018-04-23 13:49:21.379943	63
665	169	318	2018-04-23 13:49:21.38259	2018-04-23 13:49:21.38259	62
666	115	318	2018-04-23 13:49:21.384521	2018-04-23 13:49:21.384521	75
667	167	318	2018-04-23 13:49:21.386914	2018-04-23 13:49:21.386914	34
668	152	319	2018-04-23 13:49:21.38971	2018-04-23 13:49:21.38971	54
669	131	320	2018-04-23 13:49:21.392482	2018-04-23 13:49:21.392482	31
670	109	320	2018-04-23 13:49:21.394486	2018-04-23 13:49:21.394486	80
671	166	320	2018-04-23 13:49:21.396448	2018-04-23 13:49:21.396448	66
672	22	320	2018-04-23 13:49:21.398794	2018-04-23 13:49:21.398794	37
673	57	322	2018-04-23 13:49:21.402491	2018-04-23 13:49:21.402491	50
674	150	322	2018-04-23 13:49:21.404683	2018-04-23 13:49:21.404683	90
675	133	322	2018-04-23 13:49:21.406761	2018-04-23 13:49:21.406761	61
676	81	322	2018-04-23 13:49:21.408803	2018-04-23 13:49:21.408803	80
677	39	323	2018-04-23 13:49:21.411475	2018-04-23 13:49:21.411475	67
678	27	323	2018-04-23 13:49:21.413436	2018-04-23 13:49:21.413436	49
679	112	323	2018-04-23 13:49:21.415374	2018-04-23 13:49:21.415374	85
680	22	324	2018-04-23 13:49:21.418109	2018-04-23 13:49:21.418109	86
681	49	324	2018-04-23 13:49:21.420385	2018-04-23 13:49:21.420385	75
682	63	325	2018-04-23 13:49:21.423147	2018-04-23 13:49:21.423147	66
683	108	325	2018-04-23 13:49:21.425115	2018-04-23 13:49:21.425115	46
684	27	325	2018-04-23 13:49:21.42705	2018-04-23 13:49:21.42705	91
685	159	325	2018-04-23 13:49:21.428977	2018-04-23 13:49:21.428977	84
686	154	326	2018-04-23 13:49:21.431913	2018-04-23 13:49:21.431913	100
687	143	326	2018-04-23 13:49:21.43391	2018-04-23 13:49:21.43391	45
688	98	326	2018-04-23 13:49:21.43609	2018-04-23 13:49:21.43609	47
689	168	326	2018-04-23 13:49:21.438154	2018-04-23 13:49:21.438154	32
690	151	327	2018-04-23 13:49:21.440911	2018-04-23 13:49:21.440911	67
691	74	327	2018-04-23 13:49:21.442823	2018-04-23 13:49:21.442823	84
692	94	327	2018-04-23 13:49:21.44476	2018-04-23 13:49:21.44476	86
693	52	327	2018-04-23 13:49:21.446697	2018-04-23 13:49:21.446697	96
694	194	329	2018-04-23 13:49:21.449884	2018-04-23 13:49:21.449884	72
695	65	330	2018-04-23 13:49:21.452629	2018-04-23 13:49:21.452629	91
696	155	330	2018-04-23 13:49:21.454701	2018-04-23 13:49:21.454701	63
697	19	331	2018-04-23 13:49:21.457495	2018-04-23 13:49:21.457495	39
698	199	331	2018-04-23 13:49:21.459581	2018-04-23 13:49:21.459581	35
699	194	331	2018-04-23 13:49:21.461531	2018-04-23 13:49:21.461531	80
700	118	333	2018-04-23 13:49:21.464705	2018-04-23 13:49:21.464705	48
701	152	333	2018-04-23 13:49:21.466669	2018-04-23 13:49:21.466669	100
702	33	333	2018-04-23 13:49:21.46873	2018-04-23 13:49:21.46873	70
703	89	334	2018-04-23 13:49:21.471473	2018-04-23 13:49:21.471473	98
704	109	334	2018-04-23 13:49:21.473491	2018-04-23 13:49:21.473491	30
705	194	334	2018-04-23 13:49:21.475493	2018-04-23 13:49:21.475493	84
706	21	335	2018-04-23 13:49:21.478064	2018-04-23 13:49:21.478064	75
707	197	335	2018-04-23 13:49:21.479953	2018-04-23 13:49:21.479953	65
708	194	335	2018-04-23 13:49:21.482048	2018-04-23 13:49:21.482048	53
709	149	336	2018-04-23 13:49:21.484862	2018-04-23 13:49:21.484862	50
710	122	336	2018-04-23 13:49:21.486992	2018-04-23 13:49:21.486992	71
711	59	336	2018-04-23 13:49:21.48908	2018-04-23 13:49:21.48908	37
712	198	336	2018-04-23 13:49:21.491158	2018-04-23 13:49:21.491158	98
713	120	337	2018-04-23 13:49:21.49389	2018-04-23 13:49:21.49389	44
714	69	337	2018-04-23 13:49:21.496281	2018-04-23 13:49:21.496281	85
715	40	337	2018-04-23 13:49:21.498674	2018-04-23 13:49:21.498674	73
716	147	339	2018-04-23 13:49:21.502322	2018-04-23 13:49:21.502322	97
717	63	339	2018-04-23 13:49:21.504581	2018-04-23 13:49:21.504581	34
718	66	339	2018-04-23 13:49:21.506808	2018-04-23 13:49:21.506808	56
719	9	339	2018-04-23 13:49:21.509229	2018-04-23 13:49:21.509229	53
720	73	340	2018-04-23 13:49:21.512067	2018-04-23 13:49:21.512067	48
721	185	340	2018-04-23 13:49:21.514095	2018-04-23 13:49:21.514095	54
722	160	341	2018-04-23 13:49:21.516858	2018-04-23 13:49:21.516858	67
723	179	341	2018-04-23 13:49:21.519158	2018-04-23 13:49:21.519158	52
724	49	341	2018-04-23 13:49:21.522101	2018-04-23 13:49:21.522101	100
725	119	341	2018-04-23 13:49:21.524602	2018-04-23 13:49:21.524602	39
726	123	342	2018-04-23 13:49:21.527466	2018-04-23 13:49:21.527466	95
727	28	343	2018-04-23 13:49:21.530102	2018-04-23 13:49:21.530102	34
728	51	343	2018-04-23 13:49:21.532229	2018-04-23 13:49:21.532229	38
729	146	344	2018-04-23 13:49:21.536373	2018-04-23 13:49:21.536373	46
730	188	344	2018-04-23 13:49:21.538626	2018-04-23 13:49:21.538626	33
731	167	344	2018-04-23 13:49:21.540723	2018-04-23 13:49:21.540723	81
732	74	344	2018-04-23 13:49:21.542709	2018-04-23 13:49:21.542709	80
733	93	345	2018-04-23 13:49:21.545351	2018-04-23 13:49:21.545351	76
734	64	345	2018-04-23 13:49:21.547294	2018-04-23 13:49:21.547294	56
735	120	346	2018-04-23 13:49:21.550058	2018-04-23 13:49:21.550058	30
736	50	346	2018-04-23 13:49:21.55215	2018-04-23 13:49:21.55215	68
737	43	347	2018-04-23 13:49:21.554935	2018-04-23 13:49:21.554935	55
738	10	347	2018-04-23 13:49:21.556979	2018-04-23 13:49:21.556979	51
739	94	349	2018-04-23 13:49:21.560503	2018-04-23 13:49:21.560503	90
740	74	349	2018-04-23 13:49:21.562548	2018-04-23 13:49:21.562548	56
741	3	350	2018-04-23 13:49:21.565391	2018-04-23 13:49:21.565391	37
742	71	353	2018-04-23 13:49:21.570148	2018-04-23 13:49:21.570148	91
743	16	353	2018-04-23 13:49:21.57264	2018-04-23 13:49:21.57264	40
744	196	353	2018-04-23 13:49:21.575046	2018-04-23 13:49:21.575046	83
745	170	353	2018-04-23 13:49:21.577475	2018-04-23 13:49:21.577475	61
746	71	354	2018-04-23 13:49:21.580863	2018-04-23 13:49:21.580863	54
747	53	354	2018-04-23 13:49:21.5831	2018-04-23 13:49:21.5831	67
748	117	355	2018-04-23 13:49:21.585949	2018-04-23 13:49:21.585949	68
749	175	355	2018-04-23 13:49:21.587993	2018-04-23 13:49:21.587993	87
750	77	356	2018-04-23 13:49:21.590658	2018-04-23 13:49:21.590658	45
751	112	356	2018-04-23 13:49:21.592618	2018-04-23 13:49:21.592618	65
752	10	356	2018-04-23 13:49:21.594564	2018-04-23 13:49:21.594564	43
753	35	357	2018-04-23 13:49:21.597282	2018-04-23 13:49:21.597282	38
754	191	357	2018-04-23 13:49:21.599476	2018-04-23 13:49:21.599476	96
755	124	357	2018-04-23 13:49:21.601585	2018-04-23 13:49:21.601585	79
756	148	357	2018-04-23 13:49:21.603761	2018-04-23 13:49:21.603761	88
757	181	359	2018-04-23 13:49:21.607169	2018-04-23 13:49:21.607169	69
758	125	359	2018-04-23 13:49:21.609247	2018-04-23 13:49:21.609247	56
759	141	359	2018-04-23 13:49:21.611298	2018-04-23 13:49:21.611298	77
760	120	360	2018-04-23 13:49:21.61396	2018-04-23 13:49:21.61396	53
761	169	360	2018-04-23 13:49:21.615968	2018-04-23 13:49:21.615968	46
762	97	360	2018-04-23 13:49:21.617894	2018-04-23 13:49:21.617894	51
763	18	360	2018-04-23 13:49:21.619955	2018-04-23 13:49:21.619955	74
764	86	361	2018-04-23 13:49:21.622707	2018-04-23 13:49:21.622707	59
765	83	361	2018-04-23 13:49:21.625679	2018-04-23 13:49:21.625679	47
766	133	361	2018-04-23 13:49:21.627999	2018-04-23 13:49:21.627999	53
767	130	361	2018-04-23 13:49:21.630175	2018-04-23 13:49:21.630175	37
768	138	362	2018-04-23 13:49:21.632991	2018-04-23 13:49:21.632991	88
769	23	362	2018-04-23 13:49:21.635175	2018-04-23 13:49:21.635175	57
770	54	363	2018-04-23 13:49:21.638194	2018-04-23 13:49:21.638194	59
771	113	365	2018-04-23 13:49:21.641529	2018-04-23 13:49:21.641529	60
772	178	366	2018-04-23 13:49:21.644349	2018-04-23 13:49:21.644349	97
773	130	366	2018-04-23 13:49:21.646347	2018-04-23 13:49:21.646347	55
774	158	366	2018-04-23 13:49:21.648329	2018-04-23 13:49:21.648329	38
775	127	368	2018-04-23 13:49:21.651902	2018-04-23 13:49:21.651902	83
776	102	368	2018-04-23 13:49:21.654119	2018-04-23 13:49:21.654119	88
777	190	370	2018-04-23 13:49:21.657443	2018-04-23 13:49:21.657443	78
778	198	370	2018-04-23 13:49:21.659383	2018-04-23 13:49:21.659383	83
779	166	371	2018-04-23 13:49:21.662319	2018-04-23 13:49:21.662319	96
780	90	371	2018-04-23 13:49:21.664423	2018-04-23 13:49:21.664423	54
781	188	371	2018-04-23 13:49:21.666539	2018-04-23 13:49:21.666539	47
782	172	371	2018-04-23 13:49:21.668655	2018-04-23 13:49:21.668655	30
783	64	372	2018-04-23 13:49:21.683694	2018-04-23 13:49:21.683694	44
784	4	372	2018-04-23 13:49:21.686654	2018-04-23 13:49:21.686654	69
785	176	372	2018-04-23 13:49:21.69554	2018-04-23 13:49:21.69554	55
786	7	372	2018-04-23 13:49:21.698696	2018-04-23 13:49:21.698696	37
787	112	373	2018-04-23 13:49:21.701524	2018-04-23 13:49:21.701524	76
788	41	373	2018-04-23 13:49:21.703901	2018-04-23 13:49:21.703901	78
789	58	373	2018-04-23 13:49:21.705975	2018-04-23 13:49:21.705975	67
790	49	374	2018-04-23 13:49:21.708882	2018-04-23 13:49:21.708882	37
791	85	374	2018-04-23 13:49:21.710819	2018-04-23 13:49:21.710819	97
792	38	375	2018-04-23 13:49:21.713441	2018-04-23 13:49:21.713441	85
793	51	376	2018-04-23 13:49:21.715989	2018-04-23 13:49:21.715989	72
794	62	376	2018-04-23 13:49:21.717909	2018-04-23 13:49:21.717909	40
795	38	376	2018-04-23 13:49:21.719919	2018-04-23 13:49:21.719919	66
796	119	377	2018-04-23 13:49:21.722612	2018-04-23 13:49:21.722612	99
797	92	377	2018-04-23 13:49:21.724625	2018-04-23 13:49:21.724625	54
798	103	377	2018-04-23 13:49:21.726685	2018-04-23 13:49:21.726685	85
799	144	379	2018-04-23 13:49:21.73003	2018-04-23 13:49:21.73003	43
800	85	379	2018-04-23 13:49:21.732426	2018-04-23 13:49:21.732426	87
801	88	379	2018-04-23 13:49:21.734833	2018-04-23 13:49:21.734833	47
802	183	380	2018-04-23 13:49:21.738	2018-04-23 13:49:21.738	66
803	127	381	2018-04-23 13:49:21.740766	2018-04-23 13:49:21.740766	65
804	166	381	2018-04-23 13:49:21.742749	2018-04-23 13:49:21.742749	40
805	15	381	2018-04-23 13:49:21.744655	2018-04-23 13:49:21.744655	71
806	99	382	2018-04-23 13:49:21.747418	2018-04-23 13:49:21.747418	54
807	11	383	2018-04-23 13:49:21.749979	2018-04-23 13:49:21.749979	49
808	23	383	2018-04-23 13:49:21.751965	2018-04-23 13:49:21.751965	83
809	165	385	2018-04-23 13:49:21.755349	2018-04-23 13:49:21.755349	51
810	138	385	2018-04-23 13:49:21.757328	2018-04-23 13:49:21.757328	49
811	90	385	2018-04-23 13:49:21.759395	2018-04-23 13:49:21.759395	81
812	138	386	2018-04-23 13:49:21.762068	2018-04-23 13:49:21.762068	93
813	93	386	2018-04-23 13:49:21.764698	2018-04-23 13:49:21.764698	59
814	159	386	2018-04-23 13:49:21.767545	2018-04-23 13:49:21.767545	47
815	58	388	2018-04-23 13:49:21.771457	2018-04-23 13:49:21.771457	93
816	138	388	2018-04-23 13:49:21.773591	2018-04-23 13:49:21.773591	83
817	150	388	2018-04-23 13:49:21.775703	2018-04-23 13:49:21.775703	97
818	112	388	2018-04-23 13:49:21.777739	2018-04-23 13:49:21.777739	84
819	178	390	2018-04-23 13:49:21.781135	2018-04-23 13:49:21.781135	46
820	146	390	2018-04-23 13:49:21.783113	2018-04-23 13:49:21.783113	67
821	78	390	2018-04-23 13:49:21.785174	2018-04-23 13:49:21.785174	69
822	25	391	2018-04-23 13:49:21.787921	2018-04-23 13:49:21.787921	81
823	180	391	2018-04-23 13:49:21.790147	2018-04-23 13:49:21.790147	99
824	153	391	2018-04-23 13:49:21.792325	2018-04-23 13:49:21.792325	36
825	59	391	2018-04-23 13:49:21.794411	2018-04-23 13:49:21.794411	94
826	127	392	2018-04-23 13:49:21.797024	2018-04-23 13:49:21.797024	96
827	165	392	2018-04-23 13:49:21.798971	2018-04-23 13:49:21.798971	47
828	31	392	2018-04-23 13:49:21.801022	2018-04-23 13:49:21.801022	44
829	91	393	2018-04-23 13:49:21.804902	2018-04-23 13:49:21.804902	56
830	195	393	2018-04-23 13:49:21.807717	2018-04-23 13:49:21.807717	92
831	69	393	2018-04-23 13:49:21.810479	2018-04-23 13:49:21.810479	43
832	195	394	2018-04-23 13:49:21.813805	2018-04-23 13:49:21.813805	91
833	86	395	2018-04-23 13:49:21.817631	2018-04-23 13:49:21.817631	35
834	67	395	2018-04-23 13:49:21.820381	2018-04-23 13:49:21.820381	90
835	123	397	2018-04-23 13:49:21.824684	2018-04-23 13:49:21.824684	66
836	88	398	2018-04-23 13:49:21.827521	2018-04-23 13:49:21.827521	86
837	33	398	2018-04-23 13:49:21.829553	2018-04-23 13:49:21.829553	39
838	186	398	2018-04-23 13:49:21.831638	2018-04-23 13:49:21.831638	89
839	15	398	2018-04-23 13:49:21.833689	2018-04-23 13:49:21.833689	91
840	151	399	2018-04-23 13:49:21.836535	2018-04-23 13:49:21.836535	77
841	147	399	2018-04-23 13:49:21.838991	2018-04-23 13:49:21.838991	30
842	48	399	2018-04-23 13:49:21.841527	2018-04-23 13:49:21.841527	78
843	93	400	2018-04-23 13:49:21.844342	2018-04-23 13:49:21.844342	87
844	163	400	2018-04-23 13:49:21.846299	2018-04-23 13:49:21.846299	33
845	145	400	2018-04-23 13:49:21.848233	2018-04-23 13:49:21.848233	44
846	131	400	2018-04-23 13:49:21.850853	2018-04-23 13:49:21.850853	80
847	11	401	2018-04-23 13:49:21.853785	2018-04-23 13:49:21.853785	35
848	3	401	2018-04-23 13:49:21.856211	2018-04-23 13:49:21.856211	34
849	168	402	2018-04-23 13:49:21.859185	2018-04-23 13:49:21.859185	64
850	53	402	2018-04-23 13:49:21.861552	2018-04-23 13:49:21.861552	33
851	160	402	2018-04-23 13:49:21.863932	2018-04-23 13:49:21.863932	53
852	183	404	2018-04-23 13:49:21.86741	2018-04-23 13:49:21.86741	88
853	198	405	2018-04-23 13:49:21.870483	2018-04-23 13:49:21.870483	100
854	161	405	2018-04-23 13:49:21.872683	2018-04-23 13:49:21.872683	44
855	139	405	2018-04-23 13:49:21.875637	2018-04-23 13:49:21.875637	36
856	39	406	2018-04-23 13:49:21.879077	2018-04-23 13:49:21.879077	50
857	45	406	2018-04-23 13:49:21.881327	2018-04-23 13:49:21.881327	85
858	37	407	2018-04-23 13:49:21.884191	2018-04-23 13:49:21.884191	64
859	118	407	2018-04-23 13:49:21.887102	2018-04-23 13:49:21.887102	49
860	173	408	2018-04-23 13:49:21.891502	2018-04-23 13:49:21.891502	96
861	199	408	2018-04-23 13:49:21.893725	2018-04-23 13:49:21.893725	35
862	55	408	2018-04-23 13:49:21.895852	2018-04-23 13:49:21.895852	68
863	195	408	2018-04-23 13:49:21.897966	2018-04-23 13:49:21.897966	91
864	75	409	2018-04-23 13:49:21.900855	2018-04-23 13:49:21.900855	58
865	130	409	2018-04-23 13:49:21.903497	2018-04-23 13:49:21.903497	60
866	32	409	2018-04-23 13:49:21.905624	2018-04-23 13:49:21.905624	91
867	147	410	2018-04-23 13:49:21.908319	2018-04-23 13:49:21.908319	98
868	111	410	2018-04-23 13:49:21.910249	2018-04-23 13:49:21.910249	38
869	188	410	2018-04-23 13:49:21.912241	2018-04-23 13:49:21.912241	36
870	45	411	2018-04-23 13:49:21.914921	2018-04-23 13:49:21.914921	62
871	65	411	2018-04-23 13:49:21.917142	2018-04-23 13:49:21.917142	93
872	19	411	2018-04-23 13:49:21.919252	2018-04-23 13:49:21.919252	62
873	114	412	2018-04-23 13:49:21.92205	2018-04-23 13:49:21.92205	88
874	81	412	2018-04-23 13:49:21.924075	2018-04-23 13:49:21.924075	39
875	70	413	2018-04-23 13:49:21.926718	2018-04-23 13:49:21.926718	86
876	90	413	2018-04-23 13:49:21.928648	2018-04-23 13:49:21.928648	76
877	87	414	2018-04-23 13:49:21.931241	2018-04-23 13:49:21.931241	37
878	24	414	2018-04-23 13:49:21.933155	2018-04-23 13:49:21.933155	64
879	50	414	2018-04-23 13:49:21.935161	2018-04-23 13:49:21.935161	42
880	142	414	2018-04-23 13:49:21.937236	2018-04-23 13:49:21.937236	43
881	155	415	2018-04-23 13:49:21.940016	2018-04-23 13:49:21.940016	47
882	166	416	2018-04-23 13:49:21.942911	2018-04-23 13:49:21.942911	45
883	87	416	2018-04-23 13:49:21.944972	2018-04-23 13:49:21.944972	69
884	27	417	2018-04-23 13:49:21.947753	2018-04-23 13:49:21.947753	35
885	72	417	2018-04-23 13:49:21.949753	2018-04-23 13:49:21.949753	70
886	61	417	2018-04-23 13:49:21.951834	2018-04-23 13:49:21.951834	32
887	106	417	2018-04-23 13:49:21.954251	2018-04-23 13:49:21.954251	30
888	117	419	2018-04-23 13:49:21.957824	2018-04-23 13:49:21.957824	46
889	98	420	2018-04-23 13:49:21.960784	2018-04-23 13:49:21.960784	58
890	123	422	2018-04-23 13:49:21.96419	2018-04-23 13:49:21.96419	84
891	189	422	2018-04-23 13:49:21.966155	2018-04-23 13:49:21.966155	65
892	6	422	2018-04-23 13:49:21.968606	2018-04-23 13:49:21.968606	69
893	78	423	2018-04-23 13:49:21.971693	2018-04-23 13:49:21.971693	34
894	17	423	2018-04-23 13:49:21.973726	2018-04-23 13:49:21.973726	85
895	169	423	2018-04-23 13:49:21.975753	2018-04-23 13:49:21.975753	97
896	23	424	2018-04-23 13:49:21.978579	2018-04-23 13:49:21.978579	52
897	83	424	2018-04-23 13:49:21.980637	2018-04-23 13:49:21.980637	61
898	196	425	2018-04-23 13:49:21.983346	2018-04-23 13:49:21.983346	88
899	158	425	2018-04-23 13:49:21.985361	2018-04-23 13:49:21.985361	67
900	137	425	2018-04-23 13:49:21.987439	2018-04-23 13:49:21.987439	99
901	27	425	2018-04-23 13:49:21.989496	2018-04-23 13:49:21.989496	59
902	145	427	2018-04-23 13:49:21.992951	2018-04-23 13:49:21.992951	82
903	172	427	2018-04-23 13:49:21.994986	2018-04-23 13:49:21.994986	80
904	124	427	2018-04-23 13:49:21.996957	2018-04-23 13:49:21.996957	91
905	93	427	2018-04-23 13:49:21.998858	2018-04-23 13:49:21.998858	90
906	153	428	2018-04-23 13:49:22.001447	2018-04-23 13:49:22.001447	41
907	3	429	2018-04-23 13:49:22.004362	2018-04-23 13:49:22.004362	33
908	4	429	2018-04-23 13:49:22.006558	2018-04-23 13:49:22.006558	60
909	80	430	2018-04-23 13:49:22.009265	2018-04-23 13:49:22.009265	41
910	141	431	2018-04-23 13:49:22.012153	2018-04-23 13:49:22.012153	48
911	6	431	2018-04-23 13:49:22.014183	2018-04-23 13:49:22.014183	84
912	41	431	2018-04-23 13:49:22.016121	2018-04-23 13:49:22.016121	74
913	106	432	2018-04-23 13:49:22.019164	2018-04-23 13:49:22.019164	75
914	66	433	2018-04-23 13:49:22.021858	2018-04-23 13:49:22.021858	76
915	26	434	2018-04-23 13:49:22.024464	2018-04-23 13:49:22.024464	39
916	9	434	2018-04-23 13:49:22.026417	2018-04-23 13:49:22.026417	55
917	126	434	2018-04-23 13:49:22.028355	2018-04-23 13:49:22.028355	88
918	186	435	2018-04-23 13:49:22.031186	2018-04-23 13:49:22.031186	61
919	55	435	2018-04-23 13:49:22.033141	2018-04-23 13:49:22.033141	80
920	111	436	2018-04-23 13:49:22.035877	2018-04-23 13:49:22.035877	52
921	72	437	2018-04-23 13:49:22.038721	2018-04-23 13:49:22.038721	53
922	77	437	2018-04-23 13:49:22.040799	2018-04-23 13:49:22.040799	38
923	171	437	2018-04-23 13:49:22.042991	2018-04-23 13:49:22.042991	72
924	173	438	2018-04-23 13:49:22.045809	2018-04-23 13:49:22.045809	37
925	123	438	2018-04-23 13:49:22.047793	2018-04-23 13:49:22.047793	97
926	83	438	2018-04-23 13:49:22.049781	2018-04-23 13:49:22.049781	91
927	117	439	2018-04-23 13:49:22.05299	2018-04-23 13:49:22.05299	51
928	51	439	2018-04-23 13:49:22.055208	2018-04-23 13:49:22.055208	33
929	183	439	2018-04-23 13:49:22.057264	2018-04-23 13:49:22.057264	36
930	60	439	2018-04-23 13:49:22.059352	2018-04-23 13:49:22.059352	100
931	159	440	2018-04-23 13:49:22.062089	2018-04-23 13:49:22.062089	80
932	58	440	2018-04-23 13:49:22.064469	2018-04-23 13:49:22.064469	35
933	79	440	2018-04-23 13:49:22.066821	2018-04-23 13:49:22.066821	75
934	43	441	2018-04-23 13:49:22.070018	2018-04-23 13:49:22.070018	63
935	185	441	2018-04-23 13:49:22.072113	2018-04-23 13:49:22.072113	97
936	67	441	2018-04-23 13:49:22.074222	2018-04-23 13:49:22.074222	49
937	171	442	2018-04-23 13:49:22.076938	2018-04-23 13:49:22.076938	41
938	126	442	2018-04-23 13:49:22.078864	2018-04-23 13:49:22.078864	56
939	162	442	2018-04-23 13:49:22.081006	2018-04-23 13:49:22.081006	85
940	200	443	2018-04-23 13:49:22.083727	2018-04-23 13:49:22.083727	89
941	43	444	2018-04-23 13:49:22.086503	2018-04-23 13:49:22.086503	89
942	31	444	2018-04-23 13:49:22.088522	2018-04-23 13:49:22.088522	45
943	16	444	2018-04-23 13:49:22.090477	2018-04-23 13:49:22.090477	31
944	185	444	2018-04-23 13:49:22.092418	2018-04-23 13:49:22.092418	30
945	49	445	2018-04-23 13:49:22.095242	2018-04-23 13:49:22.095242	75
946	24	447	2018-04-23 13:49:22.098621	2018-04-23 13:49:22.098621	68
947	120	449	2018-04-23 13:49:22.101917	2018-04-23 13:49:22.101917	78
948	13	449	2018-04-23 13:49:22.104115	2018-04-23 13:49:22.104115	48
949	135	450	2018-04-23 13:49:22.107201	2018-04-23 13:49:22.107201	65
950	53	450	2018-04-23 13:49:22.109265	2018-04-23 13:49:22.109265	84
951	32	451	2018-04-23 13:49:22.112268	2018-04-23 13:49:22.112268	32
952	17	451	2018-04-23 13:49:22.114277	2018-04-23 13:49:22.114277	89
953	74	452	2018-04-23 13:49:22.116903	2018-04-23 13:49:22.116903	41
954	36	453	2018-04-23 13:49:22.119652	2018-04-23 13:49:22.119652	38
955	184	453	2018-04-23 13:49:22.121867	2018-04-23 13:49:22.121867	80
956	42	453	2018-04-23 13:49:22.123872	2018-04-23 13:49:22.123872	50
957	9	453	2018-04-23 13:49:22.125864	2018-04-23 13:49:22.125864	86
958	72	454	2018-04-23 13:49:22.128468	2018-04-23 13:49:22.128468	40
959	134	456	2018-04-23 13:49:22.131831	2018-04-23 13:49:22.131831	36
960	117	457	2018-04-23 13:49:22.134612	2018-04-23 13:49:22.134612	93
961	126	458	2018-04-23 13:49:22.137331	2018-04-23 13:49:22.137331	90
962	171	458	2018-04-23 13:49:22.139368	2018-04-23 13:49:22.139368	87
963	87	459	2018-04-23 13:49:22.141977	2018-04-23 13:49:22.141977	34
964	42	459	2018-04-23 13:49:22.144039	2018-04-23 13:49:22.144039	80
965	115	459	2018-04-23 13:49:22.146122	2018-04-23 13:49:22.146122	44
966	133	461	2018-04-23 13:49:22.149576	2018-04-23 13:49:22.149576	41
967	65	464	2018-04-23 13:49:22.153612	2018-04-23 13:49:22.153612	78
968	119	465	2018-04-23 13:49:22.156295	2018-04-23 13:49:22.156295	57
969	175	465	2018-04-23 13:49:22.158342	2018-04-23 13:49:22.158342	59
970	61	465	2018-04-23 13:49:22.160302	2018-04-23 13:49:22.160302	34
971	21	465	2018-04-23 13:49:22.16223	2018-04-23 13:49:22.16223	75
972	29	466	2018-04-23 13:49:22.164824	2018-04-23 13:49:22.164824	38
973	31	466	2018-04-23 13:49:22.166783	2018-04-23 13:49:22.166783	97
974	114	466	2018-04-23 13:49:22.168787	2018-04-23 13:49:22.168787	97
975	196	466	2018-04-23 13:49:22.170847	2018-04-23 13:49:22.170847	70
976	189	468	2018-04-23 13:49:22.174694	2018-04-23 13:49:22.174694	46
977	105	468	2018-04-23 13:49:22.176706	2018-04-23 13:49:22.176706	52
978	93	468	2018-04-23 13:49:22.178691	2018-04-23 13:49:22.178691	72
979	156	469	2018-04-23 13:49:22.18164	2018-04-23 13:49:22.18164	79
980	52	469	2018-04-23 13:49:22.183897	2018-04-23 13:49:22.183897	90
981	145	469	2018-04-23 13:49:22.186084	2018-04-23 13:49:22.186084	66
982	169	470	2018-04-23 13:49:22.188924	2018-04-23 13:49:22.188924	34
983	60	470	2018-04-23 13:49:22.190894	2018-04-23 13:49:22.190894	55
984	68	470	2018-04-23 13:49:22.192863	2018-04-23 13:49:22.192863	71
985	26	471	2018-04-23 13:49:22.195653	2018-04-23 13:49:22.195653	31
986	86	472	2018-04-23 13:49:22.198482	2018-04-23 13:49:22.198482	86
987	34	472	2018-04-23 13:49:22.200479	2018-04-23 13:49:22.200479	45
988	120	473	2018-04-23 13:49:22.203302	2018-04-23 13:49:22.203302	93
989	181	473	2018-04-23 13:49:22.205302	2018-04-23 13:49:22.205302	96
990	22	474	2018-04-23 13:49:22.208014	2018-04-23 13:49:22.208014	34
991	197	474	2018-04-23 13:49:22.210113	2018-04-23 13:49:22.210113	30
992	79	475	2018-04-23 13:49:22.212954	2018-04-23 13:49:22.212954	35
993	76	475	2018-04-23 13:49:22.214893	2018-04-23 13:49:22.214893	53
994	19	475	2018-04-23 13:49:22.216835	2018-04-23 13:49:22.216835	85
995	162	475	2018-04-23 13:49:22.218864	2018-04-23 13:49:22.218864	71
996	120	477	2018-04-23 13:49:22.222275	2018-04-23 13:49:22.222275	68
997	84	477	2018-04-23 13:49:22.224573	2018-04-23 13:49:22.224573	82
998	46	478	2018-04-23 13:49:22.227407	2018-04-23 13:49:22.227407	43
999	147	478	2018-04-23 13:49:22.229349	2018-04-23 13:49:22.229349	36
1000	20	478	2018-04-23 13:49:22.231364	2018-04-23 13:49:22.231364	63
1001	62	478	2018-04-23 13:49:22.233624	2018-04-23 13:49:22.233624	57
1002	5	479	2018-04-23 13:49:22.236769	2018-04-23 13:49:22.236769	48
1003	191	479	2018-04-23 13:49:22.239011	2018-04-23 13:49:22.239011	71
1004	138	479	2018-04-23 13:49:22.241181	2018-04-23 13:49:22.241181	81
1005	48	479	2018-04-23 13:49:22.243267	2018-04-23 13:49:22.243267	61
1006	74	480	2018-04-23 13:49:22.246079	2018-04-23 13:49:22.246079	100
1007	43	481	2018-04-23 13:49:22.248796	2018-04-23 13:49:22.248796	31
1008	111	481	2018-04-23 13:49:22.250945	2018-04-23 13:49:22.250945	41
1009	37	481	2018-04-23 13:49:22.253105	2018-04-23 13:49:22.253105	82
1010	164	482	2018-04-23 13:49:22.255845	2018-04-23 13:49:22.255845	87
1011	190	482	2018-04-23 13:49:22.257984	2018-04-23 13:49:22.257984	70
1012	41	482	2018-04-23 13:49:22.259986	2018-04-23 13:49:22.259986	44
1013	120	482	2018-04-23 13:49:22.262469	2018-04-23 13:49:22.262469	100
1014	96	483	2018-04-23 13:49:22.26907	2018-04-23 13:49:22.26907	58
1015	37	484	2018-04-23 13:49:22.271896	2018-04-23 13:49:22.271896	36
1016	23	484	2018-04-23 13:49:22.273907	2018-04-23 13:49:22.273907	40
1017	13	484	2018-04-23 13:49:22.276047	2018-04-23 13:49:22.276047	80
1018	122	485	2018-04-23 13:49:22.278754	2018-04-23 13:49:22.278754	87
1019	71	485	2018-04-23 13:49:22.280979	2018-04-23 13:49:22.280979	40
1020	8	485	2018-04-23 13:49:22.283114	2018-04-23 13:49:22.283114	34
1021	68	488	2018-04-23 13:49:22.287434	2018-04-23 13:49:22.287434	99
1022	8	488	2018-04-23 13:49:22.289464	2018-04-23 13:49:22.289464	63
1023	134	488	2018-04-23 13:49:22.291426	2018-04-23 13:49:22.291426	53
1024	49	488	2018-04-23 13:49:22.293473	2018-04-23 13:49:22.293473	43
1025	148	490	2018-04-23 13:49:22.296752	2018-04-23 13:49:22.296752	73
1026	82	490	2018-04-23 13:49:22.298765	2018-04-23 13:49:22.298765	30
1027	177	490	2018-04-23 13:49:22.300785	2018-04-23 13:49:22.300785	30
1028	172	490	2018-04-23 13:49:22.302931	2018-04-23 13:49:22.302931	78
1029	1	492	2018-04-23 13:49:22.306713	2018-04-23 13:49:22.306713	96
1030	50	492	2018-04-23 13:49:22.308795	2018-04-23 13:49:22.308795	57
1031	133	492	2018-04-23 13:49:22.310847	2018-04-23 13:49:22.310847	37
1032	74	493	2018-04-23 13:49:22.313931	2018-04-23 13:49:22.313931	57
1033	35	493	2018-04-23 13:49:22.31602	2018-04-23 13:49:22.31602	77
1034	127	494	2018-04-23 13:49:22.318781	2018-04-23 13:49:22.318781	96
1035	125	494	2018-04-23 13:49:22.321005	2018-04-23 13:49:22.321005	92
1036	54	494	2018-04-23 13:49:22.323103	2018-04-23 13:49:22.323103	74
1037	26	495	2018-04-23 13:49:22.326128	2018-04-23 13:49:22.326128	84
1038	39	496	2018-04-23 13:49:22.329018	2018-04-23 13:49:22.329018	37
1039	86	497	2018-04-23 13:49:22.331814	2018-04-23 13:49:22.331814	99
1040	39	498	2018-04-23 13:49:22.33456	2018-04-23 13:49:22.33456	97
1041	175	499	2018-04-23 13:49:22.337515	2018-04-23 13:49:22.337515	96
\.


--
-- Data for Name: line_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.line_items (id, product_id, order_id, price, quantity, created_at, updated_at) FROM stdin;
1	124	1	55.7999999999999972	5	2018-04-23 13:49:24.051871	2018-04-23 13:49:24.051871
2	95	1	83.6700000000000017	1	2018-04-23 13:49:24.056141	2018-04-23 13:49:24.056141
3	184	1	30.379999999999999	5	2018-04-23 13:49:24.059587	2018-04-23 13:49:24.059587
4	152	2	41.1300000000000026	5	2018-04-23 13:49:24.064863	2018-04-23 13:49:24.064863
5	106	3	46.3699999999999974	2	2018-04-23 13:49:24.071105	2018-04-23 13:49:24.071105
6	\N	3	53.3100000000000023	3	2018-04-23 13:49:24.076218	2018-04-23 13:49:24.076218
7	222	4	18.8099999999999987	4	2018-04-23 13:49:24.081987	2018-04-23 13:49:24.081987
8	11	5	18.629999999999999	5	2018-04-23 13:49:24.087909	2018-04-23 13:49:24.087909
9	404	5	102.519999999999996	3	2018-04-23 13:49:24.091299	2018-04-23 13:49:24.091299
10	112	6	21.8200000000000003	1	2018-04-23 13:49:24.097674	2018-04-23 13:49:24.097674
11	279	7	12.4100000000000001	1	2018-04-23 13:49:24.104018	2018-04-23 13:49:24.104018
12	79	7	43.5600000000000023	2	2018-04-23 13:49:24.10769	2018-04-23 13:49:24.10769
13	207	7	6.19999999999999929	2	2018-04-23 13:49:24.11159	2018-04-23 13:49:24.11159
14	331	8	87.6299999999999955	3	2018-04-23 13:49:24.11749	2018-04-23 13:49:24.11749
15	340	8	88.0699999999999932	3	2018-04-23 13:49:24.121402	2018-04-23 13:49:24.121402
16	81	8	98.4899999999999949	2	2018-04-23 13:49:24.125468	2018-04-23 13:49:24.125468
17	\N	9	30.7800000000000011	4	2018-04-23 13:49:24.132862	2018-04-23 13:49:24.132862
18	153	9	88.6899999999999977	1	2018-04-23 13:49:24.136168	2018-04-23 13:49:24.136168
19	195	9	18.0300000000000011	5	2018-04-23 13:49:24.139529	2018-04-23 13:49:24.139529
20	269	10	97.6599999999999966	2	2018-04-23 13:49:24.145393	2018-04-23 13:49:24.145393
21	258	11	1.29000000000000004	4	2018-04-23 13:49:24.151632	2018-04-23 13:49:24.151632
22	441	11	-3.69000000000000039	5	2018-04-23 13:49:24.155051	2018-04-23 13:49:24.155051
23	37	11	79.4300000000000068	5	2018-04-23 13:49:24.158706	2018-04-23 13:49:24.158706
24	179	12	71.7900000000000063	5	2018-04-23 13:49:24.164149	2018-04-23 13:49:24.164149
25	167	12	31.9600000000000009	1	2018-04-23 13:49:24.167366	2018-04-23 13:49:24.167366
26	94	13	23.6300000000000026	2	2018-04-23 13:49:24.173242	2018-04-23 13:49:24.173242
27	\N	13	72.1400000000000006	2	2018-04-23 13:49:24.179157	2018-04-23 13:49:24.179157
28	261	13	85.7999999999999972	3	2018-04-23 13:49:24.18246	2018-04-23 13:49:24.18246
29	99	14	1.39999999999999991	5	2018-04-23 13:49:24.187749	2018-04-23 13:49:24.187749
30	63	15	54.990000000000002	4	2018-04-23 13:49:24.192739	2018-04-23 13:49:24.192739
31	214	15	34.490000000000002	5	2018-04-23 13:49:24.195794	2018-04-23 13:49:24.195794
32	136	16	92.6400000000000006	5	2018-04-23 13:49:24.200902	2018-04-23 13:49:24.200902
33	369	16	21.5799999999999983	4	2018-04-23 13:49:24.20458	2018-04-23 13:49:24.20458
34	127	16	14.0299999999999994	1	2018-04-23 13:49:24.207597	2018-04-23 13:49:24.207597
35	395	17	61.7900000000000063	3	2018-04-23 13:49:24.213142	2018-04-23 13:49:24.213142
36	\N	18	51.2700000000000031	4	2018-04-23 13:49:24.221803	2018-04-23 13:49:24.221803
37	100	18	74.2099999999999937	3	2018-04-23 13:49:24.225271	2018-04-23 13:49:24.225271
38	468	19	68.0499999999999972	4	2018-04-23 13:49:24.232097	2018-04-23 13:49:24.232097
39	232	20	60.7199999999999989	5	2018-04-23 13:49:24.238011	2018-04-23 13:49:24.238011
40	265	21	19.9800000000000004	2	2018-04-23 13:49:24.244062	2018-04-23 13:49:24.244062
41	137	22	91.0300000000000011	2	2018-04-23 13:49:24.249642	2018-04-23 13:49:24.249642
42	269	22	104.659999999999997	4	2018-04-23 13:49:24.253391	2018-04-23 13:49:24.253391
43	278	22	37.5600000000000023	4	2018-04-23 13:49:24.257461	2018-04-23 13:49:24.257461
44	154	23	5.16000000000000014	2	2018-04-23 13:49:24.26345	2018-04-23 13:49:24.26345
45	245	24	6.25	3	2018-04-23 13:49:24.269793	2018-04-23 13:49:24.269793
46	64	24	78.3700000000000045	1	2018-04-23 13:49:24.273749	2018-04-23 13:49:24.273749
47	394	24	38.5799999999999983	5	2018-04-23 13:49:24.277626	2018-04-23 13:49:24.277626
48	346	25	38.8500000000000014	1	2018-04-23 13:49:24.292992	2018-04-23 13:49:24.292992
49	\N	25	45.0300000000000011	1	2018-04-23 13:49:24.297388	2018-04-23 13:49:24.297388
50	287	26	11.9600000000000009	5	2018-04-23 13:49:24.305136	2018-04-23 13:49:24.305136
51	166	26	18.7399999999999984	1	2018-04-23 13:49:24.308761	2018-04-23 13:49:24.308761
52	438	26	14.8200000000000003	1	2018-04-23 13:49:24.311831	2018-04-23 13:49:24.311831
53	170	27	38.8800000000000026	1	2018-04-23 13:49:24.316797	2018-04-23 13:49:24.316797
54	15	28	63.9799999999999969	4	2018-04-23 13:49:24.321883	2018-04-23 13:49:24.321883
55	41	29	80.0699999999999932	5	2018-04-23 13:49:24.32671	2018-04-23 13:49:24.32671
56	138	29	32.7899999999999991	2	2018-04-23 13:49:24.329559	2018-04-23 13:49:24.329559
57	211	29	18.5799999999999983	3	2018-04-23 13:49:24.332341	2018-04-23 13:49:24.332341
58	163	30	21.2300000000000004	1	2018-04-23 13:49:24.33836	2018-04-23 13:49:24.33836
59	96	30	95.75	5	2018-04-23 13:49:24.341328	2018-04-23 13:49:24.341328
60	56	31	59.3800000000000026	1	2018-04-23 13:49:24.34629	2018-04-23 13:49:24.34629
61	75	31	75.0600000000000023	5	2018-04-23 13:49:24.349258	2018-04-23 13:49:24.349258
62	6	32	66.1700000000000017	2	2018-04-23 13:49:24.35464	2018-04-23 13:49:24.35464
63	325	32	63.2900000000000063	5	2018-04-23 13:49:24.357693	2018-04-23 13:49:24.357693
64	367	32	40.6599999999999966	1	2018-04-23 13:49:24.360675	2018-04-23 13:49:24.360675
65	90	33	69.519999999999996	5	2018-04-23 13:49:24.366234	2018-04-23 13:49:24.366234
66	\N	34	6.82000000000000028	1	2018-04-23 13:49:24.373058	2018-04-23 13:49:24.373058
67	64	34	78.3700000000000045	4	2018-04-23 13:49:24.376113	2018-04-23 13:49:24.376113
68	106	34	56.3699999999999974	3	2018-04-23 13:49:24.379143	2018-04-23 13:49:24.379143
69	424	35	73.8299999999999983	2	2018-04-23 13:49:24.384016	2018-04-23 13:49:24.384016
70	276	35	36.0399999999999991	4	2018-04-23 13:49:24.387066	2018-04-23 13:49:24.387066
71	473	36	37.4399999999999977	1	2018-04-23 13:49:24.392746	2018-04-23 13:49:24.392746
72	\N	37	97.269999999999996	2	2018-04-23 13:49:24.398875	2018-04-23 13:49:24.398875
73	359	37	29.9200000000000017	1	2018-04-23 13:49:24.401821	2018-04-23 13:49:24.401821
74	368	37	96.6700000000000017	4	2018-04-23 13:49:24.404901	2018-04-23 13:49:24.404901
75	431	38	38.6899999999999977	3	2018-04-23 13:49:24.409892	2018-04-23 13:49:24.409892
76	229	38	35.3299999999999983	1	2018-04-23 13:49:24.413259	2018-04-23 13:49:24.413259
77	340	38	96.0699999999999932	5	2018-04-23 13:49:24.416783	2018-04-23 13:49:24.416783
78	201	39	14.4600000000000009	5	2018-04-23 13:49:24.421838	2018-04-23 13:49:24.421838
79	199	39	14.8599999999999994	3	2018-04-23 13:49:24.42474	2018-04-23 13:49:24.42474
80	165	39	91.9000000000000057	3	2018-04-23 13:49:24.427618	2018-04-23 13:49:24.427618
81	246	40	72.2099999999999937	3	2018-04-23 13:49:24.432305	2018-04-23 13:49:24.432305
82	456	41	42.8999999999999986	3	2018-04-23 13:49:24.437313	2018-04-23 13:49:24.437313
83	62	41	32.3100000000000023	3	2018-04-23 13:49:24.440477	2018-04-23 13:49:24.440477
84	457	42	75.6200000000000045	1	2018-04-23 13:49:24.445622	2018-04-23 13:49:24.445622
85	177	42	25.6099999999999994	5	2018-04-23 13:49:24.448571	2018-04-23 13:49:24.448571
86	267	42	89.8299999999999983	1	2018-04-23 13:49:24.451565	2018-04-23 13:49:24.451565
87	439	43	68.1299999999999955	4	2018-04-23 13:49:24.456505	2018-04-23 13:49:24.456505
88	464	44	26.1099999999999994	2	2018-04-23 13:49:24.461303	2018-04-23 13:49:24.461303
89	344	44	61.3800000000000026	1	2018-04-23 13:49:24.464243	2018-04-23 13:49:24.464243
90	147	45	24.9499999999999993	4	2018-04-23 13:49:24.469518	2018-04-23 13:49:24.469518
91	345	45	66.4000000000000057	5	2018-04-23 13:49:24.472664	2018-04-23 13:49:24.472664
92	297	45	59.0799999999999983	2	2018-04-23 13:49:24.475623	2018-04-23 13:49:24.475623
93	40	46	15.5500000000000007	3	2018-04-23 13:49:24.481338	2018-04-23 13:49:24.481338
94	416	46	7.05999999999999961	3	2018-04-23 13:49:24.484472	2018-04-23 13:49:24.484472
95	396	46	73.2900000000000063	2	2018-04-23 13:49:24.487587	2018-04-23 13:49:24.487587
96	291	47	80.7199999999999989	2	2018-04-23 13:49:24.492371	2018-04-23 13:49:24.492371
97	199	47	14.8599999999999994	1	2018-04-23 13:49:24.496025	2018-04-23 13:49:24.496025
98	196	47	47.3699999999999974	4	2018-04-23 13:49:24.499061	2018-04-23 13:49:24.499061
99	278	48	37.5600000000000023	5	2018-04-23 13:49:24.504267	2018-04-23 13:49:24.504267
100	236	48	95.6400000000000006	5	2018-04-23 13:49:24.507283	2018-04-23 13:49:24.507283
101	\N	48	50.2700000000000031	1	2018-04-23 13:49:24.511955	2018-04-23 13:49:24.511955
102	347	49	100.069999999999993	1	2018-04-23 13:49:24.517161	2018-04-23 13:49:24.517161
103	\N	49	12.1500000000000004	5	2018-04-23 13:49:24.522203	2018-04-23 13:49:24.522203
104	404	49	94.519999999999996	1	2018-04-23 13:49:24.525409	2018-04-23 13:49:24.525409
105	67	50	24.9699999999999989	2	2018-04-23 13:49:24.530172	2018-04-23 13:49:24.530172
106	315	50	96.0499999999999972	3	2018-04-23 13:49:24.533023	2018-04-23 13:49:24.533023
107	368	51	93.6700000000000017	5	2018-04-23 13:49:24.538097	2018-04-23 13:49:24.538097
108	183	51	86.8799999999999955	1	2018-04-23 13:49:24.541205	2018-04-23 13:49:24.541205
109	137	52	90.0300000000000011	4	2018-04-23 13:49:24.546179	2018-04-23 13:49:24.546179
110	275	53	26.6400000000000006	4	2018-04-23 13:49:24.552118	2018-04-23 13:49:24.552118
111	323	53	14.7300000000000004	4	2018-04-23 13:49:24.55512	2018-04-23 13:49:24.55512
112	191	53	82.1400000000000006	4	2018-04-23 13:49:24.558039	2018-04-23 13:49:24.558039
113	178	54	61.3800000000000026	4	2018-04-23 13:49:24.563202	2018-04-23 13:49:24.563202
114	37	54	79.4300000000000068	3	2018-04-23 13:49:24.56628	2018-04-23 13:49:24.56628
115	39	55	11.9399999999999995	2	2018-04-23 13:49:24.571332	2018-04-23 13:49:24.571332
116	308	55	68.0900000000000034	4	2018-04-23 13:49:24.574878	2018-04-23 13:49:24.574878
117	367	55	45.6599999999999966	4	2018-04-23 13:49:24.578142	2018-04-23 13:49:24.578142
118	5	56	12.6499999999999986	4	2018-04-23 13:49:24.583125	2018-04-23 13:49:24.583125
119	130	56	-7.54999999999999982	3	2018-04-23 13:49:24.586201	2018-04-23 13:49:24.586201
120	442	57	12.6199999999999992	2	2018-04-23 13:49:24.591983	2018-04-23 13:49:24.591983
121	179	57	71.7900000000000063	4	2018-04-23 13:49:24.595297	2018-04-23 13:49:24.595297
122	447	58	99.2999999999999972	3	2018-04-23 13:49:24.601258	2018-04-23 13:49:24.601258
123	197	58	16.9800000000000004	2	2018-04-23 13:49:24.604724	2018-04-23 13:49:24.604724
124	413	58	15.5	3	2018-04-23 13:49:24.607655	2018-04-23 13:49:24.607655
125	132	59	41.8100000000000023	3	2018-04-23 13:49:24.612464	2018-04-23 13:49:24.612464
126	109	59	15.1300000000000008	2	2018-04-23 13:49:24.615309	2018-04-23 13:49:24.615309
127	67	60	24.9699999999999989	2	2018-04-23 13:49:24.620162	2018-04-23 13:49:24.620162
128	186	61	34.1599999999999966	1	2018-04-23 13:49:24.624876	2018-04-23 13:49:24.624876
129	97	61	36.259999999999998	2	2018-04-23 13:49:24.628266	2018-04-23 13:49:24.628266
130	373	62	95.4200000000000017	2	2018-04-23 13:49:24.633334	2018-04-23 13:49:24.633334
131	443	62	106.640000000000001	4	2018-04-23 13:49:24.636543	2018-04-23 13:49:24.636543
132	68	63	86.230000000000004	5	2018-04-23 13:49:24.641803	2018-04-23 13:49:24.641803
133	43	63	23.1000000000000014	1	2018-04-23 13:49:24.644686	2018-04-23 13:49:24.644686
134	301	63	-0.440000000000000391	3	2018-04-23 13:49:24.647602	2018-04-23 13:49:24.647602
135	36	64	41.0200000000000031	3	2018-04-23 13:49:24.65255	2018-04-23 13:49:24.65255
136	419	64	81.1500000000000057	3	2018-04-23 13:49:24.656062	2018-04-23 13:49:24.656062
137	45	65	36.6599999999999966	1	2018-04-23 13:49:24.660844	2018-04-23 13:49:24.660844
138	\N	66	45.0300000000000011	1	2018-04-23 13:49:24.667365	2018-04-23 13:49:24.667365
139	24	67	45.0200000000000031	1	2018-04-23 13:49:24.672452	2018-04-23 13:49:24.672452
140	91	67	92.4699999999999989	1	2018-04-23 13:49:24.675364	2018-04-23 13:49:24.675364
141	177	67	25.6099999999999994	3	2018-04-23 13:49:24.678206	2018-04-23 13:49:24.678206
142	205	68	99.2999999999999972	1	2018-04-23 13:49:24.683619	2018-04-23 13:49:24.683619
143	61	68	32.3299999999999983	3	2018-04-23 13:49:24.687466	2018-04-23 13:49:24.687466
144	255	69	55.509999999999998	2	2018-04-23 13:49:24.69266	2018-04-23 13:49:24.69266
145	75	69	77.0600000000000023	4	2018-04-23 13:49:24.695564	2018-04-23 13:49:24.695564
146	176	69	47.8400000000000034	2	2018-04-23 13:49:24.698469	2018-04-23 13:49:24.698469
147	83	70	14.6300000000000008	1	2018-04-23 13:49:24.703508	2018-04-23 13:49:24.703508
148	183	70	89.8799999999999955	4	2018-04-23 13:49:24.707395	2018-04-23 13:49:24.707395
149	364	71	53.3100000000000023	1	2018-04-23 13:49:24.713051	2018-04-23 13:49:24.713051
150	146	71	51.4299999999999997	3	2018-04-23 13:49:24.716033	2018-04-23 13:49:24.716033
151	111	72	3.21000000000000085	3	2018-04-23 13:49:24.721171	2018-04-23 13:49:24.721171
152	195	72	23.0300000000000011	5	2018-04-23 13:49:24.72469	2018-04-23 13:49:24.72469
153	450	73	53.8500000000000014	3	2018-04-23 13:49:24.729807	2018-04-23 13:49:24.729807
154	155	73	11.0399999999999991	2	2018-04-23 13:49:24.732935	2018-04-23 13:49:24.732935
155	182	74	27.8399999999999999	2	2018-04-23 13:49:24.738447	2018-04-23 13:49:24.738447
156	141	74	17.7199999999999989	5	2018-04-23 13:49:24.741379	2018-04-23 13:49:24.741379
157	435	75	92.7900000000000063	2	2018-04-23 13:49:24.746228	2018-04-23 13:49:24.746228
158	192	76	95.230000000000004	1	2018-04-23 13:49:24.751096	2018-04-23 13:49:24.751096
159	408	76	44.1300000000000026	3	2018-04-23 13:49:24.754368	2018-04-23 13:49:24.754368
160	354	77	96.8100000000000023	5	2018-04-23 13:49:24.759854	2018-04-23 13:49:24.759854
161	392	77	64.2000000000000028	1	2018-04-23 13:49:24.763346	2018-04-23 13:49:24.763346
162	462	77	91.0499999999999972	2	2018-04-23 13:49:24.766438	2018-04-23 13:49:24.766438
163	404	78	91.519999999999996	5	2018-04-23 13:49:24.771958	2018-04-23 13:49:24.771958
164	316	78	22.3800000000000026	4	2018-04-23 13:49:24.774927	2018-04-23 13:49:24.774927
165	158	79	40.3100000000000023	5	2018-04-23 13:49:24.779824	2018-04-23 13:49:24.779824
166	65	79	48.0300000000000011	2	2018-04-23 13:49:24.782836	2018-04-23 13:49:24.782836
167	218	80	31.5500000000000007	4	2018-04-23 13:49:24.792624	2018-04-23 13:49:24.792624
168	301	80	5.55999999999999961	1	2018-04-23 13:49:24.803256	2018-04-23 13:49:24.803256
169	30	81	98.6700000000000017	1	2018-04-23 13:49:24.822116	2018-04-23 13:49:24.822116
170	27	81	96.75	4	2018-04-23 13:49:24.825787	2018-04-23 13:49:24.825787
171	302	81	23.6900000000000013	3	2018-04-23 13:49:24.828727	2018-04-23 13:49:24.828727
172	111	82	1.21000000000000085	4	2018-04-23 13:49:24.833585	2018-04-23 13:49:24.833585
173	250	82	74.1299999999999955	2	2018-04-23 13:49:24.836655	2018-04-23 13:49:24.836655
174	2	82	30.9500000000000028	1	2018-04-23 13:49:24.839953	2018-04-23 13:49:24.839953
175	\N	83	26.4200000000000017	4	2018-04-23 13:49:24.846639	2018-04-23 13:49:24.846639
176	277	83	85.25	4	2018-04-23 13:49:24.849785	2018-04-23 13:49:24.849785
177	368	83	96.6700000000000017	2	2018-04-23 13:49:24.853619	2018-04-23 13:49:24.853619
178	419	84	81.1500000000000057	2	2018-04-23 13:49:24.858588	2018-04-23 13:49:24.858588
179	138	84	33.7899999999999991	1	2018-04-23 13:49:24.861479	2018-04-23 13:49:24.861479
180	278	84	37.5600000000000023	3	2018-04-23 13:49:24.864334	2018-04-23 13:49:24.864334
181	377	85	52.5300000000000011	1	2018-04-23 13:49:24.869255	2018-04-23 13:49:24.869255
182	371	86	68.0100000000000051	2	2018-04-23 13:49:24.874234	2018-04-23 13:49:24.874234
183	229	86	29.3299999999999983	1	2018-04-23 13:49:24.87735	2018-04-23 13:49:24.87735
184	82	86	65.8700000000000045	3	2018-04-23 13:49:24.88043	2018-04-23 13:49:24.88043
185	50	87	10.2899999999999991	2	2018-04-23 13:49:24.885616	2018-04-23 13:49:24.885616
186	182	88	27.8399999999999999	1	2018-04-23 13:49:24.891108	2018-04-23 13:49:24.891108
187	306	89	89.0699999999999932	1	2018-04-23 13:49:24.896034	2018-04-23 13:49:24.896034
188	230	89	6.91000000000000014	2	2018-04-23 13:49:24.89891	2018-04-23 13:49:24.89891
189	393	89	56.6700000000000017	1	2018-04-23 13:49:24.902374	2018-04-23 13:49:24.902374
190	234	90	10.8200000000000003	2	2018-04-23 13:49:24.90818	2018-04-23 13:49:24.90818
191	11	91	14.629999999999999	4	2018-04-23 13:49:24.913436	2018-04-23 13:49:24.913436
192	292	92	34.8999999999999986	5	2018-04-23 13:49:24.918473	2018-04-23 13:49:24.918473
193	31	93	68.480000000000004	5	2018-04-23 13:49:24.923723	2018-04-23 13:49:24.923723
194	86	93	63.9500000000000028	3	2018-04-23 13:49:24.926667	2018-04-23 13:49:24.926667
195	368	94	84.6700000000000017	1	2018-04-23 13:49:24.931815	2018-04-23 13:49:24.931815
196	378	94	23.6999999999999993	5	2018-04-23 13:49:24.934775	2018-04-23 13:49:24.934775
197	370	95	92.1099999999999994	5	2018-04-23 13:49:24.939896	2018-04-23 13:49:24.939896
198	\N	95	74.1700000000000017	5	2018-04-23 13:49:24.944273	2018-04-23 13:49:24.944273
199	175	96	67.0799999999999983	3	2018-04-23 13:49:24.949276	2018-04-23 13:49:24.949276
200	260	97	53.8900000000000006	5	2018-04-23 13:49:24.954713	2018-04-23 13:49:24.954713
201	401	97	62.5900000000000034	4	2018-04-23 13:49:24.958055	2018-04-23 13:49:24.958055
202	141	98	18.7199999999999989	4	2018-04-23 13:49:24.96301	2018-04-23 13:49:24.96301
203	417	99	96.8199999999999932	2	2018-04-23 13:49:24.967936	2018-04-23 13:49:24.967936
204	259	100	71.9000000000000057	5	2018-04-23 13:49:24.973364	2018-04-23 13:49:24.973364
205	311	101	49.0499999999999972	1	2018-04-23 13:49:24.978629	2018-04-23 13:49:24.978629
206	66	101	58.5900000000000034	1	2018-04-23 13:49:24.982136	2018-04-23 13:49:24.982136
207	120	102	50.1400000000000006	1	2018-04-23 13:49:24.98771	2018-04-23 13:49:24.98771
208	21	102	38.7100000000000009	2	2018-04-23 13:49:24.990667	2018-04-23 13:49:24.990667
209	108	102	3.33000000000000007	3	2018-04-23 13:49:24.993509	2018-04-23 13:49:24.993509
210	446	103	0.40999999999999992	1	2018-04-23 13:49:24.998211	2018-04-23 13:49:24.998211
211	301	104	13.5599999999999987	5	2018-04-23 13:49:25.00315	2018-04-23 13:49:25.00315
212	266	104	18.7199999999999989	1	2018-04-23 13:49:25.006155	2018-04-23 13:49:25.006155
213	55	105	51.7700000000000031	3	2018-04-23 13:49:25.011801	2018-04-23 13:49:25.011801
214	260	105	52.8900000000000006	2	2018-04-23 13:49:25.014701	2018-04-23 13:49:25.014701
215	173	105	8.1899999999999995	3	2018-04-23 13:49:25.017602	2018-04-23 13:49:25.017602
216	\N	106	17.6499999999999986	3	2018-04-23 13:49:25.023938	2018-04-23 13:49:25.023938
217	351	106	70.5999999999999943	3	2018-04-23 13:49:25.027066	2018-04-23 13:49:25.027066
218	176	106	42.8400000000000034	2	2018-04-23 13:49:25.030113	2018-04-23 13:49:25.030113
219	1	107	85.8100000000000023	5	2018-04-23 13:49:25.035556	2018-04-23 13:49:25.035556
220	13	107	90.3199999999999932	2	2018-04-23 13:49:25.038764	2018-04-23 13:49:25.038764
221	149	108	0.310000000000000053	4	2018-04-23 13:49:25.043889	2018-04-23 13:49:25.043889
222	227	108	80.6099999999999994	3	2018-04-23 13:49:25.046811	2018-04-23 13:49:25.046811
223	235	108	70.0600000000000023	4	2018-04-23 13:49:25.049675	2018-04-23 13:49:25.049675
224	433	109	3.66999999999999993	2	2018-04-23 13:49:25.055057	2018-04-23 13:49:25.055057
225	\N	109	69.0300000000000011	3	2018-04-23 13:49:25.059442	2018-04-23 13:49:25.059442
226	188	110	50.7700000000000031	5	2018-04-23 13:49:25.064852	2018-04-23 13:49:25.064852
227	219	110	60.2000000000000028	2	2018-04-23 13:49:25.067753	2018-04-23 13:49:25.067753
228	62	111	28.3099999999999987	5	2018-04-23 13:49:25.07279	2018-04-23 13:49:25.07279
229	\N	111	69.0300000000000011	1	2018-04-23 13:49:25.077235	2018-04-23 13:49:25.077235
230	24	112	52.0200000000000031	3	2018-04-23 13:49:25.08213	2018-04-23 13:49:25.08213
231	458	113	98.4599999999999937	5	2018-04-23 13:49:25.087051	2018-04-23 13:49:25.087051
232	310	114	54.4099999999999966	3	2018-04-23 13:49:25.092742	2018-04-23 13:49:25.092742
233	106	114	46.3699999999999974	3	2018-04-23 13:49:25.095584	2018-04-23 13:49:25.095584
234	33	114	2.20999999999999996	3	2018-04-23 13:49:25.098595	2018-04-23 13:49:25.098595
235	327	115	45.2199999999999989	1	2018-04-23 13:49:25.103587	2018-04-23 13:49:25.103587
236	422	115	6.83999999999999986	2	2018-04-23 13:49:25.106745	2018-04-23 13:49:25.106745
237	48	116	11.1600000000000001	3	2018-04-23 13:49:25.111616	2018-04-23 13:49:25.111616
238	286	116	83.3599999999999994	2	2018-04-23 13:49:25.114568	2018-04-23 13:49:25.114568
239	368	117	93.6700000000000017	4	2018-04-23 13:49:25.120128	2018-04-23 13:49:25.120128
240	37	117	79.4300000000000068	1	2018-04-23 13:49:25.123129	2018-04-23 13:49:25.123129
241	234	118	29.8200000000000003	3	2018-04-23 13:49:25.128129	2018-04-23 13:49:25.128129
242	123	118	96.7099999999999937	5	2018-04-23 13:49:25.131131	2018-04-23 13:49:25.131131
243	396	118	64.2900000000000063	2	2018-04-23 13:49:25.134379	2018-04-23 13:49:25.134379
244	133	119	58.9699999999999989	4	2018-04-23 13:49:25.139409	2018-04-23 13:49:25.139409
245	64	119	78.3700000000000045	1	2018-04-23 13:49:25.142798	2018-04-23 13:49:25.142798
246	318	119	33.240000000000002	4	2018-04-23 13:49:25.146015	2018-04-23 13:49:25.146015
247	156	120	73.789999999999992	1	2018-04-23 13:49:25.150758	2018-04-23 13:49:25.150758
248	410	120	32.3200000000000003	4	2018-04-23 13:49:25.1539	2018-04-23 13:49:25.1539
249	245	121	6.25	3	2018-04-23 13:49:25.158999	2018-04-23 13:49:25.158999
250	147	121	17.9499999999999993	2	2018-04-23 13:49:25.162704	2018-04-23 13:49:25.162704
251	174	122	74.0900000000000034	1	2018-04-23 13:49:25.167518	2018-04-23 13:49:25.167518
252	70	122	104.519999999999996	1	2018-04-23 13:49:25.171231	2018-04-23 13:49:25.171231
253	420	122	37.3999999999999986	4	2018-04-23 13:49:25.174339	2018-04-23 13:49:25.174339
254	79	123	43.5600000000000023	4	2018-04-23 13:49:25.179288	2018-04-23 13:49:25.179288
255	\N	124	2.29999999999999982	1	2018-04-23 13:49:25.185725	2018-04-23 13:49:25.185725
256	447	124	105.299999999999997	3	2018-04-23 13:49:25.188927	2018-04-23 13:49:25.188927
257	369	124	25.5799999999999983	3	2018-04-23 13:49:25.192028	2018-04-23 13:49:25.192028
258	286	125	82.3599999999999994	3	2018-04-23 13:49:25.197217	2018-04-23 13:49:25.197217
259	\N	126	38.6700000000000017	4	2018-04-23 13:49:25.204183	2018-04-23 13:49:25.204183
260	436	127	2.18999999999999995	2	2018-04-23 13:49:25.209485	2018-04-23 13:49:25.209485
261	452	127	97.1800000000000068	2	2018-04-23 13:49:25.212833	2018-04-23 13:49:25.212833
262	104	127	21.5100000000000016	2	2018-04-23 13:49:25.216184	2018-04-23 13:49:25.216184
263	43	128	28.1000000000000014	5	2018-04-23 13:49:25.222014	2018-04-23 13:49:25.222014
264	194	128	78.6599999999999966	4	2018-04-23 13:49:25.225586	2018-04-23 13:49:25.225586
265	438	128	26.8200000000000003	3	2018-04-23 13:49:25.229	2018-04-23 13:49:25.229
266	397	129	60.75	3	2018-04-23 13:49:25.23438	2018-04-23 13:49:25.23438
267	61	129	29.3299999999999983	4	2018-04-23 13:49:25.237844	2018-04-23 13:49:25.237844
268	48	129	6.16000000000000014	3	2018-04-23 13:49:25.24096	2018-04-23 13:49:25.24096
269	92	130	97.2399999999999949	5	2018-04-23 13:49:25.246098	2018-04-23 13:49:25.246098
270	183	130	91.8799999999999955	4	2018-04-23 13:49:25.24914	2018-04-23 13:49:25.24914
271	266	130	12.7200000000000006	1	2018-04-23 13:49:25.252664	2018-04-23 13:49:25.252664
272	277	131	87.25	3	2018-04-23 13:49:25.257794	2018-04-23 13:49:25.257794
273	255	131	55.509999999999998	4	2018-04-23 13:49:25.260691	2018-04-23 13:49:25.260691
274	138	132	42.7899999999999991	1	2018-04-23 13:49:25.265434	2018-04-23 13:49:25.265434
275	345	133	65.4000000000000057	5	2018-04-23 13:49:25.270422	2018-04-23 13:49:25.270422
276	394	133	28.5799999999999983	5	2018-04-23 13:49:25.273359	2018-04-23 13:49:25.273359
277	82	134	74.8700000000000045	2	2018-04-23 13:49:25.278761	2018-04-23 13:49:25.278761
278	362	134	54.8299999999999983	3	2018-04-23 13:49:25.282042	2018-04-23 13:49:25.282042
279	1	134	99.8100000000000023	5	2018-04-23 13:49:25.285093	2018-04-23 13:49:25.285093
280	326	135	10.5899999999999999	4	2018-04-23 13:49:25.290458	2018-04-23 13:49:25.290458
281	266	136	12.7200000000000006	4	2018-04-23 13:49:25.296312	2018-04-23 13:49:25.296312
282	472	136	30.8599999999999994	2	2018-04-23 13:49:25.299904	2018-04-23 13:49:25.299904
283	216	136	8.73000000000000043	5	2018-04-23 13:49:25.304155	2018-04-23 13:49:25.304155
284	242	137	63.1599999999999966	3	2018-04-23 13:49:25.309604	2018-04-23 13:49:25.309604
285	296	137	24.129999999999999	3	2018-04-23 13:49:25.312589	2018-04-23 13:49:25.312589
286	218	137	31.5500000000000007	2	2018-04-23 13:49:25.319494	2018-04-23 13:49:25.319494
287	415	138	7.79000000000000004	1	2018-04-23 13:49:25.324714	2018-04-23 13:49:25.324714
288	186	139	38.1599999999999966	1	2018-04-23 13:49:25.329922	2018-04-23 13:49:25.329922
289	304	139	50.1300000000000026	2	2018-04-23 13:49:25.333296	2018-04-23 13:49:25.333296
290	350	139	81.0499999999999972	3	2018-04-23 13:49:25.336376	2018-04-23 13:49:25.336376
291	28	140	3.85999999999999988	5	2018-04-23 13:49:25.342584	2018-04-23 13:49:25.342584
292	341	141	77.3900000000000006	3	2018-04-23 13:49:25.348506	2018-04-23 13:49:25.348506
293	158	142	40.3100000000000023	2	2018-04-23 13:49:25.354108	2018-04-23 13:49:25.354108
294	200	142	20.9800000000000004	5	2018-04-23 13:49:25.357886	2018-04-23 13:49:25.357886
295	393	142	46.6700000000000017	2	2018-04-23 13:49:25.36082	2018-04-23 13:49:25.36082
296	172	143	62.0100000000000051	2	2018-04-23 13:49:25.365533	2018-04-23 13:49:25.365533
297	213	144	56.4699999999999989	2	2018-04-23 13:49:25.370388	2018-04-23 13:49:25.370388
298	181	144	87.1400000000000006	4	2018-04-23 13:49:25.373399	2018-04-23 13:49:25.373399
299	435	145	91.7900000000000063	4	2018-04-23 13:49:25.378447	2018-04-23 13:49:25.378447
300	51	145	38.6199999999999974	5	2018-04-23 13:49:25.381408	2018-04-23 13:49:25.381408
301	26	146	30.2300000000000004	3	2018-04-23 13:49:25.387859	2018-04-23 13:49:25.387859
302	472	146	30.8599999999999994	1	2018-04-23 13:49:25.390767	2018-04-23 13:49:25.390767
303	224	146	39.2199999999999989	3	2018-04-23 13:49:25.39363	2018-04-23 13:49:25.39363
304	109	147	15.1300000000000008	5	2018-04-23 13:49:25.398334	2018-04-23 13:49:25.398334
305	224	147	33.2199999999999989	5	2018-04-23 13:49:25.401139	2018-04-23 13:49:25.401139
306	462	147	91.0499999999999972	4	2018-04-23 13:49:25.404111	2018-04-23 13:49:25.404111
307	68	148	95.230000000000004	5	2018-04-23 13:49:25.408844	2018-04-23 13:49:25.408844
308	213	148	56.4699999999999989	5	2018-04-23 13:49:25.41246	2018-04-23 13:49:25.41246
309	182	149	27.8399999999999999	1	2018-04-23 13:49:25.417792	2018-04-23 13:49:25.417792
310	428	149	59.8900000000000006	2	2018-04-23 13:49:25.420916	2018-04-23 13:49:25.420916
311	440	149	8.44000000000000128	3	2018-04-23 13:49:25.423808	2018-04-23 13:49:25.423808
312	234	150	19.8200000000000003	3	2018-04-23 13:49:25.42856	2018-04-23 13:49:25.42856
313	354	151	99.8100000000000023	5	2018-04-23 13:49:25.433678	2018-04-23 13:49:25.433678
314	316	151	12.3800000000000008	1	2018-04-23 13:49:25.436779	2018-04-23 13:49:25.436779
315	392	151	55.2000000000000028	2	2018-04-23 13:49:25.440623	2018-04-23 13:49:25.440623
316	309	152	20.75	2	2018-04-23 13:49:25.445709	2018-04-23 13:49:25.445709
317	38	152	15.4299999999999997	2	2018-04-23 13:49:25.448645	2018-04-23 13:49:25.448645
318	468	152	63.0499999999999972	3	2018-04-23 13:49:25.452122	2018-04-23 13:49:25.452122
319	271	153	66.1500000000000057	1	2018-04-23 13:49:25.457245	2018-04-23 13:49:25.457245
320	8	153	71.8799999999999955	4	2018-04-23 13:49:25.460298	2018-04-23 13:49:25.460298
321	194	154	84.6599999999999966	1	2018-04-23 13:49:25.465984	2018-04-23 13:49:25.465984
322	211	154	18.5799999999999983	2	2018-04-23 13:49:25.469206	2018-04-23 13:49:25.469206
323	201	155	13.4600000000000009	3	2018-04-23 13:49:25.474289	2018-04-23 13:49:25.474289
324	57	156	18.2699999999999996	5	2018-04-23 13:49:25.479071	2018-04-23 13:49:25.479071
325	101	157	80.4300000000000068	4	2018-04-23 13:49:25.484265	2018-04-23 13:49:25.484265
326	\N	157	16.1499999999999986	3	2018-04-23 13:49:25.489169	2018-04-23 13:49:25.489169
327	163	158	23.2300000000000004	2	2018-04-23 13:49:25.495153	2018-04-23 13:49:25.495153
328	216	159	3.72999999999999998	4	2018-04-23 13:49:25.499926	2018-04-23 13:49:25.499926
329	119	159	5.92999999999999972	4	2018-04-23 13:49:25.503235	2018-04-23 13:49:25.503235
330	144	160	82.9500000000000028	2	2018-04-23 13:49:25.508141	2018-04-23 13:49:25.508141
331	27	160	86.75	2	2018-04-23 13:49:25.511022	2018-04-23 13:49:25.511022
332	82	161	65.8700000000000045	4	2018-04-23 13:49:25.515795	2018-04-23 13:49:25.515795
333	260	162	45.8900000000000006	3	2018-04-23 13:49:25.521802	2018-04-23 13:49:25.521802
334	409	162	60.8800000000000026	2	2018-04-23 13:49:25.524852	2018-04-23 13:49:25.524852
335	372	163	87.3900000000000006	3	2018-04-23 13:49:25.529628	2018-04-23 13:49:25.529628
336	49	163	93.019999999999996	3	2018-04-23 13:49:25.53346	2018-04-23 13:49:25.53346
337	404	163	101.519999999999996	2	2018-04-23 13:49:25.536524	2018-04-23 13:49:25.536524
338	265	164	19.9800000000000004	4	2018-04-23 13:49:25.541566	2018-04-23 13:49:25.541566
339	164	164	6.88999999999999968	3	2018-04-23 13:49:25.544691	2018-04-23 13:49:25.544691
340	259	164	58.8999999999999986	2	2018-04-23 13:49:25.548088	2018-04-23 13:49:25.548088
341	8	165	62.8800000000000026	1	2018-04-23 13:49:25.553316	2018-04-23 13:49:25.553316
342	50	165	1.28999999999999915	2	2018-04-23 13:49:25.557066	2018-04-23 13:49:25.557066
343	469	165	71.1800000000000068	1	2018-04-23 13:49:25.560353	2018-04-23 13:49:25.560353
344	422	166	11.8399999999999999	4	2018-04-23 13:49:25.565256	2018-04-23 13:49:25.565256
345	443	166	98.6400000000000006	3	2018-04-23 13:49:25.568937	2018-04-23 13:49:25.568937
346	115	166	44.8900000000000006	2	2018-04-23 13:49:25.572377	2018-04-23 13:49:25.572377
347	251	167	30.9499999999999993	3	2018-04-23 13:49:25.577713	2018-04-23 13:49:25.577713
348	89	167	54.8100000000000023	1	2018-04-23 13:49:25.580624	2018-04-23 13:49:25.580624
349	75	168	78.0600000000000023	4	2018-04-23 13:49:25.585535	2018-04-23 13:49:25.585535
350	81	169	98.4899999999999949	5	2018-04-23 13:49:25.590509	2018-04-23 13:49:25.590509
351	226	169	5.75	3	2018-04-23 13:49:25.593915	2018-04-23 13:49:25.593915
352	112	169	30.8200000000000003	3	2018-04-23 13:49:25.597245	2018-04-23 13:49:25.597245
353	441	170	5.30999999999999961	3	2018-04-23 13:49:25.602984	2018-04-23 13:49:25.602984
354	162	170	45.4500000000000028	1	2018-04-23 13:49:25.606267	2018-04-23 13:49:25.606267
355	\N	170	74.0300000000000011	1	2018-04-23 13:49:25.611216	2018-04-23 13:49:25.611216
356	246	171	80.2099999999999937	5	2018-04-23 13:49:25.616152	2018-04-23 13:49:25.616152
357	460	172	75.8799999999999955	4	2018-04-23 13:49:25.621121	2018-04-23 13:49:25.621121
358	302	172	20.6900000000000013	4	2018-04-23 13:49:25.624113	2018-04-23 13:49:25.624113
359	231	173	35.0499999999999972	4	2018-04-23 13:49:25.630913	2018-04-23 13:49:25.630913
360	267	174	89.8299999999999983	3	2018-04-23 13:49:25.636437	2018-04-23 13:49:25.636437
361	29	175	93.2000000000000028	4	2018-04-23 13:49:25.641396	2018-04-23 13:49:25.641396
362	3	176	63.6499999999999986	2	2018-04-23 13:49:25.64613	2018-04-23 13:49:25.64613
363	183	176	96.8799999999999955	5	2018-04-23 13:49:25.648977	2018-04-23 13:49:25.648977
364	107	176	34.8699999999999974	5	2018-04-23 13:49:25.652443	2018-04-23 13:49:25.652443
365	9	177	80.6800000000000068	3	2018-04-23 13:49:25.657922	2018-04-23 13:49:25.657922
366	140	177	47.1099999999999994	5	2018-04-23 13:49:25.66094	2018-04-23 13:49:25.66094
367	229	178	30.3299999999999983	4	2018-04-23 13:49:25.666196	2018-04-23 13:49:25.666196
368	309	178	26.75	4	2018-04-23 13:49:25.669327	2018-04-23 13:49:25.669327
369	398	179	50.8699999999999974	2	2018-04-23 13:49:25.674598	2018-04-23 13:49:25.674598
370	446	179	1.40999999999999992	2	2018-04-23 13:49:25.67758	2018-04-23 13:49:25.67758
371	341	179	77.3900000000000006	5	2018-04-23 13:49:25.68086	2018-04-23 13:49:25.68086
372	74	180	67.1099999999999994	3	2018-04-23 13:49:25.685866	2018-04-23 13:49:25.685866
373	465	180	74.0300000000000011	5	2018-04-23 13:49:25.689048	2018-04-23 13:49:25.689048
374	452	180	101.180000000000007	5	2018-04-23 13:49:25.691989	2018-04-23 13:49:25.691989
375	455	181	20.0799999999999983	5	2018-04-23 13:49:25.697069	2018-04-23 13:49:25.697069
376	139	181	80.1899999999999977	2	2018-04-23 13:49:25.706361	2018-04-23 13:49:25.706361
377	211	182	18.5799999999999983	2	2018-04-23 13:49:25.723738	2018-04-23 13:49:25.723738
378	48	182	6.16000000000000014	3	2018-04-23 13:49:25.727192	2018-04-23 13:49:25.727192
379	360	183	56.1000000000000014	3	2018-04-23 13:49:25.732346	2018-04-23 13:49:25.732346
380	79	184	43.5600000000000023	5	2018-04-23 13:49:25.737781	2018-04-23 13:49:25.737781
381	367	185	46.6599999999999966	4	2018-04-23 13:49:25.743523	2018-04-23 13:49:25.743523
382	21	185	38.7100000000000009	4	2018-04-23 13:49:25.746415	2018-04-23 13:49:25.746415
383	123	185	96.7099999999999937	4	2018-04-23 13:49:25.74931	2018-04-23 13:49:25.74931
384	206	186	14.25	3	2018-04-23 13:49:25.755011	2018-04-23 13:49:25.755011
385	106	186	38.3699999999999974	4	2018-04-23 13:49:25.758078	2018-04-23 13:49:25.758078
386	460	186	83.8799999999999955	2	2018-04-23 13:49:25.761028	2018-04-23 13:49:25.761028
387	21	187	38.7100000000000009	5	2018-04-23 13:49:25.766038	2018-04-23 13:49:25.766038
388	298	187	0.340000000000000024	3	2018-04-23 13:49:25.769782	2018-04-23 13:49:25.769782
389	313	188	47.509999999999998	3	2018-04-23 13:49:25.775179	2018-04-23 13:49:25.775179
390	4	188	32.1499999999999986	1	2018-04-23 13:49:25.778527	2018-04-23 13:49:25.778527
391	344	189	54.3800000000000026	2	2018-04-23 13:49:25.783497	2018-04-23 13:49:25.783497
392	305	189	15.6400000000000006	5	2018-04-23 13:49:25.786503	2018-04-23 13:49:25.786503
393	148	190	74.8799999999999955	4	2018-04-23 13:49:25.791584	2018-04-23 13:49:25.791584
394	221	190	35.0300000000000011	5	2018-04-23 13:49:25.795121	2018-04-23 13:49:25.795121
395	35	190	32.2899999999999991	2	2018-04-23 13:49:25.79856	2018-04-23 13:49:25.79856
396	254	191	6.83000000000000007	5	2018-04-23 13:49:25.804155	2018-04-23 13:49:25.804155
397	414	192	10.3599999999999994	5	2018-04-23 13:49:25.808948	2018-04-23 13:49:25.808948
398	182	192	27.8399999999999999	2	2018-04-23 13:49:25.811825	2018-04-23 13:49:25.811825
399	452	193	96.1800000000000068	2	2018-04-23 13:49:25.816797	2018-04-23 13:49:25.816797
400	151	193	50.6700000000000017	4	2018-04-23 13:49:25.820086	2018-04-23 13:49:25.820086
401	\N	193	97.269999999999996	4	2018-04-23 13:49:25.825706	2018-04-23 13:49:25.825706
402	389	194	1.79999999999999982	3	2018-04-23 13:49:25.83093	2018-04-23 13:49:25.83093
403	462	194	95.0499999999999972	2	2018-04-23 13:49:25.834032	2018-04-23 13:49:25.834032
404	11	195	22.629999999999999	3	2018-04-23 13:49:25.839766	2018-04-23 13:49:25.839766
405	475	195	82.0400000000000063	4	2018-04-23 13:49:25.844976	2018-04-23 13:49:25.844976
406	35	196	33.2899999999999991	2	2018-04-23 13:49:25.854542	2018-04-23 13:49:25.854542
407	95	196	69.6700000000000017	4	2018-04-23 13:49:25.857556	2018-04-23 13:49:25.857556
408	331	197	82.6299999999999955	3	2018-04-23 13:49:25.862318	2018-04-23 13:49:25.862318
409	232	198	62.7199999999999989	5	2018-04-23 13:49:25.867499	2018-04-23 13:49:25.867499
410	35	198	24.2899999999999991	3	2018-04-23 13:49:25.870941	2018-04-23 13:49:25.870941
411	222	199	18.8099999999999987	4	2018-04-23 13:49:25.87621	2018-04-23 13:49:25.87621
412	416	199	11.0599999999999987	1	2018-04-23 13:49:25.879205	2018-04-23 13:49:25.879205
413	43	199	31.1000000000000014	1	2018-04-23 13:49:25.882043	2018-04-23 13:49:25.882043
414	127	200	15.0299999999999994	1	2018-04-23 13:49:25.886972	2018-04-23 13:49:25.886972
415	327	200	42.2199999999999989	2	2018-04-23 13:49:25.889931	2018-04-23 13:49:25.889931
416	441	200	5.30999999999999961	5	2018-04-23 13:49:25.892757	2018-04-23 13:49:25.892757
417	463	201	32.8500000000000014	2	2018-04-23 13:49:25.897415	2018-04-23 13:49:25.897415
418	160	201	66.4200000000000017	5	2018-04-23 13:49:25.900634	2018-04-23 13:49:25.900634
419	163	201	23.2300000000000004	2	2018-04-23 13:49:25.904034	2018-04-23 13:49:25.904034
420	285	202	83.2900000000000063	5	2018-04-23 13:49:25.908881	2018-04-23 13:49:25.908881
421	409	202	59.8800000000000026	3	2018-04-23 13:49:25.911791	2018-04-23 13:49:25.911791
422	166	202	28.7399999999999984	5	2018-04-23 13:49:25.914784	2018-04-23 13:49:25.914784
423	250	203	83.1299999999999955	2	2018-04-23 13:49:25.919734	2018-04-23 13:49:25.919734
424	129	203	50.4200000000000017	4	2018-04-23 13:49:25.922783	2018-04-23 13:49:25.922783
425	77	204	57.8599999999999994	1	2018-04-23 13:49:25.928493	2018-04-23 13:49:25.928493
426	\N	204	58.3100000000000023	5	2018-04-23 13:49:25.933082	2018-04-23 13:49:25.933082
427	322	205	74.0999999999999943	2	2018-04-23 13:49:25.938316	2018-04-23 13:49:25.938316
428	403	205	30.9200000000000017	1	2018-04-23 13:49:25.941305	2018-04-23 13:49:25.941305
429	451	206	27.0700000000000003	3	2018-04-23 13:49:25.946016	2018-04-23 13:49:25.946016
430	189	207	6.65000000000000036	3	2018-04-23 13:49:25.950748	2018-04-23 13:49:25.950748
431	204	208	93.8199999999999932	5	2018-04-23 13:49:25.956347	2018-04-23 13:49:25.956347
432	371	208	61.0100000000000051	2	2018-04-23 13:49:25.959831	2018-04-23 13:49:25.959831
433	335	208	4.45999999999999996	1	2018-04-23 13:49:25.963212	2018-04-23 13:49:25.963212
434	78	209	24.3599999999999994	3	2018-04-23 13:49:25.968915	2018-04-23 13:49:25.968915
435	121	209	51.0399999999999991	4	2018-04-23 13:49:25.972097	2018-04-23 13:49:25.972097
436	266	210	12.7200000000000006	2	2018-04-23 13:49:25.977108	2018-04-23 13:49:25.977108
437	266	211	10.7200000000000006	3	2018-04-23 13:49:25.982322	2018-04-23 13:49:25.982322
438	252	212	64.3900000000000006	4	2018-04-23 13:49:25.987467	2018-04-23 13:49:25.987467
439	59	212	98.4899999999999949	2	2018-04-23 13:49:25.990518	2018-04-23 13:49:25.990518
440	374	213	12.3100000000000005	5	2018-04-23 13:49:25.995708	2018-04-23 13:49:25.995708
441	397	213	55.75	3	2018-04-23 13:49:25.998625	2018-04-23 13:49:25.998625
442	420	213	45.3999999999999986	1	2018-04-23 13:49:26.001584	2018-04-23 13:49:26.001584
443	291	214	80.7199999999999989	5	2018-04-23 13:49:26.007088	2018-04-23 13:49:26.007088
444	469	214	71.1800000000000068	2	2018-04-23 13:49:26.010076	2018-04-23 13:49:26.010076
445	193	215	42.4500000000000028	5	2018-04-23 13:49:26.014838	2018-04-23 13:49:26.014838
446	10	216	70.4500000000000028	3	2018-04-23 13:49:26.019784	2018-04-23 13:49:26.019784
447	465	217	74.0300000000000011	5	2018-04-23 13:49:26.024885	2018-04-23 13:49:26.024885
448	41	218	76.0699999999999932	4	2018-04-23 13:49:26.03	2018-04-23 13:49:26.03
449	24	218	52.0200000000000031	5	2018-04-23 13:49:26.033762	2018-04-23 13:49:26.033762
450	163	218	23.2300000000000004	2	2018-04-23 13:49:26.037214	2018-04-23 13:49:26.037214
451	13	219	100.319999999999993	3	2018-04-23 13:49:26.042573	2018-04-23 13:49:26.042573
452	284	220	31.4800000000000004	1	2018-04-23 13:49:26.047379	2018-04-23 13:49:26.047379
453	397	220	60.75	4	2018-04-23 13:49:26.050218	2018-04-23 13:49:26.050218
454	208	220	88.8199999999999932	5	2018-04-23 13:49:26.053337	2018-04-23 13:49:26.053337
455	208	221	81.8199999999999932	2	2018-04-23 13:49:26.058401	2018-04-23 13:49:26.058401
456	207	222	10.1999999999999993	5	2018-04-23 13:49:26.063849	2018-04-23 13:49:26.063849
457	193	222	37.4500000000000028	1	2018-04-23 13:49:26.066703	2018-04-23 13:49:26.066703
458	322	223	66.0999999999999943	2	2018-04-23 13:49:26.07175	2018-04-23 13:49:26.07175
459	254	224	15.8300000000000001	3	2018-04-23 13:49:26.076765	2018-04-23 13:49:26.076765
460	456	224	42.8999999999999986	4	2018-04-23 13:49:26.079665	2018-04-23 13:49:26.079665
461	14	225	40.3400000000000034	4	2018-04-23 13:49:26.084632	2018-04-23 13:49:26.084632
462	395	226	64.7900000000000063	4	2018-04-23 13:49:26.090387	2018-04-23 13:49:26.090387
463	252	227	64.3900000000000006	4	2018-04-23 13:49:26.095307	2018-04-23 13:49:26.095307
464	266	227	9.72000000000000064	2	2018-04-23 13:49:26.098212	2018-04-23 13:49:26.098212
465	375	227	-8.76999999999999957	3	2018-04-23 13:49:26.101049	2018-04-23 13:49:26.101049
466	14	228	50.3400000000000034	5	2018-04-23 13:49:26.106319	2018-04-23 13:49:26.106319
467	471	229	42.4600000000000009	2	2018-04-23 13:49:26.111437	2018-04-23 13:49:26.111437
468	404	230	87.519999999999996	2	2018-04-23 13:49:26.116893	2018-04-23 13:49:26.116893
469	363	230	46.6199999999999974	1	2018-04-23 13:49:26.120008	2018-04-23 13:49:26.120008
470	\N	231	58.3100000000000023	4	2018-04-23 13:49:26.127319	2018-04-23 13:49:26.127319
471	213	232	56.4699999999999989	2	2018-04-23 13:49:26.133221	2018-04-23 13:49:26.133221
472	329	233	1.10000000000000009	1	2018-04-23 13:49:26.138738	2018-04-23 13:49:26.138738
473	386	233	100.049999999999997	4	2018-04-23 13:49:26.142968	2018-04-23 13:49:26.142968
474	134	233	10.0800000000000001	5	2018-04-23 13:49:26.14597	2018-04-23 13:49:26.14597
475	238	234	93.6500000000000057	3	2018-04-23 13:49:26.15066	2018-04-23 13:49:26.15066
476	257	235	1.55000000000000004	4	2018-04-23 13:49:26.155694	2018-04-23 13:49:26.155694
477	424	235	69.8299999999999983	2	2018-04-23 13:49:26.158847	2018-04-23 13:49:26.158847
478	351	236	66.5999999999999943	2	2018-04-23 13:49:26.163571	2018-04-23 13:49:26.163571
479	450	236	53.8500000000000014	4	2018-04-23 13:49:26.166439	2018-04-23 13:49:26.166439
480	126	237	8.44999999999999929	3	2018-04-23 13:49:26.172163	2018-04-23 13:49:26.172163
481	435	237	92.7900000000000063	5	2018-04-23 13:49:26.175267	2018-04-23 13:49:26.175267
482	127	237	20.0300000000000011	5	2018-04-23 13:49:26.17828	2018-04-23 13:49:26.17828
483	260	238	39.8900000000000006	3	2018-04-23 13:49:26.183007	2018-04-23 13:49:26.183007
484	\N	239	76.1400000000000006	1	2018-04-23 13:49:26.189824	2018-04-23 13:49:26.189824
485	129	239	52.4200000000000017	3	2018-04-23 13:49:26.19342	2018-04-23 13:49:26.19342
486	329	239	0.100000000000000006	1	2018-04-23 13:49:26.196851	2018-04-23 13:49:26.196851
487	307	240	82.4899999999999949	5	2018-04-23 13:49:26.201632	2018-04-23 13:49:26.201632
488	388	240	51.6700000000000017	4	2018-04-23 13:49:26.204699	2018-04-23 13:49:26.204699
489	253	240	39.5399999999999991	2	2018-04-23 13:49:26.207598	2018-04-23 13:49:26.207598
490	18	241	99.6700000000000017	1	2018-04-23 13:49:26.212618	2018-04-23 13:49:26.212618
491	382	242	29.1899999999999977	4	2018-04-23 13:49:26.217689	2018-04-23 13:49:26.217689
492	394	242	40.5799999999999983	2	2018-04-23 13:49:26.221491	2018-04-23 13:49:26.221491
493	204	243	93.8199999999999932	1	2018-04-23 13:49:26.226513	2018-04-23 13:49:26.226513
494	117	243	15.6199999999999992	2	2018-04-23 13:49:26.229617	2018-04-23 13:49:26.229617
495	143	244	53.6899999999999977	2	2018-04-23 13:49:26.234589	2018-04-23 13:49:26.234589
496	406	244	20.4699999999999989	4	2018-04-23 13:49:26.237769	2018-04-23 13:49:26.237769
497	197	244	34.980000000000004	5	2018-04-23 13:49:26.240865	2018-04-23 13:49:26.240865
498	389	245	4.79999999999999982	3	2018-04-23 13:49:26.246123	2018-04-23 13:49:26.246123
499	427	246	19.5	3	2018-04-23 13:49:26.251608	2018-04-23 13:49:26.251608
500	\N	246	15.8300000000000001	5	2018-04-23 13:49:26.256302	2018-04-23 13:49:26.256302
501	192	246	82.230000000000004	3	2018-04-23 13:49:26.259318	2018-04-23 13:49:26.259318
502	93	247	10.3800000000000008	3	2018-04-23 13:49:26.264096	2018-04-23 13:49:26.264096
503	187	247	17.6300000000000026	5	2018-04-23 13:49:26.266962	2018-04-23 13:49:26.266962
504	135	247	48.6099999999999994	3	2018-04-23 13:49:26.270007	2018-04-23 13:49:26.270007
505	\N	248	86.9500000000000028	2	2018-04-23 13:49:26.276918	2018-04-23 13:49:26.276918
506	441	248	5.30999999999999961	4	2018-04-23 13:49:26.280096	2018-04-23 13:49:26.280096
507	179	249	71.7900000000000063	3	2018-04-23 13:49:26.284962	2018-04-23 13:49:26.284962
508	164	249	6.88999999999999968	4	2018-04-23 13:49:26.288268	2018-04-23 13:49:26.288268
509	109	250	15.1300000000000008	3	2018-04-23 13:49:26.293339	2018-04-23 13:49:26.293339
510	388	251	44.6700000000000017	1	2018-04-23 13:49:26.299154	2018-04-23 13:49:26.299154
511	397	252	60.75	1	2018-04-23 13:49:26.306089	2018-04-23 13:49:26.306089
512	32	253	68.7900000000000063	5	2018-04-23 13:49:26.310926	2018-04-23 13:49:26.310926
513	81	254	101.489999999999995	1	2018-04-23 13:49:26.315693	2018-04-23 13:49:26.315693
514	119	254	10.9299999999999997	2	2018-04-23 13:49:26.319082	2018-04-23 13:49:26.319082
515	378	254	26.6999999999999993	4	2018-04-23 13:49:26.322289	2018-04-23 13:49:26.322289
516	387	255	51.7100000000000009	2	2018-04-23 13:49:26.327316	2018-04-23 13:49:26.327316
517	130	255	2.45000000000000018	5	2018-04-23 13:49:26.330905	2018-04-23 13:49:26.330905
518	340	255	106.069999999999993	5	2018-04-23 13:49:26.333959	2018-04-23 13:49:26.333959
519	369	256	32.5799999999999983	5	2018-04-23 13:49:26.339399	2018-04-23 13:49:26.339399
520	376	256	39	4	2018-04-23 13:49:26.342424	2018-04-23 13:49:26.342424
521	102	257	5.66999999999999993	3	2018-04-23 13:49:26.347212	2018-04-23 13:49:26.347212
522	404	257	94.519999999999996	2	2018-04-23 13:49:26.350449	2018-04-23 13:49:26.350449
523	229	258	33.3299999999999983	4	2018-04-23 13:49:26.360398	2018-04-23 13:49:26.360398
524	269	258	97.6599999999999966	3	2018-04-23 13:49:26.363553	2018-04-23 13:49:26.363553
525	265	258	13.9800000000000004	4	2018-04-23 13:49:26.366406	2018-04-23 13:49:26.366406
526	351	259	70.5999999999999943	1	2018-04-23 13:49:26.37155	2018-04-23 13:49:26.37155
527	450	259	49.8500000000000014	1	2018-04-23 13:49:26.374452	2018-04-23 13:49:26.374452
528	110	260	96.6599999999999966	3	2018-04-23 13:49:26.379192	2018-04-23 13:49:26.379192
529	306	260	99.0699999999999932	5	2018-04-23 13:49:26.382161	2018-04-23 13:49:26.382161
530	349	261	74.7000000000000028	4	2018-04-23 13:49:26.388203	2018-04-23 13:49:26.388203
531	360	261	64.0999999999999943	3	2018-04-23 13:49:26.39117	2018-04-23 13:49:26.39117
532	402	262	12.4900000000000002	5	2018-04-23 13:49:26.395897	2018-04-23 13:49:26.395897
533	279	262	12.4100000000000001	5	2018-04-23 13:49:26.398777	2018-04-23 13:49:26.398777
534	376	262	39	2	2018-04-23 13:49:26.401586	2018-04-23 13:49:26.401586
535	317	263	40.7899999999999991	5	2018-04-23 13:49:26.406291	2018-04-23 13:49:26.406291
536	2	263	34.9500000000000028	3	2018-04-23 13:49:26.409122	2018-04-23 13:49:26.409122
537	183	264	85.8799999999999955	5	2018-04-23 13:49:26.415256	2018-04-23 13:49:26.415256
538	354	264	101.810000000000002	2	2018-04-23 13:49:26.418338	2018-04-23 13:49:26.418338
539	297	265	53.0799999999999983	4	2018-04-23 13:49:26.424169	2018-04-23 13:49:26.424169
540	465	265	70.0300000000000011	3	2018-04-23 13:49:26.427571	2018-04-23 13:49:26.427571
541	430	265	15.3900000000000006	2	2018-04-23 13:49:26.430921	2018-04-23 13:49:26.430921
542	207	266	11.1999999999999993	4	2018-04-23 13:49:26.436656	2018-04-23 13:49:26.436656
543	433	266	7.66999999999999993	2	2018-04-23 13:49:26.440871	2018-04-23 13:49:26.440871
544	455	267	20.0799999999999983	3	2018-04-23 13:49:26.446164	2018-04-23 13:49:26.446164
545	211	267	18.5799999999999983	5	2018-04-23 13:49:26.449058	2018-04-23 13:49:26.449058
546	33	267	7.20999999999999996	5	2018-04-23 13:49:26.451931	2018-04-23 13:49:26.451931
547	366	268	46.9200000000000017	4	2018-04-23 13:49:26.456686	2018-04-23 13:49:26.456686
548	358	268	88.480000000000004	4	2018-04-23 13:49:26.459604	2018-04-23 13:49:26.459604
549	357	268	1.63000000000000078	5	2018-04-23 13:49:26.462516	2018-04-23 13:49:26.462516
550	124	269	55.7999999999999972	1	2018-04-23 13:49:26.468195	2018-04-23 13:49:26.468195
551	420	269	37.3999999999999986	1	2018-04-23 13:49:26.471774	2018-04-23 13:49:26.471774
552	417	270	101.819999999999993	1	2018-04-23 13:49:26.477491	2018-04-23 13:49:26.477491
553	11	271	22.629999999999999	4	2018-04-23 13:49:26.482487	2018-04-23 13:49:26.482487
554	256	272	64.8100000000000023	5	2018-04-23 13:49:26.487313	2018-04-23 13:49:26.487313
555	165	272	86.9000000000000057	4	2018-04-23 13:49:26.490205	2018-04-23 13:49:26.490205
556	86	272	59.9500000000000028	2	2018-04-23 13:49:26.493474	2018-04-23 13:49:26.493474
557	343	273	72	5	2018-04-23 13:49:26.498693	2018-04-23 13:49:26.498693
558	217	273	19.2699999999999996	1	2018-04-23 13:49:26.501704	2018-04-23 13:49:26.501704
559	\N	274	26.4200000000000017	5	2018-04-23 13:49:26.508215	2018-04-23 13:49:26.508215
560	398	274	57.8699999999999974	2	2018-04-23 13:49:26.511269	2018-04-23 13:49:26.511269
561	419	275	81.1500000000000057	2	2018-04-23 13:49:26.516044	2018-04-23 13:49:26.516044
562	117	275	21.6199999999999974	2	2018-04-23 13:49:26.519223	2018-04-23 13:49:26.519223
563	202	276	59.259999999999998	4	2018-04-23 13:49:26.524636	2018-04-23 13:49:26.524636
564	21	276	38.7100000000000009	1	2018-04-23 13:49:26.527537	2018-04-23 13:49:26.527537
565	446	276	1.40999999999999992	5	2018-04-23 13:49:26.530397	2018-04-23 13:49:26.530397
566	153	277	79.6899999999999977	1	2018-04-23 13:49:26.535136	2018-04-23 13:49:26.535136
567	438	278	26.8200000000000003	1	2018-04-23 13:49:26.539897	2018-04-23 13:49:26.539897
568	276	279	38.0399999999999991	5	2018-04-23 13:49:26.545057	2018-04-23 13:49:26.545057
569	344	279	51.3800000000000026	2	2018-04-23 13:49:26.548506	2018-04-23 13:49:26.548506
570	331	279	89.6299999999999955	4	2018-04-23 13:49:26.551448	2018-04-23 13:49:26.551448
571	83	280	14.6300000000000008	3	2018-04-23 13:49:26.556338	2018-04-23 13:49:26.556338
572	255	281	55.509999999999998	5	2018-04-23 13:49:26.561503	2018-04-23 13:49:26.561503
573	76	281	17.6000000000000014	5	2018-04-23 13:49:26.564378	2018-04-23 13:49:26.564378
574	120	282	49.1400000000000006	5	2018-04-23 13:49:26.569051	2018-04-23 13:49:26.569051
575	475	282	80.0400000000000063	5	2018-04-23 13:49:26.572791	2018-04-23 13:49:26.572791
576	295	283	99.3900000000000006	3	2018-04-23 13:49:26.578845	2018-04-23 13:49:26.578845
577	326	283	22.5899999999999999	3	2018-04-23 13:49:26.582386	2018-04-23 13:49:26.582386
578	463	284	22.8500000000000014	4	2018-04-23 13:49:26.587376	2018-04-23 13:49:26.587376
579	388	284	44.6700000000000017	3	2018-04-23 13:49:26.590194	2018-04-23 13:49:26.590194
580	209	284	13.0500000000000007	1	2018-04-23 13:49:26.593029	2018-04-23 13:49:26.593029
581	108	285	7.33000000000000007	3	2018-04-23 13:49:26.597956	2018-04-23 13:49:26.597956
582	318	285	41.240000000000002	1	2018-04-23 13:49:26.601333	2018-04-23 13:49:26.601333
583	298	285	0.340000000000000024	4	2018-04-23 13:49:26.605245	2018-04-23 13:49:26.605245
584	17	286	4.40000000000000036	2	2018-04-23 13:49:26.611003	2018-04-23 13:49:26.611003
585	201	287	18.4600000000000009	3	2018-04-23 13:49:26.616227	2018-04-23 13:49:26.616227
586	138	287	37.7899999999999991	5	2018-04-23 13:49:26.619207	2018-04-23 13:49:26.619207
587	403	287	25.9200000000000017	1	2018-04-23 13:49:26.622206	2018-04-23 13:49:26.622206
588	124	288	55.7999999999999972	4	2018-04-23 13:49:26.627892	2018-04-23 13:49:26.627892
589	443	288	106.640000000000001	4	2018-04-23 13:49:26.631369	2018-04-23 13:49:26.631369
590	219	289	56.2000000000000028	5	2018-04-23 13:49:26.636121	2018-04-23 13:49:26.636121
591	248	289	13.8399999999999999	3	2018-04-23 13:49:26.6392	2018-04-23 13:49:26.6392
592	308	290	67.0900000000000034	2	2018-04-23 13:49:26.643965	2018-04-23 13:49:26.643965
593	58	290	84.9200000000000017	4	2018-04-23 13:49:26.6468	2018-04-23 13:49:26.6468
594	130	290	2.45000000000000018	5	2018-04-23 13:49:26.649648	2018-04-23 13:49:26.649648
595	112	291	30.8200000000000003	3	2018-04-23 13:49:26.654387	2018-04-23 13:49:26.654387
596	300	291	50.6199999999999974	4	2018-04-23 13:49:26.657858	2018-04-23 13:49:26.657858
597	\N	291	79.3400000000000034	3	2018-04-23 13:49:26.662442	2018-04-23 13:49:26.662442
598	262	292	10.9399999999999995	3	2018-04-23 13:49:26.667461	2018-04-23 13:49:26.667461
599	237	293	76.3400000000000034	2	2018-04-23 13:49:26.67218	2018-04-23 13:49:26.67218
600	348	294	24.5799999999999983	4	2018-04-23 13:49:26.676906	2018-04-23 13:49:26.676906
601	353	295	95.9899999999999949	4	2018-04-23 13:49:26.681845	2018-04-23 13:49:26.681845
602	328	295	70.0799999999999983	3	2018-04-23 13:49:26.685252	2018-04-23 13:49:26.685252
603	23	296	20.5500000000000007	1	2018-04-23 13:49:26.690131	2018-04-23 13:49:26.690131
604	440	296	21.4400000000000013	4	2018-04-23 13:49:26.693497	2018-04-23 13:49:26.693497
605	382	297	22.1899999999999977	1	2018-04-23 13:49:26.699301	2018-04-23 13:49:26.699301
606	103	297	62.7700000000000031	1	2018-04-23 13:49:26.702805	2018-04-23 13:49:26.702805
607	393	297	56.6700000000000017	2	2018-04-23 13:49:26.706133	2018-04-23 13:49:26.706133
608	297	298	60.0799999999999983	5	2018-04-23 13:49:26.712414	2018-04-23 13:49:26.712414
609	204	299	93.8199999999999932	1	2018-04-23 13:49:26.717256	2018-04-23 13:49:26.717256
610	329	299	0.100000000000000006	2	2018-04-23 13:49:26.720146	2018-04-23 13:49:26.720146
611	350	299	81.0499999999999972	2	2018-04-23 13:49:26.722999	2018-04-23 13:49:26.722999
612	117	300	10.6199999999999992	3	2018-04-23 13:49:26.727869	2018-04-23 13:49:26.727869
613	75	300	82.0600000000000023	5	2018-04-23 13:49:26.731341	2018-04-23 13:49:26.731341
614	\N	301	15.8300000000000001	5	2018-04-23 13:49:26.739126	2018-04-23 13:49:26.739126
615	21	302	30.7100000000000009	5	2018-04-23 13:49:26.744732	2018-04-23 13:49:26.744732
616	272	302	9.85999999999999943	2	2018-04-23 13:49:26.747723	2018-04-23 13:49:26.747723
617	56	303	65.3799999999999955	3	2018-04-23 13:49:26.752513	2018-04-23 13:49:26.752513
618	367	303	48.6599999999999966	3	2018-04-23 13:49:26.755505	2018-04-23 13:49:26.755505
619	277	303	96.25	1	2018-04-23 13:49:26.758562	2018-04-23 13:49:26.758562
620	394	304	32.5799999999999983	4	2018-04-23 13:49:26.763699	2018-04-23 13:49:26.763699
621	454	304	15.7899999999999991	3	2018-04-23 13:49:26.767076	2018-04-23 13:49:26.767076
622	182	304	27.8399999999999999	4	2018-04-23 13:49:26.770587	2018-04-23 13:49:26.770587
623	143	305	46.6899999999999977	2	2018-04-23 13:49:26.775459	2018-04-23 13:49:26.775459
624	263	305	97.1500000000000057	2	2018-04-23 13:49:26.778302	2018-04-23 13:49:26.778302
625	10	305	60.4500000000000028	4	2018-04-23 13:49:26.781199	2018-04-23 13:49:26.781199
626	19	306	96.8700000000000045	5	2018-04-23 13:49:26.785976	2018-04-23 13:49:26.785976
627	114	307	18.3100000000000023	2	2018-04-23 13:49:26.792108	2018-04-23 13:49:26.792108
628	25	307	98.7900000000000063	2	2018-04-23 13:49:26.795933	2018-04-23 13:49:26.795933
629	123	307	96.7099999999999937	4	2018-04-23 13:49:26.799023	2018-04-23 13:49:26.799023
630	439	308	64.1299999999999955	2	2018-04-23 13:49:26.804061	2018-04-23 13:49:26.804061
631	23	308	13.5500000000000007	5	2018-04-23 13:49:26.807436	2018-04-23 13:49:26.807436
632	49	309	100.019999999999996	1	2018-04-23 13:49:26.813245	2018-04-23 13:49:26.813245
633	48	309	-1.83999999999999986	5	2018-04-23 13:49:26.816655	2018-04-23 13:49:26.816655
634	414	309	10.3599999999999994	5	2018-04-23 13:49:26.819997	2018-04-23 13:49:26.819997
635	57	310	28.2699999999999996	5	2018-04-23 13:49:26.825137	2018-04-23 13:49:26.825137
636	274	311	33.240000000000002	5	2018-04-23 13:49:26.829909	2018-04-23 13:49:26.829909
637	173	311	11.1899999999999995	2	2018-04-23 13:49:26.832725	2018-04-23 13:49:26.832725
638	240	312	42.5399999999999991	1	2018-04-23 13:49:26.837701	2018-04-23 13:49:26.837701
639	\N	312	8.15000000000000036	4	2018-04-23 13:49:26.84236	2018-04-23 13:49:26.84236
640	30	313	106.670000000000002	5	2018-04-23 13:49:26.84804	2018-04-23 13:49:26.84804
641	335	313	-5.54000000000000004	5	2018-04-23 13:49:26.851034	2018-04-23 13:49:26.851034
642	473	313	34.4399999999999977	2	2018-04-23 13:49:26.853907	2018-04-23 13:49:26.853907
643	118	314	53.7899999999999991	5	2018-04-23 13:49:26.859165	2018-04-23 13:49:26.859165
644	138	315	24.7899999999999991	2	2018-04-23 13:49:26.867648	2018-04-23 13:49:26.867648
645	256	316	60.8100000000000023	2	2018-04-23 13:49:26.873065	2018-04-23 13:49:26.873065
646	405	317	51.6499999999999986	3	2018-04-23 13:49:26.878248	2018-04-23 13:49:26.878248
647	334	317	14.9299999999999997	5	2018-04-23 13:49:26.881159	2018-04-23 13:49:26.881159
648	100	317	79.2099999999999937	2	2018-04-23 13:49:26.884004	2018-04-23 13:49:26.884004
649	394	318	34.5799999999999983	4	2018-04-23 13:49:26.888843	2018-04-23 13:49:26.888843
650	376	318	39	2	2018-04-23 13:49:26.891734	2018-04-23 13:49:26.891734
651	304	319	56.1300000000000026	2	2018-04-23 13:49:26.896662	2018-04-23 13:49:26.896662
652	50	319	6.28999999999999915	1	2018-04-23 13:49:26.899937	2018-04-23 13:49:26.899937
653	406	319	20.4699999999999989	1	2018-04-23 13:49:26.902916	2018-04-23 13:49:26.902916
654	149	320	5.3100000000000005	1	2018-04-23 13:49:26.90806	2018-04-23 13:49:26.90806
655	\N	320	82.9500000000000028	3	2018-04-23 13:49:26.912411	2018-04-23 13:49:26.912411
656	154	321	7.16000000000000014	3	2018-04-23 13:49:26.917401	2018-04-23 13:49:26.917401
657	191	321	81.1400000000000006	1	2018-04-23 13:49:26.920413	2018-04-23 13:49:26.920413
658	369	321	30.5799999999999983	5	2018-04-23 13:49:26.923501	2018-04-23 13:49:26.923501
659	442	322	11.6199999999999992	3	2018-04-23 13:49:26.929059	2018-04-23 13:49:26.929059
660	234	322	20.8200000000000003	5	2018-04-23 13:49:26.93192	2018-04-23 13:49:26.93192
661	387	322	61.7100000000000009	1	2018-04-23 13:49:26.934727	2018-04-23 13:49:26.934727
662	405	323	51.6499999999999986	1	2018-04-23 13:49:26.939436	2018-04-23 13:49:26.939436
663	408	324	44.1300000000000026	4	2018-04-23 13:49:26.944097	2018-04-23 13:49:26.944097
664	181	325	87.1400000000000006	5	2018-04-23 13:49:26.949103	2018-04-23 13:49:26.949103
665	423	325	52.3800000000000026	5	2018-04-23 13:49:26.95257	2018-04-23 13:49:26.95257
666	112	325	21.8200000000000003	1	2018-04-23 13:49:26.955688	2018-04-23 13:49:26.955688
667	334	326	21.9299999999999997	3	2018-04-23 13:49:26.961435	2018-04-23 13:49:26.961435
668	\N	327	53.3100000000000023	4	2018-04-23 13:49:26.968219	2018-04-23 13:49:26.968219
669	\N	328	71.1400000000000006	4	2018-04-23 13:49:26.974802	2018-04-23 13:49:26.974802
670	234	328	20.8200000000000003	1	2018-04-23 13:49:26.978184	2018-04-23 13:49:26.978184
671	157	329	60.1200000000000045	3	2018-04-23 13:49:26.983551	2018-04-23 13:49:26.983551
672	117	330	7.61999999999999922	4	2018-04-23 13:49:26.988299	2018-04-23 13:49:26.988299
673	1	331	93.8100000000000023	4	2018-04-23 13:49:26.99322	2018-04-23 13:49:26.99322
674	108	331	7.33000000000000007	1	2018-04-23 13:49:26.996157	2018-04-23 13:49:26.996157
675	462	332	94.0499999999999972	5	2018-04-23 13:49:27.001107	2018-04-23 13:49:27.001107
676	445	332	6.51000000000000156	3	2018-04-23 13:49:27.004102	2018-04-23 13:49:27.004102
677	145	332	92.7999999999999972	5	2018-04-23 13:49:27.007578	2018-04-23 13:49:27.007578
678	351	333	66.5999999999999943	5	2018-04-23 13:49:27.012783	2018-04-23 13:49:27.012783
679	207	333	20.1999999999999993	2	2018-04-23 13:49:27.015805	2018-04-23 13:49:27.015805
680	138	333	33.7899999999999991	3	2018-04-23 13:49:27.018804	2018-04-23 13:49:27.018804
681	17	334	3.40000000000000036	5	2018-04-23 13:49:27.023576	2018-04-23 13:49:27.023576
682	114	334	6.3100000000000005	1	2018-04-23 13:49:27.026457	2018-04-23 13:49:27.026457
683	425	334	63.5900000000000034	5	2018-04-23 13:49:27.029273	2018-04-23 13:49:27.029273
684	226	335	-4.25	2	2018-04-23 13:49:27.034538	2018-04-23 13:49:27.034538
685	319	336	46.0499999999999972	2	2018-04-23 13:49:27.039778	2018-04-23 13:49:27.039778
686	256	337	60.8100000000000023	3	2018-04-23 13:49:27.04492	2018-04-23 13:49:27.04492
687	439	337	74.1299999999999955	3	2018-04-23 13:49:27.048027	2018-04-23 13:49:27.048027
688	4	337	34.1499999999999986	3	2018-04-23 13:49:27.051075	2018-04-23 13:49:27.051075
689	229	338	34.3299999999999983	3	2018-04-23 13:49:27.055967	2018-04-23 13:49:27.055967
690	315	339	104.049999999999997	3	2018-04-23 13:49:27.061636	2018-04-23 13:49:27.061636
691	176	340	51.8400000000000034	1	2018-04-23 13:49:27.066539	2018-04-23 13:49:27.066539
692	137	340	91.0300000000000011	5	2018-04-23 13:49:27.06941	2018-04-23 13:49:27.06941
693	453	340	0.240000000000000213	2	2018-04-23 13:49:27.072352	2018-04-23 13:49:27.072352
694	455	341	15.0799999999999983	4	2018-04-23 13:49:27.077358	2018-04-23 13:49:27.077358
695	145	342	92.7999999999999972	1	2018-04-23 13:49:27.08232	2018-04-23 13:49:27.08232
696	95	342	76.6700000000000017	1	2018-04-23 13:49:27.085418	2018-04-23 13:49:27.085418
697	366	343	56.9200000000000017	5	2018-04-23 13:49:27.090495	2018-04-23 13:49:27.090495
698	457	344	75.6200000000000045	4	2018-04-23 13:49:27.09525	2018-04-23 13:49:27.09525
699	20	344	62.1099999999999994	4	2018-04-23 13:49:27.098143	2018-04-23 13:49:27.098143
700	122	345	73.230000000000004	5	2018-04-23 13:49:27.103217	2018-04-23 13:49:27.103217
701	\N	346	36.4200000000000017	5	2018-04-23 13:49:27.109823	2018-04-23 13:49:27.109823
702	349	346	70.7000000000000028	5	2018-04-23 13:49:27.11355	2018-04-23 13:49:27.11355
703	449	346	26.7399999999999984	5	2018-04-23 13:49:27.116464	2018-04-23 13:49:27.116464
704	455	347	17.0799999999999983	1	2018-04-23 13:49:27.121244	2018-04-23 13:49:27.121244
705	138	347	33.7899999999999991	2	2018-04-23 13:49:27.124084	2018-04-23 13:49:27.124084
706	164	348	6.88999999999999968	1	2018-04-23 13:49:27.128958	2018-04-23 13:49:27.128958
707	318	348	37.240000000000002	2	2018-04-23 13:49:27.131935	2018-04-23 13:49:27.131935
708	257	348	2.54999999999999982	3	2018-04-23 13:49:27.134772	2018-04-23 13:49:27.134772
709	299	349	3.74000000000000021	4	2018-04-23 13:49:27.140629	2018-04-23 13:49:27.140629
710	223	349	26.7800000000000011	3	2018-04-23 13:49:27.143625	2018-04-23 13:49:27.143625
711	73	350	33.6400000000000006	1	2018-04-23 13:49:27.148404	2018-04-23 13:49:27.148404
712	429	350	60.4300000000000068	2	2018-04-23 13:49:27.151329	2018-04-23 13:49:27.151329
713	72	350	42.740000000000002	2	2018-04-23 13:49:27.154198	2018-04-23 13:49:27.154198
714	272	351	14.8599999999999994	1	2018-04-23 13:49:27.158893	2018-04-23 13:49:27.158893
715	35	351	24.2899999999999991	4	2018-04-23 13:49:27.161817	2018-04-23 13:49:27.161817
716	253	352	45.5399999999999991	1	2018-04-23 13:49:27.167276	2018-04-23 13:49:27.167276
717	420	352	34.3999999999999986	1	2018-04-23 13:49:27.170313	2018-04-23 13:49:27.170313
718	451	353	29.0700000000000003	4	2018-04-23 13:49:27.176141	2018-04-23 13:49:27.176141
719	438	353	16.8200000000000003	4	2018-04-23 13:49:27.179001	2018-04-23 13:49:27.179001
720	468	353	69.0499999999999972	2	2018-04-23 13:49:27.181892	2018-04-23 13:49:27.181892
721	147	354	27.9499999999999993	5	2018-04-23 13:49:27.186555	2018-04-23 13:49:27.186555
722	340	354	99.0699999999999932	4	2018-04-23 13:49:27.1894	2018-04-23 13:49:27.1894
723	58	354	86.9200000000000017	2	2018-04-23 13:49:27.192942	2018-04-23 13:49:27.192942
724	344	355	54.3800000000000026	5	2018-04-23 13:49:27.19814	2018-04-23 13:49:27.19814
725	124	355	55.7999999999999972	4	2018-04-23 13:49:27.20104	2018-04-23 13:49:27.20104
726	312	356	65.289999999999992	2	2018-04-23 13:49:27.206043	2018-04-23 13:49:27.206043
727	183	356	86.8799999999999955	3	2018-04-23 13:49:27.209068	2018-04-23 13:49:27.209068
728	180	357	95.5600000000000023	2	2018-04-23 13:49:27.214496	2018-04-23 13:49:27.214496
729	12	358	38.5900000000000034	4	2018-04-23 13:49:27.219966	2018-04-23 13:49:27.219966
730	25	359	95.7900000000000063	4	2018-04-23 13:49:27.225449	2018-04-23 13:49:27.225449
731	397	359	67.75	5	2018-04-23 13:49:27.228435	2018-04-23 13:49:27.228435
732	156	359	63.7899999999999991	2	2018-04-23 13:49:27.23133	2018-04-23 13:49:27.23133
733	83	360	24.6300000000000026	4	2018-04-23 13:49:27.23644	2018-04-23 13:49:27.23644
734	426	360	89.6800000000000068	4	2018-04-23 13:49:27.239679	2018-04-23 13:49:27.239679
735	121	360	59.0399999999999991	1	2018-04-23 13:49:27.242626	2018-04-23 13:49:27.242626
736	64	361	78.3700000000000045	3	2018-04-23 13:49:27.247942	2018-04-23 13:49:27.247942
737	264	361	45.5799999999999983	5	2018-04-23 13:49:27.250925	2018-04-23 13:49:27.250925
738	177	362	34.6099999999999994	2	2018-04-23 13:49:27.255662	2018-04-23 13:49:27.255662
739	271	362	61.1500000000000057	1	2018-04-23 13:49:27.258678	2018-04-23 13:49:27.258678
740	50	363	10.2899999999999991	3	2018-04-23 13:49:27.26367	2018-04-23 13:49:27.26367
741	337	364	50.3200000000000003	2	2018-04-23 13:49:27.268608	2018-04-23 13:49:27.268608
742	184	364	33.3799999999999955	3	2018-04-23 13:49:27.271583	2018-04-23 13:49:27.271583
743	104	364	19.5100000000000016	4	2018-04-23 13:49:27.275047	2018-04-23 13:49:27.275047
744	\N	365	29.6700000000000017	2	2018-04-23 13:49:27.281626	2018-04-23 13:49:27.281626
745	142	365	74.769999999999996	2	2018-04-23 13:49:27.284853	2018-04-23 13:49:27.284853
746	89	366	54.8100000000000023	3	2018-04-23 13:49:27.290022	2018-04-23 13:49:27.290022
747	59	367	98.4899999999999949	2	2018-04-23 13:49:27.295309	2018-04-23 13:49:27.295309
748	274	367	34.240000000000002	1	2018-04-23 13:49:27.298595	2018-04-23 13:49:27.298595
749	313	368	55.509999999999998	4	2018-04-23 13:49:27.304067	2018-04-23 13:49:27.304067
750	129	369	55.4200000000000017	2	2018-04-23 13:49:27.309608	2018-04-23 13:49:27.309608
751	438	369	16.8200000000000003	3	2018-04-23 13:49:27.313008	2018-04-23 13:49:27.313008
752	89	370	56.8100000000000023	4	2018-04-23 13:49:27.318725	2018-04-23 13:49:27.318725
753	9	371	74.6800000000000068	3	2018-04-23 13:49:27.324666	2018-04-23 13:49:27.324666
754	57	371	38.269999999999996	1	2018-04-23 13:49:27.328571	2018-04-23 13:49:27.328571
755	128	372	80.3400000000000034	2	2018-04-23 13:49:27.333504	2018-04-23 13:49:27.333504
756	66	372	58.5900000000000034	3	2018-04-23 13:49:27.336446	2018-04-23 13:49:27.336446
757	68	373	95.230000000000004	5	2018-04-23 13:49:27.341334	2018-04-23 13:49:27.341334
758	140	373	47.1099999999999994	2	2018-04-23 13:49:27.344278	2018-04-23 13:49:27.344278
759	9	374	81.6800000000000068	5	2018-04-23 13:49:27.349039	2018-04-23 13:49:27.349039
760	223	374	26.7800000000000011	2	2018-04-23 13:49:27.352023	2018-04-23 13:49:27.352023
761	125	375	34.75	5	2018-04-23 13:49:27.357516	2018-04-23 13:49:27.357516
762	\N	375	51.2700000000000031	3	2018-04-23 13:49:27.365792	2018-04-23 13:49:27.365792
763	358	375	90.480000000000004	4	2018-04-23 13:49:27.368842	2018-04-23 13:49:27.368842
764	131	376	49.7199999999999989	4	2018-04-23 13:49:27.373895	2018-04-23 13:49:27.373895
765	414	376	-2.64000000000000012	1	2018-04-23 13:49:27.376825	2018-04-23 13:49:27.376825
766	77	376	58.8599999999999994	1	2018-04-23 13:49:27.380328	2018-04-23 13:49:27.380328
767	321	377	89.2800000000000011	5	2018-04-23 13:49:27.385392	2018-04-23 13:49:27.385392
768	69	377	5.90000000000000036	4	2018-04-23 13:49:27.388793	2018-04-23 13:49:27.388793
769	16	378	30.2600000000000016	4	2018-04-23 13:49:27.393584	2018-04-23 13:49:27.393584
770	221	378	35.0300000000000011	1	2018-04-23 13:49:27.396528	2018-04-23 13:49:27.396528
771	214	379	43.490000000000002	3	2018-04-23 13:49:27.401604	2018-04-23 13:49:27.401604
772	150	380	10.7699999999999996	5	2018-04-23 13:49:27.407381	2018-04-23 13:49:27.407381
773	130	380	12.4499999999999993	1	2018-04-23 13:49:27.410989	2018-04-23 13:49:27.410989
774	\N	381	63.0300000000000011	2	2018-04-23 13:49:27.417606	2018-04-23 13:49:27.417606
775	63	382	66.9900000000000091	2	2018-04-23 13:49:27.422804	2018-04-23 13:49:27.422804
776	53	383	18.5399999999999991	4	2018-04-23 13:49:27.427505	2018-04-23 13:49:27.427505
777	382	383	32.1899999999999977	2	2018-04-23 13:49:27.430324	2018-04-23 13:49:27.430324
778	52	383	82.9599999999999937	1	2018-04-23 13:49:27.43315	2018-04-23 13:49:27.43315
779	358	384	87.480000000000004	2	2018-04-23 13:49:27.438652	2018-04-23 13:49:27.438652
780	401	385	64.5900000000000034	1	2018-04-23 13:49:27.443497	2018-04-23 13:49:27.443497
781	227	386	81.6099999999999994	5	2018-04-23 13:49:27.449157	2018-04-23 13:49:27.449157
782	114	386	22.3100000000000023	3	2018-04-23 13:49:27.452573	2018-04-23 13:49:27.452573
783	404	387	99.519999999999996	3	2018-04-23 13:49:27.458278	2018-04-23 13:49:27.458278
784	110	387	94.6599999999999966	5	2018-04-23 13:49:27.462155	2018-04-23 13:49:27.462155
785	378	388	24.6999999999999993	3	2018-04-23 13:49:27.467634	2018-04-23 13:49:27.467634
786	189	388	4.65000000000000036	1	2018-04-23 13:49:27.470551	2018-04-23 13:49:27.470551
787	272	389	9.85999999999999943	4	2018-04-23 13:49:27.475346	2018-04-23 13:49:27.475346
788	\N	390	53.3100000000000023	2	2018-04-23 13:49:27.481827	2018-04-23 13:49:27.481827
789	416	390	4.05999999999999961	4	2018-04-23 13:49:27.485014	2018-04-23 13:49:27.485014
790	366	391	58.9200000000000017	4	2018-04-23 13:49:27.490663	2018-04-23 13:49:27.490663
791	282	391	42.3999999999999986	5	2018-04-23 13:49:27.493772	2018-04-23 13:49:27.493772
792	53	391	18.5399999999999991	3	2018-04-23 13:49:27.496751	2018-04-23 13:49:27.496751
793	384	392	67.9200000000000017	4	2018-04-23 13:49:27.501646	2018-04-23 13:49:27.501646
794	358	393	89.480000000000004	2	2018-04-23 13:49:27.506776	2018-04-23 13:49:27.506776
795	455	394	28.0799999999999983	1	2018-04-23 13:49:27.511925	2018-04-23 13:49:27.511925
796	190	394	20.1099999999999994	4	2018-04-23 13:49:27.515479	2018-04-23 13:49:27.515479
797	366	394	43.9200000000000017	5	2018-04-23 13:49:27.519335	2018-04-23 13:49:27.519335
798	14	395	40.3400000000000034	3	2018-04-23 13:49:27.524477	2018-04-23 13:49:27.524477
799	\N	395	15.8300000000000001	5	2018-04-23 13:49:27.528972	2018-04-23 13:49:27.528972
800	169	395	38.75	5	2018-04-23 13:49:27.531898	2018-04-23 13:49:27.531898
801	34	396	25.7699999999999996	1	2018-04-23 13:49:27.536697	2018-04-23 13:49:27.536697
802	413	396	15.5	2	2018-04-23 13:49:27.539577	2018-04-23 13:49:27.539577
803	468	396	59.0499999999999972	1	2018-04-23 13:49:27.542399	2018-04-23 13:49:27.542399
804	318	397	32.240000000000002	1	2018-04-23 13:49:27.548001	2018-04-23 13:49:27.548001
805	455	397	14.0799999999999983	5	2018-04-23 13:49:27.550994	2018-04-23 13:49:27.550994
806	115	398	51.8900000000000006	4	2018-04-23 13:49:27.556705	2018-04-23 13:49:27.556705
807	174	398	80.0900000000000034	1	2018-04-23 13:49:27.560073	2018-04-23 13:49:27.560073
808	272	399	9.85999999999999943	4	2018-04-23 13:49:27.565794	2018-04-23 13:49:27.565794
809	208	399	81.8199999999999932	4	2018-04-23 13:49:27.569096	2018-04-23 13:49:27.569096
810	255	400	55.509999999999998	3	2018-04-23 13:49:27.574804	2018-04-23 13:49:27.574804
811	409	400	67.8799999999999955	2	2018-04-23 13:49:27.577801	2018-04-23 13:49:27.577801
812	472	401	30.8599999999999994	1	2018-04-23 13:49:27.582647	2018-04-23 13:49:27.582647
813	210	402	13.2100000000000009	5	2018-04-23 13:49:27.587355	2018-04-23 13:49:27.587355
814	211	403	18.5799999999999983	3	2018-04-23 13:49:27.592193	2018-04-23 13:49:27.592193
815	85	403	63.5200000000000031	3	2018-04-23 13:49:27.59516	2018-04-23 13:49:27.59516
816	315	404	96.0499999999999972	1	2018-04-23 13:49:27.601037	2018-04-23 13:49:27.601037
817	\N	405	73.3400000000000034	2	2018-04-23 13:49:27.607798	2018-04-23 13:49:27.607798
818	22	405	30.25	4	2018-04-23 13:49:27.610906	2018-04-23 13:49:27.610906
819	23	405	20.5500000000000007	3	2018-04-23 13:49:27.614024	2018-04-23 13:49:27.614024
820	203	406	66.1800000000000068	1	2018-04-23 13:49:27.618777	2018-04-23 13:49:27.618777
821	215	406	88.5100000000000051	2	2018-04-23 13:49:27.621605	2018-04-23 13:49:27.621605
822	278	407	37.5600000000000023	5	2018-04-23 13:49:27.626762	2018-04-23 13:49:27.626762
823	58	408	84.9200000000000017	5	2018-04-23 13:49:27.632278	2018-04-23 13:49:27.632278
824	18	408	99.6700000000000017	1	2018-04-23 13:49:27.635259	2018-04-23 13:49:27.635259
825	473	408	30.4399999999999977	5	2018-04-23 13:49:27.638239	2018-04-23 13:49:27.638239
826	306	409	90.0699999999999932	3	2018-04-23 13:49:27.643424	2018-04-23 13:49:27.643424
827	405	409	51.6499999999999986	3	2018-04-23 13:49:27.646704	2018-04-23 13:49:27.646704
828	16	409	30.2600000000000016	1	2018-04-23 13:49:27.649682	2018-04-23 13:49:27.649682
829	30	410	105.670000000000002	3	2018-04-23 13:49:27.655582	2018-04-23 13:49:27.655582
830	430	410	18.3900000000000006	5	2018-04-23 13:49:27.658678	2018-04-23 13:49:27.658678
831	17	411	12.4000000000000004	1	2018-04-23 13:49:27.663427	2018-04-23 13:49:27.663427
832	269	411	97.6599999999999966	4	2018-04-23 13:49:27.666269	2018-04-23 13:49:27.666269
833	441	411	2.30999999999999961	4	2018-04-23 13:49:27.669122	2018-04-23 13:49:27.669122
834	350	412	81.0499999999999972	3	2018-04-23 13:49:27.674067	2018-04-23 13:49:27.674067
835	131	412	50.7199999999999989	5	2018-04-23 13:49:27.677088	2018-04-23 13:49:27.677088
836	181	413	94.1400000000000006	2	2018-04-23 13:49:27.682773	2018-04-23 13:49:27.682773
837	5	413	21.6499999999999986	4	2018-04-23 13:49:27.686083	2018-04-23 13:49:27.686083
838	189	414	-0.349999999999999645	1	2018-04-23 13:49:27.690905	2018-04-23 13:49:27.690905
839	422	414	11.8399999999999999	1	2018-04-23 13:49:27.693741	2018-04-23 13:49:27.693741
840	236	414	99.6400000000000006	2	2018-04-23 13:49:27.696616	2018-04-23 13:49:27.696616
841	76	415	15.5999999999999996	3	2018-04-23 13:49:27.701509	2018-04-23 13:49:27.701509
842	249	415	18.4800000000000004	4	2018-04-23 13:49:27.704513	2018-04-23 13:49:27.704513
843	341	416	78.3900000000000006	1	2018-04-23 13:49:27.710032	2018-04-23 13:49:27.710032
844	283	417	6.62999999999999989	1	2018-04-23 13:49:27.715551	2018-04-23 13:49:27.715551
845	462	417	91.0499999999999972	5	2018-04-23 13:49:27.718634	2018-04-23 13:49:27.718634
846	91	417	94.4699999999999989	5	2018-04-23 13:49:27.721699	2018-04-23 13:49:27.721699
847	118	418	45.7899999999999991	1	2018-04-23 13:49:27.726688	2018-04-23 13:49:27.726688
848	91	418	84.4699999999999989	1	2018-04-23 13:49:27.730021	2018-04-23 13:49:27.730021
849	362	419	54.8299999999999983	2	2018-04-23 13:49:27.736378	2018-04-23 13:49:27.736378
850	95	420	76.6700000000000017	5	2018-04-23 13:49:27.741914	2018-04-23 13:49:27.741914
851	292	420	42.8999999999999986	1	2018-04-23 13:49:27.74491	2018-04-23 13:49:27.74491
852	278	421	37.5600000000000023	5	2018-04-23 13:49:27.749657	2018-04-23 13:49:27.749657
853	238	421	93.6500000000000057	5	2018-04-23 13:49:27.752646	2018-04-23 13:49:27.752646
854	24	421	46.0200000000000031	2	2018-04-23 13:49:27.755662	2018-04-23 13:49:27.755662
855	\N	422	48.6700000000000017	5	2018-04-23 13:49:27.762341	2018-04-23 13:49:27.762341
856	270	422	16.6300000000000026	3	2018-04-23 13:49:27.76579	2018-04-23 13:49:27.76579
857	385	423	88.019999999999996	1	2018-04-23 13:49:27.770955	2018-04-23 13:49:27.770955
858	\N	423	86.9500000000000028	2	2018-04-23 13:49:27.775592	2018-04-23 13:49:27.775592
859	240	423	35.5399999999999991	3	2018-04-23 13:49:27.778675	2018-04-23 13:49:27.778675
860	370	424	91.1099999999999994	4	2018-04-23 13:49:27.783531	2018-04-23 13:49:27.783531
861	365	424	13.1400000000000006	4	2018-04-23 13:49:27.786491	2018-04-23 13:49:27.786491
862	6	425	62.1700000000000017	3	2018-04-23 13:49:27.793007	2018-04-23 13:49:27.793007
863	224	426	26.2199999999999989	4	2018-04-23 13:49:27.798176	2018-04-23 13:49:27.798176
864	309	426	17.75	4	2018-04-23 13:49:27.801277	2018-04-23 13:49:27.801277
865	154	427	7.16000000000000014	3	2018-04-23 13:49:27.807041	2018-04-23 13:49:27.807041
866	452	427	96.1800000000000068	4	2018-04-23 13:49:27.81046	2018-04-23 13:49:27.81046
867	314	427	67.0499999999999972	3	2018-04-23 13:49:27.813871	2018-04-23 13:49:27.813871
868	13	428	90.3199999999999932	3	2018-04-23 13:49:27.819877	2018-04-23 13:49:27.819877
869	332	428	71.2099999999999937	2	2018-04-23 13:49:27.823105	2018-04-23 13:49:27.823105
870	402	428	12.4900000000000002	4	2018-04-23 13:49:27.826071	2018-04-23 13:49:27.826071
871	203	429	63.1799999999999997	1	2018-04-23 13:49:27.830815	2018-04-23 13:49:27.830815
872	\N	430	74.1700000000000017	2	2018-04-23 13:49:27.837284	2018-04-23 13:49:27.837284
873	347	431	91.0699999999999932	1	2018-04-23 13:49:27.842621	2018-04-23 13:49:27.842621
874	49	431	93.019999999999996	1	2018-04-23 13:49:27.84597	2018-04-23 13:49:27.84597
875	268	432	68.4500000000000028	2	2018-04-23 13:49:27.851358	2018-04-23 13:49:27.851358
876	166	432	36.7399999999999949	3	2018-04-23 13:49:27.854299	2018-04-23 13:49:27.854299
877	446	433	0.40999999999999992	4	2018-04-23 13:49:27.859369	2018-04-23 13:49:27.859369
878	\N	433	7.41999999999999993	3	2018-04-23 13:49:27.867847	2018-04-23 13:49:27.867847
879	38	434	6.42999999999999972	4	2018-04-23 13:49:27.873365	2018-04-23 13:49:27.873365
880	6	434	66.1700000000000017	1	2018-04-23 13:49:27.876528	2018-04-23 13:49:27.876528
881	30	434	98.6700000000000017	5	2018-04-23 13:49:27.879412	2018-04-23 13:49:27.879412
882	424	435	73.8299999999999983	3	2018-04-23 13:49:27.884162	2018-04-23 13:49:27.884162
883	97	435	54.259999999999998	1	2018-04-23 13:49:27.887129	2018-04-23 13:49:27.887129
884	371	435	74.0100000000000051	4	2018-04-23 13:49:27.890017	2018-04-23 13:49:27.890017
885	193	436	37.4500000000000028	2	2018-04-23 13:49:27.89477	2018-04-23 13:49:27.89477
886	381	436	37.7000000000000028	2	2018-04-23 13:49:27.897668	2018-04-23 13:49:27.897668
887	4	437	38.1499999999999986	1	2018-04-23 13:49:27.903558	2018-04-23 13:49:27.903558
888	196	437	45.3699999999999974	5	2018-04-23 13:49:27.906849	2018-04-23 13:49:27.906849
889	218	438	30.5500000000000007	1	2018-04-23 13:49:27.912599	2018-04-23 13:49:27.912599
890	202	438	58.259999999999998	4	2018-04-23 13:49:27.915923	2018-04-23 13:49:27.915923
891	470	438	54.0399999999999991	5	2018-04-23 13:49:27.918872	2018-04-23 13:49:27.918872
892	403	439	21.9200000000000017	4	2018-04-23 13:49:27.92379	2018-04-23 13:49:27.92379
893	91	439	83.4699999999999989	3	2018-04-23 13:49:27.926933	2018-04-23 13:49:27.926933
894	42	440	44.0499999999999972	2	2018-04-23 13:49:27.935901	2018-04-23 13:49:27.935901
895	265	441	19.9800000000000004	3	2018-04-23 13:49:27.943469	2018-04-23 13:49:27.943469
896	219	441	57.2000000000000028	2	2018-04-23 13:49:27.948579	2018-04-23 13:49:27.948579
897	77	441	58.8599999999999994	3	2018-04-23 13:49:27.953132	2018-04-23 13:49:27.953132
898	305	442	7.64000000000000057	5	2018-04-23 13:49:27.959091	2018-04-23 13:49:27.959091
899	276	442	40.0399999999999991	3	2018-04-23 13:49:27.962029	2018-04-23 13:49:27.962029
900	133	442	68.9699999999999989	2	2018-04-23 13:49:27.964903	2018-04-23 13:49:27.964903
901	137	443	96.0300000000000011	1	2018-04-23 13:49:27.969608	2018-04-23 13:49:27.969608
902	201	443	8.46000000000000085	1	2018-04-23 13:49:27.972877	2018-04-23 13:49:27.972877
903	265	443	10.9800000000000004	5	2018-04-23 13:49:27.975922	2018-04-23 13:49:27.975922
904	\N	444	26.4200000000000017	2	2018-04-23 13:49:27.983451	2018-04-23 13:49:27.983451
905	329	444	0.100000000000000006	2	2018-04-23 13:49:27.986739	2018-04-23 13:49:27.986739
906	297	444	70.0799999999999983	2	2018-04-23 13:49:27.989671	2018-04-23 13:49:27.989671
907	23	445	20.5500000000000007	4	2018-04-23 13:49:27.994511	2018-04-23 13:49:27.994511
908	174	445	72.0900000000000034	5	2018-04-23 13:49:27.997342	2018-04-23 13:49:27.997342
909	9	446	82.6800000000000068	3	2018-04-23 13:49:28.002075	2018-04-23 13:49:28.002075
910	4	446	34.1499999999999986	2	2018-04-23 13:49:28.004963	2018-04-23 13:49:28.004963
911	211	447	18.5799999999999983	2	2018-04-23 13:49:28.010596	2018-04-23 13:49:28.010596
912	404	448	94.519999999999996	1	2018-04-23 13:49:28.015772	2018-04-23 13:49:28.015772
913	206	448	16.25	1	2018-04-23 13:49:28.018689	2018-04-23 13:49:28.018689
914	169	449	54.75	1	2018-04-23 13:49:28.023708	2018-04-23 13:49:28.023708
915	295	449	103.390000000000001	1	2018-04-23 13:49:28.026714	2018-04-23 13:49:28.026714
916	457	449	75.6200000000000045	2	2018-04-23 13:49:28.030027	2018-04-23 13:49:28.030027
917	89	450	57.8100000000000023	1	2018-04-23 13:49:28.035482	2018-04-23 13:49:28.035482
918	252	450	64.3900000000000006	1	2018-04-23 13:49:28.039596	2018-04-23 13:49:28.039596
919	18	451	97.6700000000000017	5	2018-04-23 13:49:28.045022	2018-04-23 13:49:28.045022
920	381	451	29.6999999999999993	2	2018-04-23 13:49:28.047917	2018-04-23 13:49:28.047917
921	398	452	53.8699999999999974	5	2018-04-23 13:49:28.052685	2018-04-23 13:49:28.052685
922	225	453	7.0600000000000005	5	2018-04-23 13:49:28.057563	2018-04-23 13:49:28.057563
923	449	453	23.7399999999999984	2	2018-04-23 13:49:28.060613	2018-04-23 13:49:28.060613
924	219	454	55.2000000000000028	1	2018-04-23 13:49:28.065531	2018-04-23 13:49:28.065531
925	38	454	20.4299999999999997	3	2018-04-23 13:49:28.069032	2018-04-23 13:49:28.069032
926	40	455	15.5500000000000007	1	2018-04-23 13:49:28.073865	2018-04-23 13:49:28.073865
927	473	455	27.4399999999999977	3	2018-04-23 13:49:28.076761	2018-04-23 13:49:28.076761
928	43	456	32.1000000000000014	2	2018-04-23 13:49:28.081489	2018-04-23 13:49:28.081489
929	54	456	10.7400000000000002	3	2018-04-23 13:49:28.084488	2018-04-23 13:49:28.084488
930	218	456	39.5499999999999972	2	2018-04-23 13:49:28.087424	2018-04-23 13:49:28.087424
931	316	457	12.3800000000000008	2	2018-04-23 13:49:28.093333	2018-04-23 13:49:28.093333
932	\N	457	80.1299999999999955	3	2018-04-23 13:49:28.098741	2018-04-23 13:49:28.098741
933	462	457	90.0499999999999972	3	2018-04-23 13:49:28.101864	2018-04-23 13:49:28.101864
934	53	458	9.53999999999999915	1	2018-04-23 13:49:28.107044	2018-04-23 13:49:28.107044
935	92	459	94.2399999999999949	2	2018-04-23 13:49:28.1119	2018-04-23 13:49:28.1119
936	247	459	24.8500000000000014	5	2018-04-23 13:49:28.114792	2018-04-23 13:49:28.114792
937	237	459	76.3400000000000034	5	2018-04-23 13:49:28.117797	2018-04-23 13:49:28.117797
938	166	460	29.7399999999999984	1	2018-04-23 13:49:28.123957	2018-04-23 13:49:28.123957
939	54	461	10.7400000000000002	4	2018-04-23 13:49:28.129866	2018-04-23 13:49:28.129866
940	84	462	45.4699999999999989	3	2018-04-23 13:49:28.135645	2018-04-23 13:49:28.135645
941	245	463	-0.75	1	2018-04-23 13:49:28.141389	2018-04-23 13:49:28.141389
942	167	463	31.9600000000000009	3	2018-04-23 13:49:28.144779	2018-04-23 13:49:28.144779
943	259	463	72.9000000000000057	5	2018-04-23 13:49:28.148129	2018-04-23 13:49:28.148129
944	404	464	94.519999999999996	2	2018-04-23 13:49:28.153976	2018-04-23 13:49:28.153976
945	223	464	36.7800000000000011	5	2018-04-23 13:49:28.157	2018-04-23 13:49:28.157
946	291	464	85.7199999999999989	5	2018-04-23 13:49:28.159996	2018-04-23 13:49:28.159996
947	82	465	65.8700000000000045	5	2018-04-23 13:49:28.165121	2018-04-23 13:49:28.165121
948	\N	466	72.1299999999999955	4	2018-04-23 13:49:28.17258	2018-04-23 13:49:28.17258
949	460	467	82.8799999999999955	1	2018-04-23 13:49:28.178366	2018-04-23 13:49:28.178366
950	16	467	27.2600000000000016	1	2018-04-23 13:49:28.181362	2018-04-23 13:49:28.181362
951	352	468	86.3799999999999955	2	2018-04-23 13:49:28.186077	2018-04-23 13:49:28.186077
952	431	468	28.6899999999999977	1	2018-04-23 13:49:28.189006	2018-04-23 13:49:28.189006
953	408	468	44.1300000000000026	3	2018-04-23 13:49:28.191839	2018-04-23 13:49:28.191839
954	85	469	56.5200000000000031	1	2018-04-23 13:49:28.196899	2018-04-23 13:49:28.196899
955	150	469	17.7699999999999996	2	2018-04-23 13:49:28.199894	2018-04-23 13:49:28.199894
956	438	470	16.8200000000000003	4	2018-04-23 13:49:28.205313	2018-04-23 13:49:28.205313
957	357	471	9.63000000000000078	5	2018-04-23 13:49:28.210045	2018-04-23 13:49:28.210045
958	169	471	46.75	2	2018-04-23 13:49:28.212878	2018-04-23 13:49:28.212878
959	237	472	76.3400000000000034	5	2018-04-23 13:49:28.217724	2018-04-23 13:49:28.217724
960	6	473	65.1700000000000017	2	2018-04-23 13:49:28.222432	2018-04-23 13:49:28.222432
961	20	473	68.1099999999999994	1	2018-04-23 13:49:28.225314	2018-04-23 13:49:28.225314
962	207	474	11.1999999999999993	1	2018-04-23 13:49:28.230717	2018-04-23 13:49:28.230717
963	236	474	95.6400000000000006	4	2018-04-23 13:49:28.233768	2018-04-23 13:49:28.233768
964	101	474	76.4300000000000068	2	2018-04-23 13:49:28.23693	2018-04-23 13:49:28.23693
965	347	475	85.0699999999999932	5	2018-04-23 13:49:28.241962	2018-04-23 13:49:28.241962
966	152	475	36.1300000000000026	4	2018-04-23 13:49:28.244922	2018-04-23 13:49:28.244922
967	232	476	60.7199999999999989	2	2018-04-23 13:49:28.24972	2018-04-23 13:49:28.24972
968	210	476	13.2100000000000009	5	2018-04-23 13:49:28.252674	2018-04-23 13:49:28.252674
969	165	477	91.9000000000000057	2	2018-04-23 13:49:28.258894	2018-04-23 13:49:28.258894
970	400	478	16.6400000000000006	4	2018-04-23 13:49:28.263917	2018-04-23 13:49:28.263917
971	47	478	40.7100000000000009	3	2018-04-23 13:49:28.266872	2018-04-23 13:49:28.266872
972	\N	479	41.9399999999999977	4	2018-04-23 13:49:28.273102	2018-04-23 13:49:28.273102
973	192	480	87.230000000000004	1	2018-04-23 13:49:28.278337	2018-04-23 13:49:28.278337
974	82	480	65.8700000000000045	3	2018-04-23 13:49:28.281447	2018-04-23 13:49:28.281447
975	287	481	3.96000000000000085	2	2018-04-23 13:49:28.287175	2018-04-23 13:49:28.287175
976	47	481	52.7100000000000009	1	2018-04-23 13:49:28.290115	2018-04-23 13:49:28.290115
977	415	482	9.78999999999999915	1	2018-04-23 13:49:28.29517	2018-04-23 13:49:28.29517
978	143	482	53.6899999999999977	3	2018-04-23 13:49:28.298072	2018-04-23 13:49:28.298072
979	335	483	13.4600000000000009	4	2018-04-23 13:49:28.302761	2018-04-23 13:49:28.302761
980	258	484	3.29000000000000004	3	2018-04-23 13:49:28.308172	2018-04-23 13:49:28.308172
981	221	484	35.0300000000000011	5	2018-04-23 13:49:28.311936	2018-04-23 13:49:28.311936
982	113	484	47.2999999999999972	1	2018-04-23 13:49:28.315097	2018-04-23 13:49:28.315097
983	195	485	18.0300000000000011	5	2018-04-23 13:49:28.3201	2018-04-23 13:49:28.3201
984	445	486	16.5100000000000016	1	2018-04-23 13:49:28.324926	2018-04-23 13:49:28.324926
985	467	487	10.0999999999999996	2	2018-04-23 13:49:28.329854	2018-04-23 13:49:28.329854
986	79	487	43.5600000000000023	3	2018-04-23 13:49:28.332778	2018-04-23 13:49:28.332778
987	402	487	10.4900000000000002	2	2018-04-23 13:49:28.335732	2018-04-23 13:49:28.335732
988	374	488	12.3100000000000005	2	2018-04-23 13:49:28.341544	2018-04-23 13:49:28.341544
989	369	488	25.5799999999999983	5	2018-04-23 13:49:28.344651	2018-04-23 13:49:28.344651
990	7	489	65.6599999999999966	2	2018-04-23 13:49:28.350449	2018-04-23 13:49:28.350449
991	48	489	11.1600000000000001	1	2018-04-23 13:49:28.353966	2018-04-23 13:49:28.353966
992	21	490	38.7100000000000009	5	2018-04-23 13:49:28.359137	2018-04-23 13:49:28.359137
993	\N	490	105.269999999999996	1	2018-04-23 13:49:28.363608	2018-04-23 13:49:28.363608
994	149	491	2.31000000000000005	3	2018-04-23 13:49:28.369288	2018-04-23 13:49:28.369288
995	79	491	45.5600000000000023	4	2018-04-23 13:49:28.372679	2018-04-23 13:49:28.372679
996	202	491	65.2599999999999909	2	2018-04-23 13:49:28.375733	2018-04-23 13:49:28.375733
997	216	492	0.729999999999999982	1	2018-04-23 13:49:28.384152	2018-04-23 13:49:28.384152
998	205	492	97.2999999999999972	1	2018-04-23 13:49:28.387009	2018-04-23 13:49:28.387009
999	246	493	89.2099999999999937	3	2018-04-23 13:49:28.392511	2018-04-23 13:49:28.392511
1000	5	494	21.6499999999999986	4	2018-04-23 13:49:28.397418	2018-04-23 13:49:28.397418
1001	250	494	90.1299999999999955	3	2018-04-23 13:49:28.400342	2018-04-23 13:49:28.400342
1002	118	495	45.7899999999999991	1	2018-04-23 13:49:28.405024	2018-04-23 13:49:28.405024
1003	404	496	94.519999999999996	3	2018-04-23 13:49:28.409765	2018-04-23 13:49:28.409765
1004	202	497	63.259999999999998	5	2018-04-23 13:49:28.414708	2018-04-23 13:49:28.414708
1005	436	497	12.1899999999999995	4	2018-04-23 13:49:28.41818	2018-04-23 13:49:28.41818
1006	225	498	13.0600000000000005	4	2018-04-23 13:49:28.423466	2018-04-23 13:49:28.423466
1007	35	498	25.2899999999999991	1	2018-04-23 13:49:28.426895	2018-04-23 13:49:28.426895
1008	430	499	12.3900000000000006	1	2018-04-23 13:49:28.431809	2018-04-23 13:49:28.431809
1009	19	499	89.8700000000000045	5	2018-04-23 13:49:28.434699	2018-04-23 13:49:28.434699
1010	242	500	68.1599999999999966	4	2018-04-23 13:49:28.439782	2018-04-23 13:49:28.439782
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, completed_on, created_at, updated_at) FROM stdin;
1	2011-06-22 13:49:24.040943	2018-04-23 13:49:24.041558	2018-04-23 13:49:24.041558
2	2008-05-03 13:49:24.061318	2018-04-23 13:49:24.061802	2018-04-23 13:49:24.061802
3	2014-05-30 13:49:24.066585	2018-04-23 13:49:24.06745	2018-04-23 13:49:24.06745
4	2007-12-09 13:49:24.078206	2018-04-23 13:49:24.078731	2018-04-23 13:49:24.078731
5	2007-02-03 13:49:24.084013	2018-04-23 13:49:24.084521	2018-04-23 13:49:24.084521
6	2016-01-18 13:49:24.092962	2018-04-23 13:49:24.093743	2018-04-23 13:49:24.093743
7	2009-10-26 13:49:24.099528	2018-04-23 13:49:24.100047	2018-04-23 13:49:24.100047
8	2007-12-03 13:49:24.113455	2018-04-23 13:49:24.113966	2018-04-23 13:49:24.113966
9	2008-08-16 13:49:24.127217	2018-04-23 13:49:24.127697	2018-04-23 13:49:24.127697
10	2011-06-10 13:49:24.141452	2018-04-23 13:49:24.141948	2018-04-23 13:49:24.141948
11	2007-12-07 13:49:24.147203	2018-04-23 13:49:24.147682	2018-04-23 13:49:24.147682
12	2010-09-03 13:49:24.160475	2018-04-23 13:49:24.16094	2018-04-23 13:49:24.16094
13	2008-11-08 13:49:24.169122	2018-04-23 13:49:24.169954	2018-04-23 13:49:24.169954
14	2009-08-14 13:49:24.184164	2018-04-23 13:49:24.184653	2018-04-23 13:49:24.184653
15	2006-08-04 13:49:24.189402	2018-04-23 13:49:24.189869	2018-04-23 13:49:24.189869
16	2015-03-01 13:49:24.197301	2018-04-23 13:49:24.197756	2018-04-23 13:49:24.197756
17	2010-09-19 13:49:24.209179	2018-04-23 13:49:24.209791	2018-04-23 13:49:24.209791
18	2012-01-15 13:49:24.215567	2018-04-23 13:49:24.216279	2018-04-23 13:49:24.216279
19	2013-08-10 13:49:24.227234	2018-04-23 13:49:24.228108	2018-04-23 13:49:24.228108
20	2006-05-29 13:49:24.233892	2018-04-23 13:49:24.23436	2018-04-23 13:49:24.23436
21	2007-10-18 13:49:24.239856	2018-04-23 13:49:24.240668	2018-04-23 13:49:24.240668
22	2009-04-30 13:49:24.245833	2018-04-23 13:49:24.246291	2018-04-23 13:49:24.246291
23	2016-03-20 13:49:24.259344	2018-04-23 13:49:24.259858	2018-04-23 13:49:24.259858
24	2005-07-20 13:49:24.265329	2018-04-23 13:49:24.266194	2018-04-23 13:49:24.266194
25	2010-11-28 13:49:24.289502	2018-04-23 13:49:24.290048	2018-04-23 13:49:24.290048
26	2004-09-15 13:49:24.301536	2018-04-23 13:49:24.3021	2018-04-23 13:49:24.3021
27	2018-01-05 13:49:24.313424	2018-04-23 13:49:24.313942	2018-04-23 13:49:24.313942
28	2016-12-09 13:49:24.318393	2018-04-23 13:49:24.31896	2018-04-23 13:49:24.31896
29	2014-07-20 13:49:24.323427	2018-04-23 13:49:24.323889	2018-04-23 13:49:24.323889
30	2004-12-09 13:49:24.333907	2018-04-23 13:49:24.335143	2018-04-23 13:49:24.335143
31	2011-11-23 13:49:24.342874	2018-04-23 13:49:24.343384	2018-04-23 13:49:24.343384
32	2014-12-01 13:49:24.350888	2018-04-23 13:49:24.351643	2018-04-23 13:49:24.351643
33	2013-05-11 13:49:24.362645	2018-04-23 13:49:24.363205	2018-04-23 13:49:24.363205
34	2006-03-21 13:49:24.367822	2018-04-23 13:49:24.36829	2018-04-23 13:49:24.36829
35	2004-12-29 13:49:24.380626	2018-04-23 13:49:24.38114	2018-04-23 13:49:24.38114
36	2007-05-25 13:49:24.389083	2018-04-23 13:49:24.389778	2018-04-23 13:49:24.389778
37	2017-10-28 13:49:24.394207	2018-04-23 13:49:24.394691	2018-04-23 13:49:24.394691
38	2015-09-23 13:49:24.406442	2018-04-23 13:49:24.406957	2018-04-23 13:49:24.406957
39	2017-10-23 13:49:24.418357	2018-04-23 13:49:24.4189	2018-04-23 13:49:24.4189
40	2012-11-07 13:49:24.429084	2018-04-23 13:49:24.429563	2018-04-23 13:49:24.429563
41	2011-02-14 13:49:24.433801	2018-04-23 13:49:24.434284	2018-04-23 13:49:24.434284
42	2005-12-09 13:49:24.442106	2018-04-23 13:49:24.442664	2018-04-23 13:49:24.442664
43	2013-06-04 13:49:24.453182	2018-04-23 13:49:24.453678	2018-04-23 13:49:24.453678
44	2009-01-02 13:49:24.457989	2018-04-23 13:49:24.458462	2018-04-23 13:49:24.458462
45	2015-10-03 13:49:24.46568	2018-04-23 13:49:24.466156	2018-04-23 13:49:24.466156
46	2006-01-21 13:49:24.477273	2018-04-23 13:49:24.477986	2018-04-23 13:49:24.477986
47	2006-03-15 13:49:24.489111	2018-04-23 13:49:24.489618	2018-04-23 13:49:24.489618
48	2012-12-30 13:49:24.500678	2018-04-23 13:49:24.501157	2018-04-23 13:49:24.501157
49	2015-03-08 13:49:24.513579	2018-04-23 13:49:24.514086	2018-04-23 13:49:24.514086
50	2012-12-31 13:49:24.526937	2018-04-23 13:49:24.5274	2018-04-23 13:49:24.5274
51	2011-06-15 13:49:24.534579	2018-04-23 13:49:24.535105	2018-04-23 13:49:24.535105
52	2007-05-20 13:49:24.542737	2018-04-23 13:49:24.543228	2018-04-23 13:49:24.543228
53	2013-04-06 13:49:24.548475	2018-04-23 13:49:24.549122	2018-04-23 13:49:24.549122
54	2012-12-13 13:49:24.55986	2018-04-23 13:49:24.560368	2018-04-23 13:49:24.560368
55	2006-01-19 13:49:24.567818	2018-04-23 13:49:24.568345	2018-04-23 13:49:24.568345
56	2017-08-21 13:49:24.579691	2018-04-23 13:49:24.580224	2018-04-23 13:49:24.580224
57	2006-08-02 13:49:24.587978	2018-04-23 13:49:24.588666	2018-04-23 13:49:24.588666
58	2016-09-06 13:49:24.59697	2018-04-23 13:49:24.597678	2018-04-23 13:49:24.597678
59	2011-09-13 13:49:24.60921	2018-04-23 13:49:24.609685	2018-04-23 13:49:24.609685
60	2014-03-27 13:49:24.616785	2018-04-23 13:49:24.617244	2018-04-23 13:49:24.617244
61	2011-02-11 13:49:24.621676	2018-04-23 13:49:24.622132	2018-04-23 13:49:24.622132
62	2016-10-11 13:49:24.629845	2018-04-23 13:49:24.630393	2018-04-23 13:49:24.630393
63	2009-01-11 13:49:24.638207	2018-04-23 13:49:24.638758	2018-04-23 13:49:24.638758
64	2011-04-09 13:49:24.649098	2018-04-23 13:49:24.649565	2018-04-23 13:49:24.649565
65	2010-09-03 13:49:24.657575	2018-04-23 13:49:24.658054	2018-04-23 13:49:24.658054
66	2007-02-16 13:49:24.662374	2018-04-23 13:49:24.66288	2018-04-23 13:49:24.66288
67	2008-08-20 13:49:24.66896	2018-04-23 13:49:24.6695	2018-04-23 13:49:24.6695
68	2006-12-09 13:49:24.679946	2018-04-23 13:49:24.680554	2018-04-23 13:49:24.680554
69	2014-07-01 13:49:24.689267	2018-04-23 13:49:24.689771	2018-04-23 13:49:24.689771
70	2014-06-29 13:49:24.699965	2018-04-23 13:49:24.700434	2018-04-23 13:49:24.700434
71	2018-03-07 13:49:24.709282	2018-04-23 13:49:24.709909	2018-04-23 13:49:24.709909
72	2013-01-14 13:49:24.717551	2018-04-23 13:49:24.718042	2018-04-23 13:49:24.718042
73	2017-08-02 13:49:24.726316	2018-04-23 13:49:24.726833	2018-04-23 13:49:24.726833
74	2005-02-26 13:49:24.734848	2018-04-23 13:49:24.735425	2018-04-23 13:49:24.735425
75	2006-11-30 13:49:24.742924	2018-04-23 13:49:24.743408	2018-04-23 13:49:24.743408
76	2006-09-29 13:49:24.747758	2018-04-23 13:49:24.748265	2018-04-23 13:49:24.748265
77	2015-08-11 13:49:24.755952	2018-04-23 13:49:24.756489	2018-04-23 13:49:24.756489
78	2016-12-17 13:49:24.768129	2018-04-23 13:49:24.768694	2018-04-23 13:49:24.768694
79	2006-12-24 13:49:24.776445	2018-04-23 13:49:24.776931	2018-04-23 13:49:24.776931
80	2007-02-11 13:49:24.784405	2018-04-23 13:49:24.784943	2018-04-23 13:49:24.784943
81	2010-03-04 13:49:24.811741	2018-04-23 13:49:24.812735	2018-04-23 13:49:24.812735
82	2016-12-18 13:49:24.830265	2018-04-23 13:49:24.830741	2018-04-23 13:49:24.830741
83	2006-07-27 13:49:24.841572	2018-04-23 13:49:24.842088	2018-04-23 13:49:24.842088
84	2009-09-25 13:49:24.855217	2018-04-23 13:49:24.855725	2018-04-23 13:49:24.855725
85	2011-06-21 13:49:24.865798	2018-04-23 13:49:24.866297	2018-04-23 13:49:24.866297
86	2006-01-08 13:49:24.870907	2018-04-23 13:49:24.871419	2018-04-23 13:49:24.871419
87	2007-01-05 13:49:24.882029	2018-04-23 13:49:24.882537	2018-04-23 13:49:24.882537
88	2013-02-03 13:49:24.887401	2018-04-23 13:49:24.887946	2018-04-23 13:49:24.887946
89	2012-03-23 13:49:24.892685	2018-04-23 13:49:24.893163	2018-04-23 13:49:24.893163
90	2009-08-17 13:49:24.904559	2018-04-23 13:49:24.905113	2018-04-23 13:49:24.905113
91	2016-02-22 13:49:24.909773	2018-04-23 13:49:24.910231	2018-04-23 13:49:24.910231
92	2012-09-09 13:49:24.915011	2018-04-23 13:49:24.915498	2018-04-23 13:49:24.915498
93	2007-12-05 13:49:24.920185	2018-04-23 13:49:24.920714	2018-04-23 13:49:24.920714
94	2016-09-03 13:49:24.92836	2018-04-23 13:49:24.928885	2018-04-23 13:49:24.928885
95	2010-07-02 13:49:24.93646	2018-04-23 13:49:24.936982	2018-04-23 13:49:24.936982
96	2014-04-29 13:49:24.945807	2018-04-23 13:49:24.946323	2018-04-23 13:49:24.946323
97	2014-01-14 13:49:24.950793	2018-04-23 13:49:24.951357	2018-04-23 13:49:24.951357
98	2016-01-04 13:49:24.959639	2018-04-23 13:49:24.960132	2018-04-23 13:49:24.960132
99	2008-01-26 13:49:24.964589	2018-04-23 13:49:24.965076	2018-04-23 13:49:24.965076
100	2010-11-13 13:49:24.969722	2018-04-23 13:49:24.970325	2018-04-23 13:49:24.970325
101	2007-09-04 13:49:24.974927	2018-04-23 13:49:24.975382	2018-04-23 13:49:24.975382
102	2014-08-23 13:49:24.984007	2018-04-23 13:49:24.984628	2018-04-23 13:49:24.984628
103	2014-04-06 13:49:24.994967	2018-04-23 13:49:24.995456	2018-04-23 13:49:24.995456
104	2005-06-27 13:49:24.99972	2018-04-23 13:49:25.000218	2018-04-23 13:49:25.000218
105	2014-11-24 13:49:25.007899	2018-04-23 13:49:25.008508	2018-04-23 13:49:25.008508
106	2006-02-05 13:49:25.019206	2018-04-23 13:49:25.019716	2018-04-23 13:49:25.019716
107	2010-03-27 13:49:25.03176	2018-04-23 13:49:25.032265	2018-04-23 13:49:25.032265
108	2007-07-03 13:49:25.040357	2018-04-23 13:49:25.040893	2018-04-23 13:49:25.040893
109	2009-10-08 13:49:25.051348	2018-04-23 13:49:25.052084	2018-04-23 13:49:25.052084
110	2005-02-21 13:49:25.061077	2018-04-23 13:49:25.061708	2018-04-23 13:49:25.061708
111	2014-09-03 13:49:25.069286	2018-04-23 13:49:25.06984	2018-04-23 13:49:25.06984
112	2012-06-26 13:49:25.078778	2018-04-23 13:49:25.079267	2018-04-23 13:49:25.079267
113	2007-07-13 13:49:25.083671	2018-04-23 13:49:25.084129	2018-04-23 13:49:25.084129
114	2015-07-20 13:49:25.089148	2018-04-23 13:49:25.089743	2018-04-23 13:49:25.089743
115	2016-11-18 13:49:25.100081	2018-04-23 13:49:25.100565	2018-04-23 13:49:25.100565
116	2005-09-23 13:49:25.108268	2018-04-23 13:49:25.10878	2018-04-23 13:49:25.10878
117	2013-04-26 13:49:25.116457	2018-04-23 13:49:25.116992	2018-04-23 13:49:25.116992
118	2013-04-01 13:49:25.124659	2018-04-23 13:49:25.125193	2018-04-23 13:49:25.125193
119	2016-03-15 13:49:25.135969	2018-04-23 13:49:25.136469	2018-04-23 13:49:25.136469
120	2007-04-13 13:49:25.147497	2018-04-23 13:49:25.147998	2018-04-23 13:49:25.147998
121	2016-08-20 13:49:25.155523	2018-04-23 13:49:25.156034	2018-04-23 13:49:25.156034
122	2013-11-18 13:49:25.16421	2018-04-23 13:49:25.16471	2018-04-23 13:49:25.16471
123	2014-08-24 13:49:25.175928	2018-04-23 13:49:25.176415	2018-04-23 13:49:25.176415
124	2007-11-06 13:49:25.180854	2018-04-23 13:49:25.181326	2018-04-23 13:49:25.181326
125	2014-09-20 13:49:25.193589	2018-04-23 13:49:25.194068	2018-04-23 13:49:25.194068
126	2014-10-25 13:49:25.198844	2018-04-23 13:49:25.199389	2018-04-23 13:49:25.199389
127	2017-04-23 13:49:25.205907	2018-04-23 13:49:25.206444	2018-04-23 13:49:25.206444
128	2006-02-03 13:49:25.217929	2018-04-23 13:49:25.21851	2018-04-23 13:49:25.21851
129	2007-12-31 13:49:25.230714	2018-04-23 13:49:25.23131	2018-04-23 13:49:25.23131
130	2011-08-22 13:49:25.242527	2018-04-23 13:49:25.243136	2018-04-23 13:49:25.243136
131	2013-09-20 13:49:25.254379	2018-04-23 13:49:25.254896	2018-04-23 13:49:25.254896
132	2005-05-12 13:49:25.262179	2018-04-23 13:49:25.262649	2018-04-23 13:49:25.262649
133	2007-04-28 13:49:25.266912	2018-04-23 13:49:25.267386	2018-04-23 13:49:25.267386
134	2012-03-07 13:49:25.274988	2018-04-23 13:49:25.275602	2018-04-23 13:49:25.275602
135	2007-04-30 13:49:25.286843	2018-04-23 13:49:25.287378	2018-04-23 13:49:25.287378
136	2017-07-31 13:49:25.292229	2018-04-23 13:49:25.292938	2018-04-23 13:49:25.292938
137	2006-02-21 13:49:25.305786	2018-04-23 13:49:25.306278	2018-04-23 13:49:25.306278
138	2006-12-07 13:49:25.321119	2018-04-23 13:49:25.321647	2018-04-23 13:49:25.321647
139	2007-02-04 13:49:25.3264	2018-04-23 13:49:25.326908	2018-04-23 13:49:25.326908
140	2008-01-19 13:49:25.33813	2018-04-23 13:49:25.338858	2018-04-23 13:49:25.338858
141	2006-03-05 13:49:25.344354	2018-04-23 13:49:25.345077	2018-04-23 13:49:25.345077
142	2017-03-27 13:49:25.350277	2018-04-23 13:49:25.350962	2018-04-23 13:49:25.350962
143	2016-11-18 13:49:25.362304	2018-04-23 13:49:25.362771	2018-04-23 13:49:25.362771
144	2014-03-11 13:49:25.366997	2018-04-23 13:49:25.367482	2018-04-23 13:49:25.367482
145	2016-06-16 13:49:25.374944	2018-04-23 13:49:25.375484	2018-04-23 13:49:25.375484
146	2016-06-05 13:49:25.383182	2018-04-23 13:49:25.383889	2018-04-23 13:49:25.383889
147	2010-05-19 13:49:25.395092	2018-04-23 13:49:25.395577	2018-04-23 13:49:25.395577
148	2010-10-21 13:49:25.405598	2018-04-23 13:49:25.406085	2018-04-23 13:49:25.406085
149	2017-01-06 13:49:25.414187	2018-04-23 13:49:25.414718	2018-04-23 13:49:25.414718
150	2010-10-02 13:49:25.425312	2018-04-23 13:49:25.425766	2018-04-23 13:49:25.425766
151	2013-07-17 13:49:25.430119	2018-04-23 13:49:25.430634	2018-04-23 13:49:25.430634
152	2016-04-10 13:49:25.442203	2018-04-23 13:49:25.442738	2018-04-23 13:49:25.442738
153	2006-01-21 13:49:25.453763	2018-04-23 13:49:25.454296	2018-04-23 13:49:25.454296
154	2015-05-07 13:49:25.46203	2018-04-23 13:49:25.46276	2018-04-23 13:49:25.46276
155	2014-11-23 13:49:25.470826	2018-04-23 13:49:25.471346	2018-04-23 13:49:25.471346
156	2013-06-16 13:49:25.47582	2018-04-23 13:49:25.476304	2018-04-23 13:49:25.476304
157	2007-07-07 13:49:25.480724	2018-04-23 13:49:25.481272	2018-04-23 13:49:25.481272
158	2011-09-03 13:49:25.491131	2018-04-23 13:49:25.491834	2018-04-23 13:49:25.491834
159	2010-04-26 13:49:25.496672	2018-04-23 13:49:25.497159	2018-04-23 13:49:25.497159
160	2015-03-16 13:49:25.504858	2018-04-23 13:49:25.505362	2018-04-23 13:49:25.505362
161	2006-12-27 13:49:25.512497	2018-04-23 13:49:25.513006	2018-04-23 13:49:25.513006
162	2005-06-08 13:49:25.517288	2018-04-23 13:49:25.517911	2018-04-23 13:49:25.517911
163	2008-04-13 13:49:25.526352	2018-04-23 13:49:25.526827	2018-04-23 13:49:25.526827
164	2017-05-01 13:49:25.538097	2018-04-23 13:49:25.538601	2018-04-23 13:49:25.538601
165	2008-12-02 13:49:25.549591	2018-04-23 13:49:25.550078	2018-04-23 13:49:25.550078
166	2017-01-20 13:49:25.56192	2018-04-23 13:49:25.562415	2018-04-23 13:49:25.562415
167	2010-10-05 13:49:25.574242	2018-04-23 13:49:25.574777	2018-04-23 13:49:25.574777
168	2007-12-22 13:49:25.5821	2018-04-23 13:49:25.582556	2018-04-23 13:49:25.582556
169	2017-03-17 13:49:25.587088	2018-04-23 13:49:25.587574	2018-04-23 13:49:25.587574
170	2016-04-23 13:49:25.599203	2018-04-23 13:49:25.599838	2018-04-23 13:49:25.599838
171	2012-02-02 13:49:25.612799	2018-04-23 13:49:25.613285	2018-04-23 13:49:25.613285
172	2017-05-06 13:49:25.617692	2018-04-23 13:49:25.618183	2018-04-23 13:49:25.618183
173	2014-03-24 13:49:25.625854	2018-04-23 13:49:25.626533	2018-04-23 13:49:25.626533
174	2014-01-30 13:49:25.632777	2018-04-23 13:49:25.6333	2018-04-23 13:49:25.6333
175	2007-06-26 13:49:25.638079	2018-04-23 13:49:25.638578	2018-04-23 13:49:25.638578
176	2007-02-16 13:49:25.642915	2018-04-23 13:49:25.643374	2018-04-23 13:49:25.643374
177	2008-08-26 13:49:25.654349	2018-04-23 13:49:25.654898	2018-04-23 13:49:25.654898
178	2013-05-26 13:49:25.662624	2018-04-23 13:49:25.663303	2018-04-23 13:49:25.663303
179	2005-02-03 13:49:25.671029	2018-04-23 13:49:25.671582	2018-04-23 13:49:25.671582
180	2015-09-07 13:49:25.682377	2018-04-23 13:49:25.68285	2018-04-23 13:49:25.68285
181	2006-01-18 13:49:25.693495	2018-04-23 13:49:25.693973	2018-04-23 13:49:25.693973
182	2011-03-18 13:49:25.718889	2018-04-23 13:49:25.719777	2018-04-23 13:49:25.719777
183	2015-08-16 13:49:25.728814	2018-04-23 13:49:25.72931	2018-04-23 13:49:25.72931
184	2009-12-17 13:49:25.734013	2018-04-23 13:49:25.734525	2018-04-23 13:49:25.734525
185	2016-08-13 13:49:25.739396	2018-04-23 13:49:25.740068	2018-04-23 13:49:25.740068
186	2012-01-11 13:49:25.750767	2018-04-23 13:49:25.751237	2018-04-23 13:49:25.751237
187	2013-06-07 13:49:25.762566	2018-04-23 13:49:25.763083	2018-04-23 13:49:25.763083
188	2011-10-18 13:49:25.771512	2018-04-23 13:49:25.772038	2018-04-23 13:49:25.772038
189	2008-08-21 13:49:25.780109	2018-04-23 13:49:25.780608	2018-04-23 13:49:25.780608
190	2006-07-29 13:49:25.788068	2018-04-23 13:49:25.788598	2018-04-23 13:49:25.788598
191	2015-11-08 13:49:25.800295	2018-04-23 13:49:25.801008	2018-04-23 13:49:25.801008
192	2008-11-16 13:49:25.805682	2018-04-23 13:49:25.806155	2018-04-23 13:49:25.806155
193	2010-06-21 13:49:25.813357	2018-04-23 13:49:25.813835	2018-04-23 13:49:25.813835
194	2007-12-16 13:49:25.827299	2018-04-23 13:49:25.82784	2018-04-23 13:49:25.82784
195	2008-02-07 13:49:25.835752	2018-04-23 13:49:25.836522	2018-04-23 13:49:25.836522
196	2006-01-03 13:49:25.847046	2018-04-23 13:49:25.847598	2018-04-23 13:49:25.847598
197	2010-01-30 13:49:25.859055	2018-04-23 13:49:25.859546	2018-04-23 13:49:25.859546
198	2017-04-13 13:49:25.864233	2018-04-23 13:49:25.864707	2018-04-23 13:49:25.864707
199	2008-04-29 13:49:25.872714	2018-04-23 13:49:25.873247	2018-04-23 13:49:25.873247
200	2017-02-25 13:49:25.883526	2018-04-23 13:49:25.884058	2018-04-23 13:49:25.884058
201	2013-12-20 13:49:25.894217	2018-04-23 13:49:25.894677	2018-04-23 13:49:25.894677
202	2014-03-07 13:49:25.905606	2018-04-23 13:49:25.906078	2018-04-23 13:49:25.906078
203	2008-12-07 13:49:25.91635	2018-04-23 13:49:25.916812	2018-04-23 13:49:25.916812
204	2016-07-11 13:49:25.924525	2018-04-23 13:49:25.925208	2018-04-23 13:49:25.925208
205	2014-10-09 13:49:25.934657	2018-04-23 13:49:25.935219	2018-04-23 13:49:25.935219
206	2016-03-19 13:49:25.942791	2018-04-23 13:49:25.943249	2018-04-23 13:49:25.943249
207	2006-05-23 13:49:25.947529	2018-04-23 13:49:25.947989	2018-04-23 13:49:25.947989
208	2014-04-09 13:49:25.952766	2018-04-23 13:49:25.953333	2018-04-23 13:49:25.953333
209	2015-05-30 13:49:25.964887	2018-04-23 13:49:25.965608	2018-04-23 13:49:25.965608
210	2006-09-12 13:49:25.973652	2018-04-23 13:49:25.974182	2018-04-23 13:49:25.974182
211	2011-09-16 13:49:25.978845	2018-04-23 13:49:25.979402	2018-04-23 13:49:25.979402
212	2005-06-16 13:49:25.983858	2018-04-23 13:49:25.984458	2018-04-23 13:49:25.984458
213	2005-07-06 13:49:25.992252	2018-04-23 13:49:25.992767	2018-04-23 13:49:25.992767
214	2010-12-13 13:49:26.00319	2018-04-23 13:49:26.003712	2018-04-23 13:49:26.003712
215	2005-08-17 13:49:26.011571	2018-04-23 13:49:26.012044	2018-04-23 13:49:26.012044
216	2013-07-02 13:49:26.016323	2018-04-23 13:49:26.016811	2018-04-23 13:49:26.016811
217	2008-03-19 13:49:26.021406	2018-04-23 13:49:26.021933	2018-04-23 13:49:26.021933
218	2005-01-21 13:49:26.026475	2018-04-23 13:49:26.027006	2018-04-23 13:49:26.027006
219	2015-04-14 13:49:26.038804	2018-04-23 13:49:26.039356	2018-04-23 13:49:26.039356
220	2009-03-11 13:49:26.044136	2018-04-23 13:49:26.044636	2018-04-23 13:49:26.044636
221	2011-03-20 13:49:26.055098	2018-04-23 13:49:26.055614	2018-04-23 13:49:26.055614
222	2009-08-25 13:49:26.060405	2018-04-23 13:49:26.060952	2018-04-23 13:49:26.060952
223	2011-02-28 13:49:26.068216	2018-04-23 13:49:26.06876	2018-04-23 13:49:26.06876
224	2011-10-21 13:49:26.073294	2018-04-23 13:49:26.073803	2018-04-23 13:49:26.073803
225	2006-10-07 13:49:26.081163	2018-04-23 13:49:26.081636	2018-04-23 13:49:26.081636
226	2017-07-15 13:49:26.086778	2018-04-23 13:49:26.087418	2018-04-23 13:49:26.087418
227	2006-05-03 13:49:26.092002	2018-04-23 13:49:26.092488	2018-04-23 13:49:26.092488
228	2009-03-14 13:49:26.102664	2018-04-23 13:49:26.103308	2018-04-23 13:49:26.103308
229	2016-07-31 13:49:26.107868	2018-04-23 13:49:26.108456	2018-04-23 13:49:26.108456
230	2007-04-08 13:49:26.113331	2018-04-23 13:49:26.113884	2018-04-23 13:49:26.113884
231	2016-01-25 13:49:26.121603	2018-04-23 13:49:26.122119	2018-04-23 13:49:26.122119
232	2018-01-15 13:49:26.129685	2018-04-23 13:49:26.130228	2018-04-23 13:49:26.130228
233	2016-12-27 13:49:26.13476	2018-04-23 13:49:26.135291	2018-04-23 13:49:26.135291
234	2016-02-10 13:49:26.147437	2018-04-23 13:49:26.147928	2018-04-23 13:49:26.147928
235	2008-11-27 13:49:26.152161	2018-04-23 13:49:26.152667	2018-04-23 13:49:26.152667
236	2015-01-13 13:49:26.160324	2018-04-23 13:49:26.160812	2018-04-23 13:49:26.160812
237	2017-05-19 13:49:26.168594	2018-04-23 13:49:26.169152	2018-04-23 13:49:26.169152
238	2017-01-26 13:49:26.179783	2018-04-23 13:49:26.18027	2018-04-23 13:49:26.18027
239	2009-12-07 13:49:26.184518	2018-04-23 13:49:26.184983	2018-04-23 13:49:26.184983
240	2013-01-26 13:49:26.198354	2018-04-23 13:49:26.198817	2018-04-23 13:49:26.198817
241	2004-10-19 13:49:26.209179	2018-04-23 13:49:26.209702	2018-04-23 13:49:26.209702
242	2005-10-22 13:49:26.214203	2018-04-23 13:49:26.214727	2018-04-23 13:49:26.214727
243	2013-03-01 13:49:26.223114	2018-04-23 13:49:26.223623	2018-04-23 13:49:26.223623
244	2013-12-28 13:49:26.231167	2018-04-23 13:49:26.231664	2018-04-23 13:49:26.231664
245	2007-03-27 13:49:26.242456	2018-04-23 13:49:26.242954	2018-04-23 13:49:26.242954
246	2010-07-07 13:49:26.248025	2018-04-23 13:49:26.248564	2018-04-23 13:49:26.248564
247	2009-07-08 13:49:26.260855	2018-04-23 13:49:26.261322	2018-04-23 13:49:26.261322
248	2005-10-24 13:49:26.271608	2018-04-23 13:49:26.272121	2018-04-23 13:49:26.272121
249	2015-02-11 13:49:26.281677	2018-04-23 13:49:26.282175	2018-04-23 13:49:26.282175
250	2004-11-03 13:49:26.289845	2018-04-23 13:49:26.290386	2018-04-23 13:49:26.290386
251	2009-02-01 13:49:26.29508	2018-04-23 13:49:26.295812	2018-04-23 13:49:26.295812
252	2005-08-25 13:49:26.30195	2018-04-23 13:49:26.302752	2018-04-23 13:49:26.302752
253	2013-04-10 13:49:26.307634	2018-04-23 13:49:26.308132	2018-04-23 13:49:26.308132
254	2017-03-13 13:49:26.31243	2018-04-23 13:49:26.312919	2018-04-23 13:49:26.312919
255	2016-05-28 13:49:26.32384	2018-04-23 13:49:26.324358	2018-04-23 13:49:26.324358
256	2013-03-09 13:49:26.335702	2018-04-23 13:49:26.336285	2018-04-23 13:49:26.336285
257	2007-05-26 13:49:26.343915	2018-04-23 13:49:26.344404	2018-04-23 13:49:26.344404
258	2016-09-10 13:49:26.352034	2018-04-23 13:49:26.352573	2018-04-23 13:49:26.352573
259	2013-04-13 13:49:26.367911	2018-04-23 13:49:26.368442	2018-04-23 13:49:26.368442
260	2014-06-21 13:49:26.375935	2018-04-23 13:49:26.376432	2018-04-23 13:49:26.376432
261	2012-09-21 13:49:26.383682	2018-04-23 13:49:26.384402	2018-04-23 13:49:26.384402
262	2008-07-17 13:49:26.392657	2018-04-23 13:49:26.393141	2018-04-23 13:49:26.393141
263	2006-09-16 13:49:26.403055	2018-04-23 13:49:26.403541	2018-04-23 13:49:26.403541
264	2012-07-30 13:49:26.410575	2018-04-23 13:49:26.411141	2018-04-23 13:49:26.411141
265	2013-01-31 13:49:26.420126	2018-04-23 13:49:26.420819	2018-04-23 13:49:26.420819
266	2012-09-21 13:49:26.432657	2018-04-23 13:49:26.433345	2018-04-23 13:49:26.433345
267	2017-11-28 13:49:26.44269	2018-04-23 13:49:26.44323	2018-04-23 13:49:26.44323
268	2006-06-06 13:49:26.453427	2018-04-23 13:49:26.45392	2018-04-23 13:49:26.45392
269	2017-01-19 13:49:26.464198	2018-04-23 13:49:26.464917	2018-04-23 13:49:26.464917
270	2015-03-13 13:49:26.473518	2018-04-23 13:49:26.474226	2018-04-23 13:49:26.474226
271	2011-11-14 13:49:26.47911	2018-04-23 13:49:26.47962	2018-04-23 13:49:26.47962
272	2011-07-26 13:49:26.484063	2018-04-23 13:49:26.484533	2018-04-23 13:49:26.484533
273	2015-06-22 13:49:26.495145	2018-04-23 13:49:26.495675	2018-04-23 13:49:26.495675
274	2007-12-15 13:49:26.50337	2018-04-23 13:49:26.5039	2018-04-23 13:49:26.5039
275	2014-10-20 13:49:26.512775	2018-04-23 13:49:26.513255	2018-04-23 13:49:26.513255
276	2008-01-18 13:49:26.521067	2018-04-23 13:49:26.521649	2018-04-23 13:49:26.521649
277	2014-02-14 13:49:26.531879	2018-04-23 13:49:26.532349	2018-04-23 13:49:26.532349
278	2009-01-14 13:49:26.536649	2018-04-23 13:49:26.537123	2018-04-23 13:49:26.537123
279	2014-08-31 13:49:26.541452	2018-04-23 13:49:26.541945	2018-04-23 13:49:26.541945
280	2017-08-24 13:49:26.552978	2018-04-23 13:49:26.553437	2018-04-23 13:49:26.553437
281	2006-03-21 13:49:26.557888	2018-04-23 13:49:26.55838	2018-04-23 13:49:26.55838
282	2011-10-14 13:49:26.565828	2018-04-23 13:49:26.566316	2018-04-23 13:49:26.566316
283	2005-09-09 13:49:26.575156	2018-04-23 13:49:26.575785	2018-04-23 13:49:26.575785
284	2014-01-19 13:49:26.584009	2018-04-23 13:49:26.584512	2018-04-23 13:49:26.584512
285	2006-06-02 13:49:26.594537	2018-04-23 13:49:26.595057	2018-04-23 13:49:26.595057
286	2005-01-02 13:49:26.607031	2018-04-23 13:49:26.60758	2018-04-23 13:49:26.60758
287	2012-10-17 13:49:26.612846	2018-04-23 13:49:26.613353	2018-04-23 13:49:26.613353
288	2015-08-17 13:49:26.623889	2018-04-23 13:49:26.624584	2018-04-23 13:49:26.624584
289	2016-04-20 13:49:26.632861	2018-04-23 13:49:26.633363	2018-04-23 13:49:26.633363
290	2006-01-08 13:49:26.640695	2018-04-23 13:49:26.641192	2018-04-23 13:49:26.641192
291	2016-02-25 13:49:26.651116	2018-04-23 13:49:26.651612	2018-04-23 13:49:26.651612
292	2010-06-30 13:49:26.664093	2018-04-23 13:49:26.664607	2018-04-23 13:49:26.664607
293	2011-06-22 13:49:26.668949	2018-04-23 13:49:26.669432	2018-04-23 13:49:26.669432
294	2012-08-07 13:49:26.673677	2018-04-23 13:49:26.67413	2018-04-23 13:49:26.67413
295	2014-10-22 13:49:26.678365	2018-04-23 13:49:26.678851	2018-04-23 13:49:26.678851
296	2011-01-12 13:49:26.686792	2018-04-23 13:49:26.687282	2018-04-23 13:49:26.687282
297	2015-05-12 13:49:26.695244	2018-04-23 13:49:26.695922	2018-04-23 13:49:26.695922
298	2008-09-14 13:49:26.707858	2018-04-23 13:49:26.708504	2018-04-23 13:49:26.708504
299	2017-12-20 13:49:26.713982	2018-04-23 13:49:26.714454	2018-04-23 13:49:26.714454
300	2004-11-11 13:49:26.724497	2018-04-23 13:49:26.724959	2018-04-23 13:49:26.724959
301	2011-05-06 13:49:26.73296	2018-04-23 13:49:26.733506	2018-04-23 13:49:26.733506
302	2012-08-12 13:49:26.741049	2018-04-23 13:49:26.741617	2018-04-23 13:49:26.741617
303	2013-06-19 13:49:26.749254	2018-04-23 13:49:26.749726	2018-04-23 13:49:26.749726
304	2009-01-26 13:49:26.760126	2018-04-23 13:49:26.760685	2018-04-23 13:49:26.760685
305	2008-08-05 13:49:26.772149	2018-04-23 13:49:26.772677	2018-04-23 13:49:26.772677
306	2010-01-26 13:49:26.782694	2018-04-23 13:49:26.783173	2018-04-23 13:49:26.783173
307	2016-11-15 13:49:26.787488	2018-04-23 13:49:26.787943	2018-04-23 13:49:26.787943
308	2011-05-02 13:49:26.800623	2018-04-23 13:49:26.801123	2018-04-23 13:49:26.801123
309	2008-12-26 13:49:26.809141	2018-04-23 13:49:26.809865	2018-04-23 13:49:26.809865
310	2009-05-02 13:49:26.821767	2018-04-23 13:49:26.822267	2018-04-23 13:49:26.822267
311	2009-09-26 13:49:26.826641	2018-04-23 13:49:26.827116	2018-04-23 13:49:26.827116
312	2016-12-03 13:49:26.834211	2018-04-23 13:49:26.834679	2018-04-23 13:49:26.834679
313	2012-06-21 13:49:26.843954	2018-04-23 13:49:26.844444	2018-04-23 13:49:26.844444
314	2011-07-13 13:49:26.855529	2018-04-23 13:49:26.856072	2018-04-23 13:49:26.856072
315	2016-10-20 13:49:26.860645	2018-04-23 13:49:26.86115	2018-04-23 13:49:26.86115
316	2012-10-03 13:49:26.869298	2018-04-23 13:49:26.869764	2018-04-23 13:49:26.869764
317	2014-05-01 13:49:26.874792	2018-04-23 13:49:26.875313	2018-04-23 13:49:26.875313
318	2006-09-19 13:49:26.885481	2018-04-23 13:49:26.885954	2018-04-23 13:49:26.885954
319	2008-11-04 13:49:26.893263	2018-04-23 13:49:26.893761	2018-04-23 13:49:26.893761
320	2008-04-11 13:49:26.904522	2018-04-23 13:49:26.905125	2018-04-23 13:49:26.905125
321	2009-08-19 13:49:26.913947	2018-04-23 13:49:26.914467	2018-04-23 13:49:26.914467
322	2008-05-15 13:49:26.925287	2018-04-23 13:49:26.926009	2018-04-23 13:49:26.926009
323	2011-02-12 13:49:26.936206	2018-04-23 13:49:26.936693	2018-04-23 13:49:26.936693
324	2008-12-03 13:49:26.940883	2018-04-23 13:49:26.941381	2018-04-23 13:49:26.941381
325	2015-07-19 13:49:26.945599	2018-04-23 13:49:26.946149	2018-04-23 13:49:26.946149
326	2014-05-05 13:49:26.95739	2018-04-23 13:49:26.958126	2018-04-23 13:49:26.958126
327	2014-10-03 13:49:26.962961	2018-04-23 13:49:26.963479	2018-04-23 13:49:26.963479
328	2009-11-18 13:49:26.969828	2018-04-23 13:49:26.970353	2018-04-23 13:49:26.970353
329	2015-06-14 13:49:26.980157	2018-04-23 13:49:26.980682	2018-04-23 13:49:26.980682
330	2009-07-23 13:49:26.985075	2018-04-23 13:49:26.985535	2018-04-23 13:49:26.985535
331	2012-09-27 13:49:26.989926	2018-04-23 13:49:26.990402	2018-04-23 13:49:26.990402
332	2014-05-03 13:49:26.99766	2018-04-23 13:49:26.998191	2018-04-23 13:49:26.998191
333	2015-07-31 13:49:27.00919	2018-04-23 13:49:27.009749	2018-04-23 13:49:27.009749
334	2007-06-25 13:49:27.020313	2018-04-23 13:49:27.020784	2018-04-23 13:49:27.020784
335	2014-11-03 13:49:27.030782	2018-04-23 13:49:27.031322	2018-04-23 13:49:27.031322
336	2016-12-05 13:49:27.036122	2018-04-23 13:49:27.036657	2018-04-23 13:49:27.036657
337	2010-01-12 13:49:27.041474	2018-04-23 13:49:27.041997	2018-04-23 13:49:27.041997
338	2011-08-24 13:49:27.052547	2018-04-23 13:49:27.053063	2018-04-23 13:49:27.053063
339	2007-10-05 13:49:27.057695	2018-04-23 13:49:27.058347	2018-04-23 13:49:27.058347
340	2005-05-02 13:49:27.06315	2018-04-23 13:49:27.063633	2018-04-23 13:49:27.063633
341	2014-06-04 13:49:27.073871	2018-04-23 13:49:27.074394	2018-04-23 13:49:27.074394
342	2005-08-01 13:49:27.078949	2018-04-23 13:49:27.079439	2018-04-23 13:49:27.079439
343	2017-07-09 13:49:27.08718	2018-04-23 13:49:27.087678	2018-04-23 13:49:27.087678
344	2011-05-28 13:49:27.091991	2018-04-23 13:49:27.092463	2018-04-23 13:49:27.092463
345	2008-06-10 13:49:27.099677	2018-04-23 13:49:27.100177	2018-04-23 13:49:27.100177
346	2009-03-17 13:49:27.104843	2018-04-23 13:49:27.10537	2018-04-23 13:49:27.10537
347	2010-05-09 13:49:27.117977	2018-04-23 13:49:27.118474	2018-04-23 13:49:27.118474
348	2009-01-09 13:49:27.125562	2018-04-23 13:49:27.12609	2018-04-23 13:49:27.12609
349	2010-02-13 13:49:27.136429	2018-04-23 13:49:27.137165	2018-04-23 13:49:27.137165
350	2008-01-13 13:49:27.1451	2018-04-23 13:49:27.145594	2018-04-23 13:49:27.145594
351	2016-08-25 13:49:27.155678	2018-04-23 13:49:27.156136	2018-04-23 13:49:27.156136
352	2004-08-15 13:49:27.163282	2018-04-23 13:49:27.163847	2018-04-23 13:49:27.163847
353	2006-09-05 13:49:27.172691	2018-04-23 13:49:27.173217	2018-04-23 13:49:27.173217
354	2004-11-28 13:49:27.183353	2018-04-23 13:49:27.183826	2018-04-23 13:49:27.183826
355	2004-10-28 13:49:27.194785	2018-04-23 13:49:27.195283	2018-04-23 13:49:27.195283
356	2005-04-17 13:49:27.202575	2018-04-23 13:49:27.203091	2018-04-23 13:49:27.203091
357	2015-05-12 13:49:27.210769	2018-04-23 13:49:27.211449	2018-04-23 13:49:27.211449
358	2015-01-27 13:49:27.216113	2018-04-23 13:49:27.216641	2018-04-23 13:49:27.216641
359	2015-12-06 13:49:27.221954	2018-04-23 13:49:27.222495	2018-04-23 13:49:27.222495
360	2010-05-27 13:49:27.232941	2018-04-23 13:49:27.23347	2018-04-23 13:49:27.23347
361	2009-07-06 13:49:27.244154	2018-04-23 13:49:27.244658	2018-04-23 13:49:27.244658
362	2006-12-12 13:49:27.252414	2018-04-23 13:49:27.252888	2018-04-23 13:49:27.252888
363	2012-05-29 13:49:27.260207	2018-04-23 13:49:27.260708	2018-04-23 13:49:27.260708
364	2016-04-19 13:49:27.265301	2018-04-23 13:49:27.265819	2018-04-23 13:49:27.265819
365	2009-11-16 13:49:27.276564	2018-04-23 13:49:27.277044	2018-04-23 13:49:27.277044
366	2006-08-17 13:49:27.286474	2018-04-23 13:49:27.286993	2018-04-23 13:49:27.286993
367	2016-05-09 13:49:27.29172	2018-04-23 13:49:27.29222	2018-04-23 13:49:27.29222
368	2007-12-08 13:49:27.300482	2018-04-23 13:49:27.301019	2018-04-23 13:49:27.301019
369	2004-12-13 13:49:27.305827	2018-04-23 13:49:27.306533	2018-04-23 13:49:27.306533
370	2012-07-01 13:49:27.31469	2018-04-23 13:49:27.315414	2018-04-23 13:49:27.315414
371	2008-05-27 13:49:27.320423	2018-04-23 13:49:27.321144	2018-04-23 13:49:27.321144
372	2013-04-02 13:49:27.330129	2018-04-23 13:49:27.33062	2018-04-23 13:49:27.33062
373	2015-09-22 13:49:27.337963	2018-04-23 13:49:27.338442	2018-04-23 13:49:27.338442
374	2010-08-23 13:49:27.345786	2018-04-23 13:49:27.346269	2018-04-23 13:49:27.346269
375	2017-10-24 13:49:27.353968	2018-04-23 13:49:27.354509	2018-04-23 13:49:27.354509
376	2008-01-26 13:49:27.370389	2018-04-23 13:49:27.37094	2018-04-23 13:49:27.37094
377	2008-12-22 13:49:27.381968	2018-04-23 13:49:27.382471	2018-04-23 13:49:27.382471
378	2011-03-23 13:49:27.39029	2018-04-23 13:49:27.390782	2018-04-23 13:49:27.390782
379	2010-02-01 13:49:27.398058	2018-04-23 13:49:27.398623	2018-04-23 13:49:27.398623
380	2014-05-16 13:49:27.403233	2018-04-23 13:49:27.403735	2018-04-23 13:49:27.403735
381	2006-12-30 13:49:27.412661	2018-04-23 13:49:27.413168	2018-04-23 13:49:27.413168
382	2017-06-22 13:49:27.419457	2018-04-23 13:49:27.419978	2018-04-23 13:49:27.419978
383	2011-03-28 13:49:27.424282	2018-04-23 13:49:27.424733	2018-04-23 13:49:27.424733
384	2014-01-01 13:49:27.43498	2018-04-23 13:49:27.435503	2018-04-23 13:49:27.435503
385	2016-08-04 13:49:27.440204	2018-04-23 13:49:27.440699	2018-04-23 13:49:27.440699
386	2010-08-29 13:49:27.445195	2018-04-23 13:49:27.445874	2018-04-23 13:49:27.445874
387	2008-11-25 13:49:27.454317	2018-04-23 13:49:27.455004	2018-04-23 13:49:27.455004
388	2016-02-11 13:49:27.464173	2018-04-23 13:49:27.464701	2018-04-23 13:49:27.464701
389	2011-05-23 13:49:27.472045	2018-04-23 13:49:27.472528	2018-04-23 13:49:27.472528
390	2015-10-13 13:49:27.476917	2018-04-23 13:49:27.477431	2018-04-23 13:49:27.477431
391	2011-05-03 13:49:27.486866	2018-04-23 13:49:27.487424	2018-04-23 13:49:27.487424
392	2016-09-05 13:49:27.498286	2018-04-23 13:49:27.498805	2018-04-23 13:49:27.498805
393	2010-11-08 13:49:27.503188	2018-04-23 13:49:27.50374	2018-04-23 13:49:27.50374
394	2006-04-25 13:49:27.508377	2018-04-23 13:49:27.508905	2018-04-23 13:49:27.508905
395	2012-06-12 13:49:27.520922	2018-04-23 13:49:27.521434	2018-04-23 13:49:27.521434
396	2012-06-20 13:49:27.533383	2018-04-23 13:49:27.533881	2018-04-23 13:49:27.533881
397	2017-01-21 13:49:27.544325	2018-04-23 13:49:27.544881	2018-04-23 13:49:27.544881
398	2006-09-12 13:49:27.552662	2018-04-23 13:49:27.55342	2018-04-23 13:49:27.55342
399	2006-12-16 13:49:27.561777	2018-04-23 13:49:27.562485	2018-04-23 13:49:27.562485
400	2017-05-08 13:49:27.571023	2018-04-23 13:49:27.571762	2018-04-23 13:49:27.571762
401	2012-08-11 13:49:27.579396	2018-04-23 13:49:27.579862	2018-04-23 13:49:27.579862
402	2010-03-25 13:49:27.584139	2018-04-23 13:49:27.584617	2018-04-23 13:49:27.584617
403	2008-01-03 13:49:27.588853	2018-04-23 13:49:27.589339	2018-04-23 13:49:27.589339
404	2015-03-12 13:49:27.596728	2018-04-23 13:49:27.5973	2018-04-23 13:49:27.5973
405	2015-07-13 13:49:27.602646	2018-04-23 13:49:27.603188	2018-04-23 13:49:27.603188
406	2017-08-14 13:49:27.615515	2018-04-23 13:49:27.615991	2018-04-23 13:49:27.615991
407	2015-03-28 13:49:27.623081	2018-04-23 13:49:27.623538	2018-04-23 13:49:27.623538
408	2011-03-10 13:49:27.628559	2018-04-23 13:49:27.629125	2018-04-23 13:49:27.629125
409	2015-05-30 13:49:27.639762	2018-04-23 13:49:27.640271	2018-04-23 13:49:27.640271
410	2004-10-11 13:49:27.65129	2018-04-23 13:49:27.651819	2018-04-23 13:49:27.651819
411	2005-06-29 13:49:27.660182	2018-04-23 13:49:27.660682	2018-04-23 13:49:27.660682
412	2005-10-08 13:49:27.670616	2018-04-23 13:49:27.671104	2018-04-23 13:49:27.671104
413	2015-12-12 13:49:27.67867	2018-04-23 13:49:27.679214	2018-04-23 13:49:27.679214
414	2009-01-26 13:49:27.687591	2018-04-23 13:49:27.688072	2018-04-23 13:49:27.688072
415	2017-05-11 13:49:27.698085	2018-04-23 13:49:27.698565	2018-04-23 13:49:27.698565
416	2007-07-04 13:49:27.706072	2018-04-23 13:49:27.706587	2018-04-23 13:49:27.706587
417	2007-11-25 13:49:27.711774	2018-04-23 13:49:27.712324	2018-04-23 13:49:27.712324
418	2017-12-26 13:49:27.723262	2018-04-23 13:49:27.723769	2018-04-23 13:49:27.723769
419	2013-08-21 13:49:27.731755	2018-04-23 13:49:27.732463	2018-04-23 13:49:27.732463
420	2016-09-16 13:49:27.738396	2018-04-23 13:49:27.738926	2018-04-23 13:49:27.738926
421	2009-03-12 13:49:27.746385	2018-04-23 13:49:27.746877	2018-04-23 13:49:27.746877
422	2017-01-29 13:49:27.757277	2018-04-23 13:49:27.757804	2018-04-23 13:49:27.757804
423	2014-09-29 13:49:27.767426	2018-04-23 13:49:27.767915	2018-04-23 13:49:27.767915
424	2013-04-28 13:49:27.780231	2018-04-23 13:49:27.780706	2018-04-23 13:49:27.780706
425	2012-08-06 13:49:27.788075	2018-04-23 13:49:27.78861	2018-04-23 13:49:27.78861
426	2005-05-19 13:49:27.794672	2018-04-23 13:49:27.795202	2018-04-23 13:49:27.795202
427	2006-07-22 13:49:27.803021	2018-04-23 13:49:27.803713	2018-04-23 13:49:27.803713
428	2005-08-01 13:49:27.815405	2018-04-23 13:49:27.81591	2018-04-23 13:49:27.81591
429	2005-09-12 13:49:27.827541	2018-04-23 13:49:27.828044	2018-04-23 13:49:27.828044
430	2011-02-20 13:49:27.832448	2018-04-23 13:49:27.832937	2018-04-23 13:49:27.832937
431	2010-04-14 13:49:27.838923	2018-04-23 13:49:27.839489	2018-04-23 13:49:27.839489
432	2013-10-07 13:49:27.847908	2018-04-23 13:49:27.848441	2018-04-23 13:49:27.848441
433	2007-06-24 13:49:27.855845	2018-04-23 13:49:27.856354	2018-04-23 13:49:27.856354
434	2014-02-17 13:49:27.869553	2018-04-23 13:49:27.870068	2018-04-23 13:49:27.870068
435	2005-10-09 13:49:27.880886	2018-04-23 13:49:27.881375	2018-04-23 13:49:27.881375
436	2017-03-19 13:49:27.891501	2018-04-23 13:49:27.891974	2018-04-23 13:49:27.891974
437	2011-03-22 13:49:27.899526	2018-04-23 13:49:27.900184	2018-04-23 13:49:27.900184
438	2017-04-22 13:49:27.908558	2018-04-23 13:49:27.909295	2018-04-23 13:49:27.909295
439	2013-03-01 13:49:27.920437	2018-04-23 13:49:27.920986	2018-04-23 13:49:27.920986
440	2014-06-01 13:49:27.930174	2018-04-23 13:49:27.931095	2018-04-23 13:49:27.931095
441	2007-03-17 13:49:27.938597	2018-04-23 13:49:27.93951	2018-04-23 13:49:27.93951
442	2010-02-17 13:49:27.955175	2018-04-23 13:49:27.955848	2018-04-23 13:49:27.955848
443	2013-12-07 13:49:27.966357	2018-04-23 13:49:27.966838	2018-04-23 13:49:27.966838
444	2016-10-21 13:49:27.977492	2018-04-23 13:49:27.977972	2018-04-23 13:49:27.977972
445	2011-09-12 13:49:27.991184	2018-04-23 13:49:27.991677	2018-04-23 13:49:27.991677
446	2007-09-26 13:49:27.998854	2018-04-23 13:49:27.99932	2018-04-23 13:49:27.99932
447	2015-05-16 13:49:28.006484	2018-04-23 13:49:28.00702	2018-04-23 13:49:28.00702
448	2007-10-21 13:49:28.012308	2018-04-23 13:49:28.012808	2018-04-23 13:49:28.012808
449	2007-12-20 13:49:28.020232	2018-04-23 13:49:28.020745	2018-04-23 13:49:28.020745
450	2007-11-13 13:49:28.031777	2018-04-23 13:49:28.032476	2018-04-23 13:49:28.032476
451	2011-10-04 13:49:28.041545	2018-04-23 13:49:28.042104	2018-04-23 13:49:28.042104
452	2013-01-14 13:49:28.049399	2018-04-23 13:49:28.04988	2018-04-23 13:49:28.04988
453	2014-07-10 13:49:28.054161	2018-04-23 13:49:28.05466	2018-04-23 13:49:28.05466
454	2010-05-20 13:49:28.062179	2018-04-23 13:49:28.062694	2018-04-23 13:49:28.062694
455	2011-10-08 13:49:28.070542	2018-04-23 13:49:28.071019	2018-04-23 13:49:28.071019
456	2013-02-03 13:49:28.078205	2018-04-23 13:49:28.07868	2018-04-23 13:49:28.07868
457	2008-12-13 13:49:28.089053	2018-04-23 13:49:28.089615	2018-04-23 13:49:28.089615
458	2005-02-17 13:49:28.103497	2018-04-23 13:49:28.104028	2018-04-23 13:49:28.104028
459	2017-03-12 13:49:28.108599	2018-04-23 13:49:28.109112	2018-04-23 13:49:28.109112
460	2009-03-17 13:49:28.119586	2018-04-23 13:49:28.120105	2018-04-23 13:49:28.120105
461	2011-05-13 13:49:28.125763	2018-04-23 13:49:28.126494	2018-04-23 13:49:28.126494
462	2013-06-26 13:49:28.131621	2018-04-23 13:49:28.132339	2018-04-23 13:49:28.132339
463	2014-09-26 13:49:28.137354	2018-04-23 13:49:28.138105	2018-04-23 13:49:28.138105
464	2018-03-03 13:49:28.150345	2018-04-23 13:49:28.150905	2018-04-23 13:49:28.150905
465	2015-12-06 13:49:28.161561	2018-04-23 13:49:28.162073	2018-04-23 13:49:28.162073
466	2017-03-23 13:49:28.166866	2018-04-23 13:49:28.167553	2018-04-23 13:49:28.167553
467	2011-04-12 13:49:28.1743	2018-04-23 13:49:28.175049	2018-04-23 13:49:28.175049
468	2011-11-27 13:49:28.182828	2018-04-23 13:49:28.183302	2018-04-23 13:49:28.183302
469	2005-02-09 13:49:28.193386	2018-04-23 13:49:28.193856	2018-04-23 13:49:28.193856
470	2011-08-20 13:49:28.20164	2018-04-23 13:49:28.202284	2018-04-23 13:49:28.202284
471	2010-06-18 13:49:28.206783	2018-04-23 13:49:28.207275	2018-04-23 13:49:28.207275
472	2011-06-24 13:49:28.214384	2018-04-23 13:49:28.214893	2018-04-23 13:49:28.214893
473	2008-10-22 13:49:28.219207	2018-04-23 13:49:28.219657	2018-04-23 13:49:28.219657
474	2007-02-15 13:49:28.226921	2018-04-23 13:49:28.227422	2018-04-23 13:49:28.227422
475	2006-01-16 13:49:28.238571	2018-04-23 13:49:28.239065	2018-04-23 13:49:28.239065
476	2004-11-09 13:49:28.246476	2018-04-23 13:49:28.246953	2018-04-23 13:49:28.246953
477	2012-07-11 13:49:28.254401	2018-04-23 13:49:28.255029	2018-04-23 13:49:28.255029
478	2005-06-19 13:49:28.260543	2018-04-23 13:49:28.261042	2018-04-23 13:49:28.261042
479	2012-08-19 13:49:28.268378	2018-04-23 13:49:28.268859	2018-04-23 13:49:28.268859
480	2008-01-13 13:49:28.274718	2018-04-23 13:49:28.27522	2018-04-23 13:49:28.27522
481	2014-10-07 13:49:28.283314	2018-04-23 13:49:28.283967	2018-04-23 13:49:28.283967
482	2017-09-24 13:49:28.291688	2018-04-23 13:49:28.292231	2018-04-23 13:49:28.292231
483	2011-02-22 13:49:28.299552	2018-04-23 13:49:28.300009	2018-04-23 13:49:28.300009
484	2012-04-14 13:49:28.304577	2018-04-23 13:49:28.305121	2018-04-23 13:49:28.305121
485	2005-11-27 13:49:28.316675	2018-04-23 13:49:28.31719	2018-04-23 13:49:28.31719
486	2015-03-28 13:49:28.321646	2018-04-23 13:49:28.322129	2018-04-23 13:49:28.322129
487	2007-04-19 13:49:28.326474	2018-04-23 13:49:28.326969	2018-04-23 13:49:28.326969
488	2006-04-30 13:49:28.337505	2018-04-23 13:49:28.338173	2018-04-23 13:49:28.338173
489	2009-09-08 13:49:28.346384	2018-04-23 13:49:28.347099	2018-04-23 13:49:28.347099
490	2013-02-06 13:49:28.355671	2018-04-23 13:49:28.356184	2018-04-23 13:49:28.356184
491	2010-05-25 13:49:28.365584	2018-04-23 13:49:28.366165	2018-04-23 13:49:28.366165
492	2013-01-30 13:49:28.380815	2018-04-23 13:49:28.381309	2018-04-23 13:49:28.381309
493	2014-12-14 13:49:28.388488	2018-04-23 13:49:28.388946	2018-04-23 13:49:28.388946
494	2015-02-28 13:49:28.394118	2018-04-23 13:49:28.394594	2018-04-23 13:49:28.394594
495	2014-03-09 13:49:28.401813	2018-04-23 13:49:28.402271	2018-04-23 13:49:28.402271
496	2012-02-01 13:49:28.406518	2018-04-23 13:49:28.407017	2018-04-23 13:49:28.407017
497	2016-06-09 13:49:28.411258	2018-04-23 13:49:28.411781	2018-04-23 13:49:28.411781
498	2016-09-12 13:49:28.419976	2018-04-23 13:49:28.420492	2018-04-23 13:49:28.420492
499	2009-09-28 13:49:28.428384	2018-04-23 13:49:28.428868	2018-04-23 13:49:28.428868
500	2010-08-27 13:49:28.43626	2018-04-23 13:49:28.436785	2018-04-23 13:49:28.436785
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, description, price, sale_price, remaining_quantity, created_at, updated_at) FROM stdin;
1	Rustic Granite Computer	Vel est occaecati fuga omnis odit. A hic sed aut quidem sed possimus. Officiis nam porro.	93.8100000000000023	1	0	2018-04-23 13:49:22.356031	2018-04-23 13:49:22.356031
2	Aerodynamic Granite Shirt	Repudiandae sit ex. Voluptatum amet est consequatur natus. Aut ea maxime aut nihil.	34.9500000000000028	34.9500000000000028	25	2018-04-23 13:49:22.366851	2018-04-23 13:49:22.366851
3	Practical Bronze Chair	Voluptatem animi eum. Fugiat dolorem magnam. Eum aut quae. Voluptas sed qui quia quia. Ipsum rem sint.	63.6499999999999986	60	0	2018-04-23 13:49:22.377147	2018-04-23 13:49:22.377147
4	Aerodynamic Granite Clock	Fugit quia consectetur dicta sed. Aperiam asperiores voluptas voluptatem dolor aspernatur molestiae natus. Dignissimos temporibus est laboriosam maxime non voluptate. Nisi sunt temporibus ipsam fuga. Minima voluptas necessitatibus et magni velit.	34.1499999999999986	34.1499999999999986	13	2018-04-23 13:49:22.38119	2018-04-23 13:49:22.38119
5	Mediocre Iron Watch	Ad velit architecto ut quas molestiae quis. Rem voluptas nisi soluta mollitia. Aperiam necessitatibus distinctio nostrum nihil et. Adipisci reprehenderit est illum. Ea labore laudantium.	21.6499999999999986	21.6499999999999986	0	2018-04-23 13:49:22.384875	2018-04-23 13:49:22.384875
6	Rustic Bronze Bag	Et asperiores dolores omnis quo officiis voluptas aspernatur. Fuga optio non qui. Reprehenderit debitis dolor numquam cumque nulla. Consequatur ad aut nesciunt ut autem.	66.1700000000000017	29	0	2018-04-23 13:49:22.387994	2018-04-23 13:49:22.387994
7	Practical Paper Watch	Qui totam necessitatibus nostrum. Repellat quo voluptatem alias libero aut quis consequatur. Inventore et beatae minima aperiam ex. Nemo ut ratione consequatur autem voluptas assumenda itaque. Perferendis quasi voluptatem laborum saepe et.	63.6599999999999966	12	0	2018-04-23 13:49:22.391249	2018-04-23 13:49:22.391249
8	Sleek Marble Bottle	Voluptas assumenda id possimus occaecati similique quasi. Dolor debitis repudiandae doloremque ut at. Sed doloribus et et dolorem. Est voluptatem non minus quia in recusandae.	62.8800000000000026	19	47	2018-04-23 13:49:22.394367	2018-04-23 13:49:22.394367
9	Awesome Wooden Hat	Quas quis fugiat. Ipsa dignissimos labore optio autem quo atque. Nisi ipsum unde. Odio dolore quis natus exercitationem in vero. Adipisci dolore aspernatur accusantium est nesciunt.	74.6800000000000068	74.6800000000000068	0	2018-04-23 13:49:22.397365	2018-04-23 13:49:22.397365
10	Gorgeous Steel Hat	Et nulla sed facilis maiores. Animi nemo odio laboriosam. Ut aliquid at.	60.4500000000000028	17	0	2018-04-23 13:49:22.400232	2018-04-23 13:49:22.400232
11	Awesome Marble Computer	Amet voluptatem omnis enim commodi ducimus. Autem maiores impedit dignissimos. Porro est ipsam aperiam quia sit. Quis corporis dolorum harum ipsum a ducimus cum.	22.629999999999999	22.629999999999999	31	2018-04-23 13:49:22.403161	2018-04-23 13:49:22.403161
12	Rustic Wooden Hat	Corporis tenetur distinctio. Vero velit beatae. Incidunt hic nihil dolor. Harum quaerat est porro eligendi.	33.5900000000000034	33.5900000000000034	25	2018-04-23 13:49:22.423771	2018-04-23 13:49:22.423771
13	Durable Copper Watch	Veniam quidem occaecati qui nisi. Recusandae a nulla non omnis delectus aut similique. Eius unde esse. Voluptas aut ut maiores nisi possimus velit et.	90.3199999999999932	90.3199999999999932	2	2018-04-23 13:49:22.437999	2018-04-23 13:49:22.437999
14	Gorgeous Linen Wallet	Asperiores consequatur fugit laborum est consequatur quo quibusdam. Pariatur doloribus quo voluptatum atque. Laboriosam architecto ut ut minus voluptatem iure. Voluptate consequatur aliquam.	40.3400000000000034	40.3400000000000034	32	2018-04-23 13:49:22.441025	2018-04-23 13:49:22.441025
15	Synergistic Paper Bag	Ab tempore dolores et numquam aperiam. Tenetur tempore necessitatibus saepe explicabo voluptas. Vel repudiandae et magnam ratione aut aspernatur. Rerum qui non eius voluptas velit ab. Voluptatibus et qui ad autem unde.	63.9799999999999969	27	40	2018-04-23 13:49:22.443918	2018-04-23 13:49:22.443918
16	Intelligent Silk Lamp	Cupiditate ea quaerat voluptatem rerum distinctio. Accusantium qui molestiae nihil similique ex aut. Officia molestiae qui culpa ad facere officiis. In culpa rem beatae odio ut. Atque vel est.	30.2600000000000016	18	0	2018-04-23 13:49:22.44682	2018-04-23 13:49:22.44682
17	Mediocre Granite Bag	Vitae vero enim velit sit sunt. Qui perferendis consectetur. In temporibus quas voluptatem nobis quisquam. Provident ut nam quasi et doloremque maxime eligendi. Aspernatur architecto autem pariatur et qui nulla eum.	12.4000000000000004	6	0	2018-04-23 13:49:22.449841	2018-04-23 13:49:22.449841
18	Synergistic Rubber Plate	Et quas quo quos. Molestias repudiandae ut natus et officia dolore. Dolorum quia aliquid autem.	99.6700000000000017	16	10	2018-04-23 13:49:22.452871	2018-04-23 13:49:22.452871
19	Ergonomic Rubber Gloves	Omnis magni quasi. Veritatis provident repudiandae dolores architecto necessitatibus iure minus. Eaque cumque aut mollitia sed eius voluptatem natus.	92.8700000000000045	92.8700000000000045	17	2018-04-23 13:49:22.455721	2018-04-23 13:49:22.455721
20	Heavy Duty Copper Bottle	Ut et veritatis nihil debitis minus. Dolores deserunt est ad consequatur sunt veritatis non. Odit est ab nihil. Vitae nesciunt officia eum iusto sed iure molestiae. Excepturi accusantium repellendus rerum qui nesciunt sed.	62.1099999999999994	13	34	2018-04-23 13:49:22.458599	2018-04-23 13:49:22.458599
21	Awesome Rubber Car	Cum at maxime ut et repellat sint voluptatem. Nostrum suscipit qui. Voluptates ut reiciendis omnis eum ut qui nihil.	38.7100000000000009	32	0	2018-04-23 13:49:22.46148	2018-04-23 13:49:22.46148
22	Sleek Bronze Knife	Voluptatibus eaque laborum quasi harum. Est debitis praesentium earum rem consequatur eaque voluptates. Repudiandae consequuntur consectetur non nam.	30.25	30.25	16	2018-04-23 13:49:22.464427	2018-04-23 13:49:22.464427
23	Heavy Duty Concrete Coat	Omnis aperiam quos. Eum voluptatibus libero officia. Enim quo dolorem voluptas rerum. Ut non qui doloremque commodi qui.	20.5500000000000007	7	50	2018-04-23 13:49:22.467885	2018-04-23 13:49:22.467885
24	Gorgeous Cotton Plate	Libero non cum quam aut ducimus necessitatibus dolorem. Et velit optio vitae sed possimus nulla nisi. Cumque sed et. Iure asperiores quo dignissimos cum culpa tenetur.	52.0200000000000031	52.0200000000000031	28	2018-04-23 13:49:22.470905	2018-04-23 13:49:22.470905
25	Intelligent Steel Plate	Tempora deserunt et et odio minus. Ab maiores aut et. Ut qui voluptatem culpa incidunt. Et assumenda non nam et.	95.7900000000000063	23	25	2018-04-23 13:49:22.47672	2018-04-23 13:49:22.47672
26	Lightweight Silk Knife	Optio veniam harum ad. Placeat est id repellendus consectetur illum. Velit quos qui rerum aut alias est sint.	25.2300000000000004	21	0	2018-04-23 13:49:22.479708	2018-04-23 13:49:22.479708
27	Durable Aluminum Bottle	Pariatur totam dolorem aut repellat non sint corporis. Sapiente labore cum. Velit porro rerum similique.	96.75	96.75	13	2018-04-23 13:49:22.482707	2018-04-23 13:49:22.482707
28	Durable Paper Bench	Repudiandae tempora ipsam ad cumque debitis et. Est consequuntur blanditiis provident minus ut. Ipsam non architecto. Ex magnam tenetur nisi adipisci in et. Architecto voluptatum temporibus.	3.85999999999999988	1	50	2018-04-23 13:49:22.486186	2018-04-23 13:49:22.486186
29	Aerodynamic Rubber Coat	Dolorem id architecto possimus placeat rerum magnam qui. Quibusdam et dolor quia placeat. Iusto sit excepturi beatae. Saepe quia ut dolore dicta quae cum architecto.	99.2000000000000028	38	0	2018-04-23 13:49:22.489141	2018-04-23 13:49:22.489141
30	Fantastic Concrete Gloves	Voluptas voluptate libero modi est. Sunt et labore quasi. Ut quia aperiam voluptatem. Illum neque dolorem nihil atque vel voluptas.	98.6700000000000017	98.6700000000000017	18	2018-04-23 13:49:22.492059	2018-04-23 13:49:22.492059
31	Ergonomic Silk Car	Animi itaque repudiandae. Ut quia deserunt laudantium nobis. Quaerat doloribus aut. Et itaque vel ut laborum. Possimus et laboriosam ea enim.	73.480000000000004	10	28	2018-04-23 13:49:22.494879	2018-04-23 13:49:22.494879
32	Small Plastic Shirt	Tempore sed est corrupti natus veniam. Quibusdam quia et veniam alias nesciunt vitae. Vel quis aperiam eaque dolores vero provident.	71.7900000000000063	36	0	2018-04-23 13:49:22.497613	2018-04-23 13:49:22.497613
33	Fantastic Steel Clock	Quasi aliquam ut dolorem voluptatem eius consequuntur sint. Blanditiis ut cumque laudantium. Expedita quod eaque dolor corrupti doloremque ut non. Vel sapiente sunt voluptatibus.	7.20999999999999996	7.20999999999999996	30	2018-04-23 13:49:22.500529	2018-04-23 13:49:22.500529
34	Incredible Marble Keyboard	Dolores possimus recusandae voluptas voluptatem. Enim nam qui tempora nemo. Accusantium doloremque et. Voluptatem vel eveniet et dignissimos molestias architecto. Sit quo earum explicabo facilis dolore ea.	25.7699999999999996	15	0	2018-04-23 13:49:22.504103	2018-04-23 13:49:22.504103
35	Mediocre Leather Lamp	Accusantium aut aspernatur fugiat. Eligendi consectetur inventore. Aspernatur nesciunt ex.	24.2899999999999991	24.2899999999999991	16	2018-04-23 13:49:22.50715	2018-04-23 13:49:22.50715
36	Incredible Wool Car	Illo asperiores sunt nam. Facilis asperiores sequi. Mollitia aliquid ea est illum et architecto.	50.0200000000000031	7	0	2018-04-23 13:49:22.510041	2018-04-23 13:49:22.510041
37	Incredible Copper Watch	Autem vero ut nesciunt voluptatibus error. Quia perspiciatis ut sit labore voluptates nihil earum. Quasi ipsam ducimus facilis quod aspernatur.	79.4300000000000068	79.4300000000000068	0	2018-04-23 13:49:22.513263	2018-04-23 13:49:22.513263
38	Aerodynamic Iron Bottle	Rerum numquam excepturi minima. Et beatae in nostrum provident sint aliquid. Ipsa qui quia. Dolorem voluptate tempore et ratione. Molestiae nulla sequi.	15.4299999999999997	15.4299999999999997	48	2018-04-23 13:49:22.516177	2018-04-23 13:49:22.516177
39	Small Granite Bench	Sint repudiandae accusamus quisquam. In provident ut quasi qui natus ab. Numquam commodi accusantium sit hic id. Eveniet tempora voluptatum. Quam aut impedit est laboriosam aut.	11.9399999999999995	5	0	2018-04-23 13:49:22.519089	2018-04-23 13:49:22.519089
40	Heavy Duty Concrete Clock	Sit id officiis quia ex. Perspiciatis et accusantium accusamus. Reprehenderit esse quam rerum eos amet. Nisi voluptas sed. Placeat sunt modi et officia harum.	15.5500000000000007	15	30	2018-04-23 13:49:22.522023	2018-04-23 13:49:22.522023
41	Sleek Cotton Car	Unde a autem. Non ut tempora aperiam consequatur. Libero debitis recusandae. Eligendi sed magni.	76.0699999999999932	6	0	2018-04-23 13:49:22.524915	2018-04-23 13:49:22.524915
42	Gorgeous Concrete Shoes	Libero error qui et est. Non facilis quos eius aliquid. Nam doloremque voluptas aut. Molestiae dolorem consequatur ut id sed doloremque repudiandae. Dolore iusto illo sed est voluptatem quia.	51.0499999999999972	46	0	2018-04-23 13:49:22.527954	2018-04-23 13:49:22.527954
43	Durable Copper Pants	Et et earum nihil eaque laborum dolores. Et omnis est accusantium blanditiis. Unde optio dolor modi dolores repellendus illo. Ea eum eveniet nemo voluptates ut neque.	23.1000000000000014	1	7	2018-04-23 13:49:22.530776	2018-04-23 13:49:22.530776
44	Sleek Copper Hat	Totam quibusdam aspernatur eum. Sint placeat et non quia. Mollitia nesciunt recusandae. Labore consequuntur ratione.	39.2899999999999991	39.2899999999999991	25	2018-04-23 13:49:22.533569	2018-04-23 13:49:22.533569
45	Lightweight Wool Clock	Non nihil repudiandae porro excepturi explicabo quis occaecati. Amet voluptatibus iusto est. Cumque iste totam.	36.6599999999999966	36.6599999999999966	0	2018-04-23 13:49:22.5366	2018-04-23 13:49:22.5366
46	Gorgeous Cotton Watch	Nihil voluptatem et voluptas aut repellat. Possimus suscipit nulla labore vero cupiditate et sint. Quas est inventore rem quae. Voluptatem dignissimos tempore sed aut.	71.0300000000000011	43	20	2018-04-23 13:49:22.539614	2018-04-23 13:49:22.539614
47	Awesome Leather Bottle	Nemo harum suscipit magnam amet excepturi ullam. Totam esse maxime fuga impedit officiis ut. Ab laudantium qui quisquam. Porro quia facilis ut velit ducimus corrupti. Modi assumenda placeat nesciunt.	48.7100000000000009	48	0	2018-04-23 13:49:22.542539	2018-04-23 13:49:22.542539
48	Intelligent Granite Watch	Tempora dolores nihil cum expedita. Aut et quia ut velit. Repellat beatae et ut est possimus accusamus. Est non molestiae sint eos qui.	6.16000000000000014	1	0	2018-04-23 13:49:22.545955	2018-04-23 13:49:22.545955
49	Practical Wool Gloves	Animi aut assumenda. Repellendus deleniti qui aliquam quaerat est in optio. Qui odit velit quisquam quod omnis aspernatur eius. Enim quo sed porro qui.	93.019999999999996	93.019999999999996	0	2018-04-23 13:49:22.549024	2018-04-23 13:49:22.549024
50	Practical Leather Gloves	Temporibus ut placeat rerum consequatur iure. Architecto optio deserunt autem. Rerum ea incidunt accusamus quis quis repellat. Dolore eveniet vel rerum consectetur nihil.	10.2899999999999991	10.2899999999999991	5	2018-04-23 13:49:22.552206	2018-04-23 13:49:22.552206
51	Small Wooden Coat	Aspernatur in saepe rem. Aliquam dolor ullam dicta enim. Ducimus et rem fuga.	38.6199999999999974	24	0	2018-04-23 13:49:22.555281	2018-04-23 13:49:22.555281
52	Rustic Silk Bag	Numquam et veniam repellendus corporis voluptas. Deleniti amet maxime et. Vitae est molestiae inventore eveniet. Ipsa voluptas quod quos est. Qui distinctio consequatur autem laudantium.	82.9599999999999937	63	0	2018-04-23 13:49:22.558263	2018-04-23 13:49:22.558263
53	Aerodynamic Linen Shirt	Nesciunt quos molestiae enim voluptas repudiandae est veniam. Ut sequi omnis qui vel dolores ullam. Aperiam et non eaque laudantium officiis aut iste. Quia reprehenderit ab.	18.5399999999999991	18.5399999999999991	0	2018-04-23 13:49:22.561176	2018-04-23 13:49:22.561176
54	Rustic Plastic Pants	Ratione nostrum praesentium. Pariatur iusto voluptatem facere. Dolorem error amet quo vitae. Eius est autem. Deserunt dolorum voluptatem.	10.7400000000000002	4	44	2018-04-23 13:49:22.564177	2018-04-23 13:49:22.564177
55	Incredible Linen Car	Ex suscipit inventore ullam aut qui. Explicabo suscipit velit voluptatem mollitia cumque ut. Eum vel distinctio sint saepe. Praesentium adipisci neque.	51.7700000000000031	5	7	2018-04-23 13:49:22.567191	2018-04-23 13:49:22.567191
56	Fantastic Granite Bottle	Quo asperiores laboriosam quasi sint quam labore ullam. Quibusdam reprehenderit consequatur error ut odio quam. Distinctio quod voluptatum maxime ut. Eos rerum maiores voluptas porro inventore.	59.3800000000000026	41	47	2018-04-23 13:49:22.570396	2018-04-23 13:49:22.570396
57	Incredible Cotton Bottle	Neque est debitis. Illum similique voluptatem qui dolore repellendus et ipsam. Veritatis aperiam dolor. Est blanditiis porro sit enim.	28.2699999999999996	28.2699999999999996	0	2018-04-23 13:49:22.574061	2018-04-23 13:49:22.574061
58	Incredible Wooden Plate	Qui quia natus. Amet unde quo nisi sed quisquam enim ut. Labore quia aut ducimus et qui.	84.9200000000000017	84.9200000000000017	10	2018-04-23 13:49:22.577342	2018-04-23 13:49:22.577342
59	Rustic Wool Keyboard	Laborum repudiandae odit quis qui id. Sed repudiandae molestias quaerat. Fugiat exercitationem est quod. Saepe qui nihil in ab.	98.4899999999999949	98.4899999999999949	23	2018-04-23 13:49:22.580515	2018-04-23 13:49:22.580515
60	Gorgeous Granite Table	Sed doloremque aut neque id facere. Iusto excepturi aut. Autem quasi aut ea. Temporibus assumenda eos aut ea consequatur.	87.0400000000000063	70	2	2018-04-23 13:49:22.583465	2018-04-23 13:49:22.583465
61	Durable Paper Hat	Dolorem reprehenderit debitis cum ab quia necessitatibus similique. Exercitationem suscipit aut quibusdam natus iure dolorem blanditiis. Temporibus maxime voluptatem quae odit nihil. Rerum quas earum in error voluptate et delectus. Magni pariatur animi nisi quis.	32.3299999999999983	6	16	2018-04-23 13:49:22.586418	2018-04-23 13:49:22.586418
62	Awesome Steel Bottle	Unde explicabo laudantium cumque aut tempora et labore. Minima quos est distinctio culpa ducimus animi. Reprehenderit qui voluptatibus unde laborum vero esse. Totam ut porro magni.	28.3099999999999987	2	17	2018-04-23 13:49:22.58933	2018-04-23 13:49:22.58933
63	Synergistic Leather Plate	Fuga perspiciatis similique nobis qui. Vitae quidem omnis et enim ut numquam est. Qui voluptatum praesentium quia adipisci quibusdam doloribus inventore.	62.990000000000002	62.990000000000002	0	2018-04-23 13:49:22.59217	2018-04-23 13:49:22.59217
95	Incredible Marble Pants	Laudantium maiores eius corrupti voluptates maxime iure quas. Quidem est deserunt unde. Velit et et dolores laborum sint fugiat.	76.6700000000000017	76.6700000000000017	0	2018-04-23 13:49:22.707163	2018-04-23 13:49:22.707163
64	Mediocre Steel Table	Magni sequi labore dicta sunt placeat aperiam. Ducimus quisquam et excepturi dolorum delectus accusantium maiores. Dolorum fuga ut incidunt expedita beatae ipsa. Ratione reprehenderit vero porro aut voluptate. Unde placeat eum ipsa provident corrupti labore.	78.3700000000000045	43	0	2018-04-23 13:49:22.595127	2018-04-23 13:49:22.595127
65	Mediocre Wool Plate	Dolores et debitis odio rerum. Ad omnis et. Mollitia quia laboriosam molestias.	48.0300000000000011	46	41	2018-04-23 13:49:22.598103	2018-04-23 13:49:22.598103
66	Durable Leather Bottle	Id aut id et consequatur fugit qui. In necessitatibus assumenda maxime et. Et exercitationem voluptas sed eligendi numquam est qui. Odit sequi earum delectus similique corrupti quis qui.	58.5900000000000034	58.5900000000000034	0	2018-04-23 13:49:22.60097	2018-04-23 13:49:22.60097
67	Awesome Aluminum Bench	Similique iusto consequatur eius voluptate et qui blanditiis. Cumque nesciunt aliquam minima nostrum. Ut at architecto accusantium et molestias autem. Non rerum unde quos quae sequi.	24.9699999999999989	24.9699999999999989	23	2018-04-23 13:49:22.604239	2018-04-23 13:49:22.604239
68	Ergonomic Cotton Coat	Eum enim et ut qui. Maiores eligendi id quo at. Commodi et ut. Vitae harum consequuntur voluptas facilis rerum.	95.230000000000004	23	8	2018-04-23 13:49:22.607146	2018-04-23 13:49:22.607146
69	Rustic Leather Bench	Rerum sit consequatur eos et quia. Enim assumenda ut est est molestiae. Iusto accusamus sit.	5.90000000000000036	5.90000000000000036	0	2018-04-23 13:49:22.609967	2018-04-23 13:49:22.609967
70	Practical Bronze Computer	Velit reprehenderit cupiditate quasi voluptates fugiat. Id ut est voluptates debitis corporis nesciunt. Repellendus eum sint illo omnis optio labore error.	96.519999999999996	93	0	2018-04-23 13:49:22.612933	2018-04-23 13:49:22.612933
71	Practical Aluminum Pants	Mollitia ea dolorem libero est et. Quaerat praesentium ut voluptatibus qui. Quos maiores aut. Eligendi laudantium eveniet quasi. Temporibus deserunt sed fuga sapiente.	53.3800000000000026	53.3800000000000026	0	2018-04-23 13:49:22.616085	2018-04-23 13:49:22.616085
72	Practical Rubber Bench	Rerum aliquam placeat ad nam molestiae. Tempore tempora vero quis. Quaerat ut et quam amet maiores qui cumque. Quam dolores voluptatem repellendus qui quae in. Quo at aliquid aut.	32.740000000000002	32.740000000000002	0	2018-04-23 13:49:22.619075	2018-04-23 13:49:22.619075
73	Small Rubber Car	Doloribus occaecati aut. Fugiat odio expedita rerum sit possimus nisi qui. A rerum praesentium ut adipisci.	33.6400000000000006	33.6400000000000006	0	2018-04-23 13:49:22.621997	2018-04-23 13:49:22.621997
74	Practical Bronze Bag	Sunt dolorem fuga aut necessitatibus. Illum non eos voluptas eos. At dolore mollitia illum aperiam incidunt consequuntur quaerat. Corporis dolore id quia. Ipsum et vero.	68.1099999999999994	68.1099999999999994	0	2018-04-23 13:49:22.625005	2018-04-23 13:49:22.625005
75	Small Aluminum Knife	Accusantium porro voluptatem dolores reiciendis omnis. Voluptas quisquam quia doloribus consequatur. Consequatur vitae natus repellendus. Accusamus amet unde. Quas harum voluptates.	77.0600000000000023	77.0600000000000023	0	2018-04-23 13:49:22.627885	2018-04-23 13:49:22.627885
76	Synergistic Linen Gloves	Dignissimos voluptatem debitis. Ullam explicabo at saepe. Officiis voluptatibus quasi omnis mollitia delectus magnam. Placeat dicta animi nesciunt minima. Vitae dignissimos blanditiis laboriosam minus dolor sit quia.	15.5999999999999996	4	32	2018-04-23 13:49:22.630923	2018-04-23 13:49:22.630923
77	Rustic Steel Keyboard	Ut doloremque ullam cum ipsam optio et. Quasi repellat dicta in ipsam error suscipit ut. Molestias ratione quas omnis minima aliquam. Dolore tempore ducimus nihil voluptas.	57.8599999999999994	57.8599999999999994	32	2018-04-23 13:49:22.633901	2018-04-23 13:49:22.633901
78	Rustic Iron Plate	Ut non repellendus et eos possimus porro. Et nihil inventore explicabo dolor vel et ut. Assumenda saepe excepturi qui nostrum. Et ut id qui vel dolorem ipsa earum.	28.3599999999999994	10	40	2018-04-23 13:49:22.637028	2018-04-23 13:49:22.637028
79	Aerodynamic Iron Plate	Dolorum nihil dolor non cupiditate et et. Ex libero sed dolores ratione consequatur eos et. Qui voluptates animi ea consequatur.	43.5600000000000023	6	0	2018-04-23 13:49:22.640158	2018-04-23 13:49:22.640158
80	Aerodynamic Plastic Wallet	Doloremque illo voluptates ut qui voluptatem. Quis dolores quas. Impedit in ducimus harum iste. Sit et repellat laboriosam eos est. A dolor ab.	91.980000000000004	91.980000000000004	6	2018-04-23 13:49:22.643126	2018-04-23 13:49:22.643126
81	Heavy Duty Paper Lamp	Velit similique rerum aut provident aut vel. Sequi ipsam perferendis voluptatem est aliquid laudantium quaerat. Fuga ipsa id non autem vel. Assumenda fugiat non exercitationem officia sequi et impedit.	98.4899999999999949	98.4899999999999949	18	2018-04-23 13:49:22.645953	2018-04-23 13:49:22.645953
82	Sleek Bronze Watch	Dolores consequatur sit est neque qui. Dolor quis quae blanditiis corrupti et expedita. Quisquam saepe dolores nesciunt eaque. Vitae dolor saepe adipisci magnam est. Occaecati quia optio tempora delectus quibusdam in ut.	65.8700000000000045	65.8700000000000045	0	2018-04-23 13:49:22.648894	2018-04-23 13:49:22.648894
83	Durable Steel Gloves	Suscipit distinctio voluptas nemo vel. Quam magni officiis id animi. Commodi rerum ratione minus velit.	14.6300000000000008	14.6300000000000008	0	2018-04-23 13:49:22.651835	2018-04-23 13:49:22.651835
84	Intelligent Plastic Shirt	Aut facere nesciunt deserunt commodi libero. Sunt omnis neque. Veniam quos aut consequatur et alias. Hic quo sunt.	45.4699999999999989	15	20	2018-04-23 13:49:22.654912	2018-04-23 13:49:22.654912
85	Fantastic Copper Gloves	Excepturi quia et. Ea et error ut magni dicta. Explicabo voluptas ut aut ipsam hic quia dolorem. Iure ut ab ipsam nostrum. Consequatur at veniam.	62.5200000000000031	35	0	2018-04-23 13:49:22.657995	2018-04-23 13:49:22.657995
86	Awesome Linen Knife	Eos qui alias optio. Voluptatem id iusto sit. Ab accusamus ratione.	59.9500000000000028	59.9500000000000028	0	2018-04-23 13:49:22.661405	2018-04-23 13:49:22.661405
87	Intelligent Aluminum Bottle	Qui ullam ut. A officia placeat harum aut tempore. Omnis inventore voluptatum odit fugit. Quo autem quisquam aut veniam. Omnis autem animi qui nisi consequuntur laboriosam optio.	71.1899999999999977	71.1899999999999977	39	2018-04-23 13:49:22.664399	2018-04-23 13:49:22.664399
88	Durable Paper Computer	Repudiandae repellat sed asperiores. Quam in architecto ipsa quia harum. Velit sapiente a. Numquam et sit eaque non voluptate. Sunt et omnis et itaque illo nemo.	76.5400000000000063	76.5400000000000063	0	2018-04-23 13:49:22.66753	2018-04-23 13:49:22.66753
89	Fantastic Linen Clock	Aspernatur veniam ea incidunt velit sunt. Possimus odit autem molestiae tenetur. Officia hic voluptas est occaecati quia porro amet.	54.8100000000000023	18	14	2018-04-23 13:49:22.670497	2018-04-23 13:49:22.670497
90	Synergistic Granite Watch	Quis ex sed. Voluptas minus quaerat aut labore qui optio. Unde consequatur quas. Beatae iste ea corrupti autem aliquid. Molestiae consectetur in numquam sed dolore blanditiis.	69.519999999999996	69.519999999999996	0	2018-04-23 13:49:22.673403	2018-04-23 13:49:22.673403
91	Fantastic Leather Watch	Quisquam aut temporibus nihil. Id eum asperiores amet illo sit architecto explicabo. Iure est et est. At doloribus numquam. Placeat neque natus enim amet nostrum.	92.4699999999999989	92.4699999999999989	19	2018-04-23 13:49:22.676446	2018-04-23 13:49:22.676446
92	Lightweight Plastic Shirt	Labore laudantium error. Ipsam ut aut harum quas. Laborum ut similique ipsam explicabo. Autem facere est optio labore. Nihil aut sit consequatur vero nostrum suscipit repellat.	94.2399999999999949	94.2399999999999949	0	2018-04-23 13:49:22.679323	2018-04-23 13:49:22.679323
93	Lightweight Leather Bag	Praesentium nihil est ratione consequuntur incidunt. Nobis quisquam officia. Quaerat quisquam deleniti quae blanditiis aut architecto.	10.3800000000000008	10.3800000000000008	22	2018-04-23 13:49:22.700413	2018-04-23 13:49:22.700413
94	Rustic Paper Car	Aliquam aperiam dolorum distinctio veniam eos consequuntur possimus. Iusto vero quo velit distinctio. Culpa odio laudantium voluptatibus ut ea adipisci impedit. Nulla doloribus mollitia aut laboriosam.	33.6300000000000026	33.6300000000000026	0	2018-04-23 13:49:22.703719	2018-04-23 13:49:22.703719
96	Lightweight Wooden Bag	Velit quia eaque quisquam dolor laborum ea dolorem. Iusto iure necessitatibus nobis ad inventore unde. Nisi dicta corrupti eius recusandae. Alias eligendi voluptatum.	95.75	95.75	4	2018-04-23 13:49:22.710615	2018-04-23 13:49:22.710615
97	Incredible Paper Table	Quo atque nostrum quia et. Nihil dolor iusto autem quis voluptatibus non. Consequatur eligendi nisi ipsam. A non ratione accusamus consequatur nihil sit est. Enim quidem sunt enim aut.	45.259999999999998	12	0	2018-04-23 13:49:22.72388	2018-04-23 13:49:22.72388
98	Ergonomic Rubber Pants	Voluptatem aliquam modi nesciunt rerum. Assumenda veniam libero qui. Quis est et a omnis tenetur.	95.3799999999999955	78	45	2018-04-23 13:49:22.72744	2018-04-23 13:49:22.72744
99	Rustic Bronze Clock	Laboriosam laudantium ut nisi sit dolores et sunt. Alias hic ut aut porro. Sint adipisci laudantium odio qui aliquid quis perferendis. In aspernatur et.	1.39999999999999991	1	6	2018-04-23 13:49:22.730869	2018-04-23 13:49:22.730869
100	Synergistic Plastic Watch	Omnis dolore molestias eum consequatur mollitia soluta. Non praesentium nemo et velit repellat. Et omnis explicabo. Exercitationem alias ea ex qui et a quidem. Accusamus voluptatem aut dolor voluptate et.	79.2099999999999937	61	0	2018-04-23 13:49:22.734321	2018-04-23 13:49:22.734321
101	Sleek Wool Watch	Sunt illo et. Quibusdam architecto molestiae voluptas explicabo. Dignissimos aspernatur nulla. Asperiores architecto molestiae.	84.4300000000000068	37	26	2018-04-23 13:49:22.737391	2018-04-23 13:49:22.737391
102	Mediocre Leather Chair	Dicta qui et vel. Magnam quia qui suscipit sint libero placeat nihil. Aut aliquam ratione aperiam et eum impedit provident. Quas quis voluptatem odio maiores voluptatum ut.	10.6699999999999999	1	15	2018-04-23 13:49:22.74165	2018-04-23 13:49:22.74165
103	Durable Marble Table	Nostrum nesciunt quia voluptatem ab maiores. Asperiores iusto quia consequuntur eius et minus possimus. Est qui et fuga. Et ut iste neque modi et earum. Ab quidem accusantium suscipit consectetur quia.	62.7700000000000031	14	0	2018-04-23 13:49:22.744989	2018-04-23 13:49:22.744989
104	Practical Wooden Pants	Veritatis enim omnis quas non rem repellat culpa. Iste voluptatem odit. Libero veritatis ex. Velit nesciunt beatae labore dolores.	19.5100000000000016	19.5100000000000016	23	2018-04-23 13:49:22.74791	2018-04-23 13:49:22.74791
105	Lightweight Paper Table	Soluta reiciendis eum exercitationem aut. Qui libero tempore molestiae. Aut a voluptas tempora omnis repudiandae. Repellendus enim necessitatibus consequatur.	25.1400000000000006	25.1400000000000006	21	2018-04-23 13:49:22.75095	2018-04-23 13:49:22.75095
106	Mediocre Aluminum Shoes	Quia porro non. Minus tenetur consequatur quasi et. Ut velit ratione beatae quia. Et fuga assumenda placeat repudiandae. Sunt rerum consectetur.	46.3699999999999974	1	33	2018-04-23 13:49:22.753974	2018-04-23 13:49:22.753974
107	Mediocre Copper Pants	Distinctio id deserunt aut fugiat doloremque ut nemo. Tenetur molestiae deserunt. Aspernatur delectus tempora adipisci accusamus perspiciatis ducimus. Autem numquam eum ut perferendis et magni. Et recusandae sit.	36.8699999999999974	12	40	2018-04-23 13:49:22.757064	2018-04-23 13:49:22.757064
108	Ergonomic Concrete Bench	Ipsam vel sapiente qui aut. Architecto voluptas voluptatem expedita quia fugit sunt. Sed nostrum molestiae. Animi vel dolor qui unde corrupti enim numquam. Omnis corporis unde quasi reprehenderit aut.	7.33000000000000007	7	0	2018-04-23 13:49:22.759985	2018-04-23 13:49:22.759985
109	Small Concrete Wallet	Voluptatem quia labore non eaque voluptatum esse. Vel repellat dolores ut earum ipsa perspiciatis. Et aperiam officiis nostrum neque sequi voluptates. Inventore blanditiis porro. Laboriosam vero aut ut qui temporibus inventore possimus.	15.1300000000000008	11	0	2018-04-23 13:49:22.762972	2018-04-23 13:49:22.762972
110	Incredible Silk Bag	Non perspiciatis harum sunt suscipit. Et fugiat nihil voluptas illo qui explicabo. Alias temporibus sequi aliquid occaecati.	96.6599999999999966	25	0	2018-04-23 13:49:22.776751	2018-04-23 13:49:22.776751
111	Awesome Copper Plate	Est autem iusto qui vel hic dolor sint. Minima voluptatem facere in similique sit dolor. Impedit explicabo numquam nobis omnis. Eos repudiandae eos aut quae.	9.21000000000000085	9	12	2018-04-23 13:49:22.780362	2018-04-23 13:49:22.780362
112	Durable Granite Car	Et blanditiis quis. Laboriosam tempore asperiores vel deserunt. Voluptate alias quo ut ea est voluptas.	30.8200000000000003	30.8200000000000003	0	2018-04-23 13:49:22.783282	2018-04-23 13:49:22.783282
113	Synergistic Paper Chair	Voluptatibus et minima qui beatae. Blanditiis sequi quia corporis placeat quas ut. Consequatur alias et doloribus et.	41.2999999999999972	41.2999999999999972	43	2018-04-23 13:49:22.786276	2018-04-23 13:49:22.786276
114	Synergistic Linen Bench	Est id iste nesciunt qui aliquam quo. Explicabo sint adipisci ut reprehenderit. Eius aliquid provident vel. Corrupti aut nisi quae in ab.	15.3100000000000005	15.3100000000000005	0	2018-04-23 13:49:22.789334	2018-04-23 13:49:22.789334
115	Fantastic Marble Shirt	Quia cumque dolorem quasi aut natus. Dolorum nisi et. Repellat sequi qui et tempore. Quam ducimus reprehenderit facilis ut. Quo eum magni animi necessitatibus.	44.8900000000000006	44.8900000000000006	34	2018-04-23 13:49:22.792516	2018-04-23 13:49:22.792516
116	Lightweight Iron Knife	Hic sunt et sit aperiam enim nulla. Quia et aut provident. Odio similique quidem. Atque voluptatum quo sed in autem.	86.4899999999999949	35	0	2018-04-23 13:49:22.795415	2018-04-23 13:49:22.795415
117	Intelligent Iron Watch	Ex asperiores et. Consectetur rerum cupiditate sit facere natus. Repellat et eos ratione quasi. Quia voluptates ducimus optio animi. Iste et nesciunt ipsam et esse ratione neque.	15.6199999999999992	10	33	2018-04-23 13:49:22.798335	2018-04-23 13:49:22.798335
118	Ergonomic Concrete Coat	Ipsa aut rerum optio ex quis fuga. Blanditiis quas velit et dicta omnis et. Qui facere est quae error animi quis praesentium. Repellat neque sint quae. Vero amet ut repellendus porro.	45.7899999999999991	45.7899999999999991	0	2018-04-23 13:49:22.801597	2018-04-23 13:49:22.801597
119	Gorgeous Paper Knife	Aut explicabo qui odio non. Eius sequi quasi ipsam voluptates. In deleniti quia sequi enim. Nemo sit nobis voluptatum. Qui nihil autem.	5.92999999999999972	2	0	2018-04-23 13:49:22.804912	2018-04-23 13:49:22.804912
120	Mediocre Plastic Knife	Illo et aut harum qui tempora magni. Eum ut illum nostrum a odit quia delectus. Qui officiis at aperiam numquam aut molestiae illo.	49.1400000000000006	25	0	2018-04-23 13:49:22.807905	2018-04-23 13:49:22.807905
121	Aerodynamic Bronze Knife	Nesciunt ipsa amet veritatis. Nihil magnam illum recusandae non qui soluta. Ut accusamus nisi alias ducimus.	51.0399999999999991	25	0	2018-04-23 13:49:22.810844	2018-04-23 13:49:22.810844
122	Awesome Concrete Gloves	Aut consequatur itaque nam quis quaerat rerum ad. Fuga doloribus dignissimos. Iste culpa reprehenderit omnis et velit et. Voluptatem aliquid deserunt ab sit eveniet. Et est deserunt error velit.	76.230000000000004	76.230000000000004	0	2018-04-23 13:49:22.813797	2018-04-23 13:49:22.813797
123	Enormous Marble Coat	Odit aliquid quidem doloremque ut. Temporibus earum est et laboriosam qui eius. Sed at pariatur soluta qui similique dolor quasi. Eius sit repellendus quae consequatur aperiam.	96.7099999999999937	13	0	2018-04-23 13:49:22.82757	2018-04-23 13:49:22.82757
124	Sleek Rubber Shirt	Occaecati reprehenderit fuga fugiat enim eos sequi. In eos rerum. Voluptatem rerum corporis quis sapiente similique mollitia rerum.	55.7999999999999972	55.7999999999999972	7	2018-04-23 13:49:22.831291	2018-04-23 13:49:22.831291
125	Durable Marble Hat	Voluptas repellendus quia omnis aut ipsam. Aut eum mollitia. Autem fuga quod est et repellendus.	34.75	19	0	2018-04-23 13:49:22.834747	2018-04-23 13:49:22.834747
126	Incredible Cotton Table	Sit tenetur eius cumque sit consequatur aut. Perspiciatis est voluptates harum sint voluptate facilis consectetur. Animi tempora voluptatem vitae facilis aut.	6.45000000000000018	3	33	2018-04-23 13:49:22.83787	2018-04-23 13:49:22.83787
127	Intelligent Concrete Chair	Veritatis minima et at voluptatem. Veniam officia magni sint consectetur et facere. Repudiandae voluptatum qui.	14.0299999999999994	9	0	2018-04-23 13:49:22.842269	2018-04-23 13:49:22.842269
128	Practical Wooden Clock	Temporibus animi quas enim rem non rerum in. Voluptas rerum dolor rerum ipsum exercitationem. Consectetur porro exercitationem molestias doloribus rem voluptas iusto.	71.3400000000000034	50	0	2018-04-23 13:49:22.845362	2018-04-23 13:49:22.845362
129	Lightweight Wooden Wallet	Ut eos architecto est sint beatae. Officiis doloribus aut hic accusantium et amet. Eos id veniam. Ut corrupti voluptate sit.	50.4200000000000017	50.4200000000000017	10	2018-04-23 13:49:22.84844	2018-04-23 13:49:22.84844
130	Gorgeous Iron Computer	Cupiditate officiis quos sapiente id. Blanditiis dolores voluptates error et sed. Qui nihil expedita fuga. Eaque nam beatae quam perspiciatis itaque corrupti. Repellat doloribus adipisci.	2.45000000000000018	1	0	2018-04-23 13:49:22.856336	2018-04-23 13:49:22.856336
131	Aerodynamic Silk Plate	Qui qui cupiditate optio. Sapiente et et. Est adipisci vel in quisquam labore.	59.7199999999999989	35	0	2018-04-23 13:49:22.859071	2018-04-23 13:49:22.859071
132	Small Rubber Shirt	Asperiores voluptas eos ipsum et. Eius suscipit similique. Illum qui qui quidem. Quia non distinctio qui et nam aspernatur. Rerum tenetur omnis.	41.8100000000000023	41.8100000000000023	0	2018-04-23 13:49:22.861917	2018-04-23 13:49:22.861917
133	Ergonomic Concrete Watch	Ipsam cupiditate consectetur aspernatur voluptas totam. Eum aut recusandae sed porro. Itaque sequi reprehenderit. Omnis placeat perspiciatis qui architecto ut.	58.9699999999999989	56	0	2018-04-23 13:49:22.864977	2018-04-23 13:49:22.864977
134	Incredible Silk Chair	Enim quae incidunt voluptatibus autem exercitationem aliquid earum. Recusandae provident maiores. Et veniam qui aspernatur veritatis fuga.	10.0800000000000001	10.0800000000000001	48	2018-04-23 13:49:22.868228	2018-04-23 13:49:22.868228
135	Intelligent Concrete Shoes	Labore voluptate esse. Voluptas pariatur voluptatem perspiciatis ipsam reprehenderit temporibus. Illo quisquam odit voluptatem ex voluptatem. Quos explicabo nihil quia.	48.6099999999999994	48.6099999999999994	7	2018-04-23 13:49:22.871484	2018-04-23 13:49:22.871484
136	Rustic Cotton Shoes	Magnam fugiat quis consectetur inventore dolor illum. Dolorem cupiditate sed quia temporibus sapiente quo. Quia et consectetur sint fugit quod sit dignissimos.	90.6400000000000006	40	0	2018-04-23 13:49:22.874331	2018-04-23 13:49:22.874331
137	Incredible Plastic Lamp	Fugit praesentium possimus sit sunt. Voluptatem praesentium soluta aut sunt. Eligendi eum dolore voluptatem fugiat id tenetur.	91.0300000000000011	91.0300000000000011	0	2018-04-23 13:49:22.877184	2018-04-23 13:49:22.877184
138	Heavy Duty Paper Table	Aut facere dignissimos consequatur expedita. Quasi commodi quisquam molestiae quis ad. Repellendus ut voluptates.	33.7899999999999991	33.7899999999999991	0	2018-04-23 13:49:22.880062	2018-04-23 13:49:22.880062
139	Aerodynamic Aluminum Pants	Quis aut asperiores. Dolorem velit qui cupiditate cum rem animi perferendis. Id amet asperiores.	79.1899999999999977	79.1899999999999977	10	2018-04-23 13:49:22.88302	2018-04-23 13:49:22.88302
140	Durable Aluminum Chair	Qui nihil reiciendis sunt asperiores. Excepturi et doloribus omnis quia. Aliquid corporis saepe optio nulla velit nihil omnis. Aliquid enim et illo pariatur quasi ea.	47.1099999999999994	47.1099999999999994	0	2018-04-23 13:49:22.886034	2018-04-23 13:49:22.886034
141	Fantastic Paper Table	Distinctio culpa impedit voluptatem sint. Qui odit provident fuga dolor atque. Quas commodi qui. Et sed ut sint doloribus.	17.7199999999999989	17.7199999999999989	25	2018-04-23 13:49:22.889092	2018-04-23 13:49:22.889092
142	Aerodynamic Wooden Bench	Debitis velit tempore. Odit reiciendis sapiente rerum natus praesentium ab. Aliquam possimus praesentium.	75.769999999999996	7	46	2018-04-23 13:49:22.892037	2018-04-23 13:49:22.892037
143	Fantastic Steel Lamp	Enim soluta rem ut rerum beatae consectetur. Enim at minima ducimus aut doloribus. Distinctio animi et. Voluptas architecto laboriosam natus sint enim.	53.6899999999999977	21	0	2018-04-23 13:49:22.895051	2018-04-23 13:49:22.895051
144	Enormous Steel Pants	Dolorum error nemo qui ut placeat beatae. Omnis voluptatem eligendi neque non et aut voluptas. Enim aperiam ea repudiandae vitae facere. Sit animi velit aperiam temporibus libero.	82.9500000000000028	65	5	2018-04-23 13:49:22.897898	2018-04-23 13:49:22.897898
145	Durable Granite Computer	Est delectus et. Dolorem voluptatem et repudiandae deserunt facere accusantium qui. Saepe nam ducimus recusandae corporis quia ut. Ut facere neque.	92.7999999999999972	92.7999999999999972	0	2018-04-23 13:49:22.900862	2018-04-23 13:49:22.900862
146	Intelligent Granite Shoes	Architecto natus aut pariatur error tempora magnam sunt. Voluptatum dignissimos quia occaecati quia ipsam odio molestias. Ipsam iure consectetur sed. Rerum veniam placeat rerum facere commodi.	60.4299999999999997	52	29	2018-04-23 13:49:22.903952	2018-04-23 13:49:22.903952
147	Durable Bronze Car	Aliquam ea molestiae modi vitae ut qui. Itaque delectus ratione et. Voluptate iste aliquid consequatur esse voluptas. Non quas facere ipsa quos sequi ipsam placeat. Iusto qui nobis.	27.9499999999999993	27.9499999999999993	0	2018-04-23 13:49:22.907037	2018-04-23 13:49:22.907037
148	Enormous Granite Clock	Sequi delectus qui ut mollitia nisi nostrum. Voluptatem dignissimos et dolorem. Provident inventore dolorem.	74.8799999999999955	74	0	2018-04-23 13:49:22.910006	2018-04-23 13:49:22.910006
149	Sleek Plastic Computer	Aut voluptas voluptas. Nulla dolore quam delectus. Quia veritatis temporibus illum. Itaque maiores beatae qui quia aperiam. Alias itaque autem in asperiores voluptas nesciunt.	2.31000000000000005	2	0	2018-04-23 13:49:22.912929	2018-04-23 13:49:22.912929
150	Durable Granite Table	Nam aut repudiandae sit. Veniam assumenda deserunt omnis eligendi repellat reprehenderit dolore. Dignissimos porro est impedit sit qui.	17.7699999999999996	17.7699999999999996	0	2018-04-23 13:49:22.915828	2018-04-23 13:49:22.915828
151	Fantastic Silk Gloves	Sit vel amet perferendis error et quidem quae. Aliquid dolorem optio temporibus ullam autem. Et vel deleniti reprehenderit et minus libero accusamus.	48.6700000000000017	48.6700000000000017	0	2018-04-23 13:49:22.918879	2018-04-23 13:49:22.918879
152	Ergonomic Leather Clock	Laudantium voluptatibus eum. Omnis consectetur dolorem minus debitis. Aut sapiente non amet accusantium sed. Placeat est nihil harum ut sed. Labore totam et at cum sapiente minus.	33.1300000000000026	17	20	2018-04-23 13:49:22.934204	2018-04-23 13:49:22.934204
153	Gorgeous Steel Computer	Id dolores nam voluptatem. Aliquid repellat debitis magni explicabo vero temporibus. Inventore rerum reprehenderit magnam recusandae laudantium. Et similique sapiente nam est consequatur aut.	88.6899999999999977	88.6899999999999977	0	2018-04-23 13:49:22.937515	2018-04-23 13:49:22.937515
154	Lightweight Cotton Coat	Iusto harum velit. Dolores eaque praesentium quibusdam. Dolorem cumque non sit voluptatem culpa enim.	7.16000000000000014	7	0	2018-04-23 13:49:22.940502	2018-04-23 13:49:22.940502
155	Gorgeous Steel Car	Alias rerum dicta nesciunt. Qui odio nemo eum modi et. Eaque velit et perferendis optio non minus. Ex eos porro facere laborum.	1.04000000000000004	1.04000000000000004	14	2018-04-23 13:49:22.943518	2018-04-23 13:49:22.943518
156	Ergonomic Leather Gloves	Architecto non magnam molestiae omnis. Aut veritatis veniam voluptatem ut. Et voluptates voluptas qui blanditiis placeat enim consequuntur.	63.7899999999999991	63.7899999999999991	1	2018-04-23 13:49:22.946628	2018-04-23 13:49:22.946628
157	Gorgeous Linen Coat	Fugiat reiciendis odio et voluptas aut sed. Et dicta quo dolor enim recusandae. Provident molestiae labore et itaque est aliquam qui. Non quia voluptatem dolor minus ut ut. Quo ipsam asperiores laborum.	67.1200000000000045	11	0	2018-04-23 13:49:22.95016	2018-04-23 13:49:22.95016
158	Gorgeous Aluminum Clock	Voluptatum laudantium vel et. Omnis et facere earum rerum modi maiores. Eos distinctio voluptatem voluptatibus consequatur.	40.3100000000000023	40.3100000000000023	9	2018-04-23 13:49:22.953354	2018-04-23 13:49:22.953354
159	Awesome Bronze Pants	Aperiam harum magni. Adipisci nesciunt ea consequatur. Aspernatur doloremque eaque. Ea cum est tempora eos nihil vero.	23.8000000000000007	14	49	2018-04-23 13:49:22.956268	2018-04-23 13:49:22.956268
254	Durable Leather Pants	Modi ex consequatur impedit iure omnis. Nobis iusto amet velit. Rerum aut nihil minus necessitatibus alias placeat dolor.	15.8300000000000001	13	0	2018-04-23 13:49:23.273179	2018-04-23 13:49:23.273179
160	Synergistic Concrete Wallet	Ut eius dolore commodi dolor sunt. Tempora nemo temporibus delectus autem ut aliquam. Maxime cumque dolores et doloremque aut molestiae doloribus. Dolores ut est accusantium id harum est ea. Ex quaerat earum eaque nesciunt ratione.	66.4200000000000017	47	0	2018-04-23 13:49:22.959176	2018-04-23 13:49:22.959176
161	Synergistic Iron Lamp	Ipsam impedit aliquam et est eius vitae. Ea quia omnis nam. Fugit dolores est. Quibusdam maiores quo atque rerum dolorem nisi ea. Vero iste ipsa dolor et eveniet.	36.5399999999999991	25	26	2018-04-23 13:49:22.962128	2018-04-23 13:49:22.962128
162	Awesome Bronze Plate	Reiciendis et eius omnis doloribus. Ea omnis nesciunt aperiam voluptas ut quasi. Nemo eum voluptatem provident exercitationem eius quo. Quos atque repellat ut minus. Consequatur et ut.	51.4500000000000028	11	16	2018-04-23 13:49:22.964984	2018-04-23 13:49:22.964984
163	Aerodynamic Aluminum Knife	Vel quod qui mollitia quidem asperiores rerum quaerat. Aliquam minus officia est quas. Voluptatem in harum beatae sapiente suscipit unde a. Et facere omnis quis expedita ullam. Quae aspernatur doloremque saepe temporibus voluptatem et dolore.	23.2300000000000004	3	22	2018-04-23 13:49:22.967868	2018-04-23 13:49:22.967868
164	Synergistic Concrete Shirt	Laudantium enim nostrum temporibus dolorem impedit. Suscipit et voluptates corrupti aliquam unde. Est id dolor quis. Commodi inventore assumenda quae nihil. Sed atque cumque temporibus non natus ipsam.	6.88999999999999968	6.88999999999999968	27	2018-04-23 13:49:22.971539	2018-04-23 13:49:22.971539
165	Enormous Steel Bench	Tempora nostrum laborum est odio accusantium sed non. Sed ut autem. Odio odit quam molestiae temporibus qui. Natus veritatis ea esse.	91.9000000000000057	91.9000000000000057	0	2018-04-23 13:49:22.974918	2018-04-23 13:49:22.974918
166	Enormous Plastic Lamp	Ipsam explicabo maiores animi sapiente eos saepe temporibus. Consequatur dolores quos voluptate ad quisquam et. Saepe qui voluptates rem unde voluptatem eos sunt. Veniam dolores officia et aliquid est. Veritatis enim at consequatur libero nihil.	28.7399999999999984	7	21	2018-04-23 13:49:22.978007	2018-04-23 13:49:22.978007
167	Incredible Marble Wallet	Voluptates dolore est rem. Quam numquam enim dolorem ut. Suscipit repellendus veritatis nemo reprehenderit soluta.	31.9600000000000009	22	0	2018-04-23 13:49:22.981005	2018-04-23 13:49:22.981005
168	Mediocre Wool Chair	Voluptatem et fugit sequi quae. Nulla qui dolorem vitae. Eligendi asperiores sed magni cum et perspiciatis accusantium.	83.0300000000000011	83.0300000000000011	22	2018-04-23 13:49:22.983973	2018-04-23 13:49:22.983973
169	Durable Granite Coat	Qui at architecto reiciendis expedita voluptatem. Dignissimos reprehenderit ut repudiandae esse. Maxime dignissimos sit.	46.75	46.75	50	2018-04-23 13:49:22.987039	2018-04-23 13:49:22.987039
170	Mediocre Bronze Wallet	Dolor rerum placeat doloribus et. Neque eos in odit sapiente omnis iure quidem. Possimus nostrum voluptate et accusamus. Voluptatem odio tempora suscipit fugiat temporibus aperiam. Distinctio odit nihil.	38.8800000000000026	21	0	2018-04-23 13:49:22.98992	2018-04-23 13:49:22.98992
171	Durable Copper Car	Cum voluptas est suscipit itaque. Maiores magni consequatur aut. In nihil quidem aliquam veniam. Molestias placeat impedit qui distinctio quia. Est sed iure sed harum dolores.	9.46000000000000085	9.46000000000000085	20	2018-04-23 13:49:22.992806	2018-04-23 13:49:22.992806
172	Gorgeous Paper Pants	Magni facere deserunt sit dicta. Eum beatae cum rem sit et quidem. Voluptatem quaerat sed.	70.0100000000000051	70.0100000000000051	31	2018-04-23 13:49:22.995618	2018-04-23 13:49:22.995618
173	Gorgeous Wooden Shoes	Esse sunt iure eum. Dolor ullam ea exercitationem accusamus. Sunt ea beatae ut ut.	12.1899999999999995	12.1899999999999995	0	2018-04-23 13:49:22.998606	2018-04-23 13:49:22.998606
174	Synergistic Silk Clock	Id quis esse. Sequi et tenetur culpa omnis. Numquam consectetur dolorem in quia consequatur. Tenetur unde facere.	72.0900000000000034	72.0900000000000034	0	2018-04-23 13:49:23.001953	2018-04-23 13:49:23.001953
175	Mediocre Aluminum Bench	Quasi dignissimos consectetur inventore minus quia. Iste sint rerum magnam. Nesciunt officia quia aut neque incidunt. Ipsa rem eveniet qui odio enim magnam quia.	67.0799999999999983	35	21	2018-04-23 13:49:23.005152	2018-04-23 13:49:23.005152
176	Intelligent Paper Coat	Doloribus eos nihil. Pariatur voluptates et dolore doloremque. Saepe ut qui earum omnis vitae.	51.8400000000000034	51.8400000000000034	0	2018-04-23 13:49:23.008013	2018-04-23 13:49:23.008013
177	Rustic Plastic Shoes	Ad et aut molestias omnis aliquid possimus. Est aliquam ratione accusamus totam consequatur qui. Quae et omnis eaque. Necessitatibus sunt quis iusto aspernatur officiis ipsum voluptas. Sint dignissimos doloremque in.	34.6099999999999994	34.6099999999999994	45	2018-04-23 13:49:23.011077	2018-04-23 13:49:23.011077
178	Ergonomic Paper Shirt	Odit eaque ducimus ullam. Dolore nihil ex ad similique nobis provident animi. Voluptatibus et cum sit itaque labore eveniet velit. Expedita inventore molestiae vero esse mollitia deserunt quia.	61.3800000000000026	61.3800000000000026	32	2018-04-23 13:49:23.014066	2018-04-23 13:49:23.014066
179	Ergonomic Cotton Hat	Soluta laboriosam mollitia laborum sint accusantium. Voluptas ipsa velit fuga. Et iste vel saepe.	71.7900000000000063	67	44	2018-04-23 13:49:23.017035	2018-04-23 13:49:23.017035
180	Practical Granite Lamp	Nobis nihil harum. Sit consequatur tempora ab sunt voluptates eligendi. Doloribus aut quod ex dolores voluptas laboriosam porro. Fugiat dolor culpa quae dicta autem quod.	95.5600000000000023	95.5600000000000023	31	2018-04-23 13:49:23.020123	2018-04-23 13:49:23.020123
181	Heavy Duty Wooden Keyboard	Ullam ipsam magnam. Cupiditate debitis quam quis totam qui voluptatem. Accusamus quibusdam nesciunt voluptatem quisquam.	87.1400000000000006	16	0	2018-04-23 13:49:23.022961	2018-04-23 13:49:23.022961
182	Ergonomic Plastic Shirt	Ut laudantium id in est sit quos. Ut ab officiis. Numquam velit suscipit.	27.8399999999999999	27.8399999999999999	0	2018-04-23 13:49:23.025765	2018-04-23 13:49:23.025765
183	Sleek Bronze Clock	Ea reiciendis minima voluptas. Nulla et soluta ut. Eum corrupti dolorum culpa. Eveniet dolor architecto.	86.8799999999999955	29	0	2018-04-23 13:49:23.028681	2018-04-23 13:49:23.028681
184	Sleek Plastic Wallet	Sit aut veniam aspernatur quia aut sint. Molestias perspiciatis fuga sed est. In voluptatum a quia cumque architecto. Molestias beatae aperiam aut est recusandae cupiditate similique. Ullam rem dicta mollitia possimus aperiam ea.	30.379999999999999	30.379999999999999	11	2018-04-23 13:49:23.031578	2018-04-23 13:49:23.031578
185	Incredible Rubber Bench	Suscipit occaecati voluptas saepe totam nisi dolorem. Consequatur ratione alias eum omnis. At nisi ducimus exercitationem consequatur est mollitia. Pariatur nemo ad quisquam. Consequuntur repellat ipsa magni omnis saepe iure.	17.0199999999999996	17.0199999999999996	0	2018-04-23 13:49:23.034632	2018-04-23 13:49:23.034632
186	Intelligent Paper Bag	Iusto incidunt non ab. Atque ex repudiandae nisi aut eius harum optio. Provident neque excepturi. Eveniet voluptas non beatae eos vero doloribus. Quas amet non totam laudantium atque illum.	34.1599999999999966	34	0	2018-04-23 13:49:23.037792	2018-04-23 13:49:23.037792
187	Incredible Granite Shirt	Praesentium ut a cum vel. Inventore doloremque fuga ad consequatur vel et. Et aut optio consectetur quasi. Voluptates dolorem dolor. Provident eligendi aliquid officiis aut quos.	13.6300000000000008	13.6300000000000008	25	2018-04-23 13:49:23.040923	2018-04-23 13:49:23.040923
188	Practical Plastic Car	Impedit cupiditate omnis architecto. Eaque qui consequatur quasi suscipit porro eum dolorem. Et facilis natus et quod. Quas iste laboriosam est consequatur non et.	50.7700000000000031	50.7700000000000031	36	2018-04-23 13:49:23.043896	2018-04-23 13:49:23.043896
189	Durable Linen Bottle	Et quia quas enim deserunt. Iste aliquam rerum vitae repudiandae vel facere. Tempora voluptate unde.	6.65000000000000036	5	2	2018-04-23 13:49:23.046763	2018-04-23 13:49:23.046763
190	Practical Rubber Car	Beatae molestiae rerum quas ipsum. Corrupti exercitationem sint quia nisi voluptatem fuga magnam. Beatae et saepe occaecati. Ipsam iste laborum non quas dolor itaque dolorem.	20.1099999999999994	20.1099999999999994	0	2018-04-23 13:49:23.049557	2018-04-23 13:49:23.049557
191	Sleek Granite Watch	Non id ad eius necessitatibus facere omnis voluptas. Rerum impedit quod quidem molestiae fugit iusto. Quo odit in unde. Ut ea animi quod et quia.	81.1400000000000006	81.1400000000000006	0	2018-04-23 13:49:23.066127	2018-04-23 13:49:23.066127
192	Heavy Duty Steel Bag	Atque ducimus ut sit. Temporibus veritatis et quas nobis a id nesciunt. Ab culpa id. Eveniet quos et dolores minus nobis ut accusantium.	87.230000000000004	87.230000000000004	11	2018-04-23 13:49:23.069644	2018-04-23 13:49:23.069644
193	Awesome Cotton Car	Suscipit vitae architecto possimus sed repudiandae qui. Asperiores hic error non debitis voluptates. Voluptatem et et est eligendi et. Repudiandae cum libero.	37.4500000000000028	37.4500000000000028	0	2018-04-23 13:49:23.072572	2018-04-23 13:49:23.072572
194	Ergonomic Paper Lamp	Non ex sit laudantium. Est ex ipsum cupiditate accusamus asperiores sint. Nihil ullam aut inventore provident ut. Quis beatae cupiditate consequatur molestiae qui illum repudiandae.	84.6599999999999966	80	0	2018-04-23 13:49:23.075457	2018-04-23 13:49:23.075457
195	Fantastic Concrete Knife	Non eum quia. Aut accusantium aut doloremque sit reiciendis. Placeat sit corrupti nulla beatae vero autem non. Aut occaecati est necessitatibus.	18.0300000000000011	18.0300000000000011	47	2018-04-23 13:49:23.078229	2018-04-23 13:49:23.078229
196	Mediocre Marble Clock	Excepturi minus ducimus optio. Maxime maiores animi quidem mollitia dolorem quod. Perspiciatis consequatur vero aut unde quidem voluptas. Nam ipsa quo. Commodi aperiam reprehenderit quo optio dicta.	47.3699999999999974	16	2	2018-04-23 13:49:23.081395	2018-04-23 13:49:23.081395
197	Fantastic Wool Plate	Aut eum voluptatem facere. Quibusdam id voluptas sed culpa. Tempora consequuntur id quia corrupti totam dicta sint. Delectus repellat quisquam ullam est beatae maxime consequatur. Aperiam non architecto voluptas est.	26.9800000000000004	16	0	2018-04-23 13:49:23.084417	2018-04-23 13:49:23.084417
198	Incredible Copper Wallet	Sit distinctio provident eligendi cum architecto. Officiis omnis voluptatibus blanditiis magni ullam. Consequatur debitis illum voluptas eligendi doloribus. Sequi similique vel. Facilis vel sint amet ratione nobis a qui.	57.5799999999999983	21	0	2018-04-23 13:49:23.087565	2018-04-23 13:49:23.087565
199	Incredible Copper Bottle	Placeat perspiciatis in. Officia cupiditate culpa. Sed officia qui molestiae praesentium est ullam. Quidem vel sequi eum. Eveniet aut laboriosam et est impedit tempora ut.	14.8599999999999994	12	0	2018-04-23 13:49:23.090596	2018-04-23 13:49:23.090596
200	Small Marble Watch	Ratione id fugit voluptatem dolores in. Quia sint et iste pariatur. Et rem voluptatem.	20.9800000000000004	20.9800000000000004	0	2018-04-23 13:49:23.093847	2018-04-23 13:49:23.093847
201	Ergonomic Wool Lamp	Aut repellendus qui adipisci. Earum delectus ab. Fugit iure voluptatem alias. Officia dolorem fuga impedit.	8.46000000000000085	1	5	2018-04-23 13:49:23.096756	2018-04-23 13:49:23.096756
202	Lightweight Iron Wallet	Aliquid sed harum sit ea. Enim ipsa blanditiis commodi perferendis. Repellat earum consequatur quam quidem dolorem cumque.	61.259999999999998	61.259999999999998	24	2018-04-23 13:49:23.099623	2018-04-23 13:49:23.099623
203	Ergonomic Steel Hat	Ut vitae rerum voluptas maiores velit. Perferendis aut neque quia. Et ea ex similique tempore. Nulla nemo ipsum.	63.1799999999999997	56	0	2018-04-23 13:49:23.10274	2018-04-23 13:49:23.10274
204	Awesome Wool Lamp	Quis quas libero. Aliquid qui delectus nihil sit asperiores. Sit aut rerum.	93.8199999999999932	70	0	2018-04-23 13:49:23.105832	2018-04-23 13:49:23.105832
205	Intelligent Linen Keyboard	Qui cupiditate consequuntur. Et illum cupiditate. Architecto est deleniti exercitationem suscipit neque praesentium.	97.2999999999999972	97.2999999999999972	37	2018-04-23 13:49:23.108728	2018-04-23 13:49:23.108728
206	Sleek Wool Lamp	Et consequatur accusantium dolorem non voluptatem illo. Qui enim velit itaque voluptas facilis sed ut. Est sed rerum et dolorum. Qui ut consequuntur dolores corrupti. Ex eveniet consectetur est temporibus in illo amet.	16.25	16.25	18	2018-04-23 13:49:23.111791	2018-04-23 13:49:23.111791
207	Aerodynamic Rubber Shoes	Accusantium consequatur ea tempore repellendus laboriosam voluptates. Dolor commodi deserunt recusandae enim. Est numquam et.	11.1999999999999993	11.1999999999999993	45	2018-04-23 13:49:23.114699	2018-04-23 13:49:23.114699
208	Rustic Wool Wallet	Debitis eius aut qui sit. Doloribus officiis voluptatem quo rerum praesentium quo maxime. Inventore sed provident assumenda. Dignissimos aut nam id.	81.8199999999999932	62	13	2018-04-23 13:49:23.117916	2018-04-23 13:49:23.117916
209	Sleek Aluminum Bag	Eaque aut minus iste. Sunt sequi rerum et error magni. Molestias tempore excepturi ipsam ducimus adipisci ut nostrum.	13.0500000000000007	13.0500000000000007	0	2018-04-23 13:49:23.121145	2018-04-23 13:49:23.121145
210	Mediocre Concrete Watch	Illum voluptas suscipit. Et repellendus magni rerum qui qui explicabo quam. Quaerat est necessitatibus dolores vero sint voluptas. Animi iure unde ullam nesciunt voluptatibus.	13.2100000000000009	13.2100000000000009	0	2018-04-23 13:49:23.124093	2018-04-23 13:49:23.124093
211	Fantastic Paper Car	Est aut optio nihil. Sed dolorum dolorem perspiciatis dolorem. Nam qui nihil quidem nesciunt cumque sequi. Voluptatem suscipit est rem.	18.5799999999999983	18.5799999999999983	0	2018-04-23 13:49:23.129133	2018-04-23 13:49:23.129133
212	Incredible Copper Pants	Maiores dicta ex rerum magnam distinctio autem. Iure sapiente dolor ex incidunt. Rerum rerum dolorem mollitia ut aut eum. Voluptas veniam molestiae.	63.8800000000000026	53	0	2018-04-23 13:49:23.13198	2018-04-23 13:49:23.13198
213	Ergonomic Rubber Hat	Assumenda mollitia enim. Animi voluptas odit. Consequatur et optio officia. Et minima adipisci id.	56.4699999999999989	56.4699999999999989	2	2018-04-23 13:49:23.13695	2018-04-23 13:49:23.13695
214	Lightweight Paper Computer	Aut dolor voluptatem omnis. Non numquam labore debitis id rerum qui qui. Id voluptates sed quibusdam quo voluptatem sequi. Et quia et sunt.	43.490000000000002	43.490000000000002	10	2018-04-23 13:49:23.139857	2018-04-23 13:49:23.139857
215	Awesome Granite Shirt	Enim iste velit beatae itaque tempora. Adipisci nulla repellat magnam doloribus earum commodi. Labore voluptas odio eligendi rerum rerum. Libero minima ut odio.	92.5100000000000051	61	0	2018-04-23 13:49:23.142955	2018-04-23 13:49:23.142955
216	Enormous Rubber Wallet	Quam explicabo quis velit nihil. Ipsam sed reiciendis explicabo ut molestiae ipsa quo. Consequuntur dolorem qui. Qui sapiente dolorem quas.	3.72999999999999998	2	22	2018-04-23 13:49:23.146067	2018-04-23 13:49:23.146067
217	Ergonomic Aluminum Shirt	Accusantium voluptatibus qui inventore et et quis. Animi tenetur ea et eos occaecati eligendi id. Quo accusamus veniam. Est veritatis repudiandae eligendi voluptatum. Et dolore et vitae officiis eum maiores odio.	18.2699999999999996	18.2699999999999996	1	2018-04-23 13:49:23.149181	2018-04-23 13:49:23.149181
218	Lightweight Steel Bottle	Est dolorum occaecati. Et amet voluptas in fugit ut ipsam eaque. Delectus a voluptatem et sint. Qui et odio cumque distinctio a at. Accusantium harum sed.	31.5500000000000007	31.5500000000000007	0	2018-04-23 13:49:23.152245	2018-04-23 13:49:23.152245
219	Enormous Copper Shirt	Delectus ullam ducimus. Laborum impedit quaerat. Unde error incidunt excepturi sint eaque ab. Ducimus illo tempora rerum ut.	55.2000000000000028	55.2000000000000028	23	2018-04-23 13:49:23.155332	2018-04-23 13:49:23.155332
220	Gorgeous Steel Plate	Nemo non qui. Est dolorum quae tenetur et cumque. Dolore sit reiciendis velit.	63.6000000000000014	63.6000000000000014	0	2018-04-23 13:49:23.158265	2018-04-23 13:49:23.158265
221	Heavy Duty Wool Clock	Modi deleniti inventore ut recusandae consequatur. Assumenda et rerum voluptatem id debitis. Voluptatibus architecto exercitationem nam cupiditate qui inventore.	35.0300000000000011	26	0	2018-04-23 13:49:23.161077	2018-04-23 13:49:23.161077
222	Awesome Plastic Shoes	Rerum ratione tempora. Dolore animi rem at. Ut delectus id ut non atque dolor nemo.	18.8099999999999987	5	28	2018-04-23 13:49:23.163948	2018-04-23 13:49:23.163948
223	Enormous Cotton Gloves	Fugiat at eaque id aliquid. Earum repellendus autem. Sed voluptate tempore ea aliquid.	26.7800000000000011	23	0	2018-04-23 13:49:23.166839	2018-04-23 13:49:23.166839
224	Enormous Linen Lamp	Incidunt omnis quasi consequatur. Et aut cum sed ipsam. Aut molestiae possimus et aliquid error. Aspernatur ex neque et consequuntur inventore.	33.2199999999999989	17	49	2018-04-23 13:49:23.169967	2018-04-23 13:49:23.169967
225	Aerodynamic Granite Shoes	Quia maiores distinctio optio. Nemo consequatur et et numquam est nam maiores. Placeat eos nobis magnam non provident vel quam. Dolorem facilis velit mollitia totam incidunt voluptatem. Iure quia doloremque occaecati quo est.	13.0600000000000005	1	0	2018-04-23 13:49:23.17303	2018-04-23 13:49:23.17303
226	Aerodynamic Concrete Gloves	In velit molestiae enim ut recusandae. Recusandae et laboriosam eum est. Totam aspernatur error ad. Qui hic aut harum eum et. Sint dicta dolor tempora pariatur vitae amet et.	5.75	2	8	2018-04-23 13:49:23.17626	2018-04-23 13:49:23.17626
227	Practical Aluminum Bottle	Voluptatibus dolor ex autem id voluptatum harum. Veritatis praesentium voluptatibus optio voluptas nulla aliquid delectus. Dolores impedit qui.	81.6099999999999994	81.6099999999999994	29	2018-04-23 13:49:23.179114	2018-04-23 13:49:23.179114
228	Synergistic Plastic Pants	Consequatur hic et et. Qui culpa nihil facilis. Ut qui sequi. Error odit consequatur accusantium sint placeat delectus cumque.	0.25	1.77473503185129911	0	2018-04-23 13:49:23.182041	2018-04-23 13:49:23.182041
229	Sleek Granite Keyboard	Assumenda sapiente dolorem in harum corporis pariatur. Omnis tenetur porro. Molestiae rerum ut recusandae qui.	30.3299999999999983	30.3299999999999983	30	2018-04-23 13:49:23.187341	2018-04-23 13:49:23.187341
230	Gorgeous Marble Bag	Molestias recusandae in quia. Perferendis aperiam doloribus. Aut saepe ea suscipit aut nisi dolores. Rerum cum dolores temporibus minima. Sit ea eos qui.	6.91000000000000014	5	0	2018-04-23 13:49:23.190328	2018-04-23 13:49:23.190328
231	Sleek Leather Bottle	Alias est beatae inventore laborum molestiae. Veritatis est et similique. Sit aspernatur est tempore ipsum voluptas ea. Illum excepturi provident non voluptates. Ex quis soluta.	29.0500000000000007	29.0500000000000007	0	2018-04-23 13:49:23.195706	2018-04-23 13:49:23.195706
232	Aerodynamic Cotton Clock	Praesentium velit velit modi id nisi. Aut assumenda temporibus rerum iure. Culpa repudiandae debitis facere voluptatibus. Corrupti consequuntur et. Tenetur commodi tempora repellat maxime a soluta mollitia.	60.7199999999999989	25	33	2018-04-23 13:49:23.201014	2018-04-23 13:49:23.201014
233	Sleek Silk Bottle	Non qui velit mollitia necessitatibus quia. Repellendus labore quasi praesentium molestiae unde quisquam est. Magnam laudantium velit est eligendi. Minus dolore enim temporibus quae quis sit deserunt. Aliquid similique totam.	72.9699999999999989	13	0	2018-04-23 13:49:23.204086	2018-04-23 13:49:23.204086
234	Aerodynamic Linen Plate	In non quisquam atque quibusdam dolore dolorem. Nihil molestiae doloremque quia assumenda praesentium hic. Quod esse enim. Distinctio ab ut asperiores sed. Assumenda aliquid eos.	20.8200000000000003	7	0	2018-04-23 13:49:23.207101	2018-04-23 13:49:23.207101
235	Enormous Wool Bag	Illo quos tempore aliquam eum. Consequuntur voluptate iure blanditiis sit consectetur animi. Est molestiae quibusdam reiciendis odit assumenda ab. Soluta nisi dolor.	64.0600000000000023	12	0	2018-04-23 13:49:23.210026	2018-04-23 13:49:23.210026
236	Ergonomic Plastic Hat	Voluptatem eos quaerat nostrum esse. Rerum aut veniam rerum delectus enim illum. Aspernatur sapiente quo. Aut iusto commodi quisquam reiciendis. Dolores beatae sapiente omnis doloremque at.	95.6400000000000006	82	38	2018-04-23 13:49:23.212933	2018-04-23 13:49:23.212933
237	Rustic Rubber Clock	Laborum praesentium quia distinctio aut. Doloremque non est sit ex rerum. Sed molestias autem odit ullam et aliquid sed. Enim libero dolores quod aut. Mollitia quis non sit ullam ut.	76.3400000000000034	76.3400000000000034	0	2018-04-23 13:49:23.215821	2018-04-23 13:49:23.215821
238	Incredible Marble Car	Sed fuga nam velit. Sint cumque iusto consequuntur. Qui nostrum magni explicabo eum illo esse. Ea quibusdam ea repudiandae voluptatem minima. Est quia et sed et ea aut ut.	93.6500000000000057	34	0	2018-04-23 13:49:23.219274	2018-04-23 13:49:23.219274
239	Awesome Silk Computer	Saepe dolor exercitationem ipsa vel. Pariatur consequatur reprehenderit omnis quasi ut occaecati. Dolor est est quasi eum sed eos id. Ratione qui ipsa architecto occaecati maxime est consectetur. Inventore aut sed ducimus est consequatur rerum.	67.4300000000000068	67.4300000000000068	17	2018-04-23 13:49:23.222554	2018-04-23 13:49:23.222554
240	Awesome Marble Wallet	Laudantium voluptatem consequuntur asperiores. Ipsum quis fuga delectus quis. Dolores quidem sapiente quisquam adipisci laborum rerum.	42.5399999999999991	42.5399999999999991	21	2018-04-23 13:49:23.225556	2018-04-23 13:49:23.225556
241	Fantastic Steel Gloves	Culpa ut eius. Repellat et ipsa aperiam et et ipsam. Nulla sunt officiis ex voluptatem. Repellat accusamus sunt asperiores sunt doloribus quam. A asperiores maiores ea ab.	56.2299999999999969	56.2299999999999969	0	2018-04-23 13:49:23.228691	2018-04-23 13:49:23.228691
242	Sleek Aluminum Bench	Et eveniet sint earum. Quae et recusandae laborum vel sapiente alias. Illum excepturi dolorem praesentium officia veniam.	63.1599999999999966	63.1599999999999966	0	2018-04-23 13:49:23.231641	2018-04-23 13:49:23.231641
243	Intelligent Aluminum Keyboard	Sit recusandae rerum. Et in voluptatem nemo consequatur sed. Autem inventore corrupti eum iusto eveniet. Magni voluptatem enim. Commodi quis totam eius aliquid illo.	23.0799999999999983	23.0799999999999983	28	2018-04-23 13:49:23.23462	2018-04-23 13:49:23.23462
244	Durable Silk Plate	Enim tempora quis nesciunt aut. Pariatur consequatur illum esse. Qui cum enim.	84.0400000000000063	13	0	2018-04-23 13:49:23.237759	2018-04-23 13:49:23.237759
245	Intelligent Granite Car	Quod porro magni quis sed molestiae. Dolorem et facilis atque dolore quia. Odit cupiditate ut voluptatem et nemo sed. Eaque id rerum. Consequatur et est.	6.25	6.25	12	2018-04-23 13:49:23.240869	2018-04-23 13:49:23.240869
246	Awesome Leather Gloves	Aut ipsum praesentium dolor. Id sint possimus rerum recusandae autem corrupti. Eius non harum quidem consequuntur voluptas modi minima. Perspiciatis reiciendis deleniti consequatur dolores.	80.2099999999999937	80.2099999999999937	42	2018-04-23 13:49:23.243861	2018-04-23 13:49:23.243861
247	Aerodynamic Concrete Chair	Nisi perspiciatis et eum tempore fugit ut. Commodi qui odio. Sunt voluptatem et nisi ea facilis officiis.	26.8500000000000014	26.8500000000000014	0	2018-04-23 13:49:23.24946	2018-04-23 13:49:23.24946
248	Lightweight Bronze Table	Dolor voluptatem explicabo. Velit nihil quas aut perspiciatis dolorem sapiente voluptatem. Officia deserunt hic. Qui eligendi rem illum. Ex quasi similique nostrum aspernatur tempore vero incidunt.	13.8399999999999999	12	0	2018-04-23 13:49:23.252686	2018-04-23 13:49:23.252686
249	Small Steel Wallet	Ut veritatis ex. Animi voluptas rerum nemo est cum maiores. Sapiente placeat et tempora architecto atque et rerum. Mollitia in aut id.	16.4800000000000004	16.4800000000000004	0	2018-04-23 13:49:23.25581	2018-04-23 13:49:23.25581
250	Fantastic Plastic Shoes	Possimus laboriosam commodi. Beatae tempore aperiam. Consectetur est culpa rerum cum. Vero voluptates rerum neque fugiat mollitia deserunt fugit.	81.1299999999999955	48	0	2018-04-23 13:49:23.260819	2018-04-23 13:49:23.260819
251	Fantastic Rubber Watch	Deserunt et et sapiente molestiae veritatis. Veritatis doloribus nisi. Commodi expedita libero doloremque autem.	30.9499999999999993	3	0	2018-04-23 13:49:23.263813	2018-04-23 13:49:23.263813
252	Lightweight Bronze Bench	Amet totam quia explicabo consequatur unde. Et autem consectetur quos ea eaque nesciunt. Tenetur ut harum nobis dolores. Quis quisquam ex iure quas blanditiis minima ipsam. Dolor nihil nostrum dolore voluptatum et amet.	64.3900000000000006	64.3900000000000006	46	2018-04-23 13:49:23.266919	2018-04-23 13:49:23.266919
253	Synergistic Steel Plate	Quidem repellat ut aut quod animi voluptas. Assumenda tempore quis laboriosam qui sunt ut. Deserunt fuga sunt maiores voluptas quo quas.	36.5399999999999991	36.5399999999999991	23	2018-04-23 13:49:23.269964	2018-04-23 13:49:23.269964
255	Mediocre Iron Chair	Amet nisi nesciunt. Similique neque debitis consequuntur minus tempora aut culpa. Qui molestiae necessitatibus. Et repellat sapiente voluptate consequatur. Assumenda sunt veniam at.	55.509999999999998	43	0	2018-04-23 13:49:23.27652	2018-04-23 13:49:23.27652
256	Heavy Duty Iron Gloves	Et enim et. Aperiam quasi dolores aspernatur in minima blanditiis officiis. Quidem ea nisi est reprehenderit.	60.8100000000000023	10	24	2018-04-23 13:49:23.279713	2018-04-23 13:49:23.279713
257	Lightweight Rubber Lamp	Ullam asperiores et. Illo ipsa doloremque amet voluptas ratione. Sequi porro omnis. Veritatis voluptatem necessitatibus ab.	1.55000000000000004	1	0	2018-04-23 13:49:23.282834	2018-04-23 13:49:23.282834
258	Fantastic Copper Watch	Ea itaque et autem fuga. Placeat repellat distinctio aut. Sunt itaque repudiandae beatae aliquid qui quia fugiat. Deleniti non dolorum molestiae.	3.29000000000000004	3.29000000000000004	0	2018-04-23 13:49:23.28603	2018-04-23 13:49:23.28603
259	Mediocre Plastic Lamp	Aut rerum est. Voluptas hic ut. Fugiat sit culpa eos qui.	63.8999999999999986	12	11	2018-04-23 13:49:23.289215	2018-04-23 13:49:23.289215
260	Awesome Concrete Plate	Quam neque quae qui et et autem. Animi dicta id repellat beatae in. Est aut dolor quidem. Voluptatem dolores nesciunt eligendi quo.	45.8900000000000006	45.8900000000000006	0	2018-04-23 13:49:23.292062	2018-04-23 13:49:23.292062
261	Practical Leather Bottle	Qui veritatis dolore est. Culpa qui libero exercitationem ad. Sequi dolor ut reprehenderit labore architecto voluptates consequuntur. Commodi eius voluptatem enim qui iusto.	90.7999999999999972	90.7999999999999972	46	2018-04-23 13:49:23.294928	2018-04-23 13:49:23.294928
262	Heavy Duty Wooden Shirt	Eos necessitatibus maxime expedita vitae. Unde doloremque explicabo expedita alias fugit. Atque est magnam est. Qui omnis et.	10.9399999999999995	10.9399999999999995	7	2018-04-23 13:49:23.297767	2018-04-23 13:49:23.297767
263	Sleek Rubber Plate	Eveniet dolorem eum rerum. Consequuntur tempore est minima. Eum amet voluptate magnam qui. Quae quibusdam quos.	97.1500000000000057	97.1500000000000057	19	2018-04-23 13:49:23.301149	2018-04-23 13:49:23.301149
264	Practical Copper Chair	Est quia quis fugiat quaerat. Aspernatur sit et. Distinctio sint qui. Eaque dolore ut dolores unde aut.	45.5799999999999983	45.5799999999999983	42	2018-04-23 13:49:23.304372	2018-04-23 13:49:23.304372
265	Small Leather Plate	Et voluptas aut et possimus quae quod et. Repudiandae corporis cupiditate harum iste dolorem. Quia possimus provident labore fugiat. Molestiae consequuntur qui quia atque. Aut nobis recusandae ut sit voluptas eius.	19.9800000000000004	19.9800000000000004	0	2018-04-23 13:49:23.309603	2018-04-23 13:49:23.309603
266	Lightweight Granite Shoes	Ipsum fugiat dicta. Enim aspernatur qui voluptatem sint quisquam itaque. Modi sapiente nemo ut occaecati eum soluta nihil.	12.7200000000000006	8	0	2018-04-23 13:49:23.312621	2018-04-23 13:49:23.312621
267	Durable Plastic Watch	Nemo non quae similique ut. A nam inventore sapiente sunt ad. Optio nostrum occaecati aut. Aut placeat debitis voluptate tenetur. Cum consectetur ut.	89.8299999999999983	71	27	2018-04-23 13:49:23.315649	2018-04-23 13:49:23.315649
268	Practical Wooden Shirt	Doloribus recusandae quaerat error dignissimos. Quo qui dicta inventore ea. Veritatis autem ut reprehenderit sit nemo rem. Et ut necessitatibus eligendi excepturi at.	68.4500000000000028	68.4500000000000028	0	2018-04-23 13:49:23.318659	2018-04-23 13:49:23.318659
269	Incredible Wooden Chair	Officiis eum delectus aut aut. Quisquam iusto non fuga. Minima tempora id deleniti unde ipsum debitis.	97.6599999999999966	33	0	2018-04-23 13:49:23.32175	2018-04-23 13:49:23.32175
270	Awesome Wool Clock	Nihil omnis quod at. Enim sit debitis similique dolores. Quis quo suscipit. Veniam ea temporibus est. Et voluptatibus omnis et dolorem esse.	14.6300000000000008	14.6300000000000008	36	2018-04-23 13:49:23.324722	2018-04-23 13:49:23.324722
271	Rustic Wooden Chair	Dolorum natus ipsa. Quos ut cumque maxime dignissimos deserunt nam expedita. Quis similique voluptates possimus aut sequi id. Beatae ea deserunt quia aliquam est. In sit suscipit autem architecto autem tempora dolores.	66.1500000000000057	66.1500000000000057	0	2018-04-23 13:49:23.328048	2018-04-23 13:49:23.328048
272	Mediocre Concrete Shoes	Voluptatem dolores voluptatibus tempora. Reprehenderit doloribus numquam. Blanditiis quo nostrum ut sint rerum voluptates. Aut fugit recusandae deserunt. Corporis adipisci nihil commodi velit assumenda.	9.85999999999999943	9.85999999999999943	25	2018-04-23 13:49:23.331227	2018-04-23 13:49:23.331227
273	Fantastic Wooden Car	Quisquam dolores eos quia ut maxime dolor doloremque. Suscipit et et ipsum nisi eveniet. Dolores iure voluptate.	39.7899999999999991	39.7899999999999991	34	2018-04-23 13:49:23.340074	2018-04-23 13:49:23.340074
274	Mediocre Granite Keyboard	Ipsam accusamus aspernatur. Reprehenderit rerum voluptatibus praesentium et illo officia laudantium. Earum repudiandae quaerat sequi. Exercitationem possimus ea in dolorum ullam aut est.	34.240000000000002	17	0	2018-04-23 13:49:23.342936	2018-04-23 13:49:23.342936
275	Practical Marble Coat	Et id et dignissimos eum dolor consequuntur in. Aut cumque aut. Soluta corporis est magni voluptate. Tempora voluptate voluptas iusto et.	19.6400000000000006	19.6400000000000006	37	2018-04-23 13:49:23.345776	2018-04-23 13:49:23.345776
276	Fantastic Rubber Computer	Esse porro et voluptas. Qui ex optio cupiditate ut odit accusantium rerum. Dolor eos alias. Consequatur quam dolorem expedita ipsam.	38.0399999999999991	38.0399999999999991	23	2018-04-23 13:49:23.348633	2018-04-23 13:49:23.348633
277	Awesome Leather Computer	Architecto voluptate quam harum ipsum dolor. Velit est quia suscipit temporibus ut ut id. Repellat ea neque.	94.25	56	0	2018-04-23 13:49:23.351625	2018-04-23 13:49:23.351625
278	Gorgeous Steel Lamp	Atque quis rem. Illo sit qui qui. Nihil error incidunt. Nulla voluptas autem distinctio. Aut ratione voluptatem vel.	37.5600000000000023	36	44	2018-04-23 13:49:23.355021	2018-04-23 13:49:23.355021
279	Sleek Concrete Table	Iusto vel qui debitis suscipit. Et corporis nisi dolor voluptas autem quos ut. Quae quidem error in doloribus rerum laboriosam ipsam. In nihil et praesentium dolor qui. Sit ad vero incidunt illum.	12.4100000000000001	7	8	2018-04-23 13:49:23.358091	2018-04-23 13:49:23.358091
280	Enormous Iron Chair	Quaerat incidunt numquam omnis et hic nihil. Aliquam quae odit exercitationem vel rerum ad. Repellendus eum omnis autem suscipit quae dolorum est. Hic et vitae eos.	36.4200000000000017	6	0	2018-04-23 13:49:23.361228	2018-04-23 13:49:23.361228
281	Mediocre Aluminum Chair	Voluptas unde qui qui. Aut tenetur quasi. Eligendi aperiam ipsum recusandae architecto voluptate. Qui officia voluptatem et ut quis totam.	33.5499999999999972	33.5499999999999972	35	2018-04-23 13:49:23.36407	2018-04-23 13:49:23.36407
282	Small Cotton Clock	Qui a officia ut enim voluptas optio et. Quos adipisci hic recusandae facere sit est animi. Molestias neque enim corrupti et alias quia. Omnis sed aspernatur sequi quia ratione deserunt. Dolor asperiores dignissimos similique.	36.3999999999999986	29	13	2018-04-23 13:49:23.366971	2018-04-23 13:49:23.366971
283	Gorgeous Iron Shirt	Illo voluptas dicta id alias. Laboriosam sed quia nam dicta sunt quia. Et neque ducimus voluptas expedita. Unde omnis est perspiciatis autem et.	6.62999999999999989	6.62999999999999989	25	2018-04-23 13:49:23.370061	2018-04-23 13:49:23.370061
284	Aerodynamic Leather Car	Impedit tempore voluptatum et neque totam asperiores. Enim sequi culpa dolor. Dolores architecto et est quaerat. Eaque ratione facilis impedit consequatur odio inventore fugiat.	31.4800000000000004	31.4800000000000004	0	2018-04-23 13:49:23.375283	2018-04-23 13:49:23.375283
285	Aerodynamic Copper Chair	Sequi mollitia libero doloribus ea dolores. Et deserunt fuga. Reprehenderit velit mollitia magni voluptatibus et rem.	80.2900000000000063	80.2900000000000063	18	2018-04-23 13:49:23.378325	2018-04-23 13:49:23.378325
286	Aerodynamic Concrete Plate	Ipsum voluptate quisquam dolore consequatur sint et blanditiis. Rerum fugiat fuga accusamus. In officia molestiae dolore excepturi quis atque. Necessitatibus consequatur placeat non sapiente perferendis. Quisquam dolores rerum repudiandae harum natus.	82.3599999999999994	82.3599999999999994	0	2018-04-23 13:49:23.381745	2018-04-23 13:49:23.381745
287	Mediocre Silk Coat	Pariatur commodi excepturi ex dolore quod eligendi consectetur. Nostrum assumenda magnam et voluptate laboriosam. Ducimus sit velit aut consectetur tenetur deserunt et. Voluptates esse id deserunt quasi nulla eligendi. Id eius illum facilis delectus voluptates odio.	11.9600000000000009	7	24	2018-04-23 13:49:23.384744	2018-04-23 13:49:23.384744
288	Sleek Paper Gloves	Est minima quis praesentium ut optio esse. Reprehenderit rerum cupiditate iusto ratione. Laboriosam magnam est ut aliquam et.	46.9099999999999966	43	0	2018-04-23 13:49:23.388112	2018-04-23 13:49:23.388112
289	Durable Wool Clock	Libero sint ut quisquam voluptatem numquam quaerat non. Laudantium rem neque. Quae sunt eos sit et ex eum.	37.1899999999999977	37.1899999999999977	48	2018-04-23 13:49:23.390961	2018-04-23 13:49:23.390961
290	Intelligent Aluminum Hat	Repellat ut sint sit eligendi dolorum dignissimos. In voluptas facilis eos. Tempore qui id. Accusantium animi molestiae sint est quia.	22.3900000000000006	22.3900000000000006	0	2018-04-23 13:49:23.393808	2018-04-23 13:49:23.393808
291	Gorgeous Marble Pants	Omnis cupiditate ipsum maiores quod veritatis quae. Et illum repellat voluptatem impedit necessitatibus. Repudiandae alias nulla. Sit ducimus et ab possimus. Consequatur illo dolore ea aspernatur exercitationem blanditiis.	80.7199999999999989	21	50	2018-04-23 13:49:23.398812	2018-04-23 13:49:23.398812
292	Heavy Duty Bronze Car	Consequatur atque aut quisquam architecto accusamus. Quasi consequatur sint. Expedita impedit eos mollitia. Adipisci culpa deleniti qui natus sequi. Et quam eos rerum.	34.8999999999999986	34.8999999999999986	0	2018-04-23 13:49:23.401722	2018-04-23 13:49:23.401722
293	Synergistic Marble Clock	Qui quis dolores ullam. Sint tempora eos. Error aliquam excepturi illo dolorem ipsa et. Harum dolor quidem provident laborum facilis vero.	92.6800000000000068	26	0	2018-04-23 13:49:23.40514	2018-04-23 13:49:23.40514
294	Rustic Bronze Bench	Sed qui sit. Qui non tempore. Explicabo qui similique voluptas assumenda quas nihil.	83.4000000000000057	83.4000000000000057	9	2018-04-23 13:49:23.408318	2018-04-23 13:49:23.408318
295	Heavy Duty Bronze Table	Mollitia quos aspernatur nihil eos pariatur beatae. Debitis quod nobis numquam maiores alias aut. Sint nobis accusantium explicabo dolore quasi praesentium. Omnis voluptatem voluptatibus.	99.3900000000000006	99.3900000000000006	24	2018-04-23 13:49:23.411824	2018-04-23 13:49:23.411824
296	Fantastic Leather Table	Cumque et consequatur aliquam. Et eos mollitia itaque voluptates nobis in. Officiis eos itaque consequuntur et. Eum molestiae adipisci.	24.129999999999999	20	1	2018-04-23 13:49:23.414909	2018-04-23 13:49:23.414909
297	Gorgeous Marble Hat	Reprehenderit nemo hic culpa sit cumque doloribus eaque. Aut nam quae delectus occaecati dolor harum vero. Aut deleniti nesciunt in suscipit iste.	61.0799999999999983	13	3	2018-04-23 13:49:23.417929	2018-04-23 13:49:23.417929
298	Enormous Plastic Plate	Sequi libero consequuntur. Ut quia quidem omnis veritatis. Deleniti minus perspiciatis ex odit cumque. Dignissimos non rerum accusamus facilis.	0.340000000000000024	1.71232162797358511	0	2018-04-23 13:49:23.421072	2018-04-23 13:49:23.421072
299	Durable Steel Coat	Minus sit omnis ut quo voluptatem. Maxime consectetur placeat enim. Non eum est ratione earum consectetur in. Consequatur corrupti porro repellendus ut quasi id perferendis. Dicta aut dolor ducimus vitae aut.	12.7400000000000002	6	0	2018-04-23 13:49:23.423952	2018-04-23 13:49:23.423952
300	Intelligent Plastic Lamp	Officiis in deserunt in. Ipsam voluptates et consequatur sunt laboriosam. Dolor esse minus. Autem nulla eos exercitationem et magni itaque non.	50.6199999999999974	20	0	2018-04-23 13:49:23.427027	2018-04-23 13:49:23.427027
301	Sleek Steel Shirt	Fugiat iure blanditiis aut qui consequatur id. Nostrum delectus quae. Nihil qui id rerum debitis modi sint. Illum non quod aut. Laudantium dignissimos quibusdam autem dolor rerum corrupti.	5.55999999999999961	5.55999999999999961	45	2018-04-23 13:49:23.430141	2018-04-23 13:49:23.430141
302	Incredible Bronze Clock	Magnam et maxime deserunt labore doloremque commodi. Velit atque adipisci. Asperiores excepturi minima voluptas.	22.6900000000000013	22.6900000000000013	42	2018-04-23 13:49:23.43339	2018-04-23 13:49:23.43339
303	Awesome Aluminum Pants	Earum aut eos. Laboriosam optio sit. Exercitationem dolor occaecati.	69.0300000000000011	69.0300000000000011	0	2018-04-23 13:49:23.436544	2018-04-23 13:49:23.436544
304	Small Wool Bag	Voluptas qui esse amet. Minima delectus in. Consequatur laudantium laborum. Cupiditate et earum adipisci ut harum.	50.1300000000000026	38	0	2018-04-23 13:49:23.439596	2018-04-23 13:49:23.439596
305	Heavy Duty Marble Bottle	Libero unde sit animi hic accusantium. Quia qui voluptatibus. Hic vero ipsa eum atque et et ab. Unde sint voluptas vel. Mollitia libero et vel sit quasi velit fuga.	15.6400000000000006	15.6400000000000006	43	2018-04-23 13:49:23.442497	2018-04-23 13:49:23.442497
306	Sleek Leather Gloves	Cupiditate maxime quidem non tempore nihil voluptas. Animi error sit. Eum excepturi explicabo minus cupiditate odit. Non et dolorem cumque id deserunt.	90.0699999999999932	82	0	2018-04-23 13:49:23.445315	2018-04-23 13:49:23.445315
307	Fantastic Cotton Lamp	Et aperiam quia. Error eius eveniet qui nihil cumque. Velit ipsam delectus. Omnis iure sit.	82.4899999999999949	11	35	2018-04-23 13:49:23.448103	2018-04-23 13:49:23.448103
308	Gorgeous Wooden Shirt	Odit voluptates id. Et et sit enim. Voluptates et doloremque.	67.0900000000000034	9	31	2018-04-23 13:49:23.450859	2018-04-23 13:49:23.450859
309	Aerodynamic Rubber Wallet	Nemo ea sunt ut. Vel voluptas voluptates eveniet nihil atque ea consequatur. Aut ratione totam quae consequatur sint numquam. A illum omnis. Impedit dolores reprehenderit.	20.75	20.75	0	2018-04-23 13:49:23.453864	2018-04-23 13:49:23.453864
310	Aerodynamic Copper Plate	Iure vitae recusandae commodi eveniet sunt nemo doloremque. Deserunt veniam dicta explicabo. Reprehenderit vero et. Optio nesciunt in modi. Perferendis quae sunt hic accusantium.	53.4099999999999966	51	1	2018-04-23 13:49:23.459381	2018-04-23 13:49:23.459381
311	Durable Bronze Gloves	Accusamus odit nobis quam magnam quo. Laudantium ut id vero sunt rerum. Laboriosam a illum quis id fuga ut perferendis.	58.0499999999999972	58.0499999999999972	22	2018-04-23 13:49:23.462851	2018-04-23 13:49:23.462851
312	Incredible Bronze Watch	Dolore et dolorum vel dignissimos. Aut et possimus quos ipsam eaque exercitationem dolorem. Aliquam aut eligendi. Voluptatem vel impedit molestias vero. Voluptates laudantium aspernatur sapiente eius impedit explicabo quia.	58.2899999999999991	58.2899999999999991	0	2018-04-23 13:49:23.466428	2018-04-23 13:49:23.466428
313	Heavy Duty Copper Lamp	Dolor excepturi dolor harum voluptas quae ad. Tempore consequatur ducimus sed. Corrupti voluptatem voluptatum. Saepe maiores ipsum quidem dolorem.	45.509999999999998	45.509999999999998	0	2018-04-23 13:49:23.469595	2018-04-23 13:49:23.469595
314	Durable Paper Bottle	Sunt sit dolorum atque vel aliquid ut alias. Nulla explicabo aut qui omnis consequatur non. Ducimus expedita molestias qui reiciendis.	58.0499999999999972	41	0	2018-04-23 13:49:23.473124	2018-04-23 13:49:23.473124
315	Intelligent Iron Bag	A distinctio rem ipsam temporibus laborum. Accusamus alias nostrum exercitationem voluptates repellat. Sint eum et. A ea voluptas qui qui blanditiis. Qui rem tempora et ipsa quidem molestiae.	96.0499999999999972	96.0499999999999972	0	2018-04-23 13:49:23.476711	2018-04-23 13:49:23.476711
316	Aerodynamic Granite Coat	Fuga est molestiae autem suscipit cumque. Autem deleniti fugit blanditiis voluptates ex quaerat. Vitae culpa quia neque. Voluptate enim et quibusdam fuga molestias ut nihil. Qui minus molestiae beatae esse dolores libero.	12.3800000000000008	12.3800000000000008	0	2018-04-23 13:49:23.479887	2018-04-23 13:49:23.479887
317	Ergonomic Paper Pants	In quaerat sit nobis velit repellat tempore neque. Voluptas qui nihil enim soluta aut in nihil. Ut et facere nihil sit eos.	40.7899999999999991	40.7899999999999991	1	2018-04-23 13:49:23.483067	2018-04-23 13:49:23.483067
318	Fantastic Plastic Table	Omnis veniam eos similique error. Hic quisquam aut deleniti dolor rerum. Voluptas explicabo eius. Voluptate qui officiis ducimus neque porro accusamus. Commodi consequuntur distinctio libero consequatur neque blanditiis cupiditate.	32.240000000000002	16	7	2018-04-23 13:49:23.486695	2018-04-23 13:49:23.486695
319	Lightweight Silk Plate	Deserunt eos quidem et. Ratione sit eveniet magni aut delectus omnis nihil. Deserunt qui veritatis corrupti. Dignissimos qui voluptas eum placeat maxime expedita est. Voluptatum autem fugit et.	46.0499999999999972	26	0	2018-04-23 13:49:23.490473	2018-04-23 13:49:23.490473
320	Rustic Plastic Plate	Repellat atque labore eius quia dolorum. Qui est nostrum quibusdam dolor dolore architecto. Id iste quia culpa est praesentium et sint. Esse eveniet qui assumenda qui delectus quo. Sequi alias aut consequatur in fugit eveniet esse.	8.55000000000000071	8.55000000000000071	0	2018-04-23 13:49:23.496403	2018-04-23 13:49:23.496403
321	Aerodynamic Wool Bottle	Quae dolores accusantium minima laudantium. Non ratione quos possimus est. Nostrum quia quaerat ea aliquam cumque laboriosam autem. Quia dolorem et.	96.2800000000000011	96.2800000000000011	0	2018-04-23 13:49:23.500118	2018-04-23 13:49:23.500118
322	Intelligent Copper Plate	Assumenda nisi natus quia ut recusandae ut at. Hic facere dolorem suscipit qui sunt. Architecto eos sit modi nisi et eum. Facilis fugiat aliquid sit accusantium aspernatur harum. Labore rerum minima non vel.	66.0999999999999943	66.0999999999999943	27	2018-04-23 13:49:23.503611	2018-04-23 13:49:23.503611
323	Fantastic Copper Bench	Possimus et ea sed voluptatum quis autem qui. Blanditiis natus aut atque officia porro voluptas. Doloremque tempore natus eligendi aut. Reiciendis ipsa laudantium qui voluptatem dolores distinctio sit. Et aperiam nisi cupiditate at.	14.7300000000000004	14	39	2018-04-23 13:49:23.507298	2018-04-23 13:49:23.507298
324	Lightweight Linen Coat	Eum iure ullam aut et nulla explicabo quo. Incidunt nulla et porro id architecto. Quaerat inventore molestiae nostrum corrupti velit.	69.0400000000000063	69.0400000000000063	0	2018-04-23 13:49:23.510841	2018-04-23 13:49:23.510841
325	Durable Paper Clock	Enim rem impedit fugiat quidem minima fugit. Provident at similique reiciendis nam aut aspernatur. Vel et debitis dolore. Ipsum rerum aliquam.	66.2900000000000063	25	0	2018-04-23 13:49:23.514029	2018-04-23 13:49:23.514029
326	Rustic Copper Hat	Quo deserunt totam voluptas cum. Est voluptatibus dolores et enim assumenda voluptas. Cumque quia magnam assumenda repudiandae.	16.5899999999999999	16.5899999999999999	0	2018-04-23 13:49:23.517052	2018-04-23 13:49:23.517052
327	Mediocre Plastic Gloves	Facere dolore id. Ut distinctio expedita et veniam. Nam error dolores quia.	42.2199999999999989	42.2199999999999989	9	2018-04-23 13:49:23.520036	2018-04-23 13:49:23.520036
328	Lightweight Linen Shirt	Repellendus pariatur necessitatibus expedita dignissimos. Esse sunt cupiditate placeat voluptas praesentium a consequuntur. Fugiat et libero ullam nam nobis unde officia.	61.0799999999999983	61.0799999999999983	0	2018-04-23 13:49:23.522895	2018-04-23 13:49:23.522895
329	Enormous Rubber Chair	Quia sed maiores quisquam ipsa quos. Occaecati quidem aliquam nemo amet vero. Id ex consequatur veritatis et sequi. Dolorum placeat minima sit.	0.100000000000000006	1.27853050005858382	20	2018-04-23 13:49:23.525744	2018-04-23 13:49:23.525744
330	Synergistic Cotton Car	Nulla sint nihil qui dolor adipisci voluptatum. At temporibus eum quam. Ea aut quis.	95.9300000000000068	95.9300000000000068	0	2018-04-23 13:49:23.528577	2018-04-23 13:49:23.528577
331	Intelligent Bronze Chair	Qui est dolor ipsa. Enim dolorum est omnis quis. Qui animi cupiditate commodi eveniet explicabo.	89.6299999999999955	32	0	2018-04-23 13:49:23.535625	2018-04-23 13:49:23.535625
332	Heavy Duty Cotton Lamp	Eum facere quas magnam laudantium. Molestiae velit adipisci quia et rerum earum. Molestias est eos rerum autem inventore est. Expedita nisi neque.	71.2099999999999937	13	0	2018-04-23 13:49:23.539045	2018-04-23 13:49:23.539045
333	Awesome Steel Keyboard	Sed optio et non atque. Inventore alias delectus vel voluptatum qui eum. Aut vitae earum cum.	34.7199999999999989	34.7199999999999989	31	2018-04-23 13:49:23.544252	2018-04-23 13:49:23.544252
334	Incredible Steel Hat	Consequatur nisi beatae sed vero minima totam qui. Modi ullam enim necessitatibus laborum. Eum totam ex eum exercitationem. Sit illum quae et consequatur.	21.9299999999999997	10	40	2018-04-23 13:49:23.547212	2018-04-23 13:49:23.547212
335	Incredible Iron Gloves	Deleniti quasi laudantium fugiat aut architecto. Cumque optio voluptatem autem ex odit voluptatem. Sit provident aut tenetur quasi. Molestias fuga et quos libero cumque odio impedit. Sit et qui.	4.45999999999999996	1	4	2018-04-23 13:49:23.550831	2018-04-23 13:49:23.550831
336	Synergistic Copper Pants	Accusamus et commodi. Tenetur cupiditate quidem qui. Facere enim qui consectetur occaecati. Soluta assumenda aliquam qui.	23.6799999999999997	15	23	2018-04-23 13:49:23.553906	2018-04-23 13:49:23.553906
337	Synergistic Plastic Car	Voluptas eveniet recusandae. Dignissimos sit ea provident dicta et reprehenderit et. Vel et possimus harum minus. Qui consequatur nostrum facere quae. Velit deleniti sapiente tempore in.	50.3200000000000003	50.3200000000000003	2	2018-04-23 13:49:23.557414	2018-04-23 13:49:23.557414
338	Intelligent Wooden Gloves	Et voluptates quas. Vero et at et et sint. Est incidunt nesciunt mollitia molestias voluptas et.	40.4799999999999969	40.4799999999999969	0	2018-04-23 13:49:23.56095	2018-04-23 13:49:23.56095
339	Mediocre Linen Watch	Et nisi dignissimos enim laudantium odit non ipsam. Qui nisi enim. Id et quis. In natus velit.	22.6400000000000006	9	2	2018-04-23 13:49:23.564467	2018-04-23 13:49:23.564467
340	Small Linen Plate	Ea consequatur nisi atque quis aut. Quaerat illum optio aut dicta qui earum. Autem voluptates et ratione velit. Eligendi sapiente aperiam.	96.0699999999999932	96.0699999999999932	0	2018-04-23 13:49:23.567921	2018-04-23 13:49:23.567921
341	Intelligent Plastic Plate	Consequatur itaque beatae consequuntur. Libero cum in. Reiciendis consequatur dolores iste similique. Error sapiente praesentium alias voluptatem.	77.3900000000000006	77.3900000000000006	0	2018-04-23 13:49:23.57134	2018-04-23 13:49:23.57134
342	Ergonomic Marble Shirt	Reprehenderit autem delectus. Esse corporis qui sequi atque pariatur ratione. In blanditiis harum esse. Atque accusamus ad laboriosam. Quis accusantium qui error.	4.69000000000000039	4.69000000000000039	40	2018-04-23 13:49:23.574541	2018-04-23 13:49:23.574541
343	Synergistic Linen Car	Est sed est iusto optio deleniti non ea. Iure ut aperiam dolor libero non voluptatem. Doloribus iusto vel reprehenderit sunt soluta aut deserunt.	72	72	29	2018-04-23 13:49:23.577736	2018-04-23 13:49:23.577736
344	Lightweight Copper Gloves	Architecto alias et in dolore aliquid quis. Alias est earum vel facere nihil et. Dolores nesciunt expedita fugit velit unde.	54.3800000000000026	9	0	2018-04-23 13:49:23.580742	2018-04-23 13:49:23.580742
345	Rustic Steel Lamp	Laboriosam ut nam sint. Sit quasi adipisci quibusdam eos error. At ea architecto cumque et reiciendis dolor accusamus. Tenetur nam et. Vitae id fuga.	59.3999999999999986	59.3999999999999986	26	2018-04-23 13:49:23.583619	2018-04-23 13:49:23.583619
346	Ergonomic Concrete Car	Et molestiae et deleniti. Quo facere occaecati voluptas. Ad facere ut consequatur.	38.8500000000000014	38.8500000000000014	0	2018-04-23 13:49:23.58654	2018-04-23 13:49:23.58654
347	Practical Copper Hat	Quidem ea consequatur quibusdam deserunt unde voluptates iusto. Facere nulla ad sunt error provident placeat ipsam. Voluptatem architecto qui facilis vitae.	91.0699999999999932	32	0	2018-04-23 13:49:23.589697	2018-04-23 13:49:23.589697
348	Intelligent Concrete Clock	Architecto quaerat cumque optio dolore esse nostrum error. Est beatae officiis sunt repellat enim. Nesciunt aliquam non rerum eaque occaecati.	21.5799999999999983	21.5799999999999983	0	2018-04-23 13:49:23.593009	2018-04-23 13:49:23.593009
349	Fantastic Wool Bag	Dolores repudiandae quia nam nesciunt. Sit tempora non quas ratione perferendis commodi. Alias est voluptatem sint omnis aut recusandae fugit. Et porro et et quis impedit sed. Magni nesciunt beatae est maiores dolores et ipsum.	70.7000000000000028	45	15	2018-04-23 13:49:23.596101	2018-04-23 13:49:23.596101
350	Sleek Steel Plate	Mollitia debitis illum omnis voluptas sit ut ut. Enim dolores deserunt aut ratione. Odio corporis minus neque magni quis explicabo suscipit. Tenetur vel ducimus eos rerum. Enim non harum porro vitae occaecati.	81.0499999999999972	81.0499999999999972	42	2018-04-23 13:49:23.599096	2018-04-23 13:49:23.599096
351	Sleek Linen Gloves	Quos veniam sed eum hic qui accusantium. Molestias dolorem labore tenetur repellendus ipsa. Tempore distinctio omnis dolor eveniet.	66.5999999999999943	34	0	2018-04-23 13:49:23.601942	2018-04-23 13:49:23.601942
352	Aerodynamic Paper Knife	Ex corrupti et consectetur aut. Id quia quas aspernatur temporibus et voluptate. Non minus ad dolor et quidem. Impedit quisquam voluptas. Non et facere non dolorum reprehenderit ut quibusdam.	82.3799999999999955	62	16	2018-04-23 13:49:23.605121	2018-04-23 13:49:23.605121
353	Fantastic Silk Bag	Fugiat qui quibusdam officia ducimus quasi. Ea voluptatibus qui eaque error architecto. Molestiae porro et aut sequi voluptas quis. Provident qui et voluptatem repellendus voluptatem. Est debitis expedita.	95.9899999999999949	41	0	2018-04-23 13:49:23.608173	2018-04-23 13:49:23.608173
354	Awesome Wool Keyboard	Maiores blanditiis quam laboriosam. At praesentium odit quia. Sit tempora repellat. Officia qui enim. Voluptatibus perferendis sint nam ut.	96.8100000000000023	96.8100000000000023	0	2018-04-23 13:49:23.611148	2018-04-23 13:49:23.611148
355	Ergonomic Copper Computer	Autem illum modi quia sunt quia. Suscipit autem adipisci. Architecto sed libero non temporibus aut ipsam. Non itaque eius hic natus nam.	45.3999999999999986	13	4	2018-04-23 13:49:23.61413	2018-04-23 13:49:23.61413
356	Ergonomic Silk Shirt	Eaque incidunt nobis officiis illo libero. Dignissimos facere est. Beatae in quas est debitis.	85.4500000000000028	63	0	2018-04-23 13:49:23.617258	2018-04-23 13:49:23.617258
357	Ergonomic Wooden Chair	Consequuntur distinctio vel qui. Sed repellat eum inventore facere ipsa. Molestiae quia consequatur est. Rerum adipisci et libero voluptas quisquam tempore ipsum. Qui quia similique provident explicabo tenetur.	9.63000000000000078	9.63000000000000078	0	2018-04-23 13:49:23.620414	2018-04-23 13:49:23.620414
358	Gorgeous Copper Shirt	Ipsa dolorum aut commodi quia et. Ut natus aspernatur suscipit. Quibusdam aliquam voluptatibus libero nisi. Et molestias unde accusamus.	87.480000000000004	82	0	2018-04-23 13:49:23.623346	2018-04-23 13:49:23.623346
359	Synergistic Plastic Wallet	Deserunt minima laudantium aspernatur explicabo. Nulla iure dolor ad. Aut culpa rerum quibusdam. Vero eos sequi qui rerum et ex.	29.9200000000000017	13	0	2018-04-23 13:49:23.626206	2018-04-23 13:49:23.626206
360	Enormous Wool Table	Et sit quia qui qui dolores quia perferendis. Consectetur nobis quis et dicta numquam ut. Error doloribus ex. Commodi consequatur excepturi exercitationem et quia fuga minima. Autem et qui sit.	56.1000000000000014	6	13	2018-04-23 13:49:23.629154	2018-04-23 13:49:23.629154
361	Small Concrete Keyboard	Dolorem aut quos id eligendi et id placeat. Deleniti omnis est necessitatibus. Tenetur numquam magni optio laudantium. Tempora quod praesentium voluptatem sint.	38.3800000000000026	38.3800000000000026	0	2018-04-23 13:49:23.632163	2018-04-23 13:49:23.632163
362	Mediocre Silk Pants	Ut nam at ea aliquam in. Aut doloribus cumque aut voluptatem suscipit explicabo. Ad earum voluptates sint id deleniti expedita aut. Eligendi tenetur ex sint.	54.8299999999999983	54.8299999999999983	33	2018-04-23 13:49:23.635384	2018-04-23 13:49:23.635384
363	Heavy Duty Plastic Hat	Accusantium nam minima molestias officia. Minus ipsa sunt id aut omnis et. Eligendi animi voluptatum sed voluptatibus recusandae dolores nulla.	55.6199999999999974	55	0	2018-04-23 13:49:23.638608	2018-04-23 13:49:23.638608
364	Mediocre Bronze Pants	Officia ea numquam eum ab earum. Quas est voluptas sed dolorem sit. Sapiente excepturi et. Doloremque dolorem nesciunt. Sed dolorem perferendis veritatis explicabo soluta quidem ea.	47.3100000000000023	9	0	2018-04-23 13:49:23.641694	2018-04-23 13:49:23.641694
365	Ergonomic Marble Plate	Cum voluptatem quaerat impedit et hic est voluptatum. Doloribus sapiente numquam aut dignissimos accusantium nobis. Natus est mollitia eos rerum quod enim. Et quia odio qui iste et consequatur saepe.	13.1400000000000006	6	50	2018-04-23 13:49:23.64492	2018-04-23 13:49:23.64492
366	Enormous Leather Clock	Iusto velit autem. Doloremque veritatis voluptates ipsum debitis illum libero suscipit. Numquam dignissimos velit. Rerum qui assumenda et. Vel voluptatem ipsam qui itaque.	51.9200000000000017	51.9200000000000017	0	2018-04-23 13:49:23.647866	2018-04-23 13:49:23.647866
367	Aerodynamic Rubber Keyboard	Hic voluptatibus dolorem quos facere in possimus eum. Facere explicabo illum eveniet quod adipisci sunt. Modi nostrum numquam rerum quasi unde at. Autem et voluptatem amet delectus voluptatem.	46.6599999999999966	31	0	2018-04-23 13:49:23.650729	2018-04-23 13:49:23.650729
368	Incredible Silk Plate	Voluptas tempora earum sapiente quis inventore magni. Aut dolores vel ipsa odit et dolorem aliquam. Sit nulla voluptas aliquam. Modi asperiores magnam illo amet quod minus.	93.6700000000000017	93.6700000000000017	0	2018-04-23 13:49:23.653934	2018-04-23 13:49:23.653934
369	Gorgeous Rubber Hat	Nulla esse ut est consequatur aut. Aut quasi asperiores eveniet. Sed dolorum assumenda consequuntur. Modi soluta sunt dolores cupiditate ullam.	25.5799999999999983	25.5799999999999983	0	2018-04-23 13:49:23.656819	2018-04-23 13:49:23.656819
370	Aerodynamic Linen Car	Ipsa velit magni quibusdam. Voluptas sunt aut. Ipsam quia et voluptatem. In quidem corrupti dolor alias autem. Nemo odio fugit occaecati rerum.	84.1099999999999994	5	37	2018-04-23 13:49:23.659682	2018-04-23 13:49:23.659682
371	Fantastic Wooden Bottle	Maiores minima qui rerum aut et reprehenderit. Consectetur quasi libero ipsa id ut. Aut earum ut perspiciatis est nemo quos officia.	68.0100000000000051	19	24	2018-04-23 13:49:23.66254	2018-04-23 13:49:23.66254
372	Heavy Duty Silk Bottle	Laborum saepe placeat sed voluptatibus. Harum sunt quia nemo aut omnis aliquam. Qui aut optio. Non autem non commodi. Dignissimos sed repellat culpa commodi ex quae omnis.	94.3900000000000006	94.3900000000000006	0	2018-04-23 13:49:23.665445	2018-04-23 13:49:23.665445
373	Gorgeous Aluminum Bag	Sequi qui quisquam rerum dolore nostrum quod voluptatem. Et quod sint eveniet eius fugiat pariatur. Delectus aliquam iusto facilis nulla. Sit atque illum autem rerum.	95.4200000000000017	12	0	2018-04-23 13:49:23.668721	2018-04-23 13:49:23.668721
374	Sleek Leather Shirt	Maxime accusamus non adipisci commodi voluptatem. Provident ipsa rerum ut facere sed. Odit et quidem est itaque et. Saepe natus corporis ut dolor voluptatum vero excepturi. Ut dolorem neque itaque quae ducimus corporis.	12.3100000000000005	1	20	2018-04-23 13:49:23.672303	2018-04-23 13:49:23.672303
375	Synergistic Rubber Pants	Sed enim sint aut quibusdam. Nulla sunt eaque quam laboriosam voluptas ut. Omnis qui recusandae enim dolorem.	1.22999999999999998	1.22999999999999998	22	2018-04-23 13:49:23.67528	2018-04-23 13:49:23.67528
376	Aerodynamic Concrete Knife	Optio non labore debitis incidunt consequatur. Corrupti tempore id error. Autem iste rerum labore corrupti ducimus sunt saepe. Esse quia eos et maiores. Quas fugiat provident laboriosam consequatur rerum eos exercitationem.	39	39	0	2018-04-23 13:49:23.67881	2018-04-23 13:49:23.67881
377	Ergonomic Aluminum Bench	Architecto quis sed laudantium. Quo repellat omnis reprehenderit id nulla vero. Libero et voluptas. Exercitationem quod perspiciatis optio ab molestiae. Omnis omnis ea vitae.	52.5300000000000011	37	0	2018-04-23 13:49:23.682404	2018-04-23 13:49:23.682404
378	Practical Steel Computer	Omnis voluptatibus est officiis illum. Nemo velit consequatur fuga quam nulla at. Libero sint necessitatibus quaerat ullam velit minus aliquam. Dolore fuga eius et nulla.	24.6999999999999993	24.6999999999999993	26	2018-04-23 13:49:23.686071	2018-04-23 13:49:23.686071
379	Rustic Steel Computer	Ipsa laborum qui qui et. Cumque quis voluptatibus cupiditate rerum. Eveniet magnam id iste voluptatem voluptate. Quae eum recusandae nulla ex tempore iusto consequuntur. Laboriosam tenetur eius facilis.	96.1400000000000006	96.1400000000000006	0	2018-04-23 13:49:23.689301	2018-04-23 13:49:23.689301
380	Durable Plastic Car	Iusto dolorem sed pariatur ut quia. Repellendus odio vel sed nihil id pariatur. Praesentium quasi dolore placeat. Ut quo soluta voluptate qui.	18.3599999999999994	18.3599999999999994	1	2018-04-23 13:49:23.69239	2018-04-23 13:49:23.69239
381	Lightweight Marble Hat	Quia ullam voluptates. Quis a officia corporis harum et earum. Id est ut facere vel. Porro delectus ratione voluptatem quisquam odio dolores consectetur. Id nam voluptatem numquam.	29.6999999999999993	9	0	2018-04-23 13:49:23.695663	2018-04-23 13:49:23.695663
382	Enormous Bronze Bench	Sunt adipisci fuga harum nisi quibusdam et aspernatur. Eos voluptas fugit voluptatibus quis vel. Qui est nam molestiae rerum enim saepe. Aspernatur incidunt magnam consequatur molestias veniam amet. Maiores praesentium explicabo corrupti.	32.1899999999999977	22	0	2018-04-23 13:49:23.698983	2018-04-23 13:49:23.698983
383	Intelligent Wooden Pants	Nihil excepturi sapiente sunt. Nobis aut ad atque ut sit non. Dolores officia cupiditate non numquam et. Voluptatem qui ut placeat fugit. Animi ipsum laboriosam voluptatem.	93.6200000000000045	66	30	2018-04-23 13:49:23.704672	2018-04-23 13:49:23.704672
384	Practical Iron Bag	Porro molestiae dolorem tempore aliquid consectetur architecto. Eius recusandae minus aliquid. Qui saepe ea. Eum quo atque rerum quis ut.	67.9200000000000017	67.9200000000000017	0	2018-04-23 13:49:23.707963	2018-04-23 13:49:23.707963
385	Awesome Linen Clock	Voluptas repellendus ea quod aut molestiae temporibus. Sint dolores non et nihil necessitatibus est. Vel earum iure ducimus voluptatem assumenda est.	88.019999999999996	88.019999999999996	0	2018-04-23 13:49:23.710837	2018-04-23 13:49:23.710837
386	Practical Paper Shirt	Explicabo soluta fuga natus sequi. Ullam sed omnis eos sunt et qui explicabo. Libero voluptas corrupti. Delectus autem rem omnis.	98.0499999999999972	98.0499999999999972	17	2018-04-23 13:49:23.71377	2018-04-23 13:49:23.71377
387	Aerodynamic Marble Bag	Nesciunt modi numquam. Possimus nisi dolor veniam et sapiente atque. Occaecati dicta debitis ut molestiae. Odio doloremque commodi unde eos repudiandae dolorum. Qui reprehenderit et atque soluta libero.	61.7100000000000009	24	37	2018-04-23 13:49:23.716602	2018-04-23 13:49:23.716602
388	Incredible Copper Coat	Praesentium nihil laboriosam et delectus. Qui ut magni ab sunt illo. Pariatur quae dignissimos consequatur sapiente quia placeat. Ad sed praesentium fugit omnis voluptas. Quisquam ullam facilis odio aliquid.	44.6700000000000017	35	0	2018-04-23 13:49:23.720173	2018-04-23 13:49:23.720173
389	Ergonomic Bronze Chair	Consequatur ut voluptatem nihil alias quo aut. Vitae id error ratione voluptatem. Harum molestias iusto earum temporibus aut.	4.79999999999999982	4.79999999999999982	0	2018-04-23 13:49:23.723587	2018-04-23 13:49:23.723587
390	Practical Concrete Chair	Quia fugiat et quidem laboriosam minus veritatis. Delectus voluptatibus quibusdam. Voluptates eum vero autem praesentium. Distinctio tempore quia sapiente est voluptas debitis ipsum.	90.0900000000000034	48	0	2018-04-23 13:49:23.726725	2018-04-23 13:49:23.726725
391	Heavy Duty Wool Chair	Qui blanditiis quia ducimus architecto occaecati aut asperiores. Animi quasi aut natus. Dignissimos nostrum beatae suscipit. Excepturi aperiam impedit neque est. Animi rem facere fugit et quia et est.	74.2900000000000063	74.2900000000000063	0	2018-04-23 13:49:23.729697	2018-04-23 13:49:23.729697
392	Awesome Rubber Bench	Ab magnam ipsam voluptatem quasi iure ut. Eum aliquid provident qui numquam repellat tenetur. Commodi sed dolore velit suscipit qui natus. Aut sed suscipit. Blanditiis cupiditate reprehenderit minima quaerat illum neque.	64.2000000000000028	17	36	2018-04-23 13:49:23.732589	2018-04-23 13:49:23.732589
393	Heavy Duty Copper Bench	Saepe et non voluptatem nesciunt aperiam velit ex. Fuga deleniti quae sit voluptatem nobis. Pariatur nisi id illum officia atque.	56.6700000000000017	56.6700000000000017	34	2018-04-23 13:49:23.735489	2018-04-23 13:49:23.735489
394	Sleek Iron Table	Sed aliquam a necessitatibus facilis voluptatem et beatae. Vel repudiandae non non sunt. Dolores quaerat eaque laboriosam. Deserunt quidem tempora quod iste sit quisquam. Vero quisquam aspernatur aliquid nesciunt reiciendis nulla.	38.5799999999999983	9	0	2018-04-23 13:49:23.738628	2018-04-23 13:49:23.738628
395	Heavy Duty Plastic Bag	Repudiandae enim ducimus quam non. Qui rem alias. Enim quod sit saepe adipisci quam placeat.	64.7900000000000063	31	30	2018-04-23 13:49:23.741679	2018-04-23 13:49:23.741679
396	Fantastic Steel Watch	Voluptas dolorem cum ut blanditiis eius qui. Vero aliquid amet ut harum ut quaerat. Sint nemo neque laborum quisquam eum occaecati. Iusto voluptas in officiis sint.	64.2900000000000063	64.2900000000000063	0	2018-04-23 13:49:23.745192	2018-04-23 13:49:23.745192
397	Enormous Concrete Shirt	Qui ex id distinctio sit sint. Veniam et nulla vitae. Modi est impedit fuga perspiciatis ut et quo.	60.75	48	32	2018-04-23 13:49:23.74833	2018-04-23 13:49:23.74833
398	Heavy Duty Cotton Gloves	Illo voluptatem aliquid non soluta similique. Et reprehenderit id. Quis accusantium dolores temporibus debitis quo modi nemo. Natus est quo dolorum libero voluptates et nesciunt.	53.8699999999999974	53.8699999999999974	0	2018-04-23 13:49:23.751617	2018-04-23 13:49:23.751617
399	Gorgeous Linen Knife	Possimus non est in. Sint sed non culpa. Minima nemo autem voluptas iure consequuntur modi sapiente. Quis rerum illum. Excepturi id et aut illum non eum aut.	83.8700000000000045	37	12	2018-04-23 13:49:23.757211	2018-04-23 13:49:23.757211
400	Ergonomic Plastic Car	Odit dolor accusantium praesentium quaerat totam minima. Inventore nobis praesentium quod itaque unde dolore magnam. Repudiandae quia qui eum.	16.6400000000000006	9	1	2018-04-23 13:49:23.760242	2018-04-23 13:49:23.760242
401	Fantastic Rubber Hat	Doloribus rerum voluptatem corrupti et aut. Unde est beatae. Sunt aliquam sit illo voluptatem id in.	62.5900000000000034	62.5900000000000034	7	2018-04-23 13:49:23.763137	2018-04-23 13:49:23.763137
402	Intelligent Paper Shoes	Est ea officiis quas vel dignissimos. Et dolores repellendus rerum ut eaque nulla. Non laudantium omnis. Qui tempora cupiditate corporis. Dolor temporibus quam qui quis dolorem quia.	12.4900000000000002	12	1	2018-04-23 13:49:23.766298	2018-04-23 13:49:23.766298
403	Lightweight Copper Hat	Non odit a sunt dolor quo. Voluptatum quia velit quis. Delectus molestias earum reiciendis sit rerum. Eligendi explicabo et provident quaerat nesciunt eum velit. Veritatis nisi non quaerat distinctio qui sapiente nulla.	21.9200000000000017	5	0	2018-04-23 13:49:23.770255	2018-04-23 13:49:23.770255
404	Small Wool Gloves	Unde maxime rerum et soluta. Sed voluptatem ducimus aut sit quo asperiores expedita. Magnam maiores saepe. Quis ut nisi aspernatur a omnis ipsam quam.	94.519999999999996	94.519999999999996	49	2018-04-23 13:49:23.774203	2018-04-23 13:49:23.774203
405	Fantastic Aluminum Shirt	Praesentium ipsam et recusandae. Aut dolor quis enim consequatur labore sit. Accusamus est in pariatur officiis fuga. Aut autem et itaque amet laboriosam ut.	51.6499999999999986	51.6499999999999986	0	2018-04-23 13:49:23.778708	2018-04-23 13:49:23.778708
406	Enormous Wooden Plate	Non aliquid ea rerum ad. Deserunt sunt nihil expedita iste et est. Ut provident accusamus. Optio nam dolorem repellat. Dolorem voluptas recusandae alias est soluta magni voluptates.	20.4699999999999989	11	0	2018-04-23 13:49:23.78544	2018-04-23 13:49:23.78544
407	Small Plastic Bottle	Quasi iusto quos illum. Ratione hic pariatur sint porro repellat omnis quia. Laborum modi molestiae sed possimus alias magnam cum. A consectetur ratione qui. Repellat rem est ut deserunt et maxime laboriosam.	6.83000000000000007	1	32	2018-04-23 13:49:23.795909	2018-04-23 13:49:23.795909
408	Ergonomic Iron Bench	Repellat saepe aut autem voluptatem eligendi nesciunt. Ut ut qui quaerat tenetur iure iste ut. Consequuntur quo animi. Omnis omnis dolorem dolorum est. Non ea doloremque magnam explicabo reprehenderit quasi perspiciatis.	44.1300000000000026	44.1300000000000026	35	2018-04-23 13:49:23.799208	2018-04-23 13:49:23.799208
409	Lightweight Linen Knife	Tempora assumenda dolorem velit architecto ut. Quae possimus cupiditate dolore et. Cum qui dolorem veritatis nemo laborum. Ut quod nesciunt cupiditate dolor et tempore. Voluptatem vel est illum atque odio accusantium consequuntur.	59.8800000000000026	13	0	2018-04-23 13:49:23.803569	2018-04-23 13:49:23.803569
442	Awesome Plastic Watch	Omnis aut ea. Possimus maxime molestiae ut aliquid quis a ut. Quia et architecto est cumque.	11.6199999999999992	11.6199999999999992	26	2018-04-23 13:49:23.915703	2018-04-23 13:49:23.915703
410	Aerodynamic Leather Bottle	Ipsam iure nemo molestiae quo dolor qui quisquam. Id adipisci sint sunt. Repudiandae consequatur aspernatur incidunt unde. Quos assumenda sit vero. Qui vero explicabo est accusantium earum et.	32.3200000000000003	32.3200000000000003	33	2018-04-23 13:49:23.806901	2018-04-23 13:49:23.806901
411	Heavy Duty Bronze Watch	Ut ut et rerum dignissimos. Quos placeat occaecati. Corporis doloribus alias qui quia sapiente consequatur. Et optio animi quibusdam quis consequatur aliquam architecto. Id dignissimos vitae quae asperiores.	3.41000000000000014	1	0	2018-04-23 13:49:23.812254	2018-04-23 13:49:23.812254
412	Fantastic Paper Watch	Consequuntur molestiae incidunt. Non rerum dolorem dolorem. Eveniet in suscipit ducimus fuga.	82.6200000000000045	27	0	2018-04-23 13:49:23.815208	2018-04-23 13:49:23.815208
413	Rustic Rubber Wallet	Labore voluptatibus et. Provident porro placeat quis. Magnam inventore ipsam qui eos. Doloribus reprehenderit consequuntur. Ut et voluptate adipisci temporibus.	15.5	15.5	48	2018-04-23 13:49:23.81826	2018-04-23 13:49:23.81826
414	Mediocre Plastic Clock	Itaque perspiciatis voluptas et. Pariatur non vitae omnis autem incidunt ut. Omnis aut saepe quae dolor sit. Natus consequatur aut labore nulla temporibus.	2.35999999999999988	2.35999999999999988	17	2018-04-23 13:49:23.821406	2018-04-23 13:49:23.821406
415	Practical Steel Bench	Dolores quia error. Animi sed et consequuntur ut dolores qui. Aliquam perferendis dolorum animi aperiam exercitationem a alias. Tempora enim iste distinctio. Minima quas consequuntur.	7.79000000000000004	4	0	2018-04-23 13:49:23.824581	2018-04-23 13:49:23.824581
416	Enormous Wooden Bench	Autem fugit accusamus dolor. Voluptas nobis natus vero sint. Corrupti voluptatibus voluptate et.	7.05999999999999961	7.05999999999999961	14	2018-04-23 13:49:23.828458	2018-04-23 13:49:23.828458
417	Intelligent Concrete Gloves	Consequuntur aliquid eos ut quo. Unde et aut et laborum quo. Occaecati nam aspernatur exercitationem est ea dolores. Ut neque temporibus ratione tempore.	91.8199999999999932	69	0	2018-04-23 13:49:23.831878	2018-04-23 13:49:23.831878
418	Incredible Steel Bottle	Rem facilis sed sint quia. Corrupti labore debitis repellendus tempore delectus. Nostrum tempore doloribus excepturi ratione.	57.5	57.5	0	2018-04-23 13:49:23.835033	2018-04-23 13:49:23.835033
419	Lightweight Copper Bag	Et consequatur qui vitae omnis hic perspiciatis amet. Fugit voluptas commodi laboriosam. Ut ratione doloribus libero reprehenderit sit. Omnis voluptates accusamus sed. Qui corrupti neque illum nostrum.	81.1500000000000057	81.1500000000000057	0	2018-04-23 13:49:23.838375	2018-04-23 13:49:23.838375
420	Sleek Paper Plate	Ullam labore eos earum repellendus. Delectus velit rerum optio recusandae. Reprehenderit et corrupti inventore.	37.3999999999999986	37.3999999999999986	32	2018-04-23 13:49:23.841551	2018-04-23 13:49:23.841551
421	Heavy Duty Copper Chair	Rerum et aut soluta occaecati sit voluptatem quidem. Alias aut est cupiditate eos ipsa et laborum. Reiciendis officia veniam consequatur corrupti sint et. Impedit sunt dolor corrupti quia qui ea repudiandae. Quisquam at maiores necessitatibus doloribus vero officiis neque.	17.3399999999999999	8	0	2018-04-23 13:49:23.844744	2018-04-23 13:49:23.844744
422	Gorgeous Leather Gloves	Tempora odio omnis. Voluptatem nulla voluptas quibusdam nobis expedita aut. Hic iure delectus quibusdam ut omnis harum est.	11.8399999999999999	11.8399999999999999	0	2018-04-23 13:49:23.847904	2018-04-23 13:49:23.847904
423	Enormous Rubber Car	Dolorem voluptatem placeat assumenda. Est fuga error. Rerum omnis omnis dolor nulla.	52.3800000000000026	1	0	2018-04-23 13:49:23.850863	2018-04-23 13:49:23.850863
424	Lightweight Granite Computer	Distinctio cumque id maxime ipsa repellat. Quas voluptas velit quo aut ut quibusdam. Occaecati quo aut quis.	73.8299999999999983	39	7	2018-04-23 13:49:23.854056	2018-04-23 13:49:23.854056
425	Heavy Duty Paper Computer	Qui hic voluptate. Necessitatibus rerum excepturi nihil impedit. Error similique repellendus.	63.5900000000000034	56	0	2018-04-23 13:49:23.857495	2018-04-23 13:49:23.857495
426	Intelligent Aluminum Bag	Quibusdam et consequatur veritatis. Dolores voluptate voluptas fuga ipsam. Et excepturi voluptatem cum et vitae non voluptatum. Sed suscipit neque.	94.6800000000000068	44	0	2018-04-23 13:49:23.860548	2018-04-23 13:49:23.860548
427	Lightweight Wool Plate	Aut molestias sed. Velit quia iste doloremque similique sunt aperiam recusandae. Et consequuntur nesciunt harum reprehenderit ut laborum iste.	12.5	12.5	0	2018-04-23 13:49:23.863596	2018-04-23 13:49:23.863596
428	Synergistic Leather Table	Voluptatem omnis necessitatibus pariatur et delectus. Ipsum sint laboriosam est unde. Nulla est repudiandae quis et praesentium. Voluptatem similique dolores non. Quo accusamus ab in nobis quos ratione quo.	59.8900000000000006	59.8900000000000006	27	2018-04-23 13:49:23.866617	2018-04-23 13:49:23.866617
429	Fantastic Leather Clock	Aut odit vel suscipit. Totam laudantium perspiciatis voluptas voluptas ipsum voluptates vero. Qui vitae et non hic et. Incidunt laboriosam distinctio molestias dolores maxime.	67.4300000000000068	47	0	2018-04-23 13:49:23.869768	2018-04-23 13:49:23.869768
430	Lightweight Granite Table	Et vitae quia placeat dicta ut. Vel saepe labore dolor sit. Asperiores molestiae nam ipsam fugiat esse.	12.3900000000000006	8	37	2018-04-23 13:49:23.87294	2018-04-23 13:49:23.87294
431	Intelligent Marble Table	Quas aspernatur voluptatem saepe dicta. Unde tempore nobis sapiente repellendus fuga. Molestiae aut quis saepe illum rerum. Ad vel eius.	32.6899999999999977	9	0	2018-04-23 13:49:23.876621	2018-04-23 13:49:23.876621
432	Practical Cotton Bench	Fugiat commodi ut eum rerum explicabo rem. Ut culpa quos dolores. Voluptatem voluptates voluptatem voluptate earum dolores. Accusamus in et perspiciatis.	64.4399999999999977	58	0	2018-04-23 13:49:23.882985	2018-04-23 13:49:23.882985
433	Aerodynamic Granite Hat	Est eius tempore quidem et voluptatem atque. Voluptates aut est. Molestias est accusantium.	3.66999999999999993	3.66999999999999993	35	2018-04-23 13:49:23.886228	2018-04-23 13:49:23.886228
434	Aerodynamic Leather Hat	Suscipit et ipsum aut temporibus officiis rerum. Magnam et occaecati. Eaque voluptatibus minima et.	66.7600000000000051	66.7600000000000051	0	2018-04-23 13:49:23.889848	2018-04-23 13:49:23.889848
435	Synergistic Granite Table	Eaque possimus quia esse. Odit id et sunt accusantium qui assumenda enim. Voluptatem non laborum itaque reprehenderit eligendi sint. Qui tempora nulla occaecati neque. Unde fugiat pariatur et amet.	92.7900000000000063	13	0	2018-04-23 13:49:23.89307	2018-04-23 13:49:23.89307
436	Intelligent Silk Table	Et ut est pariatur. Incidunt qui iure et. Quam est facere. Aspernatur quasi qui esse. Qui ut aut dolorem itaque maiores et.	2.18999999999999995	2	0	2018-04-23 13:49:23.89627	2018-04-23 13:49:23.89627
437	Intelligent Steel Wallet	Ratione dolorem dolor. Quia reprehenderit non quasi necessitatibus sequi voluptas commodi. Similique tempora omnis et facilis. Dicta quam accusamus facilis quia omnis dignissimos minus. Ut et labore et dignissimos corporis pariatur quo.	41.3900000000000006	23	0	2018-04-23 13:49:23.899283	2018-04-23 13:49:23.899283
438	Ergonomic Paper Knife	Totam vel nisi. Odio nisi suscipit voluptate possimus. Enim qui cupiditate in saepe ullam. Cum at beatae voluptatum pariatur voluptas tempore quae.	16.8200000000000003	16.8200000000000003	33	2018-04-23 13:49:23.902316	2018-04-23 13:49:23.902316
439	Gorgeous Wool Plate	Dolore molestias est facilis dignissimos laboriosam. Magnam voluptatem deserunt. Incidunt ab quaerat voluptatibus.	68.1299999999999955	51	32	2018-04-23 13:49:23.905562	2018-04-23 13:49:23.905562
440	Synergistic Bronze Plate	Soluta voluptatem veritatis perspiciatis maxime non. Itaque quaerat ipsa eum. Vel saepe magni pariatur corporis praesentium in sed. Sint consequatur ad doloribus. Consectetur necessitatibus aliquam saepe eligendi enim.	18.4400000000000013	1	14	2018-04-23 13:49:23.909176	2018-04-23 13:49:23.909176
441	Gorgeous Wooden Watch	Recusandae corrupti est non. Ipsum quas repellat. Sequi amet qui fugit ab ut id illum. Qui quisquam dolorum facilis ab aut.	5.30999999999999961	3	0	2018-04-23 13:49:23.912495	2018-04-23 13:49:23.912495
443	Intelligent Paper Watch	Alias et iusto earum minus possimus voluptatem. Et accusamus consequatur maxime amet. Aspernatur soluta fugit aperiam. Eius commodi et.	98.6400000000000006	98.6400000000000006	33	2018-04-23 13:49:23.918901	2018-04-23 13:49:23.918901
444	Gorgeous Copper Gloves	Molestias eveniet nihil consequatur debitis optio. Saepe distinctio sint omnis possimus accusantium. Consequatur voluptatem facere natus.	51.6300000000000026	51.6300000000000026	30	2018-04-23 13:49:23.922208	2018-04-23 13:49:23.922208
445	Synergistic Copper Coat	Atque incidunt natus inventore quia alias nihil. Ea aut asperiores sint saepe eaque sed. Veritatis ipsam omnis doloremque animi quo architecto.	16.5100000000000016	9	22	2018-04-23 13:49:23.925219	2018-04-23 13:49:23.925219
446	Aerodynamic Aluminum Computer	Vel odit enim. Earum culpa ab et aperiam omnis ipsam id. Aut quam aut. Molestiae ut earum.	1.40999999999999992	1.40999999999999992	0	2018-04-23 13:49:23.928228	2018-04-23 13:49:23.928228
447	Intelligent Bronze Watch	Itaque optio nostrum voluptates sunt molestiae deleniti odio. Itaque odio est voluptatibus error exercitationem. Asperiores voluptas commodi dolorem accusamus dolores. Quia optio corrupti. Dolores odit adipisci ut.	99.2999999999999972	99.2999999999999972	0	2018-04-23 13:49:23.931275	2018-04-23 13:49:23.931275
448	Mediocre Concrete Pants	Aut est odio neque id perspiciatis repellendus quaerat. Incidunt odio vero ullam quasi quis est. Quasi molestiae beatae aperiam nihil doloribus. Pariatur tempore illum unde consequatur et libero. Molestiae voluptatem aspernatur aut.	67.730000000000004	27	47	2018-04-23 13:49:23.934993	2018-04-23 13:49:23.934993
449	Incredible Iron Shoes	Voluptates rerum soluta debitis. Voluptate assumenda nulla molestiae. Quia suscipit corporis numquam animi alias porro.	26.7399999999999984	26.7399999999999984	0	2018-04-23 13:49:23.93859	2018-04-23 13:49:23.93859
450	Enormous Aluminum Hat	Perferendis alias qui minima dolorem maiores. Ut quo sequi. Atque asperiores cum sint qui aut.	53.8500000000000014	53.8500000000000014	10	2018-04-23 13:49:23.941592	2018-04-23 13:49:23.941592
451	Lightweight Wooden Shirt	Dolorem suscipit qui. Sequi labore ratione qui. Error et delectus laboriosam beatae. Vitae consequuntur placeat.	31.0700000000000003	31.0700000000000003	0	2018-04-23 13:49:23.944629	2018-04-23 13:49:23.944629
452	Enormous Concrete Chair	Est consequatur nisi officia consequuntur asperiores cumque ea. Velit at minus nam consequatur ea tempore totam. Numquam dolorum a delectus architecto alias. Eum et fugit quam. Incidunt omnis ut.	96.1800000000000068	96.1800000000000068	0	2018-04-23 13:49:23.947622	2018-04-23 13:49:23.947622
453	Ergonomic Linen Table	Quod eos quae voluptatem incidunt suscipit. Sunt eos voluptatum dolorum sequi sit. Maxime nostrum vel ad sunt quia.	4.24000000000000021	2	0	2018-04-23 13:49:23.950596	2018-04-23 13:49:23.950596
454	Awesome Granite Shoes	Explicabo rerum et. Possimus recusandae quos. Dolores voluptatem asperiores quasi at corporis est dicta. Debitis et veniam. Ut et quam aperiam illum incidunt labore sed.	15.7899999999999991	4	26	2018-04-23 13:49:23.953855	2018-04-23 13:49:23.953855
455	Lightweight Leather Computer	Aut voluptatem non. Autem ipsam voluptas nemo quo quos non. Soluta voluptas laboriosam itaque quia.	20.0799999999999983	20.0799999999999983	0	2018-04-23 13:49:23.957087	2018-04-23 13:49:23.957087
456	Enormous Paper Car	Nihil officiis excepturi autem voluptatem qui perferendis. A est numquam voluptatem. Qui exercitationem et voluptatem dolorum doloribus. Aut necessitatibus ut doloribus asperiores aut dolorem dolores.	42.8999999999999986	42.8999999999999986	0	2018-04-23 13:49:23.960795	2018-04-23 13:49:23.960795
457	Small Aluminum Pants	Natus et et quibusdam dolores. Quis sapiente ut ex soluta adipisci harum. Est enim alias. Et voluptate consequatur a reiciendis quia autem consectetur.	75.6200000000000045	53	38	2018-04-23 13:49:23.964469	2018-04-23 13:49:23.964469
458	Synergistic Paper Lamp	Qui provident aut rerum sunt. Fugiat nemo necessitatibus eveniet dolores velit sed. Ad voluptatem et.	99.4599999999999937	21	0	2018-04-23 13:49:23.967486	2018-04-23 13:49:23.967486
459	Practical Plastic Gloves	Et aut ab quo officiis. A autem non sint aperiam tempora accusantium nisi. Sit aliquam et. Ut qui qui unde ad consequatur.	8	7	21	2018-04-23 13:49:23.973085	2018-04-23 13:49:23.973085
460	Fantastic Silk Coat	Velit rem est. Adipisci vel laudantium ut sit. Qui tempore libero.	82.8799999999999955	82.8799999999999955	43	2018-04-23 13:49:23.976202	2018-04-23 13:49:23.976202
461	Durable Granite Pants	Quisquam tempore reiciendis corrupti doloribus exercitationem sint ipsa. Ut ab est blanditiis accusantium consequuntur voluptas. Et pariatur exercitationem velit consequatur corporis ut. Assumenda ut delectus.	43.6300000000000026	43.6300000000000026	0	2018-04-23 13:49:23.979228	2018-04-23 13:49:23.979228
462	Heavy Duty Wooden Hat	Optio in doloribus voluptatem id distinctio enim sint. Ut qui impedit debitis iure maiores et. Autem a molestiae dolores. Cupiditate repellat beatae nam corporis dolorem harum.	91.0499999999999972	83	0	2018-04-23 13:49:23.982253	2018-04-23 13:49:23.982253
463	Synergistic Silk Shirt	Aliquam consectetur ut cupiditate. Quo voluptatem laudantium dicta ullam facilis dolore eum. Laudantium vel cupiditate eligendi vitae corrupti. Accusamus iusto doloremque.	32.8500000000000014	32.8500000000000014	0	2018-04-23 13:49:23.985417	2018-04-23 13:49:23.985417
464	Fantastic Marble Bottle	Nihil voluptatem eos accusantium. Quia quia non iste. Sit nihil consequatur adipisci quae officia.	25.1099999999999994	25.1099999999999994	31	2018-04-23 13:49:23.988866	2018-04-23 13:49:23.988866
465	Mediocre Leather Hat	Dolor explicabo ab fuga est. Corrupti in ut ab quod necessitatibus. Qui velit et illo quibusdam in est. Aut odit quam sed consequatur. Quia quos non.	74.0300000000000011	13	27	2018-04-23 13:49:23.992385	2018-04-23 13:49:23.992385
466	Mediocre Steel Gloves	Possimus odio minima ut quis id. Maiores non earum facilis. Ut odit aut optio iure.	57.3299999999999983	57.3299999999999983	0	2018-04-23 13:49:23.997888	2018-04-23 13:49:23.997888
467	Small Granite Coat	Repudiandae vel quisquam exercitationem voluptas nesciunt aliquid. Voluptas omnis qui. Quo enim quod voluptate placeat. Vitae et voluptatem sapiente nam sit.	12.0999999999999996	12.0999999999999996	26	2018-04-23 13:49:24.001087	2018-04-23 13:49:24.001087
468	Intelligent Cotton Chair	Rerum non sequi omnis qui qui alias. Et eos reprehenderit. Ea quo voluptatem et quasi ab. Rerum sapiente cum. Quis ex neque odio omnis nemo facere est.	59.0499999999999972	59.0499999999999972	44	2018-04-23 13:49:24.004404	2018-04-23 13:49:24.004404
469	Awesome Cotton Plate	Molestias voluptas asperiores eum quis. Ut sint eveniet voluptatem omnis. Aut et et. Architecto culpa tempore sunt tenetur illo sit.	71.1800000000000068	25	39	2018-04-23 13:49:24.009931	2018-04-23 13:49:24.009931
470	Awesome Marble Coat	Amet autem aut facere cum eaque. Aliquid occaecati voluptates quasi et excepturi. Commodi voluptatem quis. Voluptatum et voluptatem nam rerum ab dicta libero.	52.0399999999999991	52.0399999999999991	3	2018-04-23 13:49:24.017294	2018-04-23 13:49:24.017294
471	Heavy Duty Marble Plate	Voluptatem nobis sed libero et sequi non. Est velit inventore omnis error qui. Omnis et a autem doloribus. Nemo laudantium voluptates fugit perspiciatis. Voluptatem amet fugiat quod odit dolor maxime aspernatur.	42.4600000000000009	42.4600000000000009	0	2018-04-23 13:49:24.021523	2018-04-23 13:49:24.021523
472	Synergistic Steel Bottle	Explicabo accusantium et consectetur quo. Dolores et omnis consequatur at saepe excepturi. Perspiciatis aut ut. Fugiat voluptatibus distinctio excepturi. Numquam sed rerum officia voluptas.	30.8599999999999994	19	4	2018-04-23 13:49:24.025229	2018-04-23 13:49:24.025229
473	Synergistic Granite Coat	Ut facilis odio. Omnis aut dolores cumque repudiandae. Nam necessitatibus in facere est perferendis possimus. Dignissimos velit odio.	34.4399999999999977	34	0	2018-04-23 13:49:24.028965	2018-04-23 13:49:24.028965
474	Small Aluminum Gloves	Aliquam dolor iste. Libero distinctio iure et rerum consectetur. Voluptatem repudiandae officiis velit asperiores laudantium.	97.2099999999999937	97.2099999999999937	0	2018-04-23 13:49:24.032325	2018-04-23 13:49:24.032325
475	Small Marble Car	Non qui quaerat rerum voluptas. Praesentium consequatur et rerum. Cupiditate ipsum recusandae.	80.0400000000000063	80.0400000000000063	3	2018-04-23 13:49:24.036124	2018-04-23 13:49:24.036124
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects (id, title, student_id, created_at, updated_at) FROM stdin;
1	extend customized niches	494	2018-04-23 13:49:17.292393	2018-04-23 13:49:17.292393
2	innovate sexy web services	116	2018-04-23 13:49:17.295258	2018-04-23 13:49:17.295258
3	syndicate back-end functionalities	369	2018-04-23 13:49:17.297386	2018-04-23 13:49:17.297386
4	embrace extensible convergence	37	2018-04-23 13:49:17.299663	2018-04-23 13:49:17.299663
5	deploy vertical markets	123	2018-04-23 13:49:17.301736	2018-04-23 13:49:17.301736
6	synergize plug-and-play methodologies	12	2018-04-23 13:49:17.304024	2018-04-23 13:49:17.304024
7	e-enable collaborative interfaces	158	2018-04-23 13:49:17.306031	2018-04-23 13:49:17.306031
8	expedite distributed ROI	346	2018-04-23 13:49:17.30791	2018-04-23 13:49:17.30791
9	integrate compelling experiences	198	2018-04-23 13:49:17.309735	2018-04-23 13:49:17.309735
10	embrace out-of-the-box markets	437	2018-04-23 13:49:17.311573	2018-04-23 13:49:17.311573
11	grow intuitive networks	98	2018-04-23 13:49:17.313511	2018-04-23 13:49:17.313511
12	embrace out-of-the-box models	259	2018-04-23 13:49:17.315466	2018-04-23 13:49:17.315466
13	architect viral portals	80	2018-04-23 13:49:17.31744	2018-04-23 13:49:17.31744
14	unleash visionary infrastructures	473	2018-04-23 13:49:17.319755	2018-04-23 13:49:17.319755
15	exploit strategic solutions	84	2018-04-23 13:49:17.321792	2018-04-23 13:49:17.321792
16	aggregate end-to-end methodologies	278	2018-04-23 13:49:17.323763	2018-04-23 13:49:17.323763
17	strategize revolutionary methodologies	434	2018-04-23 13:49:17.325889	2018-04-23 13:49:17.325889
18	engineer back-end markets	448	2018-04-23 13:49:17.327887	2018-04-23 13:49:17.327887
19	evolve 24/7 initiatives	416	2018-04-23 13:49:17.329892	2018-04-23 13:49:17.329892
20	strategize innovative niches	85	2018-04-23 13:49:17.332006	2018-04-23 13:49:17.332006
21	revolutionize compelling partnerships	397	2018-04-23 13:49:17.333966	2018-04-23 13:49:17.333966
22	benchmark intuitive web-readiness	367	2018-04-23 13:49:17.336148	2018-04-23 13:49:17.336148
23	architect vertical systems	110	2018-04-23 13:49:17.338066	2018-04-23 13:49:17.338066
24	disintermediate next-generation convergence	147	2018-04-23 13:49:17.340055	2018-04-23 13:49:17.340055
25	implement customized experiences	358	2018-04-23 13:49:17.342018	2018-04-23 13:49:17.342018
26	productize B2B channels	42	2018-04-23 13:49:17.343944	2018-04-23 13:49:17.343944
27	architect dynamic architectures	342	2018-04-23 13:49:17.345877	2018-04-23 13:49:17.345877
28	expedite 24/365 ROI	220	2018-04-23 13:49:17.347857	2018-04-23 13:49:17.347857
29	expedite interactive e-services	318	2018-04-23 13:49:17.349849	2018-04-23 13:49:17.349849
30	facilitate robust interfaces	289	2018-04-23 13:49:17.352177	2018-04-23 13:49:17.352177
31	whiteboard visionary e-business	398	2018-04-23 13:49:17.354202	2018-04-23 13:49:17.354202
32	scale visionary systems	496	2018-04-23 13:49:17.356152	2018-04-23 13:49:17.356152
33	brand virtual web-readiness	67	2018-04-23 13:49:17.35805	2018-04-23 13:49:17.35805
34	reinvent global web services	258	2018-04-23 13:49:17.359893	2018-04-23 13:49:17.359893
35	optimize efficient interfaces	499	2018-04-23 13:49:17.361698	2018-04-23 13:49:17.361698
36	engage bricks-and-clicks synergies	221	2018-04-23 13:49:17.363522	2018-04-23 13:49:17.363522
37	maximize visionary architectures	382	2018-04-23 13:49:17.365312	2018-04-23 13:49:17.365312
38	empower efficient channels	126	2018-04-23 13:49:17.367155	2018-04-23 13:49:17.367155
39	engineer revolutionary architectures	120	2018-04-23 13:49:17.369162	2018-04-23 13:49:17.369162
40	maximize innovative infomediaries	224	2018-04-23 13:49:17.371219	2018-04-23 13:49:17.371219
41	harness integrated markets	227	2018-04-23 13:49:17.373172	2018-04-23 13:49:17.373172
42	benchmark wireless relationships	105	2018-04-23 13:49:17.375118	2018-04-23 13:49:17.375118
43	grow customized networks	226	2018-04-23 13:49:17.377014	2018-04-23 13:49:17.377014
44	leverage web-enabled deliverables	164	2018-04-23 13:49:17.379308	2018-04-23 13:49:17.379308
45	mesh visionary metrics	226	2018-04-23 13:49:17.381305	2018-04-23 13:49:17.381305
46	drive seamless communities	89	2018-04-23 13:49:17.383237	2018-04-23 13:49:17.383237
47	optimize revolutionary action-items	69	2018-04-23 13:49:17.385365	2018-04-23 13:49:17.385365
48	optimize back-end infomediaries	105	2018-04-23 13:49:17.387406	2018-04-23 13:49:17.387406
49	morph leading-edge e-tailers	15	2018-04-23 13:49:17.38934	2018-04-23 13:49:17.38934
50	integrate turn-key applications	2	2018-04-23 13:49:17.39126	2018-04-23 13:49:17.39126
51	brand out-of-the-box technologies	90	2018-04-23 13:49:17.393094	2018-04-23 13:49:17.393094
52	exploit intuitive e-commerce	205	2018-04-23 13:49:17.394931	2018-04-23 13:49:17.394931
53	grow next-generation ROI	166	2018-04-23 13:49:17.396754	2018-04-23 13:49:17.396754
54	grow 24/7 markets	152	2018-04-23 13:49:17.398599	2018-04-23 13:49:17.398599
55	scale killer bandwidth	181	2018-04-23 13:49:17.400433	2018-04-23 13:49:17.400433
56	productize one-to-one e-business	402	2018-04-23 13:49:17.402328	2018-04-23 13:49:17.402328
57	whiteboard granular metrics	379	2018-04-23 13:49:17.404326	2018-04-23 13:49:17.404326
58	target magnetic experiences	180	2018-04-23 13:49:17.406469	2018-04-23 13:49:17.406469
59	aggregate impactful solutions	210	2018-04-23 13:49:17.408413	2018-04-23 13:49:17.408413
60	monetize enterprise mindshare	107	2018-04-23 13:49:17.410381	2018-04-23 13:49:17.410381
61	disintermediate proactive e-business	314	2018-04-23 13:49:17.412305	2018-04-23 13:49:17.412305
62	optimize collaborative action-items	322	2018-04-23 13:49:17.414238	2018-04-23 13:49:17.414238
63	transition efficient schemas	45	2018-04-23 13:49:17.416141	2018-04-23 13:49:17.416141
64	reinvent cross-media methodologies	213	2018-04-23 13:49:17.418053	2018-04-23 13:49:17.418053
65	synergize revolutionary paradigms	99	2018-04-23 13:49:17.420256	2018-04-23 13:49:17.420256
66	morph cross-media content	67	2018-04-23 13:49:17.422178	2018-04-23 13:49:17.422178
67	seize real-time portals	399	2018-04-23 13:49:17.424036	2018-04-23 13:49:17.424036
68	empower front-end applications	398	2018-04-23 13:49:17.425985	2018-04-23 13:49:17.425985
69	productize revolutionary functionalities	348	2018-04-23 13:49:17.427809	2018-04-23 13:49:17.427809
70	revolutionize compelling technologies	328	2018-04-23 13:49:17.429646	2018-04-23 13:49:17.429646
71	repurpose virtual experiences	190	2018-04-23 13:49:17.431586	2018-04-23 13:49:17.431586
72	orchestrate robust paradigms	380	2018-04-23 13:49:17.43353	2018-04-23 13:49:17.43353
73	brand end-to-end applications	210	2018-04-23 13:49:17.435417	2018-04-23 13:49:17.435417
74	e-enable strategic solutions	89	2018-04-23 13:49:17.437544	2018-04-23 13:49:17.437544
75	benchmark robust initiatives	193	2018-04-23 13:49:17.439458	2018-04-23 13:49:17.439458
76	streamline open-source channels	234	2018-04-23 13:49:17.441358	2018-04-23 13:49:17.441358
77	reinvent cutting-edge synergies	233	2018-04-23 13:49:17.443233	2018-04-23 13:49:17.443233
78	evolve B2C bandwidth	378	2018-04-23 13:49:17.445136	2018-04-23 13:49:17.445136
79	streamline open-source platforms	288	2018-04-23 13:49:17.44704	2018-04-23 13:49:17.44704
80	transform virtual convergence	456	2018-04-23 13:49:17.448846	2018-04-23 13:49:17.448846
81	repurpose compelling relationships	335	2018-04-23 13:49:17.450617	2018-04-23 13:49:17.450617
82	deploy end-to-end infrastructures	34	2018-04-23 13:49:17.452483	2018-04-23 13:49:17.452483
83	e-enable integrated applications	371	2018-04-23 13:49:17.454408	2018-04-23 13:49:17.454408
84	innovate plug-and-play initiatives	55	2018-04-23 13:49:17.456357	2018-04-23 13:49:17.456357
85	transform integrated networks	133	2018-04-23 13:49:17.45855	2018-04-23 13:49:17.45855
86	synergize back-end content	51	2018-04-23 13:49:17.460569	2018-04-23 13:49:17.460569
87	exploit mission-critical interfaces	242	2018-04-23 13:49:17.462453	2018-04-23 13:49:17.462453
88	morph wireless e-markets	440	2018-04-23 13:49:17.464285	2018-04-23 13:49:17.464285
89	empower ubiquitous infomediaries	84	2018-04-23 13:49:17.466126	2018-04-23 13:49:17.466126
90	expedite B2B technologies	371	2018-04-23 13:49:17.467938	2018-04-23 13:49:17.467938
91	synergize killer users	389	2018-04-23 13:49:17.470084	2018-04-23 13:49:17.470084
92	facilitate global architectures	330	2018-04-23 13:49:17.472112	2018-04-23 13:49:17.472112
93	matrix collaborative users	205	2018-04-23 13:49:17.474032	2018-04-23 13:49:17.474032
94	transform sexy initiatives	464	2018-04-23 13:49:17.476009	2018-04-23 13:49:17.476009
95	innovate 24/365 schemas	322	2018-04-23 13:49:17.478009	2018-04-23 13:49:17.478009
96	incentivize next-generation functionalities	324	2018-04-23 13:49:17.480123	2018-04-23 13:49:17.480123
97	whiteboard robust systems	24	2018-04-23 13:49:17.483075	2018-04-23 13:49:17.483075
98	facilitate virtual mindshare	352	2018-04-23 13:49:17.48557	2018-04-23 13:49:17.48557
99	generate value-added deliverables	382	2018-04-23 13:49:17.487638	2018-04-23 13:49:17.487638
100	cultivate killer models	300	2018-04-23 13:49:17.489504	2018-04-23 13:49:17.489504
101	redefine virtual deliverables	228	2018-04-23 13:49:17.491329	2018-04-23 13:49:17.491329
102	redefine one-to-one schemas	58	2018-04-23 13:49:17.493309	2018-04-23 13:49:17.493309
103	facilitate web-enabled ROI	200	2018-04-23 13:49:17.495348	2018-04-23 13:49:17.495348
104	extend next-generation methodologies	81	2018-04-23 13:49:17.497393	2018-04-23 13:49:17.497393
105	enable customized platforms	474	2018-04-23 13:49:17.499466	2018-04-23 13:49:17.499466
106	engage innovative architectures	92	2018-04-23 13:49:17.501854	2018-04-23 13:49:17.501854
107	revolutionize virtual technologies	88	2018-04-23 13:49:17.504494	2018-04-23 13:49:17.504494
108	harness synergistic ROI	208	2018-04-23 13:49:17.506816	2018-04-23 13:49:17.506816
109	drive leading-edge mindshare	361	2018-04-23 13:49:17.508858	2018-04-23 13:49:17.508858
110	streamline back-end content	90	2018-04-23 13:49:17.51073	2018-04-23 13:49:17.51073
111	leverage user-centric action-items	479	2018-04-23 13:49:17.512758	2018-04-23 13:49:17.512758
112	brand customized e-tailers	413	2018-04-23 13:49:17.514632	2018-04-23 13:49:17.514632
113	synergize seamless applications	57	2018-04-23 13:49:17.51723	2018-04-23 13:49:17.51723
114	leverage synergistic bandwidth	458	2018-04-23 13:49:17.519499	2018-04-23 13:49:17.519499
115	e-enable out-of-the-box systems	439	2018-04-23 13:49:17.52157	2018-04-23 13:49:17.52157
116	expedite virtual platforms	265	2018-04-23 13:49:17.523624	2018-04-23 13:49:17.523624
117	deliver viral schemas	125	2018-04-23 13:49:17.525533	2018-04-23 13:49:17.525533
118	exploit distributed systems	396	2018-04-23 13:49:17.527326	2018-04-23 13:49:17.527326
119	recontextualize cutting-edge portals	170	2018-04-23 13:49:17.530341	2018-04-23 13:49:17.530341
120	mesh rich markets	8	2018-04-23 13:49:17.532377	2018-04-23 13:49:17.532377
121	transition leading-edge technologies	401	2018-04-23 13:49:17.534245	2018-04-23 13:49:17.534245
122	utilize scalable users	466	2018-04-23 13:49:17.536286	2018-04-23 13:49:17.536286
123	aggregate out-of-the-box infomediaries	113	2018-04-23 13:49:17.538385	2018-04-23 13:49:17.538385
124	aggregate killer applications	225	2018-04-23 13:49:17.540484	2018-04-23 13:49:17.540484
125	disintermediate cutting-edge solutions	355	2018-04-23 13:49:17.54269	2018-04-23 13:49:17.54269
126	harness vertical web services	362	2018-04-23 13:49:17.544738	2018-04-23 13:49:17.544738
127	integrate real-time e-commerce	60	2018-04-23 13:49:17.546684	2018-04-23 13:49:17.546684
128	leverage intuitive schemas	107	2018-04-23 13:49:17.548605	2018-04-23 13:49:17.548605
129	facilitate mission-critical ROI	477	2018-04-23 13:49:17.550409	2018-04-23 13:49:17.550409
130	innovate bricks-and-clicks metrics	331	2018-04-23 13:49:17.552362	2018-04-23 13:49:17.552362
131	scale rich technologies	482	2018-04-23 13:49:17.554351	2018-04-23 13:49:17.554351
132	architect intuitive infrastructures	6	2018-04-23 13:49:17.556338	2018-04-23 13:49:17.556338
133	mesh granular applications	245	2018-04-23 13:49:17.55829	2018-04-23 13:49:17.55829
134	unleash front-end e-commerce	90	2018-04-23 13:49:17.560256	2018-04-23 13:49:17.560256
135	transform B2B action-items	61	2018-04-23 13:49:17.562154	2018-04-23 13:49:17.562154
136	harness granular functionalities	452	2018-04-23 13:49:17.564087	2018-04-23 13:49:17.564087
137	repurpose magnetic relationships	197	2018-04-23 13:49:17.566052	2018-04-23 13:49:17.566052
138	reintermediate frictionless e-business	6	2018-04-23 13:49:17.568169	2018-04-23 13:49:17.568169
139	benchmark B2C solutions	28	2018-04-23 13:49:17.570849	2018-04-23 13:49:17.570849
140	enhance leading-edge synergies	180	2018-04-23 13:49:17.572814	2018-04-23 13:49:17.572814
141	synergize global ROI	176	2018-04-23 13:49:17.574678	2018-04-23 13:49:17.574678
142	redefine seamless communities	61	2018-04-23 13:49:17.576567	2018-04-23 13:49:17.576567
143	strategize robust users	458	2018-04-23 13:49:17.578431	2018-04-23 13:49:17.578431
144	unleash visionary vortals	278	2018-04-23 13:49:17.580291	2018-04-23 13:49:17.580291
145	engineer strategic niches	408	2018-04-23 13:49:17.582165	2018-04-23 13:49:17.582165
146	disintermediate efficient partnerships	294	2018-04-23 13:49:17.584011	2018-04-23 13:49:17.584011
147	morph real-time convergence	148	2018-04-23 13:49:17.58602	2018-04-23 13:49:17.58602
148	innovate clicks-and-mortar communities	499	2018-04-23 13:49:17.588897	2018-04-23 13:49:17.588897
149	transition synergistic mindshare	429	2018-04-23 13:49:17.591357	2018-04-23 13:49:17.591357
150	embrace transparent solutions	446	2018-04-23 13:49:17.593567	2018-04-23 13:49:17.593567
151	streamline best-of-breed schemas	452	2018-04-23 13:49:17.595616	2018-04-23 13:49:17.595616
152	engage strategic markets	206	2018-04-23 13:49:17.597615	2018-04-23 13:49:17.597615
153	morph seamless infomediaries	286	2018-04-23 13:49:17.599973	2018-04-23 13:49:17.599973
154	repurpose B2B convergence	261	2018-04-23 13:49:17.602082	2018-04-23 13:49:17.602082
155	cultivate efficient interfaces	257	2018-04-23 13:49:17.604029	2018-04-23 13:49:17.604029
156	revolutionize turn-key convergence	207	2018-04-23 13:49:17.605979	2018-04-23 13:49:17.605979
157	redefine out-of-the-box communities	324	2018-04-23 13:49:17.607874	2018-04-23 13:49:17.607874
158	facilitate dynamic applications	467	2018-04-23 13:49:17.609659	2018-04-23 13:49:17.609659
159	reinvent web-enabled functionalities	445	2018-04-23 13:49:17.611475	2018-04-23 13:49:17.611475
160	visualize back-end platforms	285	2018-04-23 13:49:17.613327	2018-04-23 13:49:17.613327
161	harness collaborative architectures	21	2018-04-23 13:49:17.615183	2018-04-23 13:49:17.615183
162	strategize e-business technologies	106	2018-04-23 13:49:17.617033	2018-04-23 13:49:17.617033
163	aggregate synergistic portals	185	2018-04-23 13:49:17.618954	2018-04-23 13:49:17.618954
164	transition open-source mindshare	151	2018-04-23 13:49:17.62131	2018-04-23 13:49:17.62131
165	target front-end platforms	116	2018-04-23 13:49:17.625062	2018-04-23 13:49:17.625062
166	generate real-time infrastructures	245	2018-04-23 13:49:17.62765	2018-04-23 13:49:17.62765
167	harness plug-and-play metrics	135	2018-04-23 13:49:17.629516	2018-04-23 13:49:17.629516
168	engineer synergistic web-readiness	403	2018-04-23 13:49:17.631355	2018-04-23 13:49:17.631355
169	brand granular initiatives	273	2018-04-23 13:49:17.633175	2018-04-23 13:49:17.633175
170	optimize bricks-and-clicks applications	393	2018-04-23 13:49:17.634979	2018-04-23 13:49:17.634979
171	optimize dot-com portals	417	2018-04-23 13:49:17.63709	2018-04-23 13:49:17.63709
172	productize dynamic e-commerce	433	2018-04-23 13:49:17.639072	2018-04-23 13:49:17.639072
173	streamline revolutionary paradigms	361	2018-04-23 13:49:17.641	2018-04-23 13:49:17.641
174	embrace real-time eyeballs	359	2018-04-23 13:49:17.64304	2018-04-23 13:49:17.64304
175	grow cross-platform infomediaries	243	2018-04-23 13:49:17.644986	2018-04-23 13:49:17.644986
176	repurpose leading-edge infomediaries	168	2018-04-23 13:49:17.646957	2018-04-23 13:49:17.646957
177	engage cross-platform bandwidth	143	2018-04-23 13:49:17.648886	2018-04-23 13:49:17.648886
178	incubate robust systems	95	2018-04-23 13:49:17.650804	2018-04-23 13:49:17.650804
179	transition granular e-markets	359	2018-04-23 13:49:17.653069	2018-04-23 13:49:17.653069
180	revolutionize end-to-end bandwidth	38	2018-04-23 13:49:17.655048	2018-04-23 13:49:17.655048
181	redefine cross-media initiatives	302	2018-04-23 13:49:17.656904	2018-04-23 13:49:17.656904
182	enhance transparent metrics	172	2018-04-23 13:49:17.65874	2018-04-23 13:49:17.65874
183	seize compelling e-business	386	2018-04-23 13:49:17.660551	2018-04-23 13:49:17.660551
184	aggregate back-end portals	322	2018-04-23 13:49:17.662364	2018-04-23 13:49:17.662364
185	deliver enterprise relationships	451	2018-04-23 13:49:17.664171	2018-04-23 13:49:17.664171
186	benchmark integrated e-commerce	236	2018-04-23 13:49:17.666046	2018-04-23 13:49:17.666046
187	matrix revolutionary portals	18	2018-04-23 13:49:17.6679	2018-04-23 13:49:17.6679
188	exploit global content	480	2018-04-23 13:49:17.669892	2018-04-23 13:49:17.669892
189	orchestrate extensible initiatives	150	2018-04-23 13:49:17.671807	2018-04-23 13:49:17.671807
190	empower plug-and-play supply-chains	157	2018-04-23 13:49:17.673659	2018-04-23 13:49:17.673659
191	deploy customized infomediaries	211	2018-04-23 13:49:17.675549	2018-04-23 13:49:17.675549
192	redefine compelling functionalities	334	2018-04-23 13:49:17.677403	2018-04-23 13:49:17.677403
193	transition cutting-edge interfaces	68	2018-04-23 13:49:17.679432	2018-04-23 13:49:17.679432
194	embrace sticky interfaces	387	2018-04-23 13:49:17.68136	2018-04-23 13:49:17.68136
195	visualize clicks-and-mortar systems	460	2018-04-23 13:49:17.683267	2018-04-23 13:49:17.683267
196	scale one-to-one supply-chains	200	2018-04-23 13:49:17.685168	2018-04-23 13:49:17.685168
197	reinvent plug-and-play experiences	498	2018-04-23 13:49:17.687167	2018-04-23 13:49:17.687167
198	visualize cross-platform bandwidth	369	2018-04-23 13:49:17.68915	2018-04-23 13:49:17.68915
199	brand leading-edge systems	328	2018-04-23 13:49:17.691073	2018-04-23 13:49:17.691073
200	maximize interactive channels	68	2018-04-23 13:49:17.693001	2018-04-23 13:49:17.693001
201	harness impactful channels	303	2018-04-23 13:49:17.695044	2018-04-23 13:49:17.695044
202	scale seamless web-readiness	115	2018-04-23 13:49:17.697289	2018-04-23 13:49:17.697289
203	generate collaborative systems	165	2018-04-23 13:49:17.69927	2018-04-23 13:49:17.69927
204	exploit virtual methodologies	362	2018-04-23 13:49:17.70132	2018-04-23 13:49:17.70132
205	monetize 24/365 e-markets	38	2018-04-23 13:49:17.703389	2018-04-23 13:49:17.703389
206	enable visionary supply-chains	191	2018-04-23 13:49:17.705587	2018-04-23 13:49:17.705587
207	unleash best-of-breed paradigms	352	2018-04-23 13:49:17.707514	2018-04-23 13:49:17.707514
208	evolve compelling e-tailers	307	2018-04-23 13:49:17.709383	2018-04-23 13:49:17.709383
209	transition frictionless bandwidth	394	2018-04-23 13:49:17.711343	2018-04-23 13:49:17.711343
210	mesh 24/365 e-services	45	2018-04-23 13:49:17.713398	2018-04-23 13:49:17.713398
211	envisioneer next-generation infrastructures	57	2018-04-23 13:49:17.715316	2018-04-23 13:49:17.715316
212	grow innovative applications	111	2018-04-23 13:49:17.717156	2018-04-23 13:49:17.717156
213	facilitate synergistic networks	414	2018-04-23 13:49:17.719085	2018-04-23 13:49:17.719085
214	syndicate integrated content	64	2018-04-23 13:49:17.720985	2018-04-23 13:49:17.720985
215	brand web-enabled mindshare	249	2018-04-23 13:49:17.722826	2018-04-23 13:49:17.722826
216	transform scalable relationships	169	2018-04-23 13:49:17.724656	2018-04-23 13:49:17.724656
217	synergize scalable methodologies	437	2018-04-23 13:49:17.726485	2018-04-23 13:49:17.726485
218	recontextualize dynamic markets	179	2018-04-23 13:49:17.728295	2018-04-23 13:49:17.728295
219	redefine B2C bandwidth	21	2018-04-23 13:49:17.730059	2018-04-23 13:49:17.730059
220	envisioneer B2C methodologies	90	2018-04-23 13:49:17.732108	2018-04-23 13:49:17.732108
221	innovate rich metrics	201	2018-04-23 13:49:17.734103	2018-04-23 13:49:17.734103
222	scale virtual synergies	330	2018-04-23 13:49:17.736255	2018-04-23 13:49:17.736255
223	utilize 24/365 bandwidth	339	2018-04-23 13:49:17.738284	2018-04-23 13:49:17.738284
224	streamline cross-platform infomediaries	461	2018-04-23 13:49:17.740294	2018-04-23 13:49:17.740294
225	revolutionize viral niches	189	2018-04-23 13:49:17.742234	2018-04-23 13:49:17.742234
226	leverage ubiquitous deliverables	230	2018-04-23 13:49:17.744248	2018-04-23 13:49:17.744248
227	deploy frictionless deliverables	468	2018-04-23 13:49:17.746219	2018-04-23 13:49:17.746219
228	envisioneer transparent deliverables	418	2018-04-23 13:49:17.748119	2018-04-23 13:49:17.748119
229	extend customized action-items	332	2018-04-23 13:49:17.750097	2018-04-23 13:49:17.750097
230	harness rich models	155	2018-04-23 13:49:17.752196	2018-04-23 13:49:17.752196
231	streamline customized interfaces	130	2018-04-23 13:49:17.754098	2018-04-23 13:49:17.754098
232	engineer holistic vortals	68	2018-04-23 13:49:17.755952	2018-04-23 13:49:17.755952
233	benchmark sexy platforms	283	2018-04-23 13:49:17.758082	2018-04-23 13:49:17.758082
234	enhance out-of-the-box synergies	381	2018-04-23 13:49:17.760085	2018-04-23 13:49:17.760085
235	e-enable innovative e-commerce	370	2018-04-23 13:49:17.762038	2018-04-23 13:49:17.762038
236	architect enterprise e-business	489	2018-04-23 13:49:17.763996	2018-04-23 13:49:17.763996
237	synergize cutting-edge vortals	86	2018-04-23 13:49:17.765915	2018-04-23 13:49:17.765915
238	deliver frictionless deliverables	66	2018-04-23 13:49:17.767884	2018-04-23 13:49:17.767884
239	transform real-time e-tailers	143	2018-04-23 13:49:17.769978	2018-04-23 13:49:17.769978
240	reintermediate vertical content	361	2018-04-23 13:49:17.771964	2018-04-23 13:49:17.771964
241	integrate visionary markets	284	2018-04-23 13:49:17.773809	2018-04-23 13:49:17.773809
242	morph frictionless solutions	135	2018-04-23 13:49:17.775662	2018-04-23 13:49:17.775662
243	visualize leading-edge web services	94	2018-04-23 13:49:17.777479	2018-04-23 13:49:17.777479
244	brand holistic functionalities	372	2018-04-23 13:49:17.779301	2018-04-23 13:49:17.779301
245	reinvent turn-key initiatives	104	2018-04-23 13:49:17.781138	2018-04-23 13:49:17.781138
246	maximize cross-platform ROI	336	2018-04-23 13:49:17.783361	2018-04-23 13:49:17.783361
247	optimize compelling technologies	176	2018-04-23 13:49:17.785352	2018-04-23 13:49:17.785352
248	grow B2B web-readiness	433	2018-04-23 13:49:17.787284	2018-04-23 13:49:17.787284
249	incentivize killer experiences	410	2018-04-23 13:49:17.789135	2018-04-23 13:49:17.789135
250	revolutionize turn-key methodologies	80	2018-04-23 13:49:17.791009	2018-04-23 13:49:17.791009
251	matrix mission-critical platforms	308	2018-04-23 13:49:17.793001	2018-04-23 13:49:17.793001
252	embrace leading-edge content	306	2018-04-23 13:49:17.794912	2018-04-23 13:49:17.794912
253	mesh user-centric eyeballs	52	2018-04-23 13:49:17.796869	2018-04-23 13:49:17.796869
254	maximize best-of-breed mindshare	185	2018-04-23 13:49:17.798833	2018-04-23 13:49:17.798833
255	transition proactive deliverables	135	2018-04-23 13:49:17.800779	2018-04-23 13:49:17.800779
256	innovate robust convergence	430	2018-04-23 13:49:17.802787	2018-04-23 13:49:17.802787
257	reintermediate efficient networks	252	2018-04-23 13:49:17.804749	2018-04-23 13:49:17.804749
258	architect killer interfaces	278	2018-04-23 13:49:17.806624	2018-04-23 13:49:17.806624
259	cultivate strategic interfaces	332	2018-04-23 13:49:17.808515	2018-04-23 13:49:17.808515
260	evolve cross-platform experiences	181	2018-04-23 13:49:17.810432	2018-04-23 13:49:17.810432
261	empower 24/365 systems	31	2018-04-23 13:49:17.812385	2018-04-23 13:49:17.812385
262	deliver scalable portals	423	2018-04-23 13:49:17.814332	2018-04-23 13:49:17.814332
263	reintermediate open-source partnerships	387	2018-04-23 13:49:17.81627	2018-04-23 13:49:17.81627
264	recontextualize holistic channels	279	2018-04-23 13:49:17.818205	2018-04-23 13:49:17.818205
265	seize distributed supply-chains	149	2018-04-23 13:49:17.820231	2018-04-23 13:49:17.820231
266	disintermediate virtual supply-chains	212	2018-04-23 13:49:17.822393	2018-04-23 13:49:17.822393
267	morph turn-key supply-chains	29	2018-04-23 13:49:17.82469	2018-04-23 13:49:17.82469
268	target revolutionary content	23	2018-04-23 13:49:17.826956	2018-04-23 13:49:17.826956
269	envisioneer proactive niches	430	2018-04-23 13:49:17.829201	2018-04-23 13:49:17.829201
270	transition turn-key channels	30	2018-04-23 13:49:17.831258	2018-04-23 13:49:17.831258
271	seize 24/365 bandwidth	412	2018-04-23 13:49:17.833154	2018-04-23 13:49:17.833154
272	grow magnetic architectures	436	2018-04-23 13:49:17.835234	2018-04-23 13:49:17.835234
273	whiteboard robust platforms	135	2018-04-23 13:49:17.837756	2018-04-23 13:49:17.837756
274	synergize sexy technologies	189	2018-04-23 13:49:17.839743	2018-04-23 13:49:17.839743
275	brand out-of-the-box partnerships	226	2018-04-23 13:49:17.841614	2018-04-23 13:49:17.841614
276	extend viral portals	321	2018-04-23 13:49:17.843469	2018-04-23 13:49:17.843469
277	deliver B2C functionalities	86	2018-04-23 13:49:17.845298	2018-04-23 13:49:17.845298
278	repurpose compelling content	124	2018-04-23 13:49:17.847144	2018-04-23 13:49:17.847144
279	revolutionize turn-key architectures	245	2018-04-23 13:49:17.849004	2018-04-23 13:49:17.849004
280	benchmark best-of-breed solutions	137	2018-04-23 13:49:17.850981	2018-04-23 13:49:17.850981
281	enhance world-class experiences	87	2018-04-23 13:49:17.852926	2018-04-23 13:49:17.852926
282	visualize dot-com metrics	331	2018-04-23 13:49:17.854864	2018-04-23 13:49:17.854864
283	optimize frictionless supply-chains	457	2018-04-23 13:49:17.856695	2018-04-23 13:49:17.856695
284	orchestrate back-end e-tailers	94	2018-04-23 13:49:17.858772	2018-04-23 13:49:17.858772
285	generate killer architectures	200	2018-04-23 13:49:17.860915	2018-04-23 13:49:17.860915
286	utilize B2C paradigms	106	2018-04-23 13:49:17.862798	2018-04-23 13:49:17.862798
287	benchmark robust methodologies	302	2018-04-23 13:49:17.864662	2018-04-23 13:49:17.864662
288	scale dot-com infomediaries	60	2018-04-23 13:49:17.866562	2018-04-23 13:49:17.866562
289	repurpose revolutionary content	246	2018-04-23 13:49:17.868502	2018-04-23 13:49:17.868502
290	streamline killer communities	243	2018-04-23 13:49:17.870472	2018-04-23 13:49:17.870472
291	harness user-centric experiences	386	2018-04-23 13:49:17.872452	2018-04-23 13:49:17.872452
292	aggregate B2C e-commerce	316	2018-04-23 13:49:17.874429	2018-04-23 13:49:17.874429
293	visualize seamless supply-chains	220	2018-04-23 13:49:17.876398	2018-04-23 13:49:17.876398
294	cultivate cutting-edge partnerships	41	2018-04-23 13:49:17.878446	2018-04-23 13:49:17.878446
295	integrate customized relationships	155	2018-04-23 13:49:17.880385	2018-04-23 13:49:17.880385
296	strategize compelling supply-chains	250	2018-04-23 13:49:17.882347	2018-04-23 13:49:17.882347
297	revolutionize back-end partnerships	458	2018-04-23 13:49:17.884262	2018-04-23 13:49:17.884262
298	repurpose frictionless interfaces	449	2018-04-23 13:49:17.886636	2018-04-23 13:49:17.886636
299	enhance collaborative solutions	181	2018-04-23 13:49:17.888592	2018-04-23 13:49:17.888592
300	productize customized e-commerce	146	2018-04-23 13:49:17.890455	2018-04-23 13:49:17.890455
301	orchestrate front-end vortals	295	2018-04-23 13:49:17.892331	2018-04-23 13:49:17.892331
302	strategize distributed communities	95	2018-04-23 13:49:17.894204	2018-04-23 13:49:17.894204
303	grow vertical deliverables	100	2018-04-23 13:49:17.896096	2018-04-23 13:49:17.896096
304	whiteboard bleeding-edge web services	413	2018-04-23 13:49:17.898009	2018-04-23 13:49:17.898009
305	evolve cross-platform action-items	79	2018-04-23 13:49:17.899903	2018-04-23 13:49:17.899903
306	drive holistic methodologies	160	2018-04-23 13:49:17.901976	2018-04-23 13:49:17.901976
307	implement world-class schemas	402	2018-04-23 13:49:17.904231	2018-04-23 13:49:17.904231
308	optimize customized deliverables	373	2018-04-23 13:49:17.912067	2018-04-23 13:49:17.912067
309	empower bleeding-edge paradigms	332	2018-04-23 13:49:17.913948	2018-04-23 13:49:17.913948
310	e-enable one-to-one content	180	2018-04-23 13:49:17.915756	2018-04-23 13:49:17.915756
311	facilitate customized systems	398	2018-04-23 13:49:17.917578	2018-04-23 13:49:17.917578
312	brand interactive technologies	358	2018-04-23 13:49:17.919588	2018-04-23 13:49:17.919588
313	syndicate killer synergies	13	2018-04-23 13:49:17.92154	2018-04-23 13:49:17.92154
314	synthesize intuitive eyeballs	61	2018-04-23 13:49:17.923426	2018-04-23 13:49:17.923426
315	visualize end-to-end action-items	76	2018-04-23 13:49:17.925371	2018-04-23 13:49:17.925371
316	brand web-enabled metrics	459	2018-04-23 13:49:17.927316	2018-04-23 13:49:17.927316
317	aggregate proactive communities	59	2018-04-23 13:49:17.929251	2018-04-23 13:49:17.929251
318	innovate real-time technologies	145	2018-04-23 13:49:17.931263	2018-04-23 13:49:17.931263
319	enable cross-platform niches	432	2018-04-23 13:49:17.93319	2018-04-23 13:49:17.93319
320	synergize robust paradigms	179	2018-04-23 13:49:17.935122	2018-04-23 13:49:17.935122
321	envisioneer scalable methodologies	128	2018-04-23 13:49:17.95347	2018-04-23 13:49:17.95347
322	innovate web-enabled web services	325	2018-04-23 13:49:17.955443	2018-04-23 13:49:17.955443
323	scale mission-critical bandwidth	161	2018-04-23 13:49:17.957366	2018-04-23 13:49:17.957366
324	innovate integrated synergies	199	2018-04-23 13:49:17.959192	2018-04-23 13:49:17.959192
325	reintermediate open-source technologies	149	2018-04-23 13:49:17.961011	2018-04-23 13:49:17.961011
326	revolutionize dynamic initiatives	431	2018-04-23 13:49:17.963053	2018-04-23 13:49:17.963053
327	incubate web-enabled initiatives	460	2018-04-23 13:49:17.964958	2018-04-23 13:49:17.964958
328	whiteboard seamless architectures	83	2018-04-23 13:49:17.966814	2018-04-23 13:49:17.966814
329	implement user-centric architectures	312	2018-04-23 13:49:17.968668	2018-04-23 13:49:17.968668
330	generate dot-com bandwidth	181	2018-04-23 13:49:17.970588	2018-04-23 13:49:17.970588
331	benchmark bleeding-edge applications	385	2018-04-23 13:49:17.972392	2018-04-23 13:49:17.972392
332	utilize scalable users	242	2018-04-23 13:49:17.974394	2018-04-23 13:49:17.974394
333	facilitate transparent relationships	221	2018-04-23 13:49:17.97635	2018-04-23 13:49:17.97635
334	engineer collaborative synergies	139	2018-04-23 13:49:17.994227	2018-04-23 13:49:17.994227
335	synergize B2B networks	271	2018-04-23 13:49:17.99656	2018-04-23 13:49:17.99656
336	brand B2B eyeballs	248	2018-04-23 13:49:17.998465	2018-04-23 13:49:17.998465
337	utilize wireless architectures	452	2018-04-23 13:49:18.000372	2018-04-23 13:49:18.000372
338	optimize enterprise synergies	75	2018-04-23 13:49:18.00241	2018-04-23 13:49:18.00241
339	exploit robust platforms	464	2018-04-23 13:49:18.004428	2018-04-23 13:49:18.004428
340	enhance virtual methodologies	298	2018-04-23 13:49:18.006258	2018-04-23 13:49:18.006258
341	transition open-source e-tailers	465	2018-04-23 13:49:18.008225	2018-04-23 13:49:18.008225
342	orchestrate clicks-and-mortar functionalities	84	2018-04-23 13:49:18.010038	2018-04-23 13:49:18.010038
343	empower dynamic e-business	140	2018-04-23 13:49:18.011778	2018-04-23 13:49:18.011778
344	deploy rich content	362	2018-04-23 13:49:18.013521	2018-04-23 13:49:18.013521
345	generate leading-edge systems	356	2018-04-23 13:49:18.015277	2018-04-23 13:49:18.015277
346	redefine intuitive experiences	209	2018-04-23 13:49:18.01703	2018-04-23 13:49:18.01703
347	e-enable 24/7 experiences	152	2018-04-23 13:49:18.018908	2018-04-23 13:49:18.018908
348	monetize visionary functionalities	131	2018-04-23 13:49:18.020715	2018-04-23 13:49:18.020715
349	drive interactive users	442	2018-04-23 13:49:18.022505	2018-04-23 13:49:18.022505
350	expedite virtual action-items	194	2018-04-23 13:49:18.024306	2018-04-23 13:49:18.024306
351	expedite vertical ROI	310	2018-04-23 13:49:18.026114	2018-04-23 13:49:18.026114
352	grow revolutionary ROI	63	2018-04-23 13:49:18.027891	2018-04-23 13:49:18.027891
353	implement seamless web services	297	2018-04-23 13:49:18.029634	2018-04-23 13:49:18.029634
354	enable turn-key applications	477	2018-04-23 13:49:18.031421	2018-04-23 13:49:18.031421
355	evolve cross-platform niches	363	2018-04-23 13:49:18.033196	2018-04-23 13:49:18.033196
356	repurpose end-to-end e-commerce	27	2018-04-23 13:49:18.035088	2018-04-23 13:49:18.035088
357	enable mission-critical platforms	310	2018-04-23 13:49:18.037027	2018-04-23 13:49:18.037027
358	enable best-of-breed infomediaries	22	2018-04-23 13:49:18.039066	2018-04-23 13:49:18.039066
359	architect e-business infrastructures	152	2018-04-23 13:49:18.041198	2018-04-23 13:49:18.041198
360	incubate virtual architectures	468	2018-04-23 13:49:18.043121	2018-04-23 13:49:18.043121
361	generate dynamic convergence	363	2018-04-23 13:49:18.044943	2018-04-23 13:49:18.044943
362	benchmark front-end portals	364	2018-04-23 13:49:18.04675	2018-04-23 13:49:18.04675
363	drive one-to-one infomediaries	128	2018-04-23 13:49:18.048617	2018-04-23 13:49:18.048617
364	exploit clicks-and-mortar systems	29	2018-04-23 13:49:18.050488	2018-04-23 13:49:18.050488
365	empower killer synergies	4	2018-04-23 13:49:18.052579	2018-04-23 13:49:18.052579
366	evolve efficient users	84	2018-04-23 13:49:18.054506	2018-04-23 13:49:18.054506
367	whiteboard sticky e-commerce	87	2018-04-23 13:49:18.056376	2018-04-23 13:49:18.056376
368	deliver seamless platforms	485	2018-04-23 13:49:18.058412	2018-04-23 13:49:18.058412
369	aggregate open-source mindshare	5	2018-04-23 13:49:18.060324	2018-04-23 13:49:18.060324
370	monetize rich metrics	482	2018-04-23 13:49:18.062253	2018-04-23 13:49:18.062253
371	repurpose extensible e-services	131	2018-04-23 13:49:18.064213	2018-04-23 13:49:18.064213
372	iterate out-of-the-box communities	470	2018-04-23 13:49:18.066299	2018-04-23 13:49:18.066299
373	synthesize virtual web services	78	2018-04-23 13:49:18.068866	2018-04-23 13:49:18.068866
374	mesh cross-platform solutions	403	2018-04-23 13:49:18.070835	2018-04-23 13:49:18.070835
375	cultivate clicks-and-mortar vortals	353	2018-04-23 13:49:18.072732	2018-04-23 13:49:18.072732
376	productize visionary vortals	213	2018-04-23 13:49:18.074634	2018-04-23 13:49:18.074634
377	iterate rich paradigms	493	2018-04-23 13:49:18.076483	2018-04-23 13:49:18.076483
378	strategize ubiquitous users	142	2018-04-23 13:49:18.078419	2018-04-23 13:49:18.078419
379	revolutionize robust networks	131	2018-04-23 13:49:18.080356	2018-04-23 13:49:18.080356
380	engage ubiquitous systems	461	2018-04-23 13:49:18.082352	2018-04-23 13:49:18.082352
381	orchestrate customized interfaces	128	2018-04-23 13:49:18.08429	2018-04-23 13:49:18.08429
382	transform plug-and-play web-readiness	188	2018-04-23 13:49:18.086438	2018-04-23 13:49:18.086438
383	brand seamless vortals	103	2018-04-23 13:49:18.088473	2018-04-23 13:49:18.088473
384	incentivize sexy schemas	59	2018-04-23 13:49:18.090392	2018-04-23 13:49:18.090392
385	reintermediate virtual solutions	363	2018-04-23 13:49:18.09225	2018-04-23 13:49:18.09225
386	engage wireless experiences	28	2018-04-23 13:49:18.094165	2018-04-23 13:49:18.094165
387	implement magnetic vortals	441	2018-04-23 13:49:18.096014	2018-04-23 13:49:18.096014
388	empower sexy experiences	152	2018-04-23 13:49:18.097827	2018-04-23 13:49:18.097827
389	embrace ubiquitous niches	452	2018-04-23 13:49:18.099636	2018-04-23 13:49:18.099636
390	maximize dynamic infrastructures	500	2018-04-23 13:49:18.101645	2018-04-23 13:49:18.101645
391	benchmark bleeding-edge markets	369	2018-04-23 13:49:18.103797	2018-04-23 13:49:18.103797
392	deliver 24/365 methodologies	136	2018-04-23 13:49:18.105734	2018-04-23 13:49:18.105734
393	enable real-time schemas	21	2018-04-23 13:49:18.107561	2018-04-23 13:49:18.107561
394	optimize granular portals	483	2018-04-23 13:49:18.109351	2018-04-23 13:49:18.109351
395	seize front-end deliverables	168	2018-04-23 13:49:18.111206	2018-04-23 13:49:18.111206
396	engineer value-added portals	167	2018-04-23 13:49:18.113016	2018-04-23 13:49:18.113016
397	optimize robust content	484	2018-04-23 13:49:18.114822	2018-04-23 13:49:18.114822
398	repurpose real-time relationships	170	2018-04-23 13:49:18.116621	2018-04-23 13:49:18.116621
399	seize front-end metrics	102	2018-04-23 13:49:18.118486	2018-04-23 13:49:18.118486
400	transform sexy mindshare	231	2018-04-23 13:49:18.120541	2018-04-23 13:49:18.120541
401	envisioneer virtual deliverables	359	2018-04-23 13:49:18.122392	2018-04-23 13:49:18.122392
402	redefine user-centric channels	497	2018-04-23 13:49:18.124208	2018-04-23 13:49:18.124208
403	implement end-to-end synergies	118	2018-04-23 13:49:18.125987	2018-04-23 13:49:18.125987
404	revolutionize turn-key technologies	15	2018-04-23 13:49:18.127798	2018-04-23 13:49:18.127798
405	revolutionize end-to-end partnerships	441	2018-04-23 13:49:18.129598	2018-04-23 13:49:18.129598
406	benchmark strategic convergence	42	2018-04-23 13:49:18.131417	2018-04-23 13:49:18.131417
407	whiteboard dot-com markets	105	2018-04-23 13:49:18.13342	2018-04-23 13:49:18.13342
408	recontextualize bricks-and-clicks initiatives	469	2018-04-23 13:49:18.135491	2018-04-23 13:49:18.135491
409	synergize vertical channels	279	2018-04-23 13:49:18.137847	2018-04-23 13:49:18.137847
410	cultivate 24/365 ROI	362	2018-04-23 13:49:18.139751	2018-04-23 13:49:18.139751
411	innovate transparent mindshare	252	2018-04-23 13:49:18.141583	2018-04-23 13:49:18.141583
412	envisioneer end-to-end applications	277	2018-04-23 13:49:18.143398	2018-04-23 13:49:18.143398
413	whiteboard proactive infrastructures	130	2018-04-23 13:49:18.167711	2018-04-23 13:49:18.167711
414	innovate enterprise vortals	311	2018-04-23 13:49:18.171278	2018-04-23 13:49:18.171278
415	utilize bleeding-edge synergies	78	2018-04-23 13:49:18.173363	2018-04-23 13:49:18.173363
416	matrix world-class partnerships	134	2018-04-23 13:49:18.175203	2018-04-23 13:49:18.175203
417	reintermediate transparent synergies	196	2018-04-23 13:49:18.177078	2018-04-23 13:49:18.177078
418	unleash frictionless e-services	320	2018-04-23 13:49:18.179002	2018-04-23 13:49:18.179002
419	engineer B2B convergence	77	2018-04-23 13:49:18.18093	2018-04-23 13:49:18.18093
420	disintermediate bricks-and-clicks infrastructures	114	2018-04-23 13:49:18.182959	2018-04-23 13:49:18.182959
421	generate cutting-edge web services	321	2018-04-23 13:49:18.184869	2018-04-23 13:49:18.184869
422	innovate open-source e-business	487	2018-04-23 13:49:18.186822	2018-04-23 13:49:18.186822
423	target bleeding-edge experiences	345	2018-04-23 13:49:18.18869	2018-04-23 13:49:18.18869
424	generate open-source vortals	95	2018-04-23 13:49:18.190547	2018-04-23 13:49:18.190547
425	iterate one-to-one experiences	168	2018-04-23 13:49:18.192447	2018-04-23 13:49:18.192447
426	facilitate scalable experiences	108	2018-04-23 13:49:18.194342	2018-04-23 13:49:18.194342
427	transform enterprise partnerships	446	2018-04-23 13:49:18.196222	2018-04-23 13:49:18.196222
428	productize best-of-breed networks	36	2018-04-23 13:49:18.198089	2018-04-23 13:49:18.198089
429	orchestrate end-to-end architectures	461	2018-04-23 13:49:18.200032	2018-04-23 13:49:18.200032
430	architect impactful paradigms	478	2018-04-23 13:49:18.202039	2018-04-23 13:49:18.202039
431	drive 24/7 e-business	471	2018-04-23 13:49:18.203982	2018-04-23 13:49:18.203982
432	whiteboard synergistic bandwidth	128	2018-04-23 13:49:18.205813	2018-04-23 13:49:18.205813
433	reintermediate plug-and-play interfaces	471	2018-04-23 13:49:18.20782	2018-04-23 13:49:18.20782
434	brand killer convergence	334	2018-04-23 13:49:18.209697	2018-04-23 13:49:18.209697
435	reintermediate revolutionary networks	375	2018-04-23 13:49:18.211554	2018-04-23 13:49:18.211554
436	engineer plug-and-play bandwidth	106	2018-04-23 13:49:18.213504	2018-04-23 13:49:18.213504
437	generate ubiquitous supply-chains	29	2018-04-23 13:49:18.215441	2018-04-23 13:49:18.215441
438	engineer integrated networks	432	2018-04-23 13:49:18.21737	2018-04-23 13:49:18.21737
439	incentivize world-class functionalities	273	2018-04-23 13:49:18.219339	2018-04-23 13:49:18.219339
440	innovate robust e-services	340	2018-04-23 13:49:18.221315	2018-04-23 13:49:18.221315
441	cultivate real-time experiences	477	2018-04-23 13:49:18.223171	2018-04-23 13:49:18.223171
442	disintermediate front-end niches	202	2018-04-23 13:49:18.224992	2018-04-23 13:49:18.224992
443	reintermediate B2C e-commerce	310	2018-04-23 13:49:18.226804	2018-04-23 13:49:18.226804
444	aggregate web-enabled functionalities	278	2018-04-23 13:49:18.228674	2018-04-23 13:49:18.228674
445	utilize impactful partnerships	317	2018-04-23 13:49:18.230617	2018-04-23 13:49:18.230617
446	engage mission-critical initiatives	197	2018-04-23 13:49:18.232561	2018-04-23 13:49:18.232561
447	e-enable e-business deliverables	326	2018-04-23 13:49:18.245974	2018-04-23 13:49:18.245974
448	monetize value-added partnerships	345	2018-04-23 13:49:18.248752	2018-04-23 13:49:18.248752
449	disintermediate 24/7 experiences	441	2018-04-23 13:49:18.251037	2018-04-23 13:49:18.251037
450	cultivate open-source e-markets	88	2018-04-23 13:49:18.253162	2018-04-23 13:49:18.253162
451	innovate efficient e-markets	348	2018-04-23 13:49:18.255155	2018-04-23 13:49:18.255155
452	envisioneer vertical ROI	201	2018-04-23 13:49:18.257055	2018-04-23 13:49:18.257055
453	whiteboard e-business metrics	465	2018-04-23 13:49:18.258895	2018-04-23 13:49:18.258895
454	disintermediate world-class e-markets	251	2018-04-23 13:49:18.260717	2018-04-23 13:49:18.260717
455	grow transparent partnerships	350	2018-04-23 13:49:18.262474	2018-04-23 13:49:18.262474
456	architect B2C supply-chains	498	2018-04-23 13:49:18.264228	2018-04-23 13:49:18.264228
457	embrace rich e-business	171	2018-04-23 13:49:18.266126	2018-04-23 13:49:18.266126
458	optimize end-to-end e-commerce	453	2018-04-23 13:49:18.268239	2018-04-23 13:49:18.268239
459	strategize plug-and-play web-readiness	430	2018-04-23 13:49:18.281743	2018-04-23 13:49:18.281743
460	grow out-of-the-box experiences	452	2018-04-23 13:49:18.284398	2018-04-23 13:49:18.284398
461	aggregate B2B relationships	242	2018-04-23 13:49:18.286408	2018-04-23 13:49:18.286408
462	utilize intuitive platforms	247	2018-04-23 13:49:18.288301	2018-04-23 13:49:18.288301
463	engage holistic e-markets	454	2018-04-23 13:49:18.290223	2018-04-23 13:49:18.290223
464	unleash strategic convergence	29	2018-04-23 13:49:18.292134	2018-04-23 13:49:18.292134
465	evolve frictionless e-markets	234	2018-04-23 13:49:18.294274	2018-04-23 13:49:18.294274
466	extend B2B architectures	492	2018-04-23 13:49:18.296497	2018-04-23 13:49:18.296497
467	embrace dot-com applications	51	2018-04-23 13:49:18.298504	2018-04-23 13:49:18.298504
468	whiteboard 24/365 communities	282	2018-04-23 13:49:18.300484	2018-04-23 13:49:18.300484
469	utilize proactive metrics	367	2018-04-23 13:49:18.302473	2018-04-23 13:49:18.302473
470	expedite dot-com technologies	396	2018-04-23 13:49:18.304762	2018-04-23 13:49:18.304762
471	utilize 24/365 channels	341	2018-04-23 13:49:18.306799	2018-04-23 13:49:18.306799
472	facilitate web-enabled e-services	245	2018-04-23 13:49:18.308674	2018-04-23 13:49:18.308674
473	transform killer experiences	5	2018-04-23 13:49:18.310502	2018-04-23 13:49:18.310502
474	iterate value-added interfaces	313	2018-04-23 13:49:18.31244	2018-04-23 13:49:18.31244
475	synergize integrated portals	64	2018-04-23 13:49:18.31426	2018-04-23 13:49:18.31426
476	embrace seamless e-markets	118	2018-04-23 13:49:18.31608	2018-04-23 13:49:18.31608
477	synthesize sticky web services	333	2018-04-23 13:49:18.318083	2018-04-23 13:49:18.318083
478	incentivize B2C web services	8	2018-04-23 13:49:18.320508	2018-04-23 13:49:18.320508
479	brand virtual systems	192	2018-04-23 13:49:18.3226	2018-04-23 13:49:18.3226
480	implement innovative applications	444	2018-04-23 13:49:18.324469	2018-04-23 13:49:18.324469
481	streamline impactful bandwidth	267	2018-04-23 13:49:18.326301	2018-04-23 13:49:18.326301
482	implement sexy channels	316	2018-04-23 13:49:18.328193	2018-04-23 13:49:18.328193
483	brand integrated communities	360	2018-04-23 13:49:18.330024	2018-04-23 13:49:18.330024
484	morph compelling initiatives	324	2018-04-23 13:49:18.331844	2018-04-23 13:49:18.331844
485	harness sticky schemas	242	2018-04-23 13:49:18.333628	2018-04-23 13:49:18.333628
486	seize clicks-and-mortar metrics	491	2018-04-23 13:49:18.335498	2018-04-23 13:49:18.335498
487	incubate impactful action-items	149	2018-04-23 13:49:18.337406	2018-04-23 13:49:18.337406
488	empower turn-key supply-chains	309	2018-04-23 13:49:18.339277	2018-04-23 13:49:18.339277
489	expedite sexy markets	244	2018-04-23 13:49:18.34115	2018-04-23 13:49:18.34115
490	reinvent plug-and-play vortals	63	2018-04-23 13:49:18.342986	2018-04-23 13:49:18.342986
491	redefine distributed experiences	149	2018-04-23 13:49:18.344815	2018-04-23 13:49:18.344815
492	generate synergistic eyeballs	357	2018-04-23 13:49:18.346939	2018-04-23 13:49:18.346939
493	implement extensible infomediaries	72	2018-04-23 13:49:18.348924	2018-04-23 13:49:18.348924
494	aggregate extensible platforms	421	2018-04-23 13:49:18.35091	2018-04-23 13:49:18.35091
495	expedite one-to-one systems	150	2018-04-23 13:49:18.352851	2018-04-23 13:49:18.352851
496	expedite wireless synergies	56	2018-04-23 13:49:18.354747	2018-04-23 13:49:18.354747
497	expedite sticky web-readiness	226	2018-04-23 13:49:18.356578	2018-04-23 13:49:18.356578
498	e-enable global channels	195	2018-04-23 13:49:18.358385	2018-04-23 13:49:18.358385
499	synergize intuitive initiatives	241	2018-04-23 13:49:18.360198	2018-04-23 13:49:18.360198
500	architect strategic paradigms	319	2018-04-23 13:49:18.362046	2018-04-23 13:49:18.362046
501	drive killer web-readiness	344	2018-04-23 13:49:18.363968	2018-04-23 13:49:18.363968
502	disintermediate bricks-and-clicks systems	109	2018-04-23 13:49:18.365885	2018-04-23 13:49:18.365885
503	synergize killer solutions	71	2018-04-23 13:49:18.367822	2018-04-23 13:49:18.367822
504	repurpose seamless solutions	5	2018-04-23 13:49:18.369744	2018-04-23 13:49:18.369744
505	harness wireless communities	307	2018-04-23 13:49:18.371809	2018-04-23 13:49:18.371809
506	maximize bleeding-edge applications	54	2018-04-23 13:49:18.373993	2018-04-23 13:49:18.373993
507	engage integrated communities	345	2018-04-23 13:49:18.375933	2018-04-23 13:49:18.375933
508	brand next-generation content	331	2018-04-23 13:49:18.377884	2018-04-23 13:49:18.377884
509	enable frictionless relationships	100	2018-04-23 13:49:18.379835	2018-04-23 13:49:18.379835
510	transition dot-com web-readiness	64	2018-04-23 13:49:18.381784	2018-04-23 13:49:18.381784
511	enhance integrated architectures	257	2018-04-23 13:49:18.383745	2018-04-23 13:49:18.383745
512	monetize revolutionary functionalities	379	2018-04-23 13:49:18.385968	2018-04-23 13:49:18.385968
513	expedite value-added methodologies	143	2018-04-23 13:49:18.387925	2018-04-23 13:49:18.387925
514	facilitate one-to-one e-commerce	428	2018-04-23 13:49:18.38982	2018-04-23 13:49:18.38982
515	optimize cross-media synergies	441	2018-04-23 13:49:18.391667	2018-04-23 13:49:18.391667
516	productize clicks-and-mortar functionalities	280	2018-04-23 13:49:18.393498	2018-04-23 13:49:18.393498
517	recontextualize granular applications	99	2018-04-23 13:49:18.395343	2018-04-23 13:49:18.395343
518	enhance sticky action-items	197	2018-04-23 13:49:18.397327	2018-04-23 13:49:18.397327
519	extend out-of-the-box action-items	53	2018-04-23 13:49:18.399344	2018-04-23 13:49:18.399344
520	visualize interactive e-tailers	320	2018-04-23 13:49:18.401213	2018-04-23 13:49:18.401213
521	transform one-to-one e-services	10	2018-04-23 13:49:18.403186	2018-04-23 13:49:18.403186
522	drive proactive technologies	340	2018-04-23 13:49:18.405113	2018-04-23 13:49:18.405113
523	grow plug-and-play convergence	141	2018-04-23 13:49:18.406926	2018-04-23 13:49:18.406926
524	reinvent real-time portals	314	2018-04-23 13:49:18.408761	2018-04-23 13:49:18.408761
525	aggregate interactive deliverables	34	2018-04-23 13:49:18.410587	2018-04-23 13:49:18.410587
526	utilize proactive web services	265	2018-04-23 13:49:18.412429	2018-04-23 13:49:18.412429
527	drive seamless content	278	2018-04-23 13:49:18.414236	2018-04-23 13:49:18.414236
528	iterate out-of-the-box metrics	17	2018-04-23 13:49:18.416042	2018-04-23 13:49:18.416042
529	syndicate synergistic methodologies	75	2018-04-23 13:49:18.417865	2018-04-23 13:49:18.417865
530	optimize holistic vortals	384	2018-04-23 13:49:18.419784	2018-04-23 13:49:18.419784
531	monetize proactive methodologies	486	2018-04-23 13:49:18.421767	2018-04-23 13:49:18.421767
532	implement intuitive markets	287	2018-04-23 13:49:18.423876	2018-04-23 13:49:18.423876
533	enable killer action-items	179	2018-04-23 13:49:18.425946	2018-04-23 13:49:18.425946
534	productize 24/7 relationships	416	2018-04-23 13:49:18.427926	2018-04-23 13:49:18.427926
535	harness innovative markets	348	2018-04-23 13:49:18.429885	2018-04-23 13:49:18.429885
536	visualize cross-media platforms	393	2018-04-23 13:49:18.431919	2018-04-23 13:49:18.431919
537	optimize virtual applications	79	2018-04-23 13:49:18.433902	2018-04-23 13:49:18.433902
538	enable back-end web services	395	2018-04-23 13:49:18.436065	2018-04-23 13:49:18.436065
539	maximize strategic architectures	108	2018-04-23 13:49:18.438055	2018-04-23 13:49:18.438055
540	synergize clicks-and-mortar experiences	68	2018-04-23 13:49:18.440279	2018-04-23 13:49:18.440279
541	utilize dot-com functionalities	37	2018-04-23 13:49:18.442333	2018-04-23 13:49:18.442333
542	mesh ubiquitous infrastructures	185	2018-04-23 13:49:18.444386	2018-04-23 13:49:18.444386
543	redefine turn-key platforms	401	2018-04-23 13:49:18.446308	2018-04-23 13:49:18.446308
544	innovate value-added relationships	183	2018-04-23 13:49:18.448208	2018-04-23 13:49:18.448208
545	leverage plug-and-play action-items	282	2018-04-23 13:49:18.450249	2018-04-23 13:49:18.450249
546	mesh B2B infomediaries	114	2018-04-23 13:49:18.452212	2018-04-23 13:49:18.452212
547	deliver open-source e-tailers	34	2018-04-23 13:49:18.454103	2018-04-23 13:49:18.454103
548	maximize impactful content	292	2018-04-23 13:49:18.455972	2018-04-23 13:49:18.455972
549	streamline virtual eyeballs	269	2018-04-23 13:49:18.457786	2018-04-23 13:49:18.457786
550	seize end-to-end portals	346	2018-04-23 13:49:18.459595	2018-04-23 13:49:18.459595
551	implement interactive ROI	130	2018-04-23 13:49:18.461399	2018-04-23 13:49:18.461399
552	whiteboard plug-and-play systems	121	2018-04-23 13:49:18.463208	2018-04-23 13:49:18.463208
553	architect killer solutions	98	2018-04-23 13:49:18.465089	2018-04-23 13:49:18.465089
554	disintermediate end-to-end portals	461	2018-04-23 13:49:18.467062	2018-04-23 13:49:18.467062
555	empower 24/7 niches	329	2018-04-23 13:49:18.46921	2018-04-23 13:49:18.46921
556	incentivize 24/7 eyeballs	10	2018-04-23 13:49:18.471273	2018-04-23 13:49:18.471273
557	optimize synergistic paradigms	276	2018-04-23 13:49:18.473244	2018-04-23 13:49:18.473244
558	matrix frictionless markets	75	2018-04-23 13:49:18.475234	2018-04-23 13:49:18.475234
559	embrace synergistic functionalities	193	2018-04-23 13:49:18.47723	2018-04-23 13:49:18.47723
560	incentivize plug-and-play convergence	194	2018-04-23 13:49:18.479205	2018-04-23 13:49:18.479205
561	productize vertical initiatives	166	2018-04-23 13:49:18.481161	2018-04-23 13:49:18.481161
562	matrix revolutionary architectures	162	2018-04-23 13:49:18.483068	2018-04-23 13:49:18.483068
563	empower impactful e-business	258	2018-04-23 13:49:18.484891	2018-04-23 13:49:18.484891
564	enable back-end experiences	292	2018-04-23 13:49:18.486905	2018-04-23 13:49:18.486905
565	generate innovative infrastructures	327	2018-04-23 13:49:18.488775	2018-04-23 13:49:18.488775
566	whiteboard value-added initiatives	344	2018-04-23 13:49:18.490752	2018-04-23 13:49:18.490752
567	engage cross-media e-business	281	2018-04-23 13:49:18.492591	2018-04-23 13:49:18.492591
568	deploy bricks-and-clicks e-services	395	2018-04-23 13:49:18.494401	2018-04-23 13:49:18.494401
569	cultivate web-enabled bandwidth	234	2018-04-23 13:49:18.4963	2018-04-23 13:49:18.4963
570	e-enable killer vortals	339	2018-04-23 13:49:18.498154	2018-04-23 13:49:18.498154
571	synergize seamless technologies	227	2018-04-23 13:49:18.500115	2018-04-23 13:49:18.500115
572	exploit killer platforms	494	2018-04-23 13:49:18.502197	2018-04-23 13:49:18.502197
573	incubate leading-edge platforms	49	2018-04-23 13:49:18.504399	2018-04-23 13:49:18.504399
574	transform clicks-and-mortar functionalities	51	2018-04-23 13:49:18.506447	2018-04-23 13:49:18.506447
575	morph transparent deliverables	56	2018-04-23 13:49:18.508411	2018-04-23 13:49:18.508411
576	orchestrate transparent technologies	128	2018-04-23 13:49:18.510382	2018-04-23 13:49:18.510382
577	engineer end-to-end metrics	309	2018-04-23 13:49:18.512357	2018-04-23 13:49:18.512357
578	engage transparent systems	100	2018-04-23 13:49:18.514215	2018-04-23 13:49:18.514215
579	leverage strategic systems	274	2018-04-23 13:49:18.516003	2018-04-23 13:49:18.516003
580	matrix 24/7 users	56	2018-04-23 13:49:18.517807	2018-04-23 13:49:18.517807
581	scale virtual users	168	2018-04-23 13:49:18.5197	2018-04-23 13:49:18.5197
582	utilize impactful architectures	439	2018-04-23 13:49:18.521633	2018-04-23 13:49:18.521633
583	matrix visionary niches	132	2018-04-23 13:49:18.523495	2018-04-23 13:49:18.523495
584	scale B2B e-commerce	305	2018-04-23 13:49:18.52538	2018-04-23 13:49:18.52538
585	transition clicks-and-mortar mindshare	373	2018-04-23 13:49:18.527414	2018-04-23 13:49:18.527414
586	e-enable collaborative applications	420	2018-04-23 13:49:18.529278	2018-04-23 13:49:18.529278
587	enhance synergistic models	383	2018-04-23 13:49:18.53112	2018-04-23 13:49:18.53112
588	drive magnetic communities	403	2018-04-23 13:49:18.532945	2018-04-23 13:49:18.532945
589	leverage interactive action-items	270	2018-04-23 13:49:18.53484	2018-04-23 13:49:18.53484
590	leverage killer schemas	319	2018-04-23 13:49:18.536923	2018-04-23 13:49:18.536923
591	visualize dynamic mindshare	89	2018-04-23 13:49:18.538822	2018-04-23 13:49:18.538822
592	unleash interactive paradigms	423	2018-04-23 13:49:18.540686	2018-04-23 13:49:18.540686
593	harness front-end e-tailers	188	2018-04-23 13:49:18.542516	2018-04-23 13:49:18.542516
594	monetize B2B bandwidth	462	2018-04-23 13:49:18.544365	2018-04-23 13:49:18.544365
595	iterate revolutionary paradigms	397	2018-04-23 13:49:18.546165	2018-04-23 13:49:18.546165
596	implement robust functionalities	218	2018-04-23 13:49:18.547983	2018-04-23 13:49:18.547983
597	optimize ubiquitous eyeballs	196	2018-04-23 13:49:18.549793	2018-04-23 13:49:18.549793
598	cultivate compelling solutions	162	2018-04-23 13:49:18.551905	2018-04-23 13:49:18.551905
599	exploit dynamic models	179	2018-04-23 13:49:18.553881	2018-04-23 13:49:18.553881
600	e-enable cutting-edge schemas	437	2018-04-23 13:49:18.555722	2018-04-23 13:49:18.555722
601	engineer leading-edge convergence	323	2018-04-23 13:49:18.557544	2018-04-23 13:49:18.557544
602	morph holistic e-business	315	2018-04-23 13:49:18.559383	2018-04-23 13:49:18.559383
603	deploy strategic metrics	43	2018-04-23 13:49:18.561182	2018-04-23 13:49:18.561182
604	brand turn-key platforms	143	2018-04-23 13:49:18.562998	2018-04-23 13:49:18.562998
605	productize compelling infrastructures	219	2018-04-23 13:49:18.564818	2018-04-23 13:49:18.564818
606	cultivate distributed functionalities	315	2018-04-23 13:49:18.566702	2018-04-23 13:49:18.566702
607	empower open-source web services	104	2018-04-23 13:49:18.568591	2018-04-23 13:49:18.568591
608	whiteboard transparent web-readiness	330	2018-04-23 13:49:18.570578	2018-04-23 13:49:18.570578
609	target wireless ROI	233	2018-04-23 13:49:18.572552	2018-04-23 13:49:18.572552
610	leverage best-of-breed architectures	296	2018-04-23 13:49:18.574481	2018-04-23 13:49:18.574481
611	empower extensible paradigms	51	2018-04-23 13:49:18.576456	2018-04-23 13:49:18.576456
612	architect cutting-edge metrics	410	2018-04-23 13:49:18.578402	2018-04-23 13:49:18.578402
613	engage rich e-business	161	2018-04-23 13:49:18.580311	2018-04-23 13:49:18.580311
614	optimize ubiquitous convergence	144	2018-04-23 13:49:18.582303	2018-04-23 13:49:18.582303
615	leverage integrated paradigms	303	2018-04-23 13:49:18.584256	2018-04-23 13:49:18.584256
616	generate 24/7 systems	62	2018-04-23 13:49:18.586191	2018-04-23 13:49:18.586191
617	syndicate bricks-and-clicks mindshare	360	2018-04-23 13:49:18.588149	2018-04-23 13:49:18.588149
618	scale integrated networks	149	2018-04-23 13:49:18.590093	2018-04-23 13:49:18.590093
619	scale dynamic e-commerce	209	2018-04-23 13:49:18.592022	2018-04-23 13:49:18.592022
620	incubate e-business action-items	348	2018-04-23 13:49:18.59395	2018-04-23 13:49:18.59395
621	productize intuitive infrastructures	413	2018-04-23 13:49:18.595925	2018-04-23 13:49:18.595925
622	incubate compelling content	266	2018-04-23 13:49:18.597886	2018-04-23 13:49:18.597886
623	exploit bleeding-edge metrics	452	2018-04-23 13:49:18.599797	2018-04-23 13:49:18.599797
624	benchmark front-end convergence	143	2018-04-23 13:49:18.601751	2018-04-23 13:49:18.601751
625	integrate rich architectures	467	2018-04-23 13:49:18.603954	2018-04-23 13:49:18.603954
626	target frictionless experiences	367	2018-04-23 13:49:18.605983	2018-04-23 13:49:18.605983
627	enable leading-edge mindshare	166	2018-04-23 13:49:18.607941	2018-04-23 13:49:18.607941
628	disintermediate sexy architectures	276	2018-04-23 13:49:18.609895	2018-04-23 13:49:18.609895
629	engage clicks-and-mortar initiatives	477	2018-04-23 13:49:18.611925	2018-04-23 13:49:18.611925
630	empower intuitive platforms	186	2018-04-23 13:49:18.613934	2018-04-23 13:49:18.613934
631	productize dot-com functionalities	65	2018-04-23 13:49:18.615958	2018-04-23 13:49:18.615958
632	facilitate dot-com e-business	446	2018-04-23 13:49:18.618045	2018-04-23 13:49:18.618045
633	monetize turn-key models	127	2018-04-23 13:49:18.62008	2018-04-23 13:49:18.62008
634	architect efficient schemas	45	2018-04-23 13:49:18.622064	2018-04-23 13:49:18.622064
635	grow world-class bandwidth	429	2018-04-23 13:49:18.624034	2018-04-23 13:49:18.624034
636	enable cutting-edge infrastructures	128	2018-04-23 13:49:18.625997	2018-04-23 13:49:18.625997
637	transition out-of-the-box relationships	16	2018-04-23 13:49:18.628046	2018-04-23 13:49:18.628046
638	drive transparent networks	207	2018-04-23 13:49:18.630228	2018-04-23 13:49:18.630228
639	generate extensible convergence	296	2018-04-23 13:49:18.632207	2018-04-23 13:49:18.632207
640	synergize plug-and-play convergence	212	2018-04-23 13:49:18.634147	2018-04-23 13:49:18.634147
641	implement transparent relationships	321	2018-04-23 13:49:18.636167	2018-04-23 13:49:18.636167
642	evolve bleeding-edge paradigms	431	2018-04-23 13:49:18.638306	2018-04-23 13:49:18.638306
643	transition enterprise interfaces	27	2018-04-23 13:49:18.640417	2018-04-23 13:49:18.640417
644	generate scalable infomediaries	103	2018-04-23 13:49:18.642396	2018-04-23 13:49:18.642396
645	innovate scalable e-commerce	17	2018-04-23 13:49:18.644314	2018-04-23 13:49:18.644314
646	incubate bleeding-edge methodologies	211	2018-04-23 13:49:18.646186	2018-04-23 13:49:18.646186
647	revolutionize web-enabled technologies	123	2018-04-23 13:49:18.648027	2018-04-23 13:49:18.648027
648	synergize sexy partnerships	362	2018-04-23 13:49:18.649858	2018-04-23 13:49:18.649858
649	transform integrated bandwidth	492	2018-04-23 13:49:18.65175	2018-04-23 13:49:18.65175
650	orchestrate best-of-breed communities	244	2018-04-23 13:49:18.65378	2018-04-23 13:49:18.65378
651	seize frictionless markets	60	2018-04-23 13:49:18.655756	2018-04-23 13:49:18.655756
652	facilitate bleeding-edge functionalities	60	2018-04-23 13:49:18.657686	2018-04-23 13:49:18.657686
653	harness cross-media synergies	164	2018-04-23 13:49:18.659678	2018-04-23 13:49:18.659678
654	evolve holistic interfaces	346	2018-04-23 13:49:18.661655	2018-04-23 13:49:18.661655
655	strategize mission-critical functionalities	496	2018-04-23 13:49:18.663586	2018-04-23 13:49:18.663586
656	empower holistic portals	189	2018-04-23 13:49:18.665528	2018-04-23 13:49:18.665528
657	seize bricks-and-clicks platforms	412	2018-04-23 13:49:18.667481	2018-04-23 13:49:18.667481
658	facilitate cross-media channels	53	2018-04-23 13:49:18.669422	2018-04-23 13:49:18.669422
659	engage sexy synergies	321	2018-04-23 13:49:18.671476	2018-04-23 13:49:18.671476
660	envisioneer extensible ROI	16	2018-04-23 13:49:18.673469	2018-04-23 13:49:18.673469
661	redefine front-end solutions	380	2018-04-23 13:49:18.675403	2018-04-23 13:49:18.675403
662	drive turn-key methodologies	205	2018-04-23 13:49:18.677379	2018-04-23 13:49:18.677379
663	seize real-time applications	173	2018-04-23 13:49:18.679403	2018-04-23 13:49:18.679403
664	generate customized technologies	148	2018-04-23 13:49:18.68147	2018-04-23 13:49:18.68147
665	drive integrated platforms	137	2018-04-23 13:49:18.683415	2018-04-23 13:49:18.683415
666	morph visionary convergence	465	2018-04-23 13:49:18.685768	2018-04-23 13:49:18.685768
667	engage next-generation interfaces	189	2018-04-23 13:49:18.688092	2018-04-23 13:49:18.688092
668	redefine granular synergies	174	2018-04-23 13:49:18.690078	2018-04-23 13:49:18.690078
669	expedite dynamic schemas	30	2018-04-23 13:49:18.691925	2018-04-23 13:49:18.691925
670	innovate web-enabled networks	263	2018-04-23 13:49:18.693808	2018-04-23 13:49:18.693808
671	scale killer web services	22	2018-04-23 13:49:18.695741	2018-04-23 13:49:18.695741
672	transition web-enabled bandwidth	454	2018-04-23 13:49:18.697776	2018-04-23 13:49:18.697776
673	integrate extensible users	377	2018-04-23 13:49:18.700165	2018-04-23 13:49:18.700165
674	generate B2C content	240	2018-04-23 13:49:18.702268	2018-04-23 13:49:18.702268
675	recontextualize seamless systems	447	2018-04-23 13:49:18.704344	2018-04-23 13:49:18.704344
676	embrace sexy paradigms	12	2018-04-23 13:49:18.706522	2018-04-23 13:49:18.706522
677	generate visionary metrics	143	2018-04-23 13:49:18.708487	2018-04-23 13:49:18.708487
678	empower vertical mindshare	64	2018-04-23 13:49:18.716206	2018-04-23 13:49:18.716206
679	enable rich functionalities	317	2018-04-23 13:49:18.718173	2018-04-23 13:49:18.718173
680	integrate best-of-breed users	266	2018-04-23 13:49:18.720328	2018-04-23 13:49:18.720328
681	cultivate one-to-one markets	101	2018-04-23 13:49:18.722201	2018-04-23 13:49:18.722201
682	innovate vertical portals	408	2018-04-23 13:49:18.72409	2018-04-23 13:49:18.72409
683	transition magnetic action-items	211	2018-04-23 13:49:18.72597	2018-04-23 13:49:18.72597
684	grow magnetic paradigms	374	2018-04-23 13:49:18.727868	2018-04-23 13:49:18.727868
685	whiteboard real-time supply-chains	41	2018-04-23 13:49:18.729762	2018-04-23 13:49:18.729762
686	benchmark magnetic content	58	2018-04-23 13:49:18.731887	2018-04-23 13:49:18.731887
687	benchmark mission-critical applications	73	2018-04-23 13:49:18.733823	2018-04-23 13:49:18.733823
688	e-enable clicks-and-mortar e-commerce	346	2018-04-23 13:49:18.735807	2018-04-23 13:49:18.735807
689	unleash cross-media ROI	52	2018-04-23 13:49:18.737706	2018-04-23 13:49:18.737706
690	syndicate mission-critical content	300	2018-04-23 13:49:18.739559	2018-04-23 13:49:18.739559
691	facilitate e-business interfaces	128	2018-04-23 13:49:18.741458	2018-04-23 13:49:18.741458
692	strategize world-class applications	23	2018-04-23 13:49:18.74332	2018-04-23 13:49:18.74332
693	synergize 24/7 synergies	411	2018-04-23 13:49:18.745138	2018-04-23 13:49:18.745138
694	harness B2B applications	467	2018-04-23 13:49:18.746952	2018-04-23 13:49:18.746952
695	visualize e-business mindshare	278	2018-04-23 13:49:18.748754	2018-04-23 13:49:18.748754
696	cultivate vertical e-commerce	373	2018-04-23 13:49:18.750649	2018-04-23 13:49:18.750649
697	visualize extensible schemas	497	2018-04-23 13:49:18.752638	2018-04-23 13:49:18.752638
698	orchestrate scalable synergies	126	2018-04-23 13:49:18.754669	2018-04-23 13:49:18.754669
699	enable integrated infrastructures	166	2018-04-23 13:49:18.756658	2018-04-23 13:49:18.756658
700	enable real-time functionalities	373	2018-04-23 13:49:18.758569	2018-04-23 13:49:18.758569
701	orchestrate turn-key infomediaries	500	2018-04-23 13:49:18.760502	2018-04-23 13:49:18.760502
702	mesh compelling metrics	402	2018-04-23 13:49:18.762435	2018-04-23 13:49:18.762435
703	expedite sticky markets	183	2018-04-23 13:49:18.764364	2018-04-23 13:49:18.764364
704	transform collaborative convergence	411	2018-04-23 13:49:18.766249	2018-04-23 13:49:18.766249
705	mesh extensible e-tailers	107	2018-04-23 13:49:18.768191	2018-04-23 13:49:18.768191
706	transition efficient experiences	452	2018-04-23 13:49:18.770394	2018-04-23 13:49:18.770394
707	utilize viral channels	100	2018-04-23 13:49:18.772514	2018-04-23 13:49:18.772514
708	deploy virtual synergies	102	2018-04-23 13:49:18.774539	2018-04-23 13:49:18.774539
709	deliver compelling portals	371	2018-04-23 13:49:18.776557	2018-04-23 13:49:18.776557
710	implement wireless niches	465	2018-04-23 13:49:18.778612	2018-04-23 13:49:18.778612
711	optimize customized schemas	345	2018-04-23 13:49:18.780538	2018-04-23 13:49:18.780538
712	grow user-centric e-tailers	447	2018-04-23 13:49:18.782596	2018-04-23 13:49:18.782596
713	deploy granular interfaces	388	2018-04-23 13:49:18.78457	2018-04-23 13:49:18.78457
714	streamline ubiquitous supply-chains	270	2018-04-23 13:49:18.786688	2018-04-23 13:49:18.786688
715	embrace interactive networks	116	2018-04-23 13:49:18.788755	2018-04-23 13:49:18.788755
716	strategize vertical systems	346	2018-04-23 13:49:18.790931	2018-04-23 13:49:18.790931
717	seize frictionless interfaces	21	2018-04-23 13:49:18.792921	2018-04-23 13:49:18.792921
718	integrate bleeding-edge technologies	256	2018-04-23 13:49:18.794868	2018-04-23 13:49:18.794868
719	visualize virtual mindshare	276	2018-04-23 13:49:18.796837	2018-04-23 13:49:18.796837
720	empower dynamic schemas	484	2018-04-23 13:49:18.798764	2018-04-23 13:49:18.798764
721	utilize cross-platform interfaces	474	2018-04-23 13:49:18.800766	2018-04-23 13:49:18.800766
722	implement B2B ROI	262	2018-04-23 13:49:18.802855	2018-04-23 13:49:18.802855
723	iterate impactful synergies	482	2018-04-23 13:49:18.804822	2018-04-23 13:49:18.804822
724	brand back-end paradigms	254	2018-04-23 13:49:18.806812	2018-04-23 13:49:18.806812
725	morph plug-and-play eyeballs	127	2018-04-23 13:49:18.80884	2018-04-23 13:49:18.80884
726	embrace sticky initiatives	192	2018-04-23 13:49:18.810744	2018-04-23 13:49:18.810744
727	unleash web-enabled applications	409	2018-04-23 13:49:18.812676	2018-04-23 13:49:18.812676
728	iterate virtual synergies	295	2018-04-23 13:49:18.81459	2018-04-23 13:49:18.81459
729	exploit cross-media systems	161	2018-04-23 13:49:18.816511	2018-04-23 13:49:18.816511
730	expedite granular niches	175	2018-04-23 13:49:18.818673	2018-04-23 13:49:18.818673
731	monetize B2C ROI	458	2018-04-23 13:49:18.820751	2018-04-23 13:49:18.820751
732	syndicate virtual platforms	265	2018-04-23 13:49:18.822781	2018-04-23 13:49:18.822781
733	scale extensible mindshare	385	2018-04-23 13:49:18.824812	2018-04-23 13:49:18.824812
734	redefine web-enabled action-items	96	2018-04-23 13:49:18.826852	2018-04-23 13:49:18.826852
735	matrix back-end mindshare	353	2018-04-23 13:49:18.828802	2018-04-23 13:49:18.828802
736	aggregate holistic markets	345	2018-04-23 13:49:18.830713	2018-04-23 13:49:18.830713
737	envisioneer virtual metrics	80	2018-04-23 13:49:18.832849	2018-04-23 13:49:18.832849
738	utilize proactive niches	372	2018-04-23 13:49:18.834835	2018-04-23 13:49:18.834835
739	target user-centric partnerships	115	2018-04-23 13:49:18.836904	2018-04-23 13:49:18.836904
740	mesh customized architectures	357	2018-04-23 13:49:18.838863	2018-04-23 13:49:18.838863
741	engage efficient action-items	209	2018-04-23 13:49:18.84071	2018-04-23 13:49:18.84071
742	architect scalable e-business	228	2018-04-23 13:49:18.843422	2018-04-23 13:49:18.843422
743	productize compelling web-readiness	14	2018-04-23 13:49:18.845361	2018-04-23 13:49:18.845361
744	optimize impactful bandwidth	390	2018-04-23 13:49:18.847221	2018-04-23 13:49:18.847221
745	scale 24/365 methodologies	416	2018-04-23 13:49:18.849054	2018-04-23 13:49:18.849054
746	orchestrate ubiquitous communities	11	2018-04-23 13:49:18.850896	2018-04-23 13:49:18.850896
747	scale seamless functionalities	53	2018-04-23 13:49:18.852829	2018-04-23 13:49:18.852829
748	scale sexy e-business	244	2018-04-23 13:49:18.854795	2018-04-23 13:49:18.854795
749	seize back-end platforms	304	2018-04-23 13:49:18.856761	2018-04-23 13:49:18.856761
750	productize value-added e-commerce	68	2018-04-23 13:49:18.859064	2018-04-23 13:49:18.859064
751	streamline open-source markets	293	2018-04-23 13:49:18.861086	2018-04-23 13:49:18.861086
752	reinvent best-of-breed e-commerce	206	2018-04-23 13:49:18.862976	2018-04-23 13:49:18.862976
753	syndicate 24/365 bandwidth	399	2018-04-23 13:49:18.864797	2018-04-23 13:49:18.864797
754	brand sexy content	178	2018-04-23 13:49:18.866601	2018-04-23 13:49:18.866601
755	monetize distributed architectures	349	2018-04-23 13:49:18.868466	2018-04-23 13:49:18.868466
756	evolve efficient users	253	2018-04-23 13:49:18.870408	2018-04-23 13:49:18.870408
757	maximize back-end relationships	442	2018-04-23 13:49:18.872292	2018-04-23 13:49:18.872292
758	strategize cross-platform synergies	474	2018-04-23 13:49:18.87427	2018-04-23 13:49:18.87427
759	orchestrate 24/365 content	155	2018-04-23 13:49:18.876223	2018-04-23 13:49:18.876223
760	brand web-enabled e-commerce	64	2018-04-23 13:49:18.878142	2018-04-23 13:49:18.878142
761	synthesize best-of-breed experiences	4	2018-04-23 13:49:18.880145	2018-04-23 13:49:18.880145
762	deploy seamless action-items	358	2018-04-23 13:49:18.882067	2018-04-23 13:49:18.882067
763	architect cross-platform web services	221	2018-04-23 13:49:18.884056	2018-04-23 13:49:18.884056
764	synergize vertical eyeballs	228	2018-04-23 13:49:18.886088	2018-04-23 13:49:18.886088
765	iterate real-time ROI	140	2018-04-23 13:49:18.888009	2018-04-23 13:49:18.888009
766	integrate world-class technologies	58	2018-04-23 13:49:18.889841	2018-04-23 13:49:18.889841
767	incubate vertical deliverables	263	2018-04-23 13:49:18.891654	2018-04-23 13:49:18.891654
768	streamline efficient models	451	2018-04-23 13:49:18.89356	2018-04-23 13:49:18.89356
769	enhance clicks-and-mortar convergence	257	2018-04-23 13:49:18.895374	2018-04-23 13:49:18.895374
770	architect value-added deliverables	223	2018-04-23 13:49:18.897216	2018-04-23 13:49:18.897216
771	redefine web-enabled interfaces	419	2018-04-23 13:49:18.899001	2018-04-23 13:49:18.899001
772	incubate granular platforms	272	2018-04-23 13:49:18.900858	2018-04-23 13:49:18.900858
773	seize front-end ROI	122	2018-04-23 13:49:18.902825	2018-04-23 13:49:18.902825
774	envisioneer vertical methodologies	268	2018-04-23 13:49:18.904811	2018-04-23 13:49:18.904811
775	strategize holistic convergence	214	2018-04-23 13:49:18.90696	2018-04-23 13:49:18.90696
776	visualize sexy paradigms	468	2018-04-23 13:49:18.908916	2018-04-23 13:49:18.908916
777	redefine ubiquitous supply-chains	94	2018-04-23 13:49:18.910931	2018-04-23 13:49:18.910931
778	envisioneer innovative architectures	108	2018-04-23 13:49:18.912839	2018-04-23 13:49:18.912839
779	evolve robust architectures	209	2018-04-23 13:49:18.915613	2018-04-23 13:49:18.915613
780	leverage virtual initiatives	137	2018-04-23 13:49:18.917619	2018-04-23 13:49:18.917619
781	benchmark integrated partnerships	469	2018-04-23 13:49:18.919711	2018-04-23 13:49:18.919711
782	engage mission-critical mindshare	317	2018-04-23 13:49:18.921722	2018-04-23 13:49:18.921722
783	engineer clicks-and-mortar infrastructures	308	2018-04-23 13:49:18.92366	2018-04-23 13:49:18.92366
784	e-enable wireless content	21	2018-04-23 13:49:18.925594	2018-04-23 13:49:18.925594
785	benchmark open-source eyeballs	258	2018-04-23 13:49:18.927508	2018-04-23 13:49:18.927508
786	generate end-to-end convergence	235	2018-04-23 13:49:18.929526	2018-04-23 13:49:18.929526
787	repurpose mission-critical users	297	2018-04-23 13:49:18.931537	2018-04-23 13:49:18.931537
788	maximize vertical mindshare	154	2018-04-23 13:49:18.933489	2018-04-23 13:49:18.933489
789	drive synergistic infomediaries	328	2018-04-23 13:49:18.935484	2018-04-23 13:49:18.935484
790	extend bleeding-edge action-items	439	2018-04-23 13:49:18.937531	2018-04-23 13:49:18.937531
791	unleash bricks-and-clicks e-tailers	231	2018-04-23 13:49:18.939407	2018-04-23 13:49:18.939407
792	brand transparent bandwidth	251	2018-04-23 13:49:18.941236	2018-04-23 13:49:18.941236
793	implement viral experiences	437	2018-04-23 13:49:18.943092	2018-04-23 13:49:18.943092
794	matrix interactive functionalities	157	2018-04-23 13:49:18.944899	2018-04-23 13:49:18.944899
795	generate interactive partnerships	469	2018-04-23 13:49:18.946707	2018-04-23 13:49:18.946707
796	synthesize web-enabled initiatives	489	2018-04-23 13:49:18.9485	2018-04-23 13:49:18.9485
797	leverage cross-media schemas	417	2018-04-23 13:49:18.950316	2018-04-23 13:49:18.950316
798	strategize 24/7 metrics	413	2018-04-23 13:49:18.952224	2018-04-23 13:49:18.952224
799	mesh revolutionary interfaces	251	2018-04-23 13:49:18.954194	2018-04-23 13:49:18.954194
800	envisioneer user-centric bandwidth	184	2018-04-23 13:49:18.956175	2018-04-23 13:49:18.956175
801	engineer enterprise bandwidth	88	2018-04-23 13:49:18.958139	2018-04-23 13:49:18.958139
802	maximize scalable users	266	2018-04-23 13:49:18.960094	2018-04-23 13:49:18.960094
803	whiteboard cross-media channels	404	2018-04-23 13:49:18.962141	2018-04-23 13:49:18.962141
804	innovate scalable e-tailers	62	2018-04-23 13:49:18.964089	2018-04-23 13:49:18.964089
805	reintermediate end-to-end schemas	485	2018-04-23 13:49:18.96598	2018-04-23 13:49:18.96598
806	optimize enterprise action-items	101	2018-04-23 13:49:18.967951	2018-04-23 13:49:18.967951
807	recontextualize integrated content	468	2018-04-23 13:49:18.970092	2018-04-23 13:49:18.970092
808	architect wireless e-services	40	2018-04-23 13:49:18.972118	2018-04-23 13:49:18.972118
809	innovate next-generation communities	317	2018-04-23 13:49:18.974062	2018-04-23 13:49:18.974062
810	seize collaborative infomediaries	403	2018-04-23 13:49:18.975973	2018-04-23 13:49:18.975973
811	maximize vertical experiences	323	2018-04-23 13:49:18.977887	2018-04-23 13:49:18.977887
812	enhance strategic eyeballs	173	2018-04-23 13:49:18.979808	2018-04-23 13:49:18.979808
813	harness scalable technologies	405	2018-04-23 13:49:18.981754	2018-04-23 13:49:18.981754
814	grow proactive networks	406	2018-04-23 13:49:18.983719	2018-04-23 13:49:18.983719
815	strategize bricks-and-clicks models	66	2018-04-23 13:49:18.985813	2018-04-23 13:49:18.985813
816	e-enable magnetic niches	439	2018-04-23 13:49:18.98858	2018-04-23 13:49:18.98858
817	reinvent efficient bandwidth	261	2018-04-23 13:49:18.992099	2018-04-23 13:49:18.992099
818	reinvent global interfaces	331	2018-04-23 13:49:18.994853	2018-04-23 13:49:18.994853
819	exploit transparent vortals	374	2018-04-23 13:49:18.996741	2018-04-23 13:49:18.996741
820	innovate seamless infomediaries	467	2018-04-23 13:49:18.998813	2018-04-23 13:49:18.998813
821	iterate B2C metrics	427	2018-04-23 13:49:19.000652	2018-04-23 13:49:19.000652
822	deliver rich channels	84	2018-04-23 13:49:19.002538	2018-04-23 13:49:19.002538
823	generate transparent mindshare	113	2018-04-23 13:49:19.004531	2018-04-23 13:49:19.004531
824	disintermediate distributed ROI	436	2018-04-23 13:49:19.006547	2018-04-23 13:49:19.006547
825	enable one-to-one partnerships	100	2018-04-23 13:49:19.008497	2018-04-23 13:49:19.008497
826	mesh extensible relationships	465	2018-04-23 13:49:19.010381	2018-04-23 13:49:19.010381
827	revolutionize granular markets	254	2018-04-23 13:49:19.012211	2018-04-23 13:49:19.012211
828	synergize world-class applications	274	2018-04-23 13:49:19.014072	2018-04-23 13:49:19.014072
829	whiteboard seamless web-readiness	488	2018-04-23 13:49:19.015958	2018-04-23 13:49:19.015958
830	morph collaborative functionalities	47	2018-04-23 13:49:19.017835	2018-04-23 13:49:19.017835
831	leverage e-business action-items	326	2018-04-23 13:49:19.019886	2018-04-23 13:49:19.019886
832	whiteboard bricks-and-clicks convergence	79	2018-04-23 13:49:19.022196	2018-04-23 13:49:19.022196
833	transform customized bandwidth	210	2018-04-23 13:49:19.024186	2018-04-23 13:49:19.024186
834	mesh back-end channels	247	2018-04-23 13:49:19.026161	2018-04-23 13:49:19.026161
835	architect distributed niches	46	2018-04-23 13:49:19.028236	2018-04-23 13:49:19.028236
836	disintermediate bleeding-edge eyeballs	277	2018-04-23 13:49:19.030203	2018-04-23 13:49:19.030203
837	architect seamless systems	247	2018-04-23 13:49:19.032213	2018-04-23 13:49:19.032213
838	architect extensible networks	172	2018-04-23 13:49:19.034175	2018-04-23 13:49:19.034175
839	strategize 24/365 metrics	161	2018-04-23 13:49:19.036336	2018-04-23 13:49:19.036336
840	monetize next-generation ROI	293	2018-04-23 13:49:19.038484	2018-04-23 13:49:19.038484
841	transform magnetic e-tailers	169	2018-04-23 13:49:19.040542	2018-04-23 13:49:19.040542
842	reintermediate frictionless vortals	464	2018-04-23 13:49:19.042543	2018-04-23 13:49:19.042543
843	recontextualize open-source channels	301	2018-04-23 13:49:19.044585	2018-04-23 13:49:19.044585
844	envisioneer front-end relationships	12	2018-04-23 13:49:19.046575	2018-04-23 13:49:19.046575
845	evolve sticky platforms	17	2018-04-23 13:49:19.048475	2018-04-23 13:49:19.048475
846	monetize killer supply-chains	77	2018-04-23 13:49:19.050416	2018-04-23 13:49:19.050416
847	integrate one-to-one eyeballs	156	2018-04-23 13:49:19.052387	2018-04-23 13:49:19.052387
848	envisioneer open-source architectures	131	2018-04-23 13:49:19.054311	2018-04-23 13:49:19.054311
849	envisioneer open-source e-business	395	2018-04-23 13:49:19.056169	2018-04-23 13:49:19.056169
850	architect revolutionary niches	237	2018-04-23 13:49:19.058002	2018-04-23 13:49:19.058002
851	whiteboard one-to-one functionalities	274	2018-04-23 13:49:19.059817	2018-04-23 13:49:19.059817
852	synthesize B2C bandwidth	69	2018-04-23 13:49:19.061644	2018-04-23 13:49:19.061644
853	orchestrate distributed networks	185	2018-04-23 13:49:19.063537	2018-04-23 13:49:19.063537
854	harness world-class applications	339	2018-04-23 13:49:19.065356	2018-04-23 13:49:19.065356
855	transition B2C mindshare	170	2018-04-23 13:49:19.067154	2018-04-23 13:49:19.067154
856	disintermediate next-generation infrastructures	45	2018-04-23 13:49:19.069014	2018-04-23 13:49:19.069014
857	cultivate clicks-and-mortar communities	204	2018-04-23 13:49:19.071355	2018-04-23 13:49:19.071355
858	iterate visionary models	415	2018-04-23 13:49:19.073365	2018-04-23 13:49:19.073365
859	facilitate intuitive methodologies	345	2018-04-23 13:49:19.075336	2018-04-23 13:49:19.075336
860	integrate global experiences	101	2018-04-23 13:49:19.077302	2018-04-23 13:49:19.077302
861	transform back-end models	301	2018-04-23 13:49:19.079223	2018-04-23 13:49:19.079223
862	whiteboard turn-key technologies	121	2018-04-23 13:49:19.081217	2018-04-23 13:49:19.081217
863	harness transparent vortals	180	2018-04-23 13:49:19.083162	2018-04-23 13:49:19.083162
864	monetize best-of-breed e-business	300	2018-04-23 13:49:19.085089	2018-04-23 13:49:19.085089
865	reinvent next-generation partnerships	424	2018-04-23 13:49:19.087292	2018-04-23 13:49:19.087292
866	mesh frictionless systems	125	2018-04-23 13:49:19.089234	2018-04-23 13:49:19.089234
867	embrace cross-platform paradigms	272	2018-04-23 13:49:19.091072	2018-04-23 13:49:19.091072
868	implement cross-media convergence	132	2018-04-23 13:49:19.093544	2018-04-23 13:49:19.093544
869	facilitate integrated e-markets	164	2018-04-23 13:49:19.095512	2018-04-23 13:49:19.095512
870	harness visionary solutions	318	2018-04-23 13:49:19.09751	2018-04-23 13:49:19.09751
871	expedite sticky paradigms	141	2018-04-23 13:49:19.099446	2018-04-23 13:49:19.099446
872	reintermediate scalable ROI	305	2018-04-23 13:49:19.101289	2018-04-23 13:49:19.101289
873	streamline enterprise vortals	373	2018-04-23 13:49:19.103544	2018-04-23 13:49:19.103544
874	aggregate vertical solutions	403	2018-04-23 13:49:19.105586	2018-04-23 13:49:19.105586
875	visualize web-enabled platforms	100	2018-04-23 13:49:19.107554	2018-04-23 13:49:19.107554
876	monetize B2B synergies	262	2018-04-23 13:49:19.109507	2018-04-23 13:49:19.109507
877	integrate integrated technologies	117	2018-04-23 13:49:19.111454	2018-04-23 13:49:19.111454
878	monetize plug-and-play networks	353	2018-04-23 13:49:19.113373	2018-04-23 13:49:19.113373
879	harness open-source functionalities	228	2018-04-23 13:49:19.115242	2018-04-23 13:49:19.115242
880	aggregate extensible platforms	42	2018-04-23 13:49:19.117114	2018-04-23 13:49:19.117114
881	enhance plug-and-play schemas	202	2018-04-23 13:49:19.119065	2018-04-23 13:49:19.119065
882	grow B2B architectures	178	2018-04-23 13:49:19.120977	2018-04-23 13:49:19.120977
883	repurpose 24/365 bandwidth	253	2018-04-23 13:49:19.122895	2018-04-23 13:49:19.122895
884	incentivize value-added schemas	399	2018-04-23 13:49:19.124845	2018-04-23 13:49:19.124845
885	whiteboard holistic partnerships	388	2018-04-23 13:49:19.126799	2018-04-23 13:49:19.126799
886	visualize 24/365 bandwidth	459	2018-04-23 13:49:19.128738	2018-04-23 13:49:19.128738
887	utilize strategic e-business	240	2018-04-23 13:49:19.130661	2018-04-23 13:49:19.130661
888	target turn-key niches	468	2018-04-23 13:49:19.132577	2018-04-23 13:49:19.132577
889	enable dot-com web-readiness	260	2018-04-23 13:49:19.134666	2018-04-23 13:49:19.134666
890	aggregate world-class e-tailers	264	2018-04-23 13:49:19.136722	2018-04-23 13:49:19.136722
891	streamline e-business relationships	30	2018-04-23 13:49:19.138638	2018-04-23 13:49:19.138638
892	cultivate wireless mindshare	443	2018-04-23 13:49:19.140479	2018-04-23 13:49:19.140479
893	matrix cutting-edge eyeballs	475	2018-04-23 13:49:19.142292	2018-04-23 13:49:19.142292
894	integrate magnetic niches	50	2018-04-23 13:49:19.144162	2018-04-23 13:49:19.144162
895	utilize dynamic networks	81	2018-04-23 13:49:19.146054	2018-04-23 13:49:19.146054
896	leverage virtual vortals	178	2018-04-23 13:49:19.147986	2018-04-23 13:49:19.147986
897	revolutionize revolutionary web services	90	2018-04-23 13:49:19.149875	2018-04-23 13:49:19.149875
898	transition web-enabled functionalities	43	2018-04-23 13:49:19.151788	2018-04-23 13:49:19.151788
899	redefine integrated e-markets	277	2018-04-23 13:49:19.153727	2018-04-23 13:49:19.153727
900	harness e-business infrastructures	491	2018-04-23 13:49:19.155624	2018-04-23 13:49:19.155624
901	empower killer paradigms	22	2018-04-23 13:49:19.157519	2018-04-23 13:49:19.157519
902	aggregate web-enabled functionalities	90	2018-04-23 13:49:19.159318	2018-04-23 13:49:19.159318
903	engage clicks-and-mortar networks	177	2018-04-23 13:49:19.161121	2018-04-23 13:49:19.161121
904	aggregate holistic mindshare	238	2018-04-23 13:49:19.162924	2018-04-23 13:49:19.162924
905	benchmark one-to-one paradigms	327	2018-04-23 13:49:19.164747	2018-04-23 13:49:19.164747
906	benchmark e-business ROI	131	2018-04-23 13:49:19.166557	2018-04-23 13:49:19.166557
907	revolutionize clicks-and-mortar partnerships	22	2018-04-23 13:49:19.168426	2018-04-23 13:49:19.168426
908	iterate e-business eyeballs	247	2018-04-23 13:49:19.170378	2018-04-23 13:49:19.170378
909	brand value-added e-services	190	2018-04-23 13:49:19.172511	2018-04-23 13:49:19.172511
910	generate bleeding-edge functionalities	141	2018-04-23 13:49:19.174568	2018-04-23 13:49:19.174568
911	drive clicks-and-mortar bandwidth	466	2018-04-23 13:49:19.176461	2018-04-23 13:49:19.176461
912	engineer turn-key portals	130	2018-04-23 13:49:19.178439	2018-04-23 13:49:19.178439
913	repurpose front-end mindshare	229	2018-04-23 13:49:19.180288	2018-04-23 13:49:19.180288
914	leverage frictionless e-business	190	2018-04-23 13:49:19.182159	2018-04-23 13:49:19.182159
915	streamline out-of-the-box web services	327	2018-04-23 13:49:19.183959	2018-04-23 13:49:19.183959
916	mesh transparent synergies	156	2018-04-23 13:49:19.185856	2018-04-23 13:49:19.185856
917	matrix dot-com ROI	131	2018-04-23 13:49:19.187816	2018-04-23 13:49:19.187816
918	incentivize customized partnerships	140	2018-04-23 13:49:19.189816	2018-04-23 13:49:19.189816
919	extend bricks-and-clicks action-items	339	2018-04-23 13:49:19.191779	2018-04-23 13:49:19.191779
920	incubate interactive ROI	83	2018-04-23 13:49:19.193723	2018-04-23 13:49:19.193723
921	implement best-of-breed e-services	339	2018-04-23 13:49:19.195645	2018-04-23 13:49:19.195645
922	engineer proactive eyeballs	421	2018-04-23 13:49:19.197574	2018-04-23 13:49:19.197574
923	integrate virtual action-items	291	2018-04-23 13:49:19.199637	2018-04-23 13:49:19.199637
924	aggregate value-added methodologies	216	2018-04-23 13:49:19.201615	2018-04-23 13:49:19.201615
925	generate granular functionalities	176	2018-04-23 13:49:19.203725	2018-04-23 13:49:19.203725
926	leverage 24/7 niches	283	2018-04-23 13:49:19.205666	2018-04-23 13:49:19.205666
927	synthesize mission-critical infomediaries	493	2018-04-23 13:49:19.207518	2018-04-23 13:49:19.207518
928	synthesize next-generation initiatives	267	2018-04-23 13:49:19.209348	2018-04-23 13:49:19.209348
929	monetize granular supply-chains	470	2018-04-23 13:49:19.211151	2018-04-23 13:49:19.211151
930	integrate holistic eyeballs	380	2018-04-23 13:49:19.212957	2018-04-23 13:49:19.212957
931	expedite virtual eyeballs	113	2018-04-23 13:49:19.214806	2018-04-23 13:49:19.214806
932	scale efficient interfaces	367	2018-04-23 13:49:19.216624	2018-04-23 13:49:19.216624
933	monetize cross-media networks	338	2018-04-23 13:49:19.218658	2018-04-23 13:49:19.218658
934	drive next-generation deliverables	101	2018-04-23 13:49:19.220614	2018-04-23 13:49:19.220614
935	brand impactful applications	202	2018-04-23 13:49:19.222529	2018-04-23 13:49:19.222529
936	benchmark impactful e-commerce	81	2018-04-23 13:49:19.224533	2018-04-23 13:49:19.224533
937	exploit clicks-and-mortar bandwidth	342	2018-04-23 13:49:19.226437	2018-04-23 13:49:19.226437
938	whiteboard granular paradigms	86	2018-04-23 13:49:19.228357	2018-04-23 13:49:19.228357
939	matrix integrated web services	23	2018-04-23 13:49:19.23025	2018-04-23 13:49:19.23025
940	synthesize collaborative relationships	88	2018-04-23 13:49:19.232206	2018-04-23 13:49:19.232206
941	architect distributed partnerships	268	2018-04-23 13:49:19.234143	2018-04-23 13:49:19.234143
942	facilitate transparent bandwidth	164	2018-04-23 13:49:19.236227	2018-04-23 13:49:19.236227
943	expedite ubiquitous mindshare	461	2018-04-23 13:49:19.238289	2018-04-23 13:49:19.238289
944	optimize next-generation users	435	2018-04-23 13:49:19.240239	2018-04-23 13:49:19.240239
945	deploy viral metrics	423	2018-04-23 13:49:19.242082	2018-04-23 13:49:19.242082
946	maximize customized markets	475	2018-04-23 13:49:19.243854	2018-04-23 13:49:19.243854
947	extend revolutionary e-services	7	2018-04-23 13:49:19.245732	2018-04-23 13:49:19.245732
948	transition collaborative convergence	282	2018-04-23 13:49:19.247571	2018-04-23 13:49:19.247571
949	innovate plug-and-play web-readiness	69	2018-04-23 13:49:19.249332	2018-04-23 13:49:19.249332
950	integrate rich paradigms	433	2018-04-23 13:49:19.25151	2018-04-23 13:49:19.25151
951	syndicate open-source vortals	117	2018-04-23 13:49:19.253527	2018-04-23 13:49:19.253527
952	mesh leading-edge web-readiness	451	2018-04-23 13:49:19.255376	2018-04-23 13:49:19.255376
953	unleash plug-and-play schemas	221	2018-04-23 13:49:19.257358	2018-04-23 13:49:19.257358
954	envisioneer integrated systems	46	2018-04-23 13:49:19.259334	2018-04-23 13:49:19.259334
955	target extensible models	492	2018-04-23 13:49:19.261279	2018-04-23 13:49:19.261279
956	transition e-business functionalities	486	2018-04-23 13:49:19.26321	2018-04-23 13:49:19.26321
957	transition strategic channels	415	2018-04-23 13:49:19.265143	2018-04-23 13:49:19.265143
958	facilitate holistic partnerships	454	2018-04-23 13:49:19.267088	2018-04-23 13:49:19.267088
959	grow magnetic schemas	9	2018-04-23 13:49:19.268977	2018-04-23 13:49:19.268977
960	aggregate sticky mindshare	260	2018-04-23 13:49:19.271087	2018-04-23 13:49:19.271087
961	transform plug-and-play e-markets	11	2018-04-23 13:49:19.273126	2018-04-23 13:49:19.273126
962	visualize virtual content	375	2018-04-23 13:49:19.274996	2018-04-23 13:49:19.274996
963	iterate robust users	353	2018-04-23 13:49:19.277038	2018-04-23 13:49:19.277038
964	benchmark sexy markets	178	2018-04-23 13:49:19.279086	2018-04-23 13:49:19.279086
965	e-enable real-time models	256	2018-04-23 13:49:19.281046	2018-04-23 13:49:19.281046
966	syndicate customized channels	228	2018-04-23 13:49:19.283046	2018-04-23 13:49:19.283046
967	aggregate end-to-end platforms	75	2018-04-23 13:49:19.285009	2018-04-23 13:49:19.285009
968	morph out-of-the-box e-commerce	65	2018-04-23 13:49:19.287026	2018-04-23 13:49:19.287026
969	mesh e-business supply-chains	430	2018-04-23 13:49:19.289045	2018-04-23 13:49:19.289045
970	enable scalable e-services	76	2018-04-23 13:49:19.291066	2018-04-23 13:49:19.291066
971	engage out-of-the-box e-commerce	133	2018-04-23 13:49:19.292941	2018-04-23 13:49:19.292941
972	enhance plug-and-play schemas	466	2018-04-23 13:49:19.294902	2018-04-23 13:49:19.294902
973	utilize seamless models	148	2018-04-23 13:49:19.296871	2018-04-23 13:49:19.296871
974	architect back-end synergies	242	2018-04-23 13:49:19.298839	2018-04-23 13:49:19.298839
975	incubate enterprise infomediaries	293	2018-04-23 13:49:19.300781	2018-04-23 13:49:19.300781
976	recontextualize compelling bandwidth	308	2018-04-23 13:49:19.303113	2018-04-23 13:49:19.303113
977	engineer real-time technologies	152	2018-04-23 13:49:19.305154	2018-04-23 13:49:19.305154
978	architect bricks-and-clicks eyeballs	216	2018-04-23 13:49:19.307068	2018-04-23 13:49:19.307068
979	deliver wireless infrastructures	391	2018-04-23 13:49:19.30894	2018-04-23 13:49:19.30894
980	matrix killer mindshare	447	2018-04-23 13:49:19.310836	2018-04-23 13:49:19.310836
981	harness transparent synergies	331	2018-04-23 13:49:19.312767	2018-04-23 13:49:19.312767
982	utilize rich partnerships	322	2018-04-23 13:49:19.314729	2018-04-23 13:49:19.314729
983	iterate wireless schemas	222	2018-04-23 13:49:19.316614	2018-04-23 13:49:19.316614
984	whiteboard user-centric bandwidth	344	2018-04-23 13:49:19.318772	2018-04-23 13:49:19.318772
985	integrate back-end mindshare	33	2018-04-23 13:49:19.320781	2018-04-23 13:49:19.320781
986	streamline next-generation paradigms	194	2018-04-23 13:49:19.322727	2018-04-23 13:49:19.322727
987	e-enable seamless experiences	155	2018-04-23 13:49:19.324655	2018-04-23 13:49:19.324655
988	scale back-end e-services	74	2018-04-23 13:49:19.326494	2018-04-23 13:49:19.326494
989	enhance value-added initiatives	306	2018-04-23 13:49:19.328521	2018-04-23 13:49:19.328521
990	enable collaborative e-markets	313	2018-04-23 13:49:19.330397	2018-04-23 13:49:19.330397
991	extend clicks-and-mortar metrics	266	2018-04-23 13:49:19.332236	2018-04-23 13:49:19.332236
992	generate viral infrastructures	117	2018-04-23 13:49:19.334043	2018-04-23 13:49:19.334043
993	harness one-to-one e-markets	2	2018-04-23 13:49:19.336315	2018-04-23 13:49:19.336315
994	reintermediate front-end users	71	2018-04-23 13:49:19.33829	2018-04-23 13:49:19.33829
995	unleash enterprise functionalities	344	2018-04-23 13:49:19.340259	2018-04-23 13:49:19.340259
996	incentivize next-generation paradigms	350	2018-04-23 13:49:19.342214	2018-04-23 13:49:19.342214
997	engage revolutionary infrastructures	385	2018-04-23 13:49:19.344216	2018-04-23 13:49:19.344216
998	aggregate back-end platforms	127	2018-04-23 13:49:19.34632	2018-04-23 13:49:19.34632
999	scale revolutionary supply-chains	282	2018-04-23 13:49:19.348392	2018-04-23 13:49:19.348392
1000	innovate intuitive experiences	104	2018-04-23 13:49:19.350387	2018-04-23 13:49:19.350387
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20160126214213
20160126214218
20160126214223
20160126214226
20160128160743
20160129052524
20160129052544
20161006210959
20161007183527
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.students (id, first_name, last_name, email, phone_number, age, registration_date, created_at, updated_at) FROM stdin;
1	Casey	Rolfson	dashawn.steuber@swaniawski.co	(449) 792-1087	67	2018-03-23 13:49:16.035105	2018-04-23 13:49:16.042023	2018-04-23 13:49:16.042023
2	Susan	Lockman	jeffery_flatley@botsford.biz	(554) 392-4646	21	2018-01-16 13:49:16.044645	2018-04-23 13:49:16.045344	2018-04-23 13:49:16.045344
3	Rosemarie	Kreiger	nestor@schamberger.io	1-635-736-5203 x944	18	2018-03-22 13:49:16.0471	2018-04-23 13:49:16.047756	2018-04-23 13:49:16.047756
4	Delta	Hamill	laurel_howe@brekkedaniel.net	(457) 121-5464	61	2018-04-23 13:49:16.049507	2018-04-23 13:49:16.050099	2018-04-23 13:49:16.050099
5	Sarah	McDermott	kieran_schoen@schulist.co	458.396.0532 x3538	50	2018-01-29 13:49:16.051875	2018-04-23 13:49:16.052518	2018-04-23 13:49:16.052518
6	Layla	Wehner	sydni@kuvalis.org	1-443-914-1452 x26732	22	2018-03-20 13:49:16.054367	2018-04-23 13:49:16.055008	2018-04-23 13:49:16.055008
7	Marilou	Hane	winfield_labadie@ernser.name	706-599-4131	23	2018-03-20 13:49:16.056823	2018-04-23 13:49:16.057428	2018-04-23 13:49:16.057428
8	Paige	McKenzie	clinton@hackettstark.com	619-813-6217 x580	31	2018-02-10 13:49:16.059005	2018-04-23 13:49:16.059754	2018-04-23 13:49:16.059754
9	Holly	Hickle	christ@thiel.biz	418-650-5670	65	2018-04-07 13:49:16.061597	2018-04-23 13:49:16.06224	2018-04-23 13:49:16.06224
10	Cayla	Nicolas	freddie@langoshdach.com	(290) 533-0894 x95134	32	2018-03-07 13:49:16.064037	2018-04-23 13:49:16.064744	2018-04-23 13:49:16.064744
11	Jordyn	Quigley	domenic_graham@turner.co	138.767.5636 x03226	45	2018-01-14 13:49:16.066618	2018-04-23 13:49:16.067363	2018-04-23 13:49:16.067363
12	Easter	Schneider	marcellus@ebertboyle.com	(437) 042-4902	44	2018-03-18 13:49:16.069306	2018-04-23 13:49:16.070001	2018-04-23 13:49:16.070001
13	Mustafa	Kulas	nicola@schiller.io	(901) 961-1936	50	2018-01-25 13:49:16.071691	2018-04-23 13:49:16.072299	2018-04-23 13:49:16.072299
14	Jayson	Collier	emmy@klockoemmerich.net	827-366-6718 x60874	22	2018-04-08 13:49:16.074008	2018-04-23 13:49:16.074589	2018-04-23 13:49:16.074589
15	Rebecca	Rohan	ervin@torphy.com	1-678-766-8720	37	2018-01-31 13:49:16.076219	2018-04-23 13:49:16.076828	2018-04-23 13:49:16.076828
16	Damien	Leuschke	maci@feeneywolf.com	225-070-8017 x103	55	2018-03-23 13:49:16.078659	2018-04-23 13:49:16.07924	2018-04-23 13:49:16.07924
17	Finn	Bode	jerad@wolffbalistreri.info	1-412-589-5534	43	2018-03-21 13:49:16.080873	2018-04-23 13:49:16.081479	2018-04-23 13:49:16.081479
18	Princess	Ebert	eve@criststanton.com	(420) 160-7841 x88774	68	2018-01-14 13:49:16.083308	2018-04-23 13:49:16.083932	2018-04-23 13:49:16.083932
19	Brian	Simonis	hudson@kihnmccullough.org	952-468-8750 x67454	40	2018-03-12 13:49:16.085981	2018-04-23 13:49:16.086625	2018-04-23 13:49:16.086625
20	Brandy	Heidenreich	oliver_lemke@bayer.io	255-597-1464 x50520	58	2018-02-09 13:49:16.088851	2018-04-23 13:49:16.089585	2018-04-23 13:49:16.089585
21	Santino	Padberg	rubye.goldner@wolff.biz	1-681-642-4031 x884	39	2018-01-23 13:49:16.091527	2018-04-23 13:49:16.092191	2018-04-23 13:49:16.092191
22	Rhett	Bednar	xander@macejkovic.org	1-191-408-7626 x664	63	2018-03-08 13:49:16.093838	2018-04-23 13:49:16.094474	2018-04-23 13:49:16.094474
23	Hanna	Prohaska	shanny_hahn@daviswelch.info	460-171-0899	36	2018-04-03 13:49:16.096135	2018-04-23 13:49:16.096729	2018-04-23 13:49:16.096729
24	Alexis	Stark	wava_kling@hamill.co	(627) 402-1724 x57585	20	2018-03-22 13:49:16.098472	2018-04-23 13:49:16.09909	2018-04-23 13:49:16.09909
25	Josianne	Glover	milton@damorehintz.net	801.051.1819 x35720	17	2018-01-14 13:49:16.100763	2018-04-23 13:49:16.101382	2018-04-23 13:49:16.101382
26	Dortha	Parisian	pablo@effertz.biz	(779) 904-8013	66	2018-02-07 13:49:16.103402	2018-04-23 13:49:16.104071	2018-04-23 13:49:16.104071
27	Kianna	Rice	emmy@prosacco.net	154.795.2490	68	2018-02-17 13:49:16.106	2018-04-23 13:49:16.106736	2018-04-23 13:49:16.106736
28	Eladio	Rempel	eleanore@bechtelar.com	1-128-156-3353 x5407	15	2018-02-14 13:49:16.108612	2018-04-23 13:49:16.109204	2018-04-23 13:49:16.109204
29	Torrance	Feeney	abbigail@gulgowski.info	1-235-128-8072 x5586	16	2018-03-09 13:49:16.111043	2018-04-23 13:49:16.11162	2018-04-23 13:49:16.11162
30	Maude	Nienow	keegan@wisoky.net	1-766-534-5420 x51824	38	2018-03-01 13:49:16.113292	2018-04-23 13:49:16.113899	2018-04-23 13:49:16.113899
31	Johnathan	Kuphal	vaughn@jacobsonboehm.co	(836) 305-8550	44	2018-04-12 13:49:16.115651	2018-04-23 13:49:16.116353	2018-04-23 13:49:16.116353
32	Lexi	Altenwerth	sim@kunde.co	(890) 343-0525 x20954	36	2018-04-02 13:49:16.118307	2018-04-23 13:49:16.119073	2018-04-23 13:49:16.119073
33	Haleigh	Koepp	howard.dibbert@hodkiewicz.org	(300) 684-0791	20	2018-02-08 13:49:16.121135	2018-04-23 13:49:16.12189	2018-04-23 13:49:16.12189
34	Effie	Stanton	juwan@ohara.biz	397.778.7744	21	2018-03-20 13:49:16.124103	2018-04-23 13:49:16.124962	2018-04-23 13:49:16.124962
35	Lenny	Shields	jody_eichmann@reillyokuneva.com	(785) 369-7298 x82499	72	2018-03-08 13:49:16.127157	2018-04-23 13:49:16.128035	2018-04-23 13:49:16.128035
36	Jess	Turner	idell@toyprohaska.org	333-522-7702	21	2018-02-13 13:49:16.130286	2018-04-23 13:49:16.13141	2018-04-23 13:49:16.13141
37	Brycen	Kemmer	otto.towne@grant.com	318-075-0481	63	2018-03-19 13:49:16.133434	2018-04-23 13:49:16.134207	2018-04-23 13:49:16.134207
38	Fred	Legros	april_murray@runolfsdottir.com	916-234-5619 x3307	38	2018-03-30 13:49:16.136004	2018-04-23 13:49:16.136674	2018-04-23 13:49:16.136674
39	Jamey	Collins	etha.lehner@turcotte.info	1-764-611-2287	33	2018-02-02 13:49:16.138364	2018-04-23 13:49:16.138978	2018-04-23 13:49:16.138978
40	Scarlett	Ankunding	winston.runolfon@watsicalarkin.info	837.296.9695 x915	49	2018-03-09 13:49:16.1407	2018-04-23 13:49:16.141333	2018-04-23 13:49:16.141333
41	Chet	Lind	fanny.rodriguez@schillerfeil.info	399-487-0086	64	2018-01-28 13:49:16.143128	2018-04-23 13:49:16.143764	2018-04-23 13:49:16.143764
42	Dennis	Lang	phoebe@lefflerjaskolski.name	621.976.4264	35	2018-02-17 13:49:16.145528	2018-04-23 13:49:16.146161	2018-04-23 13:49:16.146161
43	Waldo	Mann	amelie_white@kingharber.biz	705-317-5837 x304	26	2018-04-01 13:49:16.147951	2018-04-23 13:49:16.148534	2018-04-23 13:49:16.148534
44	Estefania	Schinner	rosemarie.trantow@homenickmcclure.org	922-578-9627 x2841	36	2018-01-17 13:49:16.150154	2018-04-23 13:49:16.150736	2018-04-23 13:49:16.150736
45	Caitlyn	Kihn	miguel.cormier@oreilly.org	709-329-8856 x503	31	2018-01-18 13:49:16.152478	2018-04-23 13:49:16.153106	2018-04-23 13:49:16.153106
46	Jefferey	Schinner	kailee@stehr.com	702.896.8863 x9088	16	2018-01-15 13:49:16.154751	2018-04-23 13:49:16.155332	2018-04-23 13:49:16.155332
47	Anita	Murazik	etha@kunde.org	(239) 359-6689	56	2018-02-24 13:49:16.15725	2018-04-23 13:49:16.157895	2018-04-23 13:49:16.157895
48	Chase	Kling	vickie_bogan@gislasonbailey.info	517-282-4499 x7421	57	2018-02-28 13:49:16.159685	2018-04-23 13:49:16.160381	2018-04-23 13:49:16.160381
49	Kim	Macejkovic	edison.greenfelder@baumbachhodkiewicz.com	(751) 370-6811 x92087	28	2018-01-16 13:49:16.162248	2018-04-23 13:49:16.16296	2018-04-23 13:49:16.16296
50	Louisa	Fadel	macy_klein@roberts.name	1-659-401-1754	67	2018-03-28 13:49:16.164915	2018-04-23 13:49:16.165587	2018-04-23 13:49:16.165587
51	Layne	Hayes	marlee@bashiriancollins.biz	(687) 184-9695 x7445	67	2018-01-20 13:49:16.167581	2018-04-23 13:49:16.168407	2018-04-23 13:49:16.168407
52	Arturo	Senger	romaine@donnelly.co	466.569.5352 x362	60	2018-03-21 13:49:16.170282	2018-04-23 13:49:16.170952	2018-04-23 13:49:16.170952
53	Alexys	Krajcik	aylin@cremin.biz	881.891.6025 x489	37	2018-03-13 13:49:16.173024	2018-04-23 13:49:16.173676	2018-04-23 13:49:16.173676
54	Bessie	Zboncak	jalen@doylebogan.io	1-219-834-2599 x970	28	2018-02-05 13:49:16.175693	2018-04-23 13:49:16.176326	2018-04-23 13:49:16.176326
55	Tristin	Rath	emmy_gleichner@stromanupton.io	(147) 470-5627 x84307	64	2018-04-14 13:49:16.17836	2018-04-23 13:49:16.179085	2018-04-23 13:49:16.179085
56	Ara	Grant	kaden.herzog@handmuller.name	1-857-601-8516	29	2018-04-23 13:49:16.181396	2018-04-23 13:49:16.182068	2018-04-23 13:49:16.182068
57	Kaci	Rempel	cayla@berge.net	(123) 604-4158 x353	41	2018-04-09 13:49:16.183894	2018-04-23 13:49:16.184675	2018-04-23 13:49:16.184675
58	Noemie	Flatley	waldo_larson@grimechaefer.net	926.487.6007	56	2018-04-20 13:49:16.187021	2018-04-23 13:49:16.188029	2018-04-23 13:49:16.188029
59	Chaya	Predovic	jordon@kelerhartmann.org	177-981-1234 x82676	57	2018-02-01 13:49:16.189831	2018-04-23 13:49:16.190488	2018-04-23 13:49:16.190488
60	Bradford	Casper	ollie.armstrong@satterfield.io	(986) 338-8250 x756	25	2018-02-22 13:49:16.192329	2018-04-23 13:49:16.192924	2018-04-23 13:49:16.192924
61	Manley	Walter	idell_daugherty@kelerkautzer.com	(754) 784-2163 x88620	28	2018-04-21 13:49:16.194545	2018-04-23 13:49:16.195156	2018-04-23 13:49:16.195156
62	Emilie	Harvey	angel.oconnell@wittingschinner.com	1-668-274-7966	48	2018-02-06 13:49:16.196741	2018-04-23 13:49:16.197328	2018-04-23 13:49:16.197328
63	Yoshiko	Hills	isaac@dibbert.org	(149) 877-4729 x43816	51	2018-04-16 13:49:16.198957	2018-04-23 13:49:16.199626	2018-04-23 13:49:16.199626
64	Monty	Shields	elian_jaskolski@ernserlind.org	1-855-174-3440 x3143	26	2018-03-22 13:49:16.201368	2018-04-23 13:49:16.202097	2018-04-23 13:49:16.202097
65	Marcos	Hettinger	lilliana.jakubowski@nitzscheullrich.com	455.152.4463	61	2018-02-22 13:49:16.203827	2018-04-23 13:49:16.2045	2018-04-23 13:49:16.2045
66	Oceane	Halvorson	rigoberto@fahey.org	984.263.1075	37	2018-02-19 13:49:16.206201	2018-04-23 13:49:16.206844	2018-04-23 13:49:16.206844
67	Luigi	Steuber	tremaine@pfannerstill.org	204-110-3956 x827	46	2018-02-09 13:49:16.208699	2018-04-23 13:49:16.209364	2018-04-23 13:49:16.209364
68	Jerald	Yost	tad@goyette.io	1-664-330-7132 x56338	60	2018-03-19 13:49:16.211148	2018-04-23 13:49:16.211798	2018-04-23 13:49:16.211798
69	Samantha	Wunsch	meta.bartell@stark.io	1-852-492-2719	46	2018-04-07 13:49:16.213963	2018-04-23 13:49:16.214602	2018-04-23 13:49:16.214602
70	Domenick	Hammes	gielle_streich@champlinshields.com	1-813-153-6513	21	2018-03-30 13:49:16.216264	2018-04-23 13:49:16.21693	2018-04-23 13:49:16.21693
71	Julia	Senger	joey@tremblay.info	1-886-060-6338	45	2018-04-14 13:49:16.218788	2018-04-23 13:49:16.219502	2018-04-23 13:49:16.219502
72	Camden	Schiller	marguerite@mueller.org	(626) 394-2180 x51690	46	2018-02-17 13:49:16.221225	2018-04-23 13:49:16.221859	2018-04-23 13:49:16.221859
73	Enrique	Hand	dario.balistreri@medhurstmarquardt.org	755.497.4310	56	2018-03-27 13:49:16.223473	2018-04-23 13:49:16.224073	2018-04-23 13:49:16.224073
74	Chaz	Zboncak	colten_haley@wolfbeatty.co	994-637-8708	39	2018-03-06 13:49:16.225665	2018-04-23 13:49:16.226314	2018-04-23 13:49:16.226314
75	Waino	Greenholt	keaton_trantow@bode.biz	1-925-667-0876	64	2018-02-18 13:49:16.228146	2018-04-23 13:49:16.228779	2018-04-23 13:49:16.228779
76	Eula	Barton	kaden@kilbackemmerich.info	1-434-336-6409	70	2018-03-29 13:49:16.2306	2018-04-23 13:49:16.231229	2018-04-23 13:49:16.231229
77	Eliza	Schinner	rodolfo@wolfkilback.info	389-268-6605 x50843	16	2018-02-10 13:49:16.232913	2018-04-23 13:49:16.233518	2018-04-23 13:49:16.233518
78	Scottie	Bashirian	montana_bradtke@hayesfriesen.name	1-493-342-1552	57	2018-02-04 13:49:16.235555	2018-04-23 13:49:16.236313	2018-04-23 13:49:16.236313
79	Gilbert	Osinski	else@gibson.info	959-166-8201	28	2018-03-07 13:49:16.238188	2018-04-23 13:49:16.238795	2018-04-23 13:49:16.238795
80	Janessa	Herzog	scarlett.ko@pfannerstill.co	970.674.5802 x41218	70	2018-03-18 13:49:16.240521	2018-04-23 13:49:16.241109	2018-04-23 13:49:16.241109
81	Eliseo	Grady	ed.macejkovic@wiegand.io	1-240-735-1588	43	2018-02-25 13:49:16.242934	2018-04-23 13:49:16.243529	2018-04-23 13:49:16.243529
82	Tyra	Kuphal	dayana@nikolauswaters.io	1-680-659-0141 x001	42	2018-02-14 13:49:16.245426	2018-04-23 13:49:16.246057	2018-04-23 13:49:16.246057
83	Roosevelt	Schinner	jameson.johns@fisherupton.name	691.852.1970 x6784	26	2018-02-15 13:49:16.247915	2018-04-23 13:49:16.248558	2018-04-23 13:49:16.248558
84	Roma	Swift	carrie@zboncakcasper.biz	(982) 256-0017	41	2018-02-08 13:49:16.250218	2018-04-23 13:49:16.250793	2018-04-23 13:49:16.250793
85	Maymie	Huel	tyson_harris@shanahan.info	(508) 313-7391 x87696	68	2018-04-18 13:49:16.252575	2018-04-23 13:49:16.253208	2018-04-23 13:49:16.253208
86	Kacie	Hane	uriel@rodriguez.com	707.275.7148 x3858	44	2018-03-23 13:49:16.255021	2018-04-23 13:49:16.255664	2018-04-23 13:49:16.255664
87	Doyle	Schaefer	erin@ryan.info	1-629-667-0354 x5155	70	2018-02-02 13:49:16.257481	2018-04-23 13:49:16.2581	2018-04-23 13:49:16.2581
88	Deon	Pacocha	merl.breitenberg@wiegand.name	(673) 128-8795	59	2018-02-19 13:49:16.260066	2018-04-23 13:49:16.260865	2018-04-23 13:49:16.260865
89	Kaley	Gleason	alexzander_kovacek@towne.name	(596) 276-7233 x9370	22	2018-01-22 13:49:16.262759	2018-04-23 13:49:16.263381	2018-04-23 13:49:16.263381
90	Dora	Frami	helen@prosaccostrosin.biz	(742) 606-2196 x0665	47	2018-02-03 13:49:16.265242	2018-04-23 13:49:16.265828	2018-04-23 13:49:16.265828
91	Blair	Cole	bonita@considine.com	1-687-777-4137 x736	28	2018-01-30 13:49:16.267456	2018-04-23 13:49:16.268039	2018-04-23 13:49:16.268039
92	Jolie	Runolfsdottir	wilton@dickibrown.biz	407.713.9053 x47852	54	2018-04-12 13:49:16.269726	2018-04-23 13:49:16.270413	2018-04-23 13:49:16.270413
93	Marlon	Eichmann	amelia@upton.org	147-328-7149 x128	30	2018-03-07 13:49:16.272249	2018-04-23 13:49:16.272907	2018-04-23 13:49:16.272907
94	Keenan	Gusikowski	alyon@casper.name	969-666-9649 x357	26	2018-04-18 13:49:16.274609	2018-04-23 13:49:16.275189	2018-04-23 13:49:16.275189
95	Ken	Auer	rogelio.schmidt@lakin.org	(514) 650-0220 x3429	49	2018-03-26 13:49:16.276831	2018-04-23 13:49:16.277409	2018-04-23 13:49:16.277409
96	Brennan	Ankunding	osvaldo_olson@rempel.co	(526) 245-5642 x42574	73	2018-03-12 13:49:16.279131	2018-04-23 13:49:16.279814	2018-04-23 13:49:16.279814
97	Alayna	Kihn	brittany@kovacek.com	1-358-120-6013	64	2018-03-13 13:49:16.281683	2018-04-23 13:49:16.282398	2018-04-23 13:49:16.282398
98	Kaylin	Fahey	ben_little@hane.org	1-443-067-7232 x767	44	2018-04-02 13:49:16.284157	2018-04-23 13:49:16.284841	2018-04-23 13:49:16.284841
99	Dessie	Pouros	dexter_bashirian@rau.biz	1-123-250-3742	28	2018-01-25 13:49:16.28678	2018-04-23 13:49:16.287554	2018-04-23 13:49:16.287554
100	Aubree	Lowe	elva@konopelskisanford.info	819-579-0727 x6589	29	2018-03-03 13:49:16.289397	2018-04-23 13:49:16.290046	2018-04-23 13:49:16.290046
101	Annabell	Wilderman	kaci@hamill.org	(308) 297-7685	15	2018-01-20 13:49:16.29188	2018-04-23 13:49:16.2925	2018-04-23 13:49:16.2925
102	Ayden	Howe	izabella_hilll@keler.biz	309.296.4614 x09610	43	2018-03-06 13:49:16.294134	2018-04-23 13:49:16.294717	2018-04-23 13:49:16.294717
103	Samantha	Upton	neil_kulas@herzog.name	(564) 759-9517	56	2018-03-12 13:49:16.296394	2018-04-23 13:49:16.297021	2018-04-23 13:49:16.297021
104	Rollin	Ledner	amelia_ullrich@lehner.net	342.898.9093	72	2018-03-05 13:49:16.298688	2018-04-23 13:49:16.299311	2018-04-23 13:49:16.299311
105	Reynold	Jenkins	curt@rau.io	384.620.1078 x7184	50	2018-03-16 13:49:16.30098	2018-04-23 13:49:16.301583	2018-04-23 13:49:16.301583
106	Jessica	Gutmann	wilfred_turner@ortiz.net	875-175-5598 x98757	51	2018-02-03 13:49:16.303558	2018-04-23 13:49:16.304221	2018-04-23 13:49:16.304221
107	Jeff	Ritchie	euna.bernhard@goldner.com	598.409.3243 x041	21	2018-02-23 13:49:16.30599	2018-04-23 13:49:16.306618	2018-04-23 13:49:16.306618
108	Sam	Aufderhar	claudie@grant.info	134.947.6531	24	2018-01-22 13:49:16.308375	2018-04-23 13:49:16.309006	2018-04-23 13:49:16.309006
109	Edmond	Kuphal	hyman@skiles.org	897.123.3467 x051	28	2018-03-08 13:49:16.310692	2018-04-23 13:49:16.311368	2018-04-23 13:49:16.311368
110	Duncan	Harber	rod.bechtelar@fadel.io	326-854-8507 x58993	17	2018-04-01 13:49:16.313286	2018-04-23 13:49:16.31395	2018-04-23 13:49:16.31395
111	Athena	Bashirian	sigurd.abbott@ziemewilderman.biz	879-087-8586	47	2018-01-18 13:49:16.315693	2018-04-23 13:49:16.316357	2018-04-23 13:49:16.316357
112	Kevon	Howell	rosario@beerwilliamson.biz	521.773.7043	68	2018-03-09 13:49:16.318316	2018-04-23 13:49:16.319004	2018-04-23 13:49:16.319004
113	Virginie	Wisoky	andreane@kunde.org	408.294.4022	21	2018-02-18 13:49:16.320923	2018-04-23 13:49:16.321555	2018-04-23 13:49:16.321555
114	Euna	Kuvalis	stephon.harvey@johns.com	(868) 199-2180 x343	64	2018-02-09 13:49:16.323279	2018-04-23 13:49:16.323885	2018-04-23 13:49:16.323885
115	Jaquelin	Crist	marquise@wiegand.name	(860) 366-4403 x17662	16	2018-04-15 13:49:16.325618	2018-04-23 13:49:16.326228	2018-04-23 13:49:16.326228
116	Reina	Shields	miller_jaskolski@kohlerrogahn.io	1-393-441-9884 x1674	45	2018-02-16 13:49:16.328089	2018-04-23 13:49:16.32879	2018-04-23 13:49:16.32879
117	Hosea	Gorczany	kaelyn.goodwin@yostschiller.com	1-625-936-9769 x114	46	2018-04-05 13:49:16.330611	2018-04-23 13:49:16.331299	2018-04-23 13:49:16.331299
118	Edison	Larson	orion.maggio@heidenreich.co	489-152-6426	20	2018-02-07 13:49:16.333145	2018-04-23 13:49:16.333894	2018-04-23 13:49:16.333894
119	Deven	Kessler	priscilla@mosciskichristiansen.name	(900) 325-5815 x547	42	2018-03-26 13:49:16.335783	2018-04-23 13:49:16.336457	2018-04-23 13:49:16.336457
120	Xander	Schumm	darby@bins.biz	1-643-426-2185 x41285	39	2018-02-09 13:49:16.338448	2018-04-23 13:49:16.339166	2018-04-23 13:49:16.339166
121	Juana	Bode	rosemarie@champlin.io	487-821-7627 x242	28	2018-03-05 13:49:16.341088	2018-04-23 13:49:16.341689	2018-04-23 13:49:16.341689
122	Athena	Bechtelar	terrence@oconner.co	252-936-7709	43	2018-04-12 13:49:16.343456	2018-04-23 13:49:16.344086	2018-04-23 13:49:16.344086
123	Felicity	Marquardt	lindsay@mohr.name	245-774-8448 x154	42	2018-04-14 13:49:16.345803	2018-04-23 13:49:16.346389	2018-04-23 13:49:16.346389
124	Alexandrea	Conroy	odell_rogahn@larsonsipes.name	317-492-8172	57	2018-04-16 13:49:16.348195	2018-04-23 13:49:16.348798	2018-04-23 13:49:16.348798
125	Natalia	Senger	peter@lang.org	1-101-039-2997 x5487	55	2018-04-10 13:49:16.350578	2018-04-23 13:49:16.351236	2018-04-23 13:49:16.351236
126	Frederique	Spinka	branson_swaniawski@vonrueden.io	1-986-784-7710 x02728	74	2018-03-17 13:49:16.353152	2018-04-23 13:49:16.353836	2018-04-23 13:49:16.353836
127	Idella	Roberts	chaim.west@luettgengislason.net	(337) 319-1564 x86767	34	2018-04-04 13:49:16.355569	2018-04-23 13:49:16.356179	2018-04-23 13:49:16.356179
128	Keegan	Beahan	kellie@bartolettistokes.info	663.677.8644	19	2018-04-19 13:49:16.35786	2018-04-23 13:49:16.358593	2018-04-23 13:49:16.358593
129	Duncan	Goldner	savanah@mayer.info	1-921-606-5409	70	2018-03-13 13:49:16.36053	2018-04-23 13:49:16.361167	2018-04-23 13:49:16.361167
130	Jaren	Walter	joesph@mcclure.name	348.566.9528	55	2018-03-18 13:49:16.362963	2018-04-23 13:49:16.363618	2018-04-23 13:49:16.363618
131	Roel	Pfannerstill	tianna.kub@rosenbaum.name	1-680-858-4130	38	2018-04-01 13:49:16.366315	2018-04-23 13:49:16.366969	2018-04-23 13:49:16.366969
132	Fabiola	Welch	imelda_murphy@okonosinski.io	696.511.8296 x8626	32	2018-04-17 13:49:16.368777	2018-04-23 13:49:16.369581	2018-04-23 13:49:16.369581
133	Amari	Christiansen	robin@okeefebogan.co	(686) 775-3779 x3748	68	2018-03-04 13:49:16.371433	2018-04-23 13:49:16.372067	2018-04-23 13:49:16.372067
134	Louisa	Treutel	justice@howellveum.co	(685) 704-6327	33	2018-02-07 13:49:16.373774	2018-04-23 13:49:16.374385	2018-04-23 13:49:16.374385
135	Harmon	Spencer	queenie_cain@lehner.io	1-105-492-8377 x4537	65	2018-03-17 13:49:16.376145	2018-04-23 13:49:16.377033	2018-04-23 13:49:16.377033
136	Maritza	Gutkowski	elinor.spinka@rutherford.net	(526) 030-5008 x204	43	2018-01-20 13:49:16.378726	2018-04-23 13:49:16.379337	2018-04-23 13:49:16.379337
137	Caleigh	Zboncak	audreanne.jerde@beckerkutch.io	(653) 480-1941 x64738	68	2018-04-20 13:49:16.381143	2018-04-23 13:49:16.38175	2018-04-23 13:49:16.38175
138	Bailee	Walsh	branson@bayerwilkinson.com	(129) 610-7318 x39248	20	2018-02-15 13:49:16.383492	2018-04-23 13:49:16.384172	2018-04-23 13:49:16.384172
139	Ed	Doyle	cheyenne_kuhn@blanda.info	1-786-559-5372	15	2018-04-13 13:49:16.386863	2018-04-23 13:49:16.387542	2018-04-23 13:49:16.387542
140	Casandra	Hane	nathan@zemlak.name	(377) 476-8742 x982	41	2018-04-04 13:49:16.389375	2018-04-23 13:49:16.390039	2018-04-23 13:49:16.390039
141	Ewald	Ziemann	ethel.schultz@wolffthiel.net	524.255.8390 x642	44	2018-01-20 13:49:16.391934	2018-04-23 13:49:16.392608	2018-04-23 13:49:16.392608
142	Marc	Bergstrom	kian@bergnaum.org	336.242.1440	59	2018-02-24 13:49:16.394451	2018-04-23 13:49:16.395137	2018-04-23 13:49:16.395137
143	Arnaldo	McCullough	amari.koepp@eichmann.io	(893) 095-5018 x9874	27	2018-03-19 13:49:16.397061	2018-04-23 13:49:16.397716	2018-04-23 13:49:16.397716
144	Anissa	Weimann	koby@macgyver.net	463.062.6651 x608	57	2018-02-28 13:49:16.399536	2018-04-23 13:49:16.400201	2018-04-23 13:49:16.400201
145	Whitney	Senger	efren_rice@klocko.biz	560-692-8232 x9874	59	2018-04-01 13:49:16.40286	2018-04-23 13:49:16.403607	2018-04-23 13:49:16.403607
146	Annette	Waters	libbie.hintz@padberg.com	(946) 659-2152 x8168	23	2018-04-06 13:49:16.405457	2018-04-23 13:49:16.406094	2018-04-23 13:49:16.406094
147	Gia	Murray	maci.roberts@corwin.org	1-533-757-0860 x923	68	2018-02-07 13:49:16.407877	2018-04-23 13:49:16.408504	2018-04-23 13:49:16.408504
148	Katherine	West	iliana.kunze@stiedemanntorphy.net	1-465-997-4246 x9972	62	2018-03-01 13:49:16.410236	2018-04-23 13:49:16.410873	2018-04-23 13:49:16.410873
149	Barry	Kilback	malachi.hegmann@daughertygrant.co	(547) 988-5045 x4239	59	2018-02-10 13:49:16.4128	2018-04-23 13:49:16.413455	2018-04-23 13:49:16.413455
150	Carmine	Langworth	tyson_hintz@stromanwilliamson.name	915-286-8087	66	2018-03-15 13:49:16.415755	2018-04-23 13:49:16.416462	2018-04-23 13:49:16.416462
151	Eryn	Crona	phoebe.hagenes@cruickshank.biz	245-678-0182	25	2018-03-04 13:49:16.41852	2018-04-23 13:49:16.419213	2018-04-23 13:49:16.419213
152	Pedro	Mertz	maci_schinner@langworth.co	1-857-951-6348	69	2018-03-31 13:49:16.421006	2018-04-23 13:49:16.421649	2018-04-23 13:49:16.421649
153	Royal	Kohler	ahmad_bogan@daugherty.biz	1-891-227-4635 x270	15	2018-03-22 13:49:16.423416	2018-04-23 13:49:16.424064	2018-04-23 13:49:16.424064
154	Dameon	Friesen	brandi.schamberger@langworth.org	1-915-314-1190	62	2018-01-22 13:49:16.425864	2018-04-23 13:49:16.426492	2018-04-23 13:49:16.426492
155	Samir	Predovic	wendell_kihn@willms.org	942.055.1124 x36447	28	2018-03-14 13:49:16.428239	2018-04-23 13:49:16.428874	2018-04-23 13:49:16.428874
156	Evangeline	Beatty	frida@greenfelder.net	637-241-9418	55	2018-03-16 13:49:16.430603	2018-04-23 13:49:16.431211	2018-04-23 13:49:16.431211
157	Daphne	Jerde	art@effertzwaters.info	940.281.7701	40	2018-02-08 13:49:16.432917	2018-04-23 13:49:16.433579	2018-04-23 13:49:16.433579
158	Lionel	Mann	zelda_howell@stantonschowalter.info	548-012-3793	49	2018-03-15 13:49:16.435368	2018-04-23 13:49:16.436068	2018-04-23 13:49:16.436068
159	Magdalen	Mohr	rosario@mueller.biz	(234) 689-1726 x673	24	2018-04-22 13:49:16.437888	2018-04-23 13:49:16.438619	2018-04-23 13:49:16.438619
160	Jordy	Lowe	delta@doyle.org	798-174-2144 x159	65	2018-03-29 13:49:16.440618	2018-04-23 13:49:16.441304	2018-04-23 13:49:16.441304
161	Shanna	Huels	gwen@champlinjerde.biz	183.451.7291 x896	68	2018-02-17 13:49:16.443116	2018-04-23 13:49:16.443853	2018-04-23 13:49:16.443853
162	Colleen	Bahringer	bridget@wintheiser.net	872-700-4726	22	2018-01-26 13:49:16.445491	2018-04-23 13:49:16.446081	2018-04-23 13:49:16.446081
163	Blaze	Gusikowski	laverna@gutkowski.io	148-625-6270 x62035	53	2018-01-16 13:49:16.447658	2018-04-23 13:49:16.448236	2018-04-23 13:49:16.448236
164	Buck	Hessel	malcolm.block@mitchell.info	(151) 138-0893 x35137	46	2018-01-31 13:49:16.449849	2018-04-23 13:49:16.450454	2018-04-23 13:49:16.450454
165	Lorena	Roob	delta.rodriguez@homenick.com	223.447.5021 x20959	65	2018-03-14 13:49:16.452392	2018-04-23 13:49:16.453163	2018-04-23 13:49:16.453163
166	Yasmin	Bins	zander@ledner.com	(556) 863-8698	28	2018-01-31 13:49:16.454904	2018-04-23 13:49:16.455533	2018-04-23 13:49:16.455533
167	Emil	Batz	taya@murphy.name	1-261-998-5811	72	2018-02-09 13:49:16.457233	2018-04-23 13:49:16.457928	2018-04-23 13:49:16.457928
168	Eli	Gleason	mitchell.gaylord@torp.co	721.007.7159 x18254	27	2018-04-11 13:49:16.459608	2018-04-23 13:49:16.460245	2018-04-23 13:49:16.460245
169	Penelope	Gutmann	ro_johnson@bogisich.com	1-409-047-7197 x9095	63	2018-02-03 13:49:16.461929	2018-04-23 13:49:16.46259	2018-04-23 13:49:16.46259
170	Novella	Jacobson	bennie@feest.co	(318) 078-1155 x7388	17	2018-01-21 13:49:16.464223	2018-04-23 13:49:16.46485	2018-04-23 13:49:16.46485
171	Bryon	Roob	tanya@kutch.info	360-421-6478 x22304	42	2018-02-23 13:49:16.46654	2018-04-23 13:49:16.467126	2018-04-23 13:49:16.467126
172	Yasmine	Okuneva	lempi@farrell.net	(817) 073-6184	63	2018-02-11 13:49:16.468872	2018-04-23 13:49:16.469716	2018-04-23 13:49:16.469716
173	Miles	Tremblay	arlene@bogisich.co	(435) 439-3541 x08672	52	2018-04-09 13:49:16.471445	2018-04-23 13:49:16.472054	2018-04-23 13:49:16.472054
174	Cody	Dietrich	edmond.torphy@tromp.net	833-219-9730	45	2018-03-14 13:49:16.473641	2018-04-23 13:49:16.474243	2018-04-23 13:49:16.474243
175	Olin	Collins	jamison.welch@ebertlemke.info	325-034-6226 x2470	15	2018-03-25 13:49:16.475845	2018-04-23 13:49:16.476415	2018-04-23 13:49:16.476415
176	Hiram	Towne	vivian_trantow@mrazstiedemann.co	(787) 362-4169 x41469	21	2018-04-23 13:49:16.477972	2018-04-23 13:49:16.4786	2018-04-23 13:49:16.4786
177	Willard	Prosacco	jaquan@hintz.io	157.872.8282 x94452	43	2018-03-24 13:49:16.480391	2018-04-23 13:49:16.481029	2018-04-23 13:49:16.481029
178	Porter	Thompson	brenna@windler.info	501-497-8114	18	2018-03-30 13:49:16.482864	2018-04-23 13:49:16.483664	2018-04-23 13:49:16.483664
179	Merl	Pfannerstill	bobby@cormierauer.io	226.975.9397 x407	65	2018-01-20 13:49:16.485414	2018-04-23 13:49:16.486103	2018-04-23 13:49:16.486103
180	Fletcher	DuBuque	henry.buckridge@barton.com	1-264-885-3065	25	2018-03-12 13:49:16.48778	2018-04-23 13:49:16.488368	2018-04-23 13:49:16.488368
181	Jewell	Rowe	arnulfo.kovacek@oberbrunnerbednar.co	1-250-468-2416 x230	26	2018-04-03 13:49:16.489943	2018-04-23 13:49:16.490514	2018-04-23 13:49:16.490514
182	Alba	Dietrich	jermain.heathcote@whitehammes.name	(516) 693-4691 x812	39	2018-02-12 13:49:16.492075	2018-04-23 13:49:16.492646	2018-04-23 13:49:16.492646
183	Ines	West	lenore@west.com	1-580-303-3690 x889	71	2018-03-11 13:49:16.494189	2018-04-23 13:49:16.494855	2018-04-23 13:49:16.494855
184	Ahmad	Smitham	althea_moore@kunzekshlerin.name	1-317-287-3553 x809	25	2018-04-16 13:49:16.496497	2018-04-23 13:49:16.497072	2018-04-23 13:49:16.497072
185	Irving	Osinski	jalen@predovicbecker.name	(131) 658-0624 x579	59	2018-01-23 13:49:16.498741	2018-04-23 13:49:16.499354	2018-04-23 13:49:16.499354
186	Isom	Dare	gerson@hodkiewicz.co	1-334-007-4634	62	2018-01-16 13:49:16.500932	2018-04-23 13:49:16.50156	2018-04-23 13:49:16.50156
187	Conrad	Kshlerin	kristopher@kris.org	571.453.8258	33	2018-04-18 13:49:16.503467	2018-04-23 13:49:16.504121	2018-04-23 13:49:16.504121
188	Savannah	Jacobson	nicola@beckerrolfson.net	896-888-6111	61	2018-04-06 13:49:16.505804	2018-04-23 13:49:16.506444	2018-04-23 13:49:16.506444
189	Viola	Weber	elliot@walter.name	443-618-6761 x77332	32	2018-04-16 13:49:16.50815	2018-04-23 13:49:16.50882	2018-04-23 13:49:16.50882
190	Rico	Aufderhar	lizzie_ratke@bartonsmitham.org	832.381.7949 x110	16	2018-04-10 13:49:16.510511	2018-04-23 13:49:16.511164	2018-04-23 13:49:16.511164
191	Lempi	O'Kon	macey@bogisichharber.co	807.691.4110 x389	53	2018-04-14 13:49:16.512868	2018-04-23 13:49:16.513511	2018-04-23 13:49:16.513511
192	Hugh	Nienow	darius@rogahn.com	861-979-9177 x486	42	2018-01-16 13:49:16.515528	2018-04-23 13:49:16.516476	2018-04-23 13:49:16.516476
193	Justice	Schaden	nyasia_muller@deckowhirthe.io	(461) 914-2630 x5639	58	2018-03-23 13:49:16.518314	2018-04-23 13:49:16.51901	2018-04-23 13:49:16.51901
194	Melyssa	Boyle	lorenzo@walter.io	273-943-0367 x502	27	2018-04-08 13:49:16.520817	2018-04-23 13:49:16.521481	2018-04-23 13:49:16.521481
195	Monserrat	Rau	scarlett@stark.name	163.744.9566 x15336	38	2018-03-06 13:49:16.523498	2018-04-23 13:49:16.524429	2018-04-23 13:49:16.524429
196	Noble	Upton	makenzie@stokes.co	(785) 305-6715	73	2018-01-16 13:49:16.526438	2018-04-23 13:49:16.527419	2018-04-23 13:49:16.527419
197	Rico	Crona	jamaal.kuphal@rueljacobs.io	615-678-2989 x2924	24	2018-01-28 13:49:16.529448	2018-04-23 13:49:16.530387	2018-04-23 13:49:16.530387
198	Emilie	Wolff	adolfo@bogisich.com	1-110-776-7627 x880	28	2018-01-17 13:49:16.532412	2018-04-23 13:49:16.53341	2018-04-23 13:49:16.53341
199	Ericka	Pfannerstill	elizabeth@wildermanyundt.org	1-598-848-8651 x5483	54	2018-03-23 13:49:16.535194	2018-04-23 13:49:16.535938	2018-04-23 13:49:16.535938
200	Selmer	Rempel	collin.denesik@pfefferprosacco.org	1-419-193-6719 x318	67	2018-03-26 13:49:16.537755	2018-04-23 13:49:16.538447	2018-04-23 13:49:16.538447
201	Walter	Wiegand	leopold_cole@hoegerbecker.biz	1-220-547-8890 x305	29	2018-04-03 13:49:16.540163	2018-04-23 13:49:16.540803	2018-04-23 13:49:16.540803
202	Baron	Barton	madelynn_bruen@wildermanbailey.co	726-305-1920 x57975	28	2018-04-06 13:49:16.542478	2018-04-23 13:49:16.543089	2018-04-23 13:49:16.543089
203	Belle	Lockman	emil_ankunding@rice.com	254-132-1510 x3544	21	2018-02-17 13:49:16.544696	2018-04-23 13:49:16.545286	2018-04-23 13:49:16.545286
204	Keara	Bernhard	juanita@doyle.biz	1-981-107-1930	67	2018-03-13 13:49:16.547266	2018-04-23 13:49:16.547917	2018-04-23 13:49:16.547917
205	Hayden	Toy	carolanne_friesen@stracke.co	1-206-749-3131 x659	23	2018-03-04 13:49:16.549599	2018-04-23 13:49:16.550233	2018-04-23 13:49:16.550233
206	Lambert	Braun	laney.walker@leannon.org	1-579-154-9973 x81003	42	2018-03-30 13:49:16.551938	2018-04-23 13:49:16.552613	2018-04-23 13:49:16.552613
207	Morgan	Paucek	rory.smitham@gottliebboyer.org	741-073-8013 x212	67	2018-03-07 13:49:16.554286	2018-04-23 13:49:16.554893	2018-04-23 13:49:16.554893
208	Selina	Rodriguez	alphonso_hagenes@schroedercain.name	179-679-2174 x189	49	2018-03-10 13:49:16.556553	2018-04-23 13:49:16.557179	2018-04-23 13:49:16.557179
209	Emerald	Simonis	urban.brown@witting.org	1-843-120-4923	48	2018-03-08 13:49:16.55895	2018-04-23 13:49:16.559572	2018-04-23 13:49:16.559572
210	Betty	Treutel	marisa.feeney@haagrosenbaum.info	1-881-126-5077 x240	22	2018-01-15 13:49:16.561271	2018-04-23 13:49:16.561898	2018-04-23 13:49:16.561898
211	Karina	Hagenes	lenny_kertzmann@littelaufderhar.org	(554) 581-3367	45	2018-02-10 13:49:16.563534	2018-04-23 13:49:16.564168	2018-04-23 13:49:16.564168
212	Hilbert	Collins	herminio@aufderhar.net	1-962-742-6023 x126	72	2018-04-02 13:49:16.565862	2018-04-23 13:49:16.566492	2018-04-23 13:49:16.566492
213	Trevion	McKenzie	elijah@howellgrant.co	(235) 493-3520 x16627	28	2018-04-16 13:49:16.568158	2018-04-23 13:49:16.568814	2018-04-23 13:49:16.568814
214	Eleazar	Gutkowski	euna@romagueramayert.io	1-787-995-8994	22	2018-02-12 13:49:16.570577	2018-04-23 13:49:16.571358	2018-04-23 13:49:16.571358
215	Misty	Zieme	camryn.mante@cummingsdeckow.info	1-799-575-0544 x4108	40	2018-03-23 13:49:16.573148	2018-04-23 13:49:16.573765	2018-04-23 13:49:16.573765
216	Junior	DuBuque	dovie@bahringer.com	524.532.5390	58	2018-03-28 13:49:16.575382	2018-04-23 13:49:16.575975	2018-04-23 13:49:16.575975
217	Emerald	O'Keefe	ryan.lesch@donnelly.com	912-103-6499 x034	59	2018-03-19 13:49:16.5777	2018-04-23 13:49:16.578695	2018-04-23 13:49:16.578695
218	Xzavier	Hyatt	elena.gleason@lynch.co	853.522.7524	31	2018-02-21 13:49:16.58049	2018-04-23 13:49:16.58112	2018-04-23 13:49:16.58112
219	Friedrich	Lindgren	bernita@hane.name	1-665-832-8533	66	2018-01-20 13:49:16.582803	2018-04-23 13:49:16.583421	2018-04-23 13:49:16.583421
220	Joelle	Kuhic	patricia@reilly.co	(163) 487-9885	26	2018-02-20 13:49:16.585107	2018-04-23 13:49:16.585762	2018-04-23 13:49:16.585762
221	Keegan	Schmitt	danial_bosco@bergnaum.info	1-891-552-8727 x409	67	2018-03-09 13:49:16.587463	2018-04-23 13:49:16.588099	2018-04-23 13:49:16.588099
222	Waino	Boyle	erin_howell@funk.info	1-380-586-0640 x685	25	2018-02-22 13:49:16.589797	2018-04-23 13:49:16.590446	2018-04-23 13:49:16.590446
223	Sabina	Towne	janick@legroskoch.net	614-664-4990 x2458	36	2018-04-03 13:49:16.592137	2018-04-23 13:49:16.592781	2018-04-23 13:49:16.592781
224	Clarabelle	Runolfsson	marisol_bashirian@marquardt.info	1-696-041-6772	30	2018-02-19 13:49:16.600205	2018-04-23 13:49:16.600965	2018-04-23 13:49:16.600965
225	Betty	Prohaska	liliana.brakus@crist.co	1-275-168-2196 x18126	66	2018-01-23 13:49:16.602929	2018-04-23 13:49:16.60365	2018-04-23 13:49:16.60365
226	Bridie	Fahey	jacynthe_stamm@carrollchamplin.com	618.342.6034	42	2018-01-31 13:49:16.605607	2018-04-23 13:49:16.606405	2018-04-23 13:49:16.606405
227	Titus	MacGyver	daryl.turner@hagenepencer.biz	(186) 930-9200 x6089	45	2018-04-06 13:49:16.608527	2018-04-23 13:49:16.609456	2018-04-23 13:49:16.609456
228	Jessy	Wolf	charley@dach.co	1-500-881-3258 x43546	59	2018-04-02 13:49:16.61137	2018-04-23 13:49:16.612015	2018-04-23 13:49:16.612015
229	Ole	Berge	kara_shields@vonruedenheller.info	369.442.6823	18	2018-03-08 13:49:16.613657	2018-04-23 13:49:16.614273	2018-04-23 13:49:16.614273
230	Chance	Witting	emely_nolan@graham.io	(829) 853-0409 x41794	55	2018-03-15 13:49:16.615987	2018-04-23 13:49:16.616633	2018-04-23 13:49:16.616633
231	Elsa	Koch	lavina@smitham.biz	827-422-2526 x152	37	2018-03-28 13:49:16.618283	2018-04-23 13:49:16.618947	2018-04-23 13:49:16.618947
232	Vernice	Mertz	demetris@franecki.co	469-486-5711	71	2018-01-26 13:49:16.620651	2018-04-23 13:49:16.621334	2018-04-23 13:49:16.621334
233	Stephania	Kihn	kory.fadel@daugherty.org	674-216-1376 x70593	38	2018-02-24 13:49:16.62328	2018-04-23 13:49:16.624332	2018-04-23 13:49:16.624332
234	Vilma	Littel	karlie@pagac.com	(239) 697-0383 x661	74	2018-02-08 13:49:16.626465	2018-04-23 13:49:16.627094	2018-04-23 13:49:16.627094
235	Rogelio	Cassin	timothy_kirlin@fahey.org	955.566.9065 x8975	74	2018-04-12 13:49:16.628715	2018-04-23 13:49:16.629341	2018-04-23 13:49:16.629341
236	Helmer	Cummerata	heber_becker@kutch.org	342-913-7891	40	2018-02-11 13:49:16.630994	2018-04-23 13:49:16.631591	2018-04-23 13:49:16.631591
237	Dan	Price	moie_wuckert@oreilly.biz	142-790-7419	15	2018-02-24 13:49:16.633262	2018-04-23 13:49:16.633893	2018-04-23 13:49:16.633893
238	Chadd	Bogisich	madalyn@westmurray.io	929.307.9668	72	2018-04-10 13:49:16.635661	2018-04-23 13:49:16.636395	2018-04-23 13:49:16.636395
239	Al	Stoltenberg	ozzie_willms@abshireberge.biz	889-299-6699 x64397	34	2018-02-06 13:49:16.638244	2018-04-23 13:49:16.638884	2018-04-23 13:49:16.638884
240	Antonia	Kunde	angus_cole@ferry.biz	1-513-603-6942	35	2018-03-18 13:49:16.640514	2018-04-23 13:49:16.641141	2018-04-23 13:49:16.641141
241	Elisabeth	Aufderhar	miller@macejkovicvon.co	1-153-823-9630 x8062	36	2018-04-10 13:49:16.642903	2018-04-23 13:49:16.643568	2018-04-23 13:49:16.643568
242	Blanche	Reichel	blanca@schimmelwalter.co	913-713-9015 x0105	28	2018-01-14 13:49:16.645286	2018-04-23 13:49:16.645926	2018-04-23 13:49:16.645926
243	Brielle	Bashirian	susie.hand@schroederheel.biz	1-486-233-1470 x691	58	2018-04-17 13:49:16.647663	2018-04-23 13:49:16.648323	2018-04-23 13:49:16.648323
244	Rodolfo	Johnston	brandi@kiehnkozey.info	1-442-913-9655	38	2018-03-29 13:49:16.650014	2018-04-23 13:49:16.650643	2018-04-23 13:49:16.650643
245	Elody	Johns	julia@davis.info	(382) 582-9582 x766	68	2018-03-29 13:49:16.65254	2018-04-23 13:49:16.653179	2018-04-23 13:49:16.653179
246	Domenick	Glover	elenora_bechtelar@jerde.name	(736) 658-2288	60	2018-03-24 13:49:16.65488	2018-04-23 13:49:16.655473	2018-04-23 13:49:16.655473
247	Roel	Herman	elaina@dickinsonboyer.com	(220) 665-9429	70	2018-02-09 13:49:16.657138	2018-04-23 13:49:16.657728	2018-04-23 13:49:16.657728
248	Nicolas	Orn	lindsay@stromanpfeffer.net	773-638-1301	17	2018-01-24 13:49:16.659397	2018-04-23 13:49:16.659991	2018-04-23 13:49:16.659991
249	Evangeline	Sipes	mollie.stroman@wardokon.org	315-486-3659 x9262	64	2018-03-30 13:49:16.66171	2018-04-23 13:49:16.662316	2018-04-23 13:49:16.662316
250	Federico	O'Reilly	marian@orn.name	(282) 441-3509 x509	33	2018-01-28 13:49:16.664103	2018-04-23 13:49:16.664711	2018-04-23 13:49:16.664711
251	Myra	Olson	magnus.weimann@jakubowskioreilly.co	1-315-784-4930 x203	44	2018-03-07 13:49:16.666457	2018-04-23 13:49:16.667101	2018-04-23 13:49:16.667101
252	Karson	Swift	celia@bode.net	1-312-350-3529 x961	63	2018-03-11 13:49:16.669006	2018-04-23 13:49:16.669649	2018-04-23 13:49:16.669649
253	Jean	Fay	nickolas_hermiston@ortizrenner.org	1-777-646-5378 x3304	62	2018-03-26 13:49:16.67141	2018-04-23 13:49:16.672011	2018-04-23 13:49:16.672011
254	Karelle	Blanda	elton@harris.biz	1-185-335-8123 x36608	43	2018-02-14 13:49:16.673702	2018-04-23 13:49:16.674301	2018-04-23 13:49:16.674301
255	Fred	Mayer	jermain_herzog@vandervort.io	325-936-1524	47	2018-03-25 13:49:16.675964	2018-04-23 13:49:16.676563	2018-04-23 13:49:16.676563
256	Eugenia	Block	thora@roberts.com	(945) 308-2576	18	2018-01-14 13:49:16.678432	2018-04-23 13:49:16.679108	2018-04-23 13:49:16.679108
257	Francesco	Thompson	lew.casper@sipes.io	377-891-9788	40	2018-03-09 13:49:16.680806	2018-04-23 13:49:16.681426	2018-04-23 13:49:16.681426
258	Emmet	Little	claire.wuckert@paucek.com	(913) 762-9584	56	2018-02-21 13:49:16.68309	2018-04-23 13:49:16.683711	2018-04-23 13:49:16.683711
259	Lazaro	Brakus	annabelle.ebert@ferrybailey.com	1-471-970-7273 x00643	59	2018-03-05 13:49:16.685365	2018-04-23 13:49:16.68603	2018-04-23 13:49:16.68603
260	Cristian	Hilll	sister_wiegand@lueilwitz.info	1-275-558-5483 x90101	60	2018-01-23 13:49:16.68775	2018-04-23 13:49:16.688607	2018-04-23 13:49:16.688607
261	Shawn	Hayes	aliya.durgan@becker.io	948.147.0608 x24068	34	2018-02-23 13:49:16.690524	2018-04-23 13:49:16.691244	2018-04-23 13:49:16.691244
262	Macey	Rosenbaum	sonya@schinner.net	1-307-565-4848	59	2018-02-24 13:49:16.693122	2018-04-23 13:49:16.693961	2018-04-23 13:49:16.693961
263	Yasmin	Runolfsson	tony@dooleyluettgen.name	(579) 517-6860	39	2018-04-19 13:49:16.69577	2018-04-23 13:49:16.696409	2018-04-23 13:49:16.696409
264	Danyka	Lebsack	rahul_eichmann@rosenbaumbrakus.biz	(419) 015-0476 x1346	73	2018-03-02 13:49:16.698051	2018-04-23 13:49:16.698669	2018-04-23 13:49:16.698669
265	Destinee	Larson	claudine@wolffsawayn.net	1-643-725-7265	64	2018-04-10 13:49:16.700283	2018-04-23 13:49:16.700887	2018-04-23 13:49:16.700887
266	Cordelia	Macejkovic	jaime_schmitt@gerhold.org	969.651.2821 x5493	58	2018-02-14 13:49:16.702634	2018-04-23 13:49:16.703433	2018-04-23 13:49:16.703433
267	Rodrigo	Murphy	ernestina@roberts.org	1-645-990-5247	51	2018-03-04 13:49:16.705459	2018-04-23 13:49:16.706219	2018-04-23 13:49:16.706219
268	Prudence	Hermann	abelardo.mohr@zulauf.biz	959-270-3920	41	2018-04-22 13:49:16.70812	2018-04-23 13:49:16.708773	2018-04-23 13:49:16.708773
269	Jany	Purdy	serena@kovacek.com	(654) 387-5364 x43345	56	2018-04-17 13:49:16.710552	2018-04-23 13:49:16.711162	2018-04-23 13:49:16.711162
270	Mafalda	Osinski	margarette@kautzer.io	725-718-2828 x825	26	2018-03-20 13:49:16.712788	2018-04-23 13:49:16.713426	2018-04-23 13:49:16.713426
271	Lamar	Kuhn	kaitlin@hettinger.net	704.438.6723 x093	22	2018-02-07 13:49:16.715184	2018-04-23 13:49:16.715767	2018-04-23 13:49:16.715767
272	Erna	Pfeffer	keara_bode@west.com	1-536-422-9929 x63789	15	2018-03-31 13:49:16.717428	2018-04-23 13:49:16.718092	2018-04-23 13:49:16.718092
273	Bert	Fisher	katrina_veum@vandervortupton.biz	(422) 827-9199 x39622	18	2018-02-25 13:49:16.720007	2018-04-23 13:49:16.720631	2018-04-23 13:49:16.720631
274	Gunnar	Rath	edward.gerhold@torp.com	1-903-538-5305 x6056	58	2018-03-24 13:49:16.722318	2018-04-23 13:49:16.722902	2018-04-23 13:49:16.722902
275	Rosamond	Ruecker	johan_orn@johnsanderson.info	173.065.3518	29	2018-03-22 13:49:16.724557	2018-04-23 13:49:16.725129	2018-04-23 13:49:16.725129
276	Mireya	Raynor	bernadette@schmittgibson.org	1-814-240-0958 x505	17	2018-03-09 13:49:16.726763	2018-04-23 13:49:16.727333	2018-04-23 13:49:16.727333
277	Davonte	Will	fermin.halvorson@kutchquitzon.biz	1-923-225-8748 x546	50	2018-03-12 13:49:16.728988	2018-04-23 13:49:16.729572	2018-04-23 13:49:16.729572
278	Makenna	Kuhn	keagan@lynch.com	899.100.7142 x59152	21	2018-03-31 13:49:16.731319	2018-04-23 13:49:16.731977	2018-04-23 13:49:16.731977
279	Leila	Smith	gunnar_pagac@swiftmurray.org	1-257-825-6068 x8940	38	2018-02-14 13:49:16.733739	2018-04-23 13:49:16.734362	2018-04-23 13:49:16.734362
280	Stephon	Schroeder	darrel@kiehn.com	531-666-0516	64	2018-01-28 13:49:16.736125	2018-04-23 13:49:16.736779	2018-04-23 13:49:16.736779
281	Americo	Gulgowski	santa@prosacco.net	(425) 407-5795	52	2018-03-16 13:49:16.738824	2018-04-23 13:49:16.739726	2018-04-23 13:49:16.739726
282	Neal	Koss	jaunita_halvorson@fay.net	955.187.7314 x04755	23	2018-02-25 13:49:16.741515	2018-04-23 13:49:16.74213	2018-04-23 13:49:16.74213
283	Jalen	Mante	titus.okon@bartonbailey.com	642-352-1755	23	2018-04-03 13:49:16.744202	2018-04-23 13:49:16.745122	2018-04-23 13:49:16.745122
284	Kaelyn	Schowalter	darrel@gerhold.co	255-845-9998 x438	58	2018-03-21 13:49:16.747411	2018-04-23 13:49:16.748362	2018-04-23 13:49:16.748362
285	Nicholas	Rohan	chesley@barrowswalker.com	677.407.4967 x60102	28	2018-04-22 13:49:16.750519	2018-04-23 13:49:16.751259	2018-04-23 13:49:16.751259
286	Annie	Ziemann	regan@kiehnnader.info	827-222-9393	51	2018-03-13 13:49:16.753126	2018-04-23 13:49:16.753904	2018-04-23 13:49:16.753904
287	Hillary	Daugherty	susana_sipes@ziemesporer.org	(711) 266-9423 x64794	71	2018-04-04 13:49:16.755695	2018-04-23 13:49:16.75662	2018-04-23 13:49:16.75662
288	Rebeka	O'Keefe	deion@lind.biz	693.902.1687	39	2018-02-10 13:49:16.75845	2018-04-23 13:49:16.759088	2018-04-23 13:49:16.759088
289	Destinee	Schneider	tiana@brownsmith.io	(345) 197-3067	48	2018-02-28 13:49:16.760865	2018-04-23 13:49:16.761479	2018-04-23 13:49:16.761479
290	Misty	Sporer	maida@hackett.io	999.338.8349	24	2018-03-19 13:49:16.763249	2018-04-23 13:49:16.763938	2018-04-23 13:49:16.763938
291	Eloy	Morar	garnet_grady@vonrueden.org	(669) 507-5440 x775	71	2018-02-25 13:49:16.765631	2018-04-23 13:49:16.766286	2018-04-23 13:49:16.766286
292	Kristin	Murazik	shemar_little@bernhardbailey.net	(919) 936-2097	66	2018-04-02 13:49:16.768285	2018-04-23 13:49:16.769018	2018-04-23 13:49:16.769018
293	Fredrick	Hahn	noel_marquardt@dickinson.org	876.462.4085	39	2018-04-11 13:49:16.770909	2018-04-23 13:49:16.771679	2018-04-23 13:49:16.771679
294	Tamara	Jast	alexandra.braun@schusterpfeffer.net	(475) 241-7745 x200	57	2018-03-12 13:49:16.774013	2018-04-23 13:49:16.774715	2018-04-23 13:49:16.774715
295	Dashawn	Schmidt	ardith@dubuque.io	(503) 146-7783	58	2018-03-01 13:49:16.776574	2018-04-23 13:49:16.777258	2018-04-23 13:49:16.777258
296	Kasey	Hessel	adalberto@konopelskiwiegand.biz	922.561.3540	36	2018-03-14 13:49:16.779006	2018-04-23 13:49:16.779725	2018-04-23 13:49:16.779725
297	Claudie	Turner	abigail@batzhalvorson.name	296.069.5640	26	2018-01-19 13:49:16.781393	2018-04-23 13:49:16.781985	2018-04-23 13:49:16.781985
298	Marjory	Bednar	vernon@hermanzemlak.name	535-922-1607 x28970	19	2018-03-01 13:49:16.783885	2018-04-23 13:49:16.784491	2018-04-23 13:49:16.784491
299	Conrad	Gutkowski	dedrick@lehnerpurdy.name	354-262-9911	47	2018-03-12 13:49:16.786223	2018-04-23 13:49:16.786857	2018-04-23 13:49:16.786857
300	Kali	Abbott	mellie@hegmannsimonis.info	982-441-1834	71	2018-02-17 13:49:16.788603	2018-04-23 13:49:16.789226	2018-04-23 13:49:16.789226
301	Angelina	Kautzer	elza@monahanparker.io	426.867.6190	20	2018-03-21 13:49:16.791002	2018-04-23 13:49:16.791609	2018-04-23 13:49:16.791609
302	Nigel	Baumbach	rick_weber@leschhaag.com	1-826-123-3288 x2097	49	2018-02-22 13:49:16.793351	2018-04-23 13:49:16.794028	2018-04-23 13:49:16.794028
303	Eldred	Harber	clemmie@cartwright.io	536.276.3733 x121	36	2018-02-07 13:49:16.79583	2018-04-23 13:49:16.796487	2018-04-23 13:49:16.796487
304	Cassidy	Lind	terrell@dachortiz.name	241.669.7039	27	2018-03-17 13:49:16.798309	2018-04-23 13:49:16.79895	2018-04-23 13:49:16.79895
305	Alfred	Davis	zander_lindgren@konopelskicartwright.net	1-602-038-8411	15	2018-03-08 13:49:16.800822	2018-04-23 13:49:16.801459	2018-04-23 13:49:16.801459
306	Edmund	Wilkinson	sonya.borer@dubuque.info	(528) 150-4729 x11274	59	2018-01-19 13:49:16.803297	2018-04-23 13:49:16.803912	2018-04-23 13:49:16.803912
307	Dayna	Predovic	reece_brown@willms.io	245.662.6119 x5569	37	2018-01-23 13:49:16.805588	2018-04-23 13:49:16.8062	2018-04-23 13:49:16.8062
308	Conner	Davis	alayna.schowalter@buckridge.name	1-473-835-4464 x91836	54	2018-04-22 13:49:16.807852	2018-04-23 13:49:16.808518	2018-04-23 13:49:16.808518
309	Rosa	Kessler	carmine@cartwright.net	(428) 035-8382	34	2018-04-01 13:49:16.8104	2018-04-23 13:49:16.811027	2018-04-23 13:49:16.811027
310	Melvin	Hansen	neal.lynch@stokes.biz	778-995-3883 x03467	17	2018-03-10 13:49:16.812897	2018-04-23 13:49:16.813533	2018-04-23 13:49:16.813533
311	Robyn	Schimmel	garland.stroman@watsica.io	1-734-720-7970 x6946	22	2018-03-05 13:49:16.815241	2018-04-23 13:49:16.81584	2018-04-23 13:49:16.81584
312	Chet	Barton	brannon.wiegand@torp.co	797-993-7156 x3908	30	2018-03-02 13:49:16.817556	2018-04-23 13:49:16.818241	2018-04-23 13:49:16.818241
313	Greta	Morar	moses.krajcik@farrellmarquardt.org	461.603.1634 x76457	51	2018-04-06 13:49:16.820073	2018-04-23 13:49:16.820705	2018-04-23 13:49:16.820705
314	Christopher	Shanahan	lenna@bartonluettgen.co	1-936-691-4951 x549	24	2018-01-17 13:49:16.822417	2018-04-23 13:49:16.823129	2018-04-23 13:49:16.823129
315	Raleigh	Reichel	kaandra_oberbrunner@klocko.co	1-724-474-3593 x873	37	2018-03-14 13:49:16.825445	2018-04-23 13:49:16.826128	2018-04-23 13:49:16.826128
316	Elnora	Abernathy	melvin.fisher@abbottlangworth.co	(570) 015-9800	55	2018-03-04 13:49:16.827824	2018-04-23 13:49:16.82844	2018-04-23 13:49:16.82844
317	Halie	Kohler	gerry_rau@haaghagenes.co	(383) 036-3435 x53229	21	2018-03-07 13:49:16.830082	2018-04-23 13:49:16.830678	2018-04-23 13:49:16.830678
318	Rory	Hackett	zechariah@weberpfannerstill.net	831-579-6881	51	2018-03-01 13:49:16.832322	2018-04-23 13:49:16.832898	2018-04-23 13:49:16.832898
319	Reed	Lebsack	faye@mcclure.info	(130) 930-5413 x862	67	2018-03-23 13:49:16.834814	2018-04-23 13:49:16.835596	2018-04-23 13:49:16.835596
320	Mariela	Bashirian	asa@reinger.io	898.868.1567	29	2018-01-28 13:49:16.837702	2018-04-23 13:49:16.838342	2018-04-23 13:49:16.838342
321	Marshall	Rodriguez	vaughn@abshireabshire.info	(354) 102-4489 x9012	41	2018-03-01 13:49:16.840057	2018-04-23 13:49:16.840644	2018-04-23 13:49:16.840644
322	Sarai	Gulgowski	darian_romaguera@price.net	103-132-6704	39	2018-02-22 13:49:16.842289	2018-04-23 13:49:16.842882	2018-04-23 13:49:16.842882
323	Destiney	Schroeder	mia_ankunding@walker.net	1-797-820-5230	22	2018-01-31 13:49:16.844526	2018-04-23 13:49:16.845122	2018-04-23 13:49:16.845122
324	Gustave	Johnson	finn@monahan.co	(668) 286-2515 x45060	69	2018-03-06 13:49:16.846769	2018-04-23 13:49:16.847373	2018-04-23 13:49:16.847373
325	Marco	Lowe	laura@dibbert.info	667.302.3516 x45415	20	2018-03-06 13:49:16.849044	2018-04-23 13:49:16.849847	2018-04-23 13:49:16.849847
326	Bradly	Becker	marcos@feilhegmann.io	1-513-837-9842	62	2018-03-25 13:49:16.851692	2018-04-23 13:49:16.852534	2018-04-23 13:49:16.852534
327	Crystal	Marks	otto.altenwerth@volkman.com	459.850.4897 x293	62	2018-03-24 13:49:16.854395	2018-04-23 13:49:16.855052	2018-04-23 13:49:16.855052
328	Horacio	Hyatt	ettie_armstrong@streich.co	1-335-346-8671 x878	15	2018-02-09 13:49:16.856886	2018-04-23 13:49:16.857518	2018-04-23 13:49:16.857518
329	Llewellyn	Ziemann	timmy.rau@hansen.name	218.846.6532 x14272	36	2018-04-16 13:49:16.859249	2018-04-23 13:49:16.859876	2018-04-23 13:49:16.859876
330	Abigail	Lockman	caleigh@haley.io	(654) 408-5221 x82148	49	2018-03-12 13:49:16.861619	2018-04-23 13:49:16.862262	2018-04-23 13:49:16.862262
331	Sadye	Lynch	chester@schimmelhaag.com	683.044.5270 x926	27	2018-02-22 13:49:16.864419	2018-04-23 13:49:16.865112	2018-04-23 13:49:16.865112
332	Sheldon	Terry	mona_mcclure@oconnell.io	(511) 624-2961	63	2018-04-03 13:49:16.86683	2018-04-23 13:49:16.867483	2018-04-23 13:49:16.867483
333	Christophe	Hyatt	emiliano.goldner@kuphal.biz	(173) 504-3803 x97980	29	2018-04-21 13:49:16.869261	2018-04-23 13:49:16.86996	2018-04-23 13:49:16.86996
334	Webster	Lakin	lia@leannon.io	(755) 804-8021 x66284	25	2018-03-23 13:49:16.872092	2018-04-23 13:49:16.872988	2018-04-23 13:49:16.872988
335	Stephon	Prosacco	fern@mueller.co	907-719-1217	39	2018-02-19 13:49:16.875068	2018-04-23 13:49:16.875988	2018-04-23 13:49:16.875988
336	Lenny	Carter	ronaldo@sauer.io	672.689.3867 x79344	49	2018-02-07 13:49:16.877842	2018-04-23 13:49:16.878478	2018-04-23 13:49:16.878478
337	Trever	Bartoletti	mallie_borer@jonesparisian.biz	(608) 234-2553 x63988	26	2018-03-06 13:49:16.880422	2018-04-23 13:49:16.881089	2018-04-23 13:49:16.881089
338	Jesus	Brekke	dewitt_mayert@romaguera.net	482.538.0010	22	2018-02-06 13:49:16.883001	2018-04-23 13:49:16.883659	2018-04-23 13:49:16.883659
339	Mathilde	Sauer	osbaldo.bednar@abbottdonnelly.org	444-850-0477	55	2018-03-05 13:49:16.885497	2018-04-23 13:49:16.886275	2018-04-23 13:49:16.886275
340	Ardith	Denesik	chester@mcculloughfeest.org	333.616.0280 x64444	24	2018-04-06 13:49:16.888125	2018-04-23 13:49:16.888802	2018-04-23 13:49:16.888802
341	Ivy	Ortiz	flo@lemke.io	1-563-962-6674 x38604	16	2018-02-11 13:49:16.890754	2018-04-23 13:49:16.891379	2018-04-23 13:49:16.891379
342	Henri	Kunze	neal@cartwright.name	980-477-1435	40	2018-04-21 13:49:16.893089	2018-04-23 13:49:16.89367	2018-04-23 13:49:16.89367
343	Katrina	Kovacek	trey@ornjohnson.net	799.129.8733 x860	55	2018-04-13 13:49:16.895337	2018-04-23 13:49:16.895913	2018-04-23 13:49:16.895913
344	Orpha	Bruen	london@hegmann.org	988.632.0702	32	2018-02-02 13:49:16.897583	2018-04-23 13:49:16.898161	2018-04-23 13:49:16.898161
345	Magnolia	Torp	america_herman@goldner.info	400-170-6235 x0119	71	2018-03-17 13:49:16.899848	2018-04-23 13:49:16.900446	2018-04-23 13:49:16.900446
346	Rossie	Lakin	derick@weber.org	1-407-822-1059 x906	68	2018-04-10 13:49:16.902133	2018-04-23 13:49:16.902783	2018-04-23 13:49:16.902783
347	Thalia	Spencer	lucile@schuppe.info	1-168-026-1310 x709	23	2018-03-02 13:49:16.904762	2018-04-23 13:49:16.905558	2018-04-23 13:49:16.905558
348	Saige	Koss	annette.goyette@leuschke.co	1-815-058-6089	22	2018-02-16 13:49:16.907376	2018-04-23 13:49:16.908	2018-04-23 13:49:16.908
349	Marlon	Huel	ruby@wyman.biz	639-128-9694 x718	42	2018-02-11 13:49:16.909711	2018-04-23 13:49:16.910296	2018-04-23 13:49:16.910296
350	Kirstin	Cremin	gabrielle.blick@boehmswaniawski.io	1-474-195-2224 x661	61	2018-03-22 13:49:16.911962	2018-04-23 13:49:16.91256	2018-04-23 13:49:16.91256
351	Anahi	Gaylord	carmen@vonrueden.name	649.729.3958 x56080	20	2018-03-21 13:49:16.914182	2018-04-23 13:49:16.914776	2018-04-23 13:49:16.914776
352	Jerrold	Towne	brandon.schaden@schaeferkihn.info	1-625-561-6696 x464	72	2018-03-02 13:49:16.916531	2018-04-23 13:49:16.917212	2018-04-23 13:49:16.917212
353	Deon	Glover	anais.goyette@huels.org	403-985-4052 x747	73	2018-03-10 13:49:16.919007	2018-04-23 13:49:16.919666	2018-04-23 13:49:16.919666
354	Magali	Kulas	jovany@labadie.io	162.705.9994 x28950	68	2018-03-10 13:49:16.92134	2018-04-23 13:49:16.921964	2018-04-23 13:49:16.921964
355	Easter	Conn	fred@hintzschoen.info	597-348-4319 x45455	24	2018-04-12 13:49:16.923596	2018-04-23 13:49:16.924216	2018-04-23 13:49:16.924216
356	Jane	Witting	kathryne@jones.io	377-026-4541 x67551	31	2018-03-30 13:49:16.925854	2018-04-23 13:49:16.926475	2018-04-23 13:49:16.926475
357	Denis	Daniel	pierre@reichel.co	1-351-290-7174 x57817	22	2018-03-31 13:49:16.928124	2018-04-23 13:49:16.928792	2018-04-23 13:49:16.928792
358	Liza	Windler	dedric_yost@dickinsontoy.org	1-198-060-6157	51	2018-02-14 13:49:16.930537	2018-04-23 13:49:16.931307	2018-04-23 13:49:16.931307
359	Mariam	Bradtke	brent@reilly.org	1-111-801-5978	67	2018-01-26 13:49:16.933152	2018-04-23 13:49:16.933802	2018-04-23 13:49:16.933802
360	Kaia	Lowe	vena_berge@blick.net	864-333-6141	64	2018-01-24 13:49:16.935702	2018-04-23 13:49:16.93636	2018-04-23 13:49:16.93636
361	Elna	Ledner	lloyd.luettgen@champlin.biz	997.783.1850 x6577	67	2018-01-18 13:49:16.938017	2018-04-23 13:49:16.93865	2018-04-23 13:49:16.93865
362	Heath	Towne	madeline_stokes@kaulkereinger.co	1-245-792-2399 x6908	45	2018-01-24 13:49:16.940327	2018-04-23 13:49:16.940923	2018-04-23 13:49:16.940923
363	Elinore	Medhurst	elroy.renner@koch.name	542.982.0946 x867	72	2018-02-23 13:49:16.942789	2018-04-23 13:49:16.94355	2018-04-23 13:49:16.94355
364	Ebba	Daugherty	marvin.king@goodwin.co	253.339.0240 x056	64	2018-03-26 13:49:16.945277	2018-04-23 13:49:16.945895	2018-04-23 13:49:16.945895
365	Cierra	Schneider	jakayla_rice@ortiz.co	(173) 787-2149 x9146	66	2018-02-14 13:49:16.94755	2018-04-23 13:49:16.948158	2018-04-23 13:49:16.948158
366	Elliott	Veum	toni@ko.info	1-919-181-5491	29	2018-03-09 13:49:16.949795	2018-04-23 13:49:16.950396	2018-04-23 13:49:16.950396
367	Alfred	Durgan	aaron_durgan@mcdermott.net	(788) 822-3805	25	2018-02-12 13:49:16.952081	2018-04-23 13:49:16.952737	2018-04-23 13:49:16.952737
368	Rosendo	Blick	fredy@zemlak.info	443-722-0402	58	2018-03-25 13:49:16.95449	2018-04-23 13:49:16.955103	2018-04-23 13:49:16.955103
369	Willie	Dibbert	laurine.hilll@kohlerstanton.info	804.072.0108 x4169	36	2018-04-06 13:49:16.957096	2018-04-23 13:49:16.957822	2018-04-23 13:49:16.957822
370	Blanca	Carroll	jennifer_larson@labadie.net	489.439.2987 x6523	66	2018-01-31 13:49:16.959597	2018-04-23 13:49:16.96022	2018-04-23 13:49:16.96022
371	Aliza	Brekke	robyn@hettingershields.org	755.540.0760 x4340	44	2018-03-10 13:49:16.961975	2018-04-23 13:49:16.96259	2018-04-23 13:49:16.96259
372	Hope	Gutmann	mervin@jerdeluettgen.biz	719-112-1282 x46744	52	2018-04-21 13:49:16.964245	2018-04-23 13:49:16.964845	2018-04-23 13:49:16.964845
373	Mohamed	Littel	ubaldo.schultz@vonruedenkemmer.com	1-675-107-3397	59	2018-03-30 13:49:16.966453	2018-04-23 13:49:16.967053	2018-04-23 13:49:16.967053
374	Tristin	Block	margarett@klockotorphy.net	(365) 807-7049 x757	25	2018-03-02 13:49:16.968774	2018-04-23 13:49:16.969477	2018-04-23 13:49:16.969477
375	Arianna	Erdman	adeline@armstrong.biz	(754) 350-9436	51	2018-02-01 13:49:16.971285	2018-04-23 13:49:16.971965	2018-04-23 13:49:16.971965
376	Angus	Schmidt	rosalinda@auer.name	(965) 980-4345 x00230	18	2018-01-29 13:49:16.973762	2018-04-23 13:49:16.974401	2018-04-23 13:49:16.974401
377	Orion	Bednar	clair@smitham.name	265.540.4874 x10177	27	2018-01-29 13:49:16.976099	2018-04-23 13:49:16.976719	2018-04-23 13:49:16.976719
378	Kaylin	Shanahan	jerome_green@mrazwest.io	1-161-437-0441 x5963	18	2018-04-15 13:49:16.978376	2018-04-23 13:49:16.978953	2018-04-23 13:49:16.978953
379	Augusta	Schamberger	kieran@wymanokuneva.com	(110) 329-7801	51	2018-02-26 13:49:16.980601	2018-04-23 13:49:16.981175	2018-04-23 13:49:16.981175
380	Chelsey	Robel	retta@purdy.info	125.873.4496 x6717	30	2018-01-14 13:49:16.982857	2018-04-23 13:49:16.983456	2018-04-23 13:49:16.983456
381	Corine	Luettgen	frankie@kulas.com	1-750-044-6043 x28305	24	2018-03-15 13:49:16.985465	2018-04-23 13:49:16.986145	2018-04-23 13:49:16.986145
382	Fay	Zemlak	katlynn@lowegoldner.name	830-652-2490 x71106	32	2018-02-24 13:49:16.987905	2018-04-23 13:49:16.988552	2018-04-23 13:49:16.988552
383	Hilda	Conn	conrad@bode.net	(291) 601-3594	73	2018-01-18 13:49:16.990333	2018-04-23 13:49:16.991009	2018-04-23 13:49:16.991009
384	Johanna	Kerluke	lucas@hilll.io	1-741-140-9343 x19319	67	2018-02-12 13:49:16.992779	2018-04-23 13:49:16.993423	2018-04-23 13:49:16.993423
385	Katheryn	Pagac	selena@waters.io	(469) 931-3558 x874	66	2018-02-18 13:49:16.995397	2018-04-23 13:49:16.996187	2018-04-23 13:49:16.996187
386	Ubaldo	Quigley	devon.welch@connelly.org	1-209-740-4037	15	2018-04-14 13:49:16.998114	2018-04-23 13:49:16.998726	2018-04-23 13:49:16.998726
387	Barry	Kohler	connor_crist@hilll.name	274.093.3136	21	2018-02-10 13:49:17.000673	2018-04-23 13:49:17.001323	2018-04-23 13:49:17.001323
388	Elda	Murazik	aracely@monahan.com	1-992-225-1037 x62956	63	2018-02-04 13:49:17.003125	2018-04-23 13:49:17.003767	2018-04-23 13:49:17.003767
389	Bertram	Boehm	pauline@haag.biz	1-365-628-2769 x4417	61	2018-03-27 13:49:17.005415	2018-04-23 13:49:17.006026	2018-04-23 13:49:17.006026
390	Carolina	Will	hudson_wilderman@kuhlman.co	1-782-481-5468 x7242	26	2018-02-13 13:49:17.007691	2018-04-23 13:49:17.008268	2018-04-23 13:49:17.008268
391	Abraham	Quitzon	mae_thiel@carter.com	729-363-0790	18	2018-03-05 13:49:17.010106	2018-04-23 13:49:17.010815	2018-04-23 13:49:17.010815
392	Shaylee	Ryan	isidro@beattystrosin.io	312.860.2363 x127	54	2018-04-01 13:49:17.012605	2018-04-23 13:49:17.013258	2018-04-23 13:49:17.013258
393	Solon	Toy	deven@moore.co	1-301-827-7636 x6672	25	2018-04-03 13:49:17.015045	2018-04-23 13:49:17.015705	2018-04-23 13:49:17.015705
394	Cayla	Kunde	kraig_klein@weinat.info	636-041-9001 x7001	38	2018-03-04 13:49:17.017452	2018-04-23 13:49:17.018147	2018-04-23 13:49:17.018147
395	Rachelle	Goldner	delia@abshire.io	1-951-618-2138 x7896	46	2018-02-27 13:49:17.019975	2018-04-23 13:49:17.020613	2018-04-23 13:49:17.020613
396	Keaton	Medhurst	oscar.wisozk@stehr.name	733.018.1075 x21392	66	2018-03-19 13:49:17.022458	2018-04-23 13:49:17.023159	2018-04-23 13:49:17.023159
397	Perry	Carter	helmer@beer.net	(644) 273-0171 x547	22	2018-03-25 13:49:17.024893	2018-04-23 13:49:17.025492	2018-04-23 13:49:17.025492
398	Yasmeen	Harvey	thaddeus.leffler@koepp.com	237.921.5768 x2273	38	2018-02-05 13:49:17.027157	2018-04-23 13:49:17.027756	2018-04-23 13:49:17.027756
399	Leta	Kertzmann	kayley_gleason@grantreichert.co	399.092.8634	15	2018-01-20 13:49:17.029408	2018-04-23 13:49:17.030007	2018-04-23 13:49:17.030007
400	Alf	Hauck	noemi@hills.net	(343) 621-5354	53	2018-02-12 13:49:17.031725	2018-04-23 13:49:17.032315	2018-04-23 13:49:17.032315
401	Kayleigh	Brown	denis_waters@hirthe.info	1-662-231-1108 x422	24	2018-01-21 13:49:17.03408	2018-04-23 13:49:17.034751	2018-04-23 13:49:17.034751
402	Jacques	Auer	roma@cruickshank.net	507.590.9175 x26701	63	2018-02-15 13:49:17.036603	2018-04-23 13:49:17.037312	2018-04-23 13:49:17.037312
403	Maia	O'Keefe	hailie@marquardt.co	1-371-931-5887 x97187	74	2018-03-13 13:49:17.039109	2018-04-23 13:49:17.039795	2018-04-23 13:49:17.039795
404	Herman	Sawayn	meredith_kerluke@pollichrenner.io	680.709.5576 x460	58	2018-02-01 13:49:17.041541	2018-04-23 13:49:17.042186	2018-04-23 13:49:17.042186
405	Axel	Baumbach	lela@witting.net	800.624.4020 x76971	66	2018-03-10 13:49:17.04392	2018-04-23 13:49:17.044544	2018-04-23 13:49:17.044544
406	Alberta	Mertz	layne.sipes@gutmann.com	772.034.3127 x995	19	2018-04-04 13:49:17.046655	2018-04-23 13:49:17.047397	2018-04-23 13:49:17.047397
407	Brice	Moen	kristian@blanda.net	619.828.6559	65	2018-01-29 13:49:17.049513	2018-04-23 13:49:17.050172	2018-04-23 13:49:17.050172
408	Rubie	Emard	markus.jast@blanda.org	760.471.8683	25	2018-02-16 13:49:17.051953	2018-04-23 13:49:17.052629	2018-04-23 13:49:17.052629
409	Coy	Pouros	dayna@kochhyatt.co	1-907-822-6240 x779	27	2018-02-17 13:49:17.054968	2018-04-23 13:49:17.05592	2018-04-23 13:49:17.05592
410	Kameron	Kunze	danyka.purdy@friesen.co	520.417.0908 x225	20	2018-01-18 13:49:17.058038	2018-04-23 13:49:17.058997	2018-04-23 13:49:17.058997
411	Reese	D'Amore	isac_ankunding@kuphal.co	850-178-7531	15	2018-03-10 13:49:17.061118	2018-04-23 13:49:17.062062	2018-04-23 13:49:17.062062
412	Yoshiko	Boyle	shanie.monahan@schinnerko.net	116.706.4709 x31939	49	2018-03-06 13:49:17.063852	2018-04-23 13:49:17.064523	2018-04-23 13:49:17.064523
413	Robin	Lang	elena@lakin.name	(596) 871-8138 x45836	59	2018-01-28 13:49:17.066378	2018-04-23 13:49:17.067034	2018-04-23 13:49:17.067034
414	Lou	Simonis	josephine.romaguera@klockogleichner.biz	167.856.6617	46	2018-01-18 13:49:17.068901	2018-04-23 13:49:17.069617	2018-04-23 13:49:17.069617
415	Layne	Rice	michale.renner@schroeder.io	(433) 741-3011	24	2018-01-25 13:49:17.071498	2018-04-23 13:49:17.072179	2018-04-23 13:49:17.072179
416	Preston	Schinner	jordane_altenwerth@rippin.net	357.295.0011 x927	51	2018-03-06 13:49:17.074075	2018-04-23 13:49:17.074833	2018-04-23 13:49:17.074833
417	Ignacio	DuBuque	fannie_runolfon@schulistanderson.com	424-662-8654 x5544	53	2018-02-14 13:49:17.076903	2018-04-23 13:49:17.077693	2018-04-23 13:49:17.077693
418	Cleveland	Rogahn	leopold@douglas.com	321-975-9013	34	2018-01-14 13:49:17.079722	2018-04-23 13:49:17.080426	2018-04-23 13:49:17.080426
419	Vidal	Wehner	vickie.wuckert@effertz.info	1-443-091-4176	62	2018-02-07 13:49:17.082223	2018-04-23 13:49:17.082869	2018-04-23 13:49:17.082869
420	Myrtle	Ruecker	bartholome@boylekuhn.co	707.574.2403	67	2018-04-04 13:49:17.084609	2018-04-23 13:49:17.085265	2018-04-23 13:49:17.085265
421	Wilhelmine	Dibbert	jimmy.moore@jerde.co	408-895-9563 x1329	38	2018-03-30 13:49:17.087041	2018-04-23 13:49:17.087674	2018-04-23 13:49:17.087674
422	Garnett	Russel	vinnie@dicki.name	1-233-455-9797 x7038	34	2018-03-20 13:49:17.089357	2018-04-23 13:49:17.089961	2018-04-23 13:49:17.089961
423	Lela	Pagac	tanya@kiehnmueller.name	(146) 634-6705 x5649	26	2018-03-02 13:49:17.091655	2018-04-23 13:49:17.092262	2018-04-23 13:49:17.092262
424	Adriel	Cruickshank	jerel_gusikowski@sporer.name	191.678.6545 x50675	54	2018-03-19 13:49:17.093932	2018-04-23 13:49:17.094522	2018-04-23 13:49:17.094522
425	Pedro	Carroll	karlee@abernathykoch.net	(168) 138-4024	54	2018-02-05 13:49:17.096172	2018-04-23 13:49:17.096763	2018-04-23 13:49:17.096763
426	Sunny	Bosco	suzanne@macgyverharber.io	(899) 413-7665 x8211	46	2018-03-17 13:49:17.098391	2018-04-23 13:49:17.099027	2018-04-23 13:49:17.099027
427	Carissa	Berge	zita@luettgenbreitenberg.net	950.580.8109 x4678	63	2018-03-30 13:49:17.100713	2018-04-23 13:49:17.101315	2018-04-23 13:49:17.101315
428	Van	Von	blanca@dicki.net	284.578.2638 x3265	30	2018-04-17 13:49:17.103064	2018-04-23 13:49:17.10377	2018-04-23 13:49:17.10377
429	Pinkie	Kovacek	edward@stammdach.name	115.449.0390 x29466	18	2018-02-10 13:49:17.105653	2018-04-23 13:49:17.106309	2018-04-23 13:49:17.106309
430	Jaida	Ziemann	marley@okon.info	690-992-2010 x9509	55	2018-01-31 13:49:17.108042	2018-04-23 13:49:17.108678	2018-04-23 13:49:17.108678
431	Edd	Mohr	deven@kertzmann.biz	548-571-0146	43	2018-01-20 13:49:17.110494	2018-04-23 13:49:17.111151	2018-04-23 13:49:17.111151
432	Phoebe	Adams	micaela_hoppe@harber.biz	1-763-616-8969 x6666	67	2018-02-02 13:49:17.112887	2018-04-23 13:49:17.113523	2018-04-23 13:49:17.113523
433	Elinore	Kozey	karl@conroyheller.name	(601) 491-3460	59	2018-02-18 13:49:17.1153	2018-04-23 13:49:17.115949	2018-04-23 13:49:17.115949
434	Sage	Gulgowski	mateo.nikolaus@keebler.com	(386) 979-9500	57	2018-01-30 13:49:17.11771	2018-04-23 13:49:17.118472	2018-04-23 13:49:17.118472
435	Yessenia	Huels	alverta@reingerhintz.com	223-848-2777	22	2018-04-20 13:49:17.120321	2018-04-23 13:49:17.120955	2018-04-23 13:49:17.120955
436	Ottilie	Davis	chance@lebsackrunolfsdottir.org	123.980.1465	63	2018-01-24 13:49:17.1227	2018-04-23 13:49:17.123305	2018-04-23 13:49:17.123305
437	Larry	Quigley	joseph@wilkinsondurgan.com	(256) 358-9880 x5568	35	2018-03-09 13:49:17.124974	2018-04-23 13:49:17.125576	2018-04-23 13:49:17.125576
438	Arnold	Weber	melvin_dooley@hegmann.com	156-056-9270 x6349	64	2018-04-09 13:49:17.127223	2018-04-23 13:49:17.12782	2018-04-23 13:49:17.12782
439	Johnpaul	Feil	reina@adams.name	952-060-7795 x313	46	2018-04-10 13:49:17.129472	2018-04-23 13:49:17.130186	2018-04-23 13:49:17.130186
440	Arianna	Schmeler	kathlyn@ratke.net	403.356.9377 x914	43	2018-02-27 13:49:17.132096	2018-04-23 13:49:17.132866	2018-04-23 13:49:17.132866
441	Lorenz	Cummerata	marquise@hartmannfadel.info	1-255-208-9570 x9440	43	2018-04-04 13:49:17.134869	2018-04-23 13:49:17.135604	2018-04-23 13:49:17.135604
442	Daphne	Davis	lizeth@gutkowski.io	246.910.8895	70	2018-02-12 13:49:17.137439	2018-04-23 13:49:17.1381	2018-04-23 13:49:17.1381
443	Jayme	Kilback	ellen.borer@bergstrom.io	352.740.0667	73	2018-02-20 13:49:17.139859	2018-04-23 13:49:17.140499	2018-04-23 13:49:17.140499
444	Rolando	Roob	santos_dach@wolff.info	905-839-1914	28	2018-04-15 13:49:17.142252	2018-04-23 13:49:17.142864	2018-04-23 13:49:17.142864
445	Litzy	Schinner	dominic@lubowitz.co	685-583-2904	48	2018-04-18 13:49:17.144567	2018-04-23 13:49:17.145185	2018-04-23 13:49:17.145185
446	Franco	Wiza	brandy@kreiger.biz	752-628-9802 x9279	41	2018-02-22 13:49:17.146864	2018-04-23 13:49:17.147477	2018-04-23 13:49:17.147477
447	Weston	Wuckert	joan.keeling@cremin.net	804.146.6942	38	2018-04-23 13:49:17.14916	2018-04-23 13:49:17.149767	2018-04-23 13:49:17.149767
448	Camylle	Wiza	hanna@kutchgraham.io	470-622-0837 x9549	57	2018-04-12 13:49:17.151516	2018-04-23 13:49:17.152205	2018-04-23 13:49:17.152205
449	Melvin	Roob	orpha@brekkeratke.info	1-998-461-2966 x6854	18	2018-03-28 13:49:17.154031	2018-04-23 13:49:17.154692	2018-04-23 13:49:17.154692
450	Darien	Carroll	allen.keebler@bernierhettinger.com	369.580.9155 x06090	30	2018-01-19 13:49:17.156512	2018-04-23 13:49:17.157191	2018-04-23 13:49:17.157191
451	Dolly	Roberts	katrine@schmidt.biz	890.355.1920 x15099	43	2018-03-09 13:49:17.159095	2018-04-23 13:49:17.159799	2018-04-23 13:49:17.159799
452	Maurice	Funk	lorenz_turcotte@konopelski.co	1-148-362-0258 x7724	28	2018-03-12 13:49:17.161875	2018-04-23 13:49:17.16256	2018-04-23 13:49:17.16256
453	Daren	Jast	jalyn@jerde.org	476-812-7653 x40871	18	2018-04-10 13:49:17.164332	2018-04-23 13:49:17.164972	2018-04-23 13:49:17.164972
454	Calista	McDermott	zoila@millsturcotte.info	1-695-083-3444	43	2018-01-18 13:49:17.166617	2018-04-23 13:49:17.167249	2018-04-23 13:49:17.167249
455	Vito	Beer	paige_hudson@bruenmurray.biz	373-547-0482 x1493	55	2018-02-08 13:49:17.17625	2018-04-23 13:49:17.176957	2018-04-23 13:49:17.176957
456	Tierra	Bartoletti	marge@ondrickaturner.biz	1-976-942-8429 x567	50	2018-03-06 13:49:17.178682	2018-04-23 13:49:17.179299	2018-04-23 13:49:17.179299
457	Halie	Murphy	ulices@collinstromp.org	614.772.6800	47	2018-04-19 13:49:17.180926	2018-04-23 13:49:17.181528	2018-04-23 13:49:17.181528
458	Joy	Halvorson	matilde_windler@mosciski.org	385.135.2236	15	2018-04-14 13:49:17.18314	2018-04-23 13:49:17.183741	2018-04-23 13:49:17.183741
459	Simone	Hilll	darrick@abernathy.biz	773.896.6996	53	2018-02-26 13:49:17.185387	2018-04-23 13:49:17.186099	2018-04-23 13:49:17.186099
460	Giles	Stiedemann	ambrose@baumbachmosciski.com	692-309-5072	48	2018-04-08 13:49:17.187878	2018-04-23 13:49:17.188638	2018-04-23 13:49:17.188638
461	Raina	Willms	jonatan@spinka.co	1-566-360-3364	63	2018-03-04 13:49:17.190581	2018-04-23 13:49:17.191242	2018-04-23 13:49:17.191242
462	Corene	Conn	libby.casper@hicklehyatt.org	1-637-547-1004 x6001	34	2018-04-15 13:49:17.192931	2018-04-23 13:49:17.193521	2018-04-23 13:49:17.193521
463	Danielle	Pacocha	savanah@reilly.org	(744) 769-3890	52	2018-04-14 13:49:17.19531	2018-04-23 13:49:17.195907	2018-04-23 13:49:17.195907
464	Daren	Koelpin	chyna_waelchi@fay.biz	212-806-0858	56	2018-03-05 13:49:17.197587	2018-04-23 13:49:17.19818	2018-04-23 13:49:17.19818
465	Elmo	Weissnat	eunice@mclaughlin.io	1-468-061-3770 x7499	72	2018-01-25 13:49:17.199857	2018-04-23 13:49:17.200533	2018-04-23 13:49:17.200533
466	Oswaldo	Lang	teresa@hyatt.net	1-239-968-6643 x230	44	2018-02-22 13:49:17.20231	2018-04-23 13:49:17.202965	2018-04-23 13:49:17.202965
467	Demond	Mayer	kelsi.wisozk@corwin.info	1-144-322-3823 x2136	46	2018-04-15 13:49:17.204654	2018-04-23 13:49:17.205267	2018-04-23 13:49:17.205267
468	Kenneth	Macejkovic	otha_pouros@gorczany.io	995.425.1702 x52508	25	2018-01-26 13:49:17.206898	2018-04-23 13:49:17.2075	2018-04-23 13:49:17.2075
469	Mohammed	Ryan	jedediah@koelpin.io	320.460.5145 x84611	66	2018-04-10 13:49:17.209138	2018-04-23 13:49:17.209711	2018-04-23 13:49:17.209711
470	Viva	Ward	gladyce.cruickshank@leuschkemcglynn.io	1-799-553-4542	37	2018-03-09 13:49:17.211403	2018-04-23 13:49:17.211977	2018-04-23 13:49:17.211977
471	Adonis	Carroll	tre@runolfon.org	(209) 703-4491	28	2018-04-22 13:49:17.213617	2018-04-23 13:49:17.21424	2018-04-23 13:49:17.21424
472	Ruth	Mayert	conor_lind@lind.co	796-651-9045	36	2018-04-14 13:49:17.215996	2018-04-23 13:49:17.216715	2018-04-23 13:49:17.216715
473	Zaria	Mayer	jasmin@rempel.biz	479-818-2448 x1034	61	2018-01-29 13:49:17.218642	2018-04-23 13:49:17.219379	2018-04-23 13:49:17.219379
474	Arthur	Wolf	maurice@champlin.info	594.835.1607 x3524	69	2018-02-24 13:49:17.221121	2018-04-23 13:49:17.221806	2018-04-23 13:49:17.221806
475	Brant	Bogisich	rodger@streich.com	1-111-133-6575 x97539	53	2018-02-02 13:49:17.22363	2018-04-23 13:49:17.224299	2018-04-23 13:49:17.224299
476	Joe	Walker	estella.turner@swifthowell.info	1-210-727-7715	71	2018-03-16 13:49:17.226141	2018-04-23 13:49:17.226823	2018-04-23 13:49:17.226823
477	Jeramie	Stroman	mozelle_johns@harvey.com	117.996.5164 x75265	32	2018-04-18 13:49:17.22864	2018-04-23 13:49:17.229271	2018-04-23 13:49:17.229271
478	Destany	Hackett	rafaela_roberts@waters.co	778-755-8395 x750	73	2018-01-30 13:49:17.230991	2018-04-23 13:49:17.231589	2018-04-23 13:49:17.231589
479	Sam	Strosin	lourdes_fisher@schinner.name	(526) 248-0472 x18761	55	2018-03-14 13:49:17.233334	2018-04-23 13:49:17.233939	2018-04-23 13:49:17.233939
480	Veronica	Orn	vicenta@becker.co	1-708-399-2070 x89321	50	2018-02-10 13:49:17.235714	2018-04-23 13:49:17.23647	2018-04-23 13:49:17.23647
481	Cary	Mayert	aglae@schadenherzog.co	191.781.2422 x00536	31	2018-03-13 13:49:17.238285	2018-04-23 13:49:17.238914	2018-04-23 13:49:17.238914
482	Lafayette	Herzog	amos@ryananderson.io	271.601.6946	43	2018-04-19 13:49:17.240546	2018-04-23 13:49:17.241161	2018-04-23 13:49:17.241161
483	Norwood	Schowalter	keaton_turner@boyle.com	(584) 237-2303	70	2018-03-25 13:49:17.242802	2018-04-23 13:49:17.243416	2018-04-23 13:49:17.243416
484	Elinore	Carter	tyler_hettinger@kautzer.org	740.812.1704	19	2018-04-12 13:49:17.245256	2018-04-23 13:49:17.245874	2018-04-23 13:49:17.245874
485	Coby	Kautzer	lonzo_lockman@quitzon.com	1-621-973-6048	25	2018-04-14 13:49:17.24753	2018-04-23 13:49:17.248103	2018-04-23 13:49:17.248103
486	Reid	Hansen	winston_goodwin@bradtkegreenholt.io	(291) 934-9419 x0449	68	2018-02-18 13:49:17.249767	2018-04-23 13:49:17.250408	2018-04-23 13:49:17.250408
487	Larissa	Spinka	marta@schmitt.co	1-943-240-8171	17	2018-04-08 13:49:17.252584	2018-04-23 13:49:17.253248	2018-04-23 13:49:17.253248
488	Verda	Feil	moses@swaniawski.io	1-155-616-5762 x876	65	2018-02-12 13:49:17.255018	2018-04-23 13:49:17.255632	2018-04-23 13:49:17.255632
489	Leola	Kling	dylan.bode@nolan.biz	1-228-161-0520	34	2018-03-11 13:49:17.257269	2018-04-23 13:49:17.257888	2018-04-23 13:49:17.257888
490	Camryn	Effertz	cathrine_hodkiewicz@buckridge.name	689-298-7878 x98687	40	2018-03-04 13:49:17.259523	2018-04-23 13:49:17.260128	2018-04-23 13:49:17.260128
491	Cassandre	DuBuque	jany.bogan@bergnaum.org	1-208-895-6932 x696	18	2018-01-27 13:49:17.261765	2018-04-23 13:49:17.262336	2018-04-23 13:49:17.262336
492	Crystel	Gerhold	estelle@krispouros.com	465.425.9066 x6944	25	2018-01-31 13:49:17.263993	2018-04-23 13:49:17.264571	2018-04-23 13:49:17.264571
493	Trycia	Haag	reece.bins@weinat.name	(947) 730-1193 x108	66	2018-02-23 13:49:17.266221	2018-04-23 13:49:17.26681	2018-04-23 13:49:17.26681
494	Viva	Simonis	tina@bosco.info	(162) 258-8259 x18248	52	2018-03-22 13:49:17.26852	2018-04-23 13:49:17.269212	2018-04-23 13:49:17.269212
495	Uriel	Smitham	maritza.keebler@smitham.net	(402) 730-4030	30	2018-04-04 13:49:17.271832	2018-04-23 13:49:17.27251	2018-04-23 13:49:17.27251
496	Lindsey	Welch	penelope_welch@creminlarkin.info	1-476-249-9924 x001	42	2018-04-04 13:49:17.274243	2018-04-23 13:49:17.274888	2018-04-23 13:49:17.274888
497	Haley	Mitchell	lisette.marks@gaylord.biz	368.703.6405	40	2018-01-19 13:49:17.276608	2018-04-23 13:49:17.277279	2018-04-23 13:49:17.277279
498	Ward	Hilll	robin.langworth@roberts.name	1-500-515-4784 x730	26	2018-02-08 13:49:17.279018	2018-04-23 13:49:17.279853	2018-04-23 13:49:17.279853
499	Dandre	Reilly	alize_doyle@schowalter.net	389-855-0988	42	2018-04-14 13:49:17.28171	2018-04-23 13:49:17.282332	2018-04-23 13:49:17.282332
500	Westley	Hermann	rocio@gorczany.org	(228) 196-4233 x338	27	2018-04-07 13:49:17.284016	2018-04-23 13:49:17.28466	2018-04-23 13:49:17.28466
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.courses_id_seq', 200, true);


--
-- Name: enrolments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.enrolments_id_seq', 1041, true);


--
-- Name: line_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.line_items_id_seq', 1010, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.orders_id_seq', 500, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_id_seq', 475, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_id_seq', 1000, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.students_id_seq', 500, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: enrolments enrolments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrolments
    ADD CONSTRAINT enrolments_pkey PRIMARY KEY (id);


--
-- Name: line_items line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT line_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: index_enrolments_on_course_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_enrolments_on_course_id ON public.enrolments USING btree (course_id);


--
-- Name: index_enrolments_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_enrolments_on_student_id ON public.enrolments USING btree (student_id);


--
-- Name: index_line_items_on_order_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_line_items_on_order_id ON public.line_items USING btree (order_id);


--
-- Name: index_line_items_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_line_items_on_product_id ON public.line_items USING btree (product_id);


--
-- Name: index_projects_on_student_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_student_id ON public.projects USING btree (student_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: line_items fk_rails_11e15d5c6b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_11e15d5c6b FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: line_items fk_rails_2dc2e5c22c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.line_items
    ADD CONSTRAINT fk_rails_2dc2e5c22c FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- Name: enrolments fk_rails_702da22bb3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrolments
    ADD CONSTRAINT fk_rails_702da22bb3 FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: projects fk_rails_cebda6ec92; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_cebda6ec92 FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: enrolments fk_rails_eec16c7a74; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.enrolments
    ADD CONSTRAINT fk_rails_eec16c7a74 FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--
