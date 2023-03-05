--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9
-- Dumped by pg_dump version 13.9

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: base_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_department_id_seq OWNER TO postgres;

--
-- Name: base_department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_department (
    id integer DEFAULT nextval('public.base_department_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.base_department OWNER TO postgres;

--
-- Name: base_operation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_operation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_operation_id_seq OWNER TO postgres;

--
-- Name: base_operation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_operation (
    id integer DEFAULT nextval('public.base_operation_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.base_operation OWNER TO postgres;

--
-- Name: base_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_order_id_seq OWNER TO postgres;

--
-- Name: base_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_order (
    id integer DEFAULT nextval('public.base_order_id_seq'::regclass) NOT NULL,
    "operationName" character varying(300),
    "departmentName" character varying(300),
    "createdAt" timestamp with time zone NOT NULL,
    description text,
    "orderId" character varying(50) NOT NULL,
    "isConfirmed" boolean NOT NULL,
    priority character varying(5),
    status character varying(200),
    department_id integer,
    operation_id integer,
    user_id integer,
    publish boolean NOT NULL
);


ALTER TABLE public.base_order OWNER TO postgres;

--
-- Name: base_order_subGroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."base_order_subGroup" (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    subgroup_id bigint NOT NULL
);


ALTER TABLE public."base_order_subGroup" OWNER TO postgres;

--
-- Name: base_order_subGroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."base_order_subGroup_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."base_order_subGroup_id_seq" OWNER TO postgres;

--
-- Name: base_order_subGroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."base_order_subGroup_id_seq" OWNED BY public."base_order_subGroup".id;


--
-- Name: base_repairoperator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_repairoperator (
    id integer NOT NULL,
    operator_id integer NOT NULL
);


ALTER TABLE public.base_repairoperator OWNER TO postgres;

--
-- Name: base_repairoperator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_repairoperator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_repairoperator_id_seq OWNER TO postgres;

--
-- Name: base_repairoperator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_repairoperator_id_seq OWNED BY public.base_repairoperator.id;


--
-- Name: base_subgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_subgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_subgroup_id_seq OWNER TO postgres;

--
-- Name: base_subgroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_subgroup (
    id integer DEFAULT nextval('public.base_subgroup_id_seq'::regclass) NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.base_subgroup OWNER TO postgres;

--
-- Name: base_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_task_id_seq OWNER TO postgres;

--
-- Name: base_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_task (
    id integer DEFAULT nextval('public.base_task_id_seq'::regclass) NOT NULL,
    description text NOT NULL,
    description2 text NOT NULL,
    date date,
    start_time time without time zone,
    end_time time without time zone,
    hours character varying(20),
    order_id integer NOT NULL,
    user_id integer,
    publish boolean,
    operator_id integer,
    status character varying(2)
);


ALTER TABLE public.base_task OWNER TO postgres;

--
-- Name: base_task_operators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base_task_operators (
    id bigint NOT NULL,
    task_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.base_task_operators OWNER TO postgres;

--
-- Name: base_task_operators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_task_operators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_task_operators_id_seq OWNER TO postgres;

--
-- Name: base_task_operators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_task_operators_id_seq OWNED BY public.base_task_operators.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: review_machine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_machine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_machine_id_seq OWNER TO postgres;

--
-- Name: review_machine; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_machine (
    id integer DEFAULT nextval('public.review_machine_id_seq'::regclass) NOT NULL,
    name character varying(300) NOT NULL,
    description text,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.review_machine OWNER TO postgres;

--
-- Name: review_part_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_part_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_part_id_seq OWNER TO postgres;

--
-- Name: review_part; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_part (
    id integer DEFAULT nextval('public.review_part_id_seq'::regclass) NOT NULL,
    name character varying(300) NOT NULL,
    description text,
    "isActive" boolean NOT NULL,
    "createdAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.review_part OWNER TO postgres;

--
-- Name: review_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_review_id_seq OWNER TO postgres;

--
-- Name: review_review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_review (
    id integer DEFAULT nextval('public.review_review_id_seq'::regclass) NOT NULL,
    "partName" character varying(300) NOT NULL,
    "machineName" character varying(300) NOT NULL,
    "reviewPeriod" character varying(200) NOT NULL,
    "reviewCount" integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    machine_id integer,
    part_id integer,
    user_id integer
);


ALTER TABLE public.review_review OWNER TO postgres;

--
-- Name: review_reviewtask_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_reviewtask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.review_reviewtask_id_seq OWNER TO postgres;

--
-- Name: review_reviewtask; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_reviewtask (
    id integer DEFAULT nextval('public.review_reviewtask_id_seq'::regclass) NOT NULL,
    description text,
    done boolean NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    review_id integer NOT NULL
);


ALTER TABLE public.review_reviewtask OWNER TO postgres;

--
-- Name: users_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_profile_id_seq OWNER TO postgres;

--
-- Name: users_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_profile (
    id integer DEFAULT nextval('public.users_profile_id_seq'::regclass) NOT NULL,
    "mobileNumber" character varying(11),
    department_id integer,
    user_id integer NOT NULL
);


ALTER TABLE public.users_profile OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: base_order_subGroup id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."base_order_subGroup" ALTER COLUMN id SET DEFAULT nextval('public."base_order_subGroup_id_seq"'::regclass);


--
-- Name: base_repairoperator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_repairoperator ALTER COLUMN id SET DEFAULT nextval('public.base_repairoperator_id_seq'::regclass);


--
-- Name: base_task_operators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_task_operators ALTER COLUMN id SET DEFAULT nextval('public.base_task_operators_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
1	کاربر عادی
3	کاربر فنی
4	اپراتور فنی
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
37	1	28
38	1	25
39	1	44
65	3	65
66	3	28
67	3	25
68	3	44
69	3	41
70	3	42
71	4	65
72	4	28
73	4	26
74	4	70
75	4	44
76	4	42
77	4	16
78	4	14
79	4	32
80	4	30
81	4	36
82	4	34
83	4	40
84	4	38
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add order	7	add_order
26	Can change order	7	change_order
27	Can delete order	7	delete_order
28	Can view order	7	view_order
29	Can add department	8	add_department
30	Can change department	8	change_department
31	Can delete department	8	delete_department
32	Can view department	8	view_department
33	Can add operation	9	add_operation
34	Can change operation	9	change_operation
35	Can delete operation	9	delete_operation
36	Can view operation	9	view_operation
37	Can add subgroup	10	add_subgroup
38	Can change subgroup	10	change_subgroup
39	Can delete subgroup	10	delete_subgroup
40	Can view subgroup	10	view_subgroup
41	Can add task	11	add_task
42	Can change task	11	change_task
43	Can delete task	11	delete_task
44	Can view task	11	view_task
45	Can add profile	12	add_profile
46	Can change profile	12	change_profile
47	Can delete profile	12	delete_profile
48	Can view profile	12	view_profile
49	Can add review	13	add_review
50	Can change review	13	change_review
51	Can delete review	13	delete_review
52	Can view review	13	view_review
53	Can add part	14	add_part
54	Can change part	14	change_part
55	Can delete part	14	delete_part
56	Can view part	14	view_part
57	Can add review task	15	add_reviewtask
58	Can change review task	15	change_reviewtask
59	Can delete review task	15	delete_reviewtask
60	Can view review task	15	view_reviewtask
61	Can add machine	16	add_machine
62	Can change machine	16	change_machine
63	Can delete machine	16	delete_machine
64	Can view machine	16	view_machine
65	Can view order all	13	view_order_all
66	Can add repair operator	17	add_repairoperator
67	Can change repair operator	17	change_repairoperator
68	Can delete repair operator	17	delete_repairoperator
69	Can view repair operator	17	view_repairoperator
70	Can view task all	13	view_task_all
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
4	pbkdf2_sha256$260000$zIpvcskTLG7xNcsNe7TC1y$uPHSvV9SPGFdzF4hngRJypJqdt407OqLAA7yCKfn4K4=	2023-01-18 10:16:13+03:30	f	11	مهدی	فرجی		f	t	2022-08-23 09:29:25+04:30
17	pbkdf2_sha256$260000$q2w0eG8SSqnjT3BiObCxbE$xh0Me1gZVmnrhqjkBh5IklkYDAAONTGxh6DiVXHANkI=	2023-01-18 08:35:24+03:30	f	22	حمید	محمدی		f	t	2022-12-05 10:35:41+03:30
8	pbkdf2_sha256$260000$zI7yBDO0YBCFf8UrUB9Gmb$gnBa2LIZSFWkecX1JMsBqddAD+cEN/ZOHZbOBBIhpVg=	2023-01-18 07:37:49.318787+03:30	f	13	رضا 	پایداری		f	t	2022-08-26 15:48:58.393262+04:30
1	pbkdf2_sha256$260000$46MvdlVsFCoAPKKFZRhxWg$+0jA3mquv6BicP09bl8TVTXjZMI2mryeL/leu5IXQLI=	2023-01-19 12:54:50.501677+03:30	t	kazemi	مصطفی	کاظمی		t	t	2022-08-22 15:27:01.543464+04:30
26	pbkdf2_sha256$260000$4eU99aVKze7wwAKZohEC0n$oVytYSlAyB7JsmtJriRSt8d3KeQJVvjfl2aK6K5zJOc=	2023-01-19 14:05:50.487876+03:30	f	24	میلاد	عباسی		f	t	2023-01-19 11:36:15.590966+03:30
16	pbkdf2_sha256$260000$WKMMDM4CI9iF1V1WzCrtYR$94dbiIfAMgZTXXY3XiUrSaQcUF9zI/r4d3z/WJr4520=	2023-01-21 15:39:24.251436+03:30	f	21	محمد 	پاکیزه جمع		f	t	2022-12-05 10:29:06.630407+03:30
3	pbkdf2_sha256$150000$hOq7LgkZFukl$crfvRWAlRY3TPeareuMFoM5f7kakpftAKBVDg/xtdo8=	2022-11-16 11:51:48.077062+03:30	f	12	خانم	عربلو		f	t	2022-08-23 09:08:56.98778+04:30
9	pbkdf2_sha256$150000$VaSopXBSiUbF$01ii9fjqPKLiy6CdMQjtg6lrgjSPZOw0pCl0RkqcpDI=	\N	f	14	محمد 	نظری		f	t	2022-08-26 15:49:30.50179+04:30
15	pbkdf2_sha256$150000$CPOCsUljh0JR$LDJClKJtQOAPsLbrd7ad9jBk2bq6Izy6OaA712pKQZQ=	\N	f	20	مرتضی	اسدی		f	t	2022-10-08 15:24:27.887792+03:30
12	pbkdf2_sha256$150000$hOq7LgkZFukl$crfvRWAlRY3TPeareuMFoM5f7kakpftAKBVDg/xtdo8=	2022-10-10 08:26:32.79522+03:30	f	18	علی	حسینی		f	t	2022-08-27 09:01:30.257805+04:30
18	pbkdf2_sha256$150000$P6ygOGTQPr9N$dcBAym1KSEcTxqNdYPQFNeYfJkp/rt4hMr11dmfzb+Q=	2022-12-21 09:20:58.932153+03:30	f	23	رضا	میرزایی		f	t	2022-12-21 09:19:45.808381+03:30
10	pbkdf2_sha256$260000$Tbt95nu0cM90zD4gGY5Bln$Jqz72bv0YwlRcWZCHz8O0uLnD0rc78m7pyjVsRP9e4g=	2023-01-14 09:10:43.244516+03:30	f	15	آقای 	جعفری		f	f	2022-08-26 15:51:49.168357+04:30
14	pbkdf2_sha256$260000$7yz4rssWWMFXxonyXofod3$+UNG6XJFbXqNK0Px9WqiTZueOcyBQnUztX8h+/lknWY=	2023-01-18 08:31:18.748485+03:30	f	19	آقای	نظیفی		f	t	2022-10-08 15:23:45.316383+03:30
2	pbkdf2_sha256$260000$m7H51kK1OsnXTiIisU1iV6$gZd5DIw7a3dksdtOS0PiS7klfW+qfox23ZkLXVrCoGs=	2023-01-23 07:31:36.384318+03:30	f	16	حمزه	کاوه		f	t	2022-08-23 08:24:45.693978+04:30
7	pbkdf2_sha256$260000$pcZJSeCH2KiDc4QGo1K1LG$Kriw6SHQ7xOiZa6MBty3raggdqmugfAnCMexQPOQUBE=	2023-01-23 07:53:29.756885+03:30	f	10	حسین 	هدایتی		f	t	2022-08-26 15:45:02.704354+04:30
11	pbkdf2_sha256$260000$FWXNnlh28rvjzVcYqkBlzB$ygnuesL0bx9k46+YAEkWrilPfaU9yNz51+qZuSRNFKs=	2023-01-14 14:28:08.063639+03:30	f	17	علی	اکبری		f	t	2022-08-27 08:59:33.809454+04:30
25	pbkdf2_sha256$260000$Hmi0KYPuRNMHqxyW8vLTka$H9zKgtF2dgKKoDxE/VZzlmPt1qUIlW1H5ItBCMAYI1s=	\N	f	abolhadi	محمد تقی	ابوالهادی		f	t	2023-01-18 10:29:55.598557+03:30
27	pbkdf2_sha256$260000$JSeWGJsUT0qXnlT45LDbKw$G9Wp/X64U6gQWDhGi40FpDxSFD2ASY4s6EG3FNzCJo8=	\N	f	25	علی	قدم دزفولی		f	t	2023-01-21 15:52:24.208134+03:30
20	pbkdf2_sha256$260000$3lF3dmSPYGqIb417zgjhWN$Y8pxmcBxn83Dwpy0tB6F9YbEAmzI/62tQSHt7F16Ma0=	\N	f	mmohamadi	سید محمد	محمدی		f	t	2023-01-18 10:11:22.921751+03:30
21	pbkdf2_sha256$260000$qoV6cmsMXnproBqCXuRwHR$YLuX+DEEZQ+3JFpTveMXCAH5YlNSvu+yx6aPQDtWQh8=	\N	f	ebrahimi	علیرضا	ابراهیمی		f	t	2023-01-18 10:14:14.949809+03:30
22	pbkdf2_sha256$260000$0MNOMQEFlhif8KcKbkrWTL$oUFub3q6fhdvv8WqiEMguz2+pqLbLEwCGpZfKH+EXpI=	\N	f	habasi	حمید رضا 	عباسی		f	t	2023-01-18 10:23:28.817385+03:30
23	pbkdf2_sha256$260000$AQJMGdqlpM7djxKYb3ZDbX$32N+AIIOF1/uLoLyQhf/5AHo/XQzyPrPqahAnS7axvM=	\N	f	soleymani	محمد جواد	سلیمانی		f	t	2023-01-18 10:28:32.270428+03:30
24	pbkdf2_sha256$260000$zbYITpM5HIJWIubPWKhakc$TfB6OdJIUHFOgmF9NSRMFPxgITngwd7prmdQaKXeIT0=	\N	f	mmoradi	مهدی	مرادی پور		f	t	2023-01-18 10:28:53.579808+03:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
4	7	1
9	9	1
16	3	1
27	4	3
29	12	1
34	15	1
35	2	1
36	11	1
37	10	1
38	16	1
39	14	1
42	17	3
43	8	1
44	18	1
48	20	4
49	21	4
51	22	4
52	23	4
53	24	4
55	4	4
56	17	4
57	25	4
59	26	1
60	27	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: base_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_department (id, name) FROM stdin;
10	دفتر مرکزی
1	انبار
4	سمپل
12	تولید
11	 صفحه کابینت
8	کنترل کیفیت
2	تولید هایگلاس
3	فنی
6	اداری
9	برنامه ریزی
7	کارخانه
5	انتظامات
13	تولید پرس طبقاتی
14	فروش
15	فناوری اطلاعات 
\.


--
-- Data for Name: base_operation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_operation (id, name) FROM stdin;
1	دستگاه تانک چسب HESSAN
2	دستگاه هایگلاس HESSAN
3	دستگاه پشت کار
4	دستگاه تانک چسب پشت کار
5	قیچی بالابر(لیفت) پشت کار
6	قیچی بالابر(لیفت) HESSAN
7	پرس گرم 3 طبقه
8	تسمه کش بادی 1
9	لیفتراک 7 تن دیزل
10	لیفتراک 3 تن دیزل
11	لیفتراک 3/5 تن دیزل
12	لیفتراک 3/5 تن گازی
14	دستگاه پست فرم 590
15	پرس پنوماتیک 1
16	پرس پنوماتیک 2
17	چسب زن پرس دوبل 1
18	چسب زن پرس دوبل 2
19	برش کلگی
20	خلال کن
21	برش طولی
22	تنونر
23	رول پرس
24	پرس گرم سالن صفحه
25	کولر سالن صفحه
26	اره دیوالت
27	اورفرز 1
28	اور فرز 2
29	میخ استوپ 1
30	میخ استوپ 2
31	برش HPL
32	سوله سالن صفحه
33	تسمه کش بادی 2
34	دستگاه هایگلاس نایس
35	کولر آبی سالن هایگلاس
36	تابلو برق سالن هایگلاس
37	تابلو برق سالن صفحه
38	گرماتاب سالن هایگلاس
39	گرماتاب سالن صفحه
40	سوله هایگلاس
41	سوله انبار
42	سلفون کش 1
43	سلفون کش2
44	محوطه کارخانه
45	ژنراطور
46	اتاق نگهبانی
47	اتاق کنترل کیفی
48	اتاق برنامه ریزی
49	اتاق تولید
50	اتاق اداری
51	اتاق لجستیک
52	اتاق کنفرانس
53	اتاق مدیریت
54	اتاق منشی
55	سوئیت
56	سالن غذا خوری
57	آشپزخانه بالا
58	سرویس بهداستی صفحه
59	سرویس بهداشتی محوطه
60	سرویس بهداشتی بانوان
61	مکنده مرکزی سالن صفحه
62	مکنده مرکزی هایگلاس
63	مکنده 4 قلو پشت کار
64	دستگاه نوار لبه
65	دستگاه اره دور کن
66	دستگاه فرچه هایگلاس
67	پیجر
68	کمپرسور مرکزی
69	آب سرد کن سالن صفحه
70	آب سرد کن سالن هایگلاس
71	ساخت
72	دفتر مرکزی
73	رختکن پرسنل
74	اتاق سمپل
75	دستگاه کاغذ خورد کن
76	لیفتراک 5 تن
77	دستگاه جت پرینتر متسا 2128
78	دستگاه جت پرینتر آرن جت
79	دستگاه جت پرینتر سپند افزار
80	پرس طبقاتی
81	لیفتراک 5 تن هایستر
82	سلفون کش طبقاتی
83	کولین تاور
84	لیفت بالابر طبقاتی
85	بویلر بخار
86	کمپرسور 22 کیلو وات
87	دستگاه تسویه RO
88	مخزن فلزی برگشت آب گرم
89	اتاق تولید پرس
90	ژنراطور دفتر مرکزی
91	گرماتاب سالن پرس
92	تسمه کش بادی شماره 3
93	سوله پرس طبقاتی
94	کابل کشی
95	ترمز پودری
96	لیفتراک 10 تن tcm
97	بخاری
98	نور ، روشنایی و لامپ
99	صندلی ، میز و تجهیزات اداری
100	باطری UPS
\.


--
-- Data for Name: base_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_order (id, "operationName", "departmentName", "createdAt", description, "orderId", "isConfirmed", priority, status, department_id, operation_id, user_id, publish) FROM stdin;
216	سوله پرس طبقاتی	فنی	2022-12-15 08:41:49.041609+03:30	تهیه محافظ دینام درب ریموتی سالن تولید و تهیه ریموت یدک	401000206	t	2	ارسال به واحد فنی\t	3	93	17	f
291	دفتر مرکزی	فنی	2023-01-02 08:02:50.780847+03:30	بخاری مدیرعامل و خانم فهیمی	401000265	f	3	\N	3	72	14	t
309	میخ استوپ 1	فنی	2023-01-04 11:22:31.581185+03:30	خرابی میخ استپ	401000283	t	3	ارسال به واحد فنی	3	29	10	t
318	دستگاه تانک چسب HESSAN	فنی	2023-01-05 09:44:01.737774+03:30	تست	401000292	t	2	ارسال به واحد فنی	3	1	1	t
300	سوله پرس طبقاتی	فنی	2023-01-02 17:44:15.92625+03:30	تعویض لامپ های سوخته انتهای سالن زیر سازه	401000274	t	3	ارسال به واحد فنی	3	93	16	t
222	دستگاه هایگلاس HESSAN	فنی	2022-12-17 09:54:15.862002+03:30	نیامدن چسب یکی از نازل روکار،\nدررولهای متراژ بالا تک نازل جوابگو نیست	401000212	t	3	ارسال به واحد فنی	3	2	10	f
292	لیفتراک 3 تن دیزل	فنی	2023-01-02 08:04:43.885458+03:30	خرابی شیلنگ واسط ترمز	401000266	f	2	\N	3	10	4	t
310	سوله پرس طبقاتی	فنی	2023-01-04 11:31:06.876847+03:30	کاهش فشار گاز و خاموش شدن گرماتاب و بخاری ها در زمان روشن بودن بویلر	401000284	t	3	ارسال به واحد فنی	3	93	16	t
301	دستگاه هایگلاس HESSAN	فنی	2023-01-03 06:58:19.391547+03:30	تعویض سیلیکون دستگاه روکار\r\nخط خطی شدن سطح سیلیکون وداشتن 2عددموج لبه سیلیکون	401000275	t	3	ارسال به واحد فنی	3	2	10	t
319	برش طولی	فنی	2023-01-05 11:31:57.361592+03:30	خرابی برش طولی	401000293	t	3	ارسال به واحد فنی	3	21	10	t
178	سوله پرس طبقاتی	فنی	2022-12-06 09:17:27.429871+03:30	تعویض فیلتر های دستگاه تصفیه آب(RO)	401000168	t	2	ارسال به واحد فنی	3	93	16	f
302	دستگاه هایگلاس HESSAN	فنی	2023-01-03 07:00:49.163039+03:30	تنظیم کردن گونیاهای خط روکار جابجا شدن ام دی اف درخط تولید	401000276	t	3	ارسال به واحد فنی	3	2	10	t
293	سوله پرس طبقاتی	فنی	2023-01-02 10:11:05.547618+03:30	نصب باد برای سلفون کش	401000267	f	2	\N	3	93	16	t
311	دفتر مرکزی	فنی	2023-01-04 11:55:07.923282+03:30	قطع اب سرد	401000285	t	2	ارسال به واحد فنی	3	72	14	t
105	دستگاه پشت کار	فنی	2022-11-07 14:06:25.102137+03:30	برعکس کردن جهت چرخش فرچه مشکی ابتدای خط پشتکار،	401000096	t	2	ارسال به واحد فنی	3	3	7	f
294	سوله پرس طبقاتی	فنی	2023-01-02 10:11:50.718762+03:30	نصب باد برای سلفون کش	401000268	f	2	\N	3	93	16	t
303	سوله پرس طبقاتی	فنی	2023-01-03 09:45:35.577917+03:30	خرابی ولوم سرعت درایو سلفون کش	401000277	t	2	ارسال به واحد فنی	3	93	16	t
321	سوله پرس طبقاتی	فنی	2023-01-07 09:04:47.052475+03:30	عایق کاری لوله برگشت بخار مجاور لوله روغن هیدرولیک جک ها داخل چاله پرس	401000295	t	2	ارسال به واحد فنی	3	93	16	t
138	تنونر	فنی	2022-11-24 10:19:05.018446+03:30	خرابی اهرم تنضیم کننده توپی تنونی سمت سالن	401000128	t	3	ارسال به واحد فنی	3	22	8	f
295	میخ استوپ 1	فنی	2023-01-02 11:03:28.884643+03:30		401000269	f	3	\N	3	29	10	t
304	سوله پرس طبقاتی	فنی	2023-01-03 09:46:17.733619+03:30	نصب روشنایی جهت سرویس پله داخل سالن	401000278	t	2	ارسال به واحد فنی	3	93	16	t
313	دفتر مرکزی	فنی	2023-01-04 13:07:50.795857+03:30	نصب جامایع دستشویی سرویس بانوان	401000287	t	1	ارسال به واحد فنی	3	72	14	t
322	سوله پرس طبقاتی	فنی	2023-01-07 09:16:44.071279+03:30	ساخت و نصب راهنما جهت میز ورودی ابتدای خط	401000296	f	2	درانتظار تایید مدیریت	3	93	16	t
247	دستگاه تانک چسب HESSAN	فنی	2022-12-22 08:15:58.239889+03:30	نیامدن چسب یکی از نازل روکار،\r\nقسمت فیلتربازدید شود	401000237	t	3	ارسال به واحد فنی	3	1	10	f
305	دستگاه نوار لبه	فنی	2023-01-03 11:05:24.920829+03:30	سرویس کلی دستگاه و خرابی جک اره	401000279	t	3	ارسال به واحد فنی	3	64	4	t
314	سوله پرس طبقاتی	فنی	2023-01-04 13:10:38.72158+03:30	ساخت و نصب راهنما برای میز ورودی جهت شارژ تخته خام	401000288	f	2	درانتظار تایید مدیریت	3	93	16	t
296	میخ استوپ 1	فنی	2023-01-02 11:04:16.074344+03:30	خرابی میخ استپ	401000270	f	3	\N	3	29	10	f
287	لیفتراک 3 تن دیزل	فنی	2023-01-02 07:54:44.174691+03:30	خرابی شیلنگ رابط ترمز لیفتراک 3 تن	401000261	f	3	\N	3	10	4	t
297	دستگاه تانک چسب HESSAN	فنی	2023-01-02 15:29:22.290331+03:30	test	401000271	f	1	\N	3	1	1	t
115	لیفتراک 3 تن دیزل	فنی	2022-11-13 12:54:13.084057+03:30	رنگ آمیزی \nسیم کشی برق \nنصیب آیینه\nتحویل به شخص	401000105	t	3	ارسال به واحد فنی	3	10	1	t
315	دستگاه پست فرم 590	فنی	2023-01-04 14:53:58.729891+03:30	روشن نشدن لامپ  کنار پرس گرم	401000289	t	2	ارسال به واحد فنی	3	14	10	t
236	دفتر مرکزی	فنی	2022-12-19 10:18:52.000537+03:30	تعمیر دستگاه هیتر(مکررخاموش میگردد)	401000226	t	3	ارسال به واحد فنی	3	72	14	t
242	دفتر مرکزی	فنی	2022-12-21 09:22:46.069449+03:30	شکستگی علمک شیر اب اشپزخانه دفتر مرکزی	401000232	t	3	ارسال به واحد فنی	3	72	18	f
20	سرویس بهداشتی بانوان	واحد فنی	2022-09-01 11:24:50.856883+04:30	خرابی هواکش سرویس بهداشتی بانوان	401000011	t	2	ارسال به واحد فنی	3	60	3	f
18	سرویس بهداشتی بانوان	واحد فنی	2022-09-01 11:21:56.901202+04:30	خرابی هواکش سرویس بهداشتی بانوان	40100009	t	2	ارسال به واحد فنی	3	60	3	f
288	لیفتراک 3 تن دیزل	فنی	2023-01-02 07:54:59.226543+03:30	خرابی شیلنگ رابط ترمز لیفتراک 3 تن	401000262	f	3	\N	3	10	4	t
320	دفتر مرکزی	فنی	2023-01-05 14:19:55.988049+03:30	خرابی   شلنگ سرویس بانوان	401000294	t	3	DN	3	72	14	t
286	سوله پرس طبقاتی	فنی	2023-01-01 11:56:27.747997+03:30	رفع نشتی گیربکس آسانسور	401000260	t	2	DN	3	93	16	t
312	سوله پرس طبقاتی	فنی	2023-01-04 12:46:23.297055+03:30	ساخت میز جهت بسته بندی پالت	401000286	t	2	DN	3	93	16	t
298	دستگاه تانک چسب HESSAN	فنی	2023-01-02 15:39:33.387514+03:30	test	401000272	t	1	ارسال به واحد فنی	3	1	1	t
90	دستگاه جت پرینتر سمپل	فنی	2022-10-30 13:12:30.733722+03:30		401000081	t	3	ارسال به واحد فنی	3	\N	1	t
278	سوله پرس طبقاتی	فنی	2022-12-29 10:05:51.600641+03:30	ساخت دو میز هدایت کننده ورق  به سلفون کش	401000252	t	2	ارسال به واحد فنی	3	93	4	t
109	برش طولی	فنی	2022-11-09 12:04:24.425962+03:30	تعویض تیغه برش طولی	401000100	t	3	ارسال به واحد فنی	3	21	8	t
23	رول پرس	واحد فنی	2022-09-03 13:27:47.833876+04:30	خرابی لوله تخلیه اب سینی چسب زن رول پرس	401000014	t	3	ارسال به واحد فنی	3	23	8	t
17	لیفتراک 3 تن دیزل	واحد فنی	2022-09-01 08:01:34.105769+04:30	نشتی روغن از لیفتراک سالن صفحه	40100008	t	2	ارسال به واحد فنی	3	10	8	t
25	تنونر	واحد فنی	2022-09-05 10:46:28.34076+04:30	تعویض تیغه توپی ۴۸میل تتونر	401000016	t	3	ارسال به واحد فنی\t\n	3	22	8	t
29	دستگاه پست فرم 590	واحد فنی	2022-09-08 09:56:00.431382+04:30	قطع شدن یکی از المنت های بالای پست فوم	401000020	t	3	ارسال به واحد فنی\t\n	3	14	8	t
30	مکنده مرکزی سالن صفحه	واحد فنی	2022-09-08 11:25:26.725379+04:30	اتصالی کردن تابلو برق مکنده سالن	401000021	t	3	ارسال به واحد فنی\t\n	3	61	8	t
244	رول پرس	فنی	2022-12-21 09:38:52.94879+03:30	جوشکاری خرک ابتدای سنباده زنی	401000234	t	2	ارسال به واحد فنی	3	23	10	t
243	دفتر مرکزی	فنی	2022-12-21 09:35:38.089699+03:30	بررسی نشتی گاز اشپزخانه دفتر مرکزی	401000233	t	3	ارسال به واحد فنی	3	72	18	t
240	تنونر	فنی	2022-12-21 08:03:21.901241+03:30	خرابی چند عدد از رولیک های هرک زمینی تنونر	401000230	t	2	ارسال به واحد فنی	3	22	10	t
168	سلفون کش 1	فنی	2022-12-05 13:24:35.687052+03:30	قفل کردن توپی ترمز دستگاه سلفون کش،	401000158	t	2	ارسال به واحد فنی	3	42	10	t
45	رول پرس	فنی	2022-09-21 10:49:39.153674+04:30	خاموش شدن ناگهانی دستگاه رول پرس	401000036	t	3	ارسال به واحد فنی	3	23	8	t
46	مکنده مرکزی سالن صفحه	فنی	2022-09-22 11:11:55.815627+03:30	خرابی لرزون مکنده تنونر	401000037	t	2	ارسال به واحد فنی	3	61	8	t
47	تنونر	فنی	2022-09-22 11:12:36.026369+03:30	خرابی چشمی باد تنونر	401000038	t	2	ارسال به واحد فنی	3	22	8	t
39	اتاق منشی	واحد فنی	2022-09-12 08:05:11.05203+04:30	خرابی تلفن منشی	401000030	t	3	ارسال به واحد فنی\t\n	3	54	1	t
42	اره دیوالت	فنی	2022-09-20 11:51:33.696884+04:30	تعویض تیغه برش دیولت	401000033	t	1	ارسال به واحد فنی	3	26	8	t
81	برش طولی	فنی	2022-10-26 13:51:44.54058+03:30	تعویض تیغه برش طولی	401000072	t	3	ارسال به واحد فنی	3	21	8	t
86	دستگاه کاغذ خورد کن	فنی	2022-10-30 08:20:44.046064+03:30	فقط دور برعکس کار میکند \nاحتمال دارد که کاغذ گیر کرده باشد\nچک شود در صورت عدم توانایی سرویس در کارخانه به بیرون فرستاده شود.	401000077	t	2	ارسال به واحد فنی	3	75	1	t
123	پرس گرم 3 طبقه	فنی	2022-11-15 12:19:19.819024+03:30	نشتی روغن یکی از شلنگهای زیر دستگاه	401000113	t	2	ارسال به واحد فنی	3	7	7	t
141	پیجر	فنی	2022-11-26 12:38:59.895308+03:30	دستگاه فعال نمیباشد	401000131	t	3	ارسال به واحد فنی	3	67	1	t
15	دفتر مرکزی	واحد فنی	2022-08-31 16:16:50.560193+04:30	اتمام برق کاری نگهبانی دفتر مرکزی	40100006	t	2	ارسال به واحد فنی	3	72	1	t
16	اتاق نگهبانی	واحد فنی\t	2022-09-01 07:43:31.262061+04:30	تعویض شلنگ گاز داخل نگهبانی	40100007	t	2	ارسال به واحد فنی	3	46	11	t
285	دفتر مرکزی	فنی	2023-01-01 10:44:38.40978+03:30	اتصالی سیم چایی ساز اشپزخانه طبقه بالا	401000259	t	1	ارسال به واحد فنی	3	72	14	t
316	برش طولی	فنی	2023-01-05 08:16:47.213603+03:30	تعویض تیغه برش طولی	401000290	t	2	ارسال به واحد فنی	3	21	10	t
306	تنونر	فنی	2023-01-04 09:20:55.159161+03:30	تعویض تیغه برش تنونر	401000280	t	3	ارسال به واحد فنی	3	22	10	t
22	دستگاه پست فرم 590	واحد فنی	2022-09-03 08:50:22.167025+04:30	خاموش شدن ناگهانی دستگاه پست فوم موقع کار	401000013	t	3	ارسال به واحد فنی	3	14	8	t
26	اور فرز 2	واحد فنی	2022-09-06 12:28:40.384676+04:30	خرابی بلبرینگ اور فرز	401000017	t	2	ارسال به واحد فنی\t\n	3	28	8	t
28	قیچی بالابر(لیفت) HESSAN	واحد فنی	2022-09-07 14:54:18.05426+04:30	بریدگی شفت قیچی لیف روکار	401000019	t	3	ارسال به واحد فنی\t	3	6	7	t
27	خلال کن	واحد فنی	2022-09-07 12:11:00.894481+04:30	روشن نشدن غلطک دستگاه	401000018	t	3	ارسال به واحد فنی\t	3	20	8	t
32	مکنده مرکزی هایگلاس	واحد فنی	2022-09-09 11:27:18.547537+04:30	چک کردن لوله خورطومی بک فیلتر	401000023	t	2	ارسال به واحد فنی\t\n	3	62	7	t
37	سوله سالن صفحه	واحد فنی	2022-09-11 14:05:55.165844+04:30	خرابی چند قسمت کف سالن صفحه بتون کاری	401000028	t	2	ارسال به واحد فنی\t\n	3	32	8	t
245	لیفتراک 5 تن هایستر	فنی	2022-12-21 09:59:16.763546+03:30	صدا دادن دکل لیفتراک ۵تن هنگام بالا پایین گذاشتن بار	401000235	t	3	ارسال به واحد فنی	3	81	10	t
248	دستگاه تانک چسب HESSAN	فنی	2022-12-22 08:17:43.065833+03:30	نیامدن چسب یکی از نازل روکار،\r\nقسمت فیلتربازدید شود	401000238	t	3	ارسال به واحد فنی	3	1	10	t
14	تنونر	واحد فنی\t	2022-08-31 12:24:02.149385+04:30	افتادن چند عدد از کفشک های ریل تنونر	40100005	t	2	ارسال به واحد فنی\t	3	22	8	t
41	دستگاه پست فرم 590	واحد فنی	2022-09-20 09:33:29.312655+04:30	ایستادن ناگهانی پست فوم در حین کار	401000032	t	3	ارسال به واحد فنی\t\n	3	14	8	t
12	تنونر	واحد فنی	2022-08-31 10:10:25.497513+04:30	صدا دادن دینام	40100003	t	2	ارسال به واحد فنی	3	22	8	t
24	میخ استوپ 1	واحد فنی	2022-09-04 12:54:15.295281+04:30	خرابی میخ استپ شکستگی سنبه	401000015	t	3	ارسال به واحد فنی	3	29	8	t
10	تنونر	واحد فنی\t	2022-08-31 09:49:58.530229+04:30	صدا دادن موتور سمت چپ دستگاه تنونر	40100002	t	3	ارسال به واحد فنی\t\n	3	22	8	t
31	دستگاه پست فرم 590	واحد فنی	2022-09-09 09:03:52.043755+04:30	گرفتگی مخزن چسب زن پست فوم	401000022	t	3	ارسال به واحد فنی\t\n	3	14	8	t
60	برش طولی	فنی	2022-10-19 14:32:36.262841+03:30	تعویض تیغه برش طولی	401000051	t	3	ارسال به واحد فنی	3	21	8	t
50	اتاق منشی	فنی	2022-10-11 07:59:19.978345+03:30	درب شیشه ای ورودی طبقه بالا هنگام باز بسته شدن صدا میدهد و به همدیگر گیر میکند	401000041	t	2	ارسال به واحد فنی	3	54	1	t
43	سلفون کش 1	واحد فنی	2022-09-20 16:39:09.986323+04:30	تنظیم کردن دستگاه سلفون کش با قسمت پرس کننده روکش های گلاس،\n(دستگاه سلفون کش بادستگاه پرس توی یک خط نیستند)	401000034	t	2	ارسال به واحد فنی	3	42	7	t
44	پرس گرم 3 طبقه	فنی	2022-09-20 17:44:56.66248+04:30	نشتی روغن از جک پرس 3طبقه	401000035	t	2	ارسال به واحد فنی	3	7	7	t
62	دستگاه پشت کار	فنی	2022-10-20 07:46:55.449997+03:30	نشتی روغن از سر شفت کرم پشتکار ازسمت دیوار،	401000053	t	2	ارسال به واحد فنی	3	3	7	t
56	لیفتراک 3 تن دیزل	فنی	2022-10-15 15:48:14.161729+03:30	نشتی آب لیفتراک سالن صفحه کابینت	401000047	t	3	ارسال به واحد فنی	3	10	3	t
57	دستگاه تانک چسب HESSAN	تولید هایگلاس	2022-10-17 09:42:24.966087+03:30	رااندازی نازل دومی روکار	401000048	t	2	ارسال به واحد فنی	2	1	7	t
51	دستگاه پشت کار	فنی	2022-10-11 10:11:38.565993+03:30	پنچر بودن رول باز کنی پشتکار	401000042	t	3	ارسال به واحد فنی	3	3	3	t
53	قیچی بالابر(لیفت) پشت کار	واحد فنی	2022-10-13 12:33:10.913149+03:30	بالا وپایین کردن لیفت پشتکار مشکل دارد،	401000044	t	2	ارسال به واحد فنی	3	5	7	t
61	رول پرس	فنی	2022-10-19 14:33:49.500518+03:30	روشن نشدن چند عدد از المنت های دستگاه رول پرس	401000052	t	3	ارسال به واحد فنی	3	23	8	t
64	پرس گرم 3 طبقه	فنی	2022-10-20 12:55:23.706169+03:30	نشتی روغن یکی از شلنگهای پرس 3طبقه	401000055	t	2	ارسال به واحد فنی	3	7	7	t
34	اتاق نگهبانی	واحد انتظامات	2022-09-10 14:05:36.320284+04:30	جابه جایی تلوزیون ال سی دی از محل فعلی به محل مورد نظر   مدیریت محترم  \nبا تشکر واحد نگهبانی کارخانه آسیانگار گلسار	401000025	t	3	ارسال به واحد فنی	3	46	11	t
58	دستگاه هایگلاس HESSAN	تولید هایگلاس	2022-10-17 09:53:03.679744+03:30	نصب فلکه فرچه بغل قسمت لیفت روکار	401000049	t	2	ارسال به واحد فنی	2	2	7	t
70	میخ استوپ 1	تولید هایگلاس	2022-10-23 08:11:59.412399+03:30	رفع مشکل دستگاه میخ استوپ، بیرون موندن ته میخها،	401000061	t	2	ارسال به واحد فنی	2	29	7	t
75	دستگاه هایگلاس HESSAN	تولید هایگلاس	2022-10-23 16:32:49.669641+03:30	مشکل سیم جرثقيل روی دستگاه روکار داخل اتاقک های گلاس برطرف شود،	401000066	t	2	ارسال به واحد فنی	2	2	7	t
36	میخ استوپ 1	واحد فنی	2022-09-11 08:37:23.589704+04:30	خرابی میخ استب	401000027	t	2	ارسال به واحد فنی\t\n	3	29	8	t
13	ساخت	مدیریت کارخانه	2022-08-31 12:00:55.14113+04:30	ساخت یک عدد سلفون کش دو غلطکه با تابلو برق مجزا	40100004	t	3	ارسال به واحد فنی	3	71	1	t
33	دستگاه هایگلاس HESSAN	واحد فنی	2022-09-09 11:31:01.137859+04:30	قسمت بین دوتا فرچه ها روی فرچه عرضی مشکل آب پاشی رفع گردد،	401000024	t	2	ارسال به واحد فنی\t\n	3	2	7	t
279	سوله انبار	فنی	2022-12-29 11:06:00.024956+03:30	روشنایی انبار قطعات	401000253	t	2	ارسال به واحد فنی	3	41	2	t
55	لیفتراک 3 تن دیزل	واحد فنی	2022-10-15 14:29:35.555182+03:30	نشتی اب داردو دود میکند	401000046	t	3	ارسال به واحد فنی	3	10	8	t
21	اتاق تولید	فنی	2022-09-03 07:58:01.100266+04:30	نداشتن دستگیره کشوی سمت دیوار	401000012	t	1	ارسال به واحد فنی	3	49	3	t
9	لیفتراک 3/5 تن دیزل	واحد فنی\t	2022-08-31 09:19:18.839774+04:30	روغن ریزی لیفتراگ	40100001	t	2	ارسال به واحد فنی	3	11	2	t
48	دستگاه پشت کار	فنی	2022-09-22 12:29:57.982201+03:30	نشتی روغن از گیربکس	401000039	t	2	ارسال به واحد فنی	3	3	7	t
40	قیچی بالابر(لیفت) پشت کار	واحد فنی	2022-09-18 10:28:39.092182+04:30	نشتی روغن از لیفت پشتکار،	401000031	t	3	ارسال به واحد فنی	3	5	7	t
49	محوطه کارخانه	فنی	2022-10-10 08:28:51.503897+03:30	درخواست جابجایی تابلو اعلانات نگهبانی	401000040	t	3	ارسال به واحد فنی	3	44	12	t
67	برش HPL	فنی	2022-10-22 08:09:57.890178+03:30	خرابی میکرو سوئیچ میز برش	401000058	t	2	ارسال به واحد فنی	3	31	2	t
63	سوله سالن صفحه	فنی	2022-10-20 09:52:33.762527+03:30	روشن نشدن یکی از لامپ های بالا سر پرس دوبل	401000054	t	2	ارسال به واحد فنی	3	32	8	t
72	دستگاه پست فرم 590	فنی	2022-10-23 10:22:22.219386+03:30	تعویض فرچه پولیش انتهای دستگاه	401000063	t	2	ارسال به واحد فنی	3	14	1	t
71	تنونر	فنی	2022-10-23 08:47:09.034304+03:30	ثابت کردن خرک کنار دستگاه تنونر	401000062	t	3	ارسال به واحد فنی	3	22	8	t
69	ساخت	فنی	2022-10-23 08:08:06.484937+03:30	جوشکار خرک برش نایلون	401000060	t	3	ارسال به واحد فنی	3	71	8	t
108	لیفتراک 7 تن دیزل	فنی	2022-11-09 08:23:55.246129+03:30	تعمیر چراغ های لیفتراک ۷ تن	401000099	t	2	ارسال به واحد فنی	3	9	2	t
65	دستگاه پشت کار	فنی	2022-10-20 13:48:13.411956+03:30	نصب کلید برای المنت های پیش گرم پشتکار	401000056	t	2	ارسال به واحد فنی	3	3	7	t
87	اره دیوالت	فنی	2022-10-30 09:13:35.871971+03:30	تعویض تیغه برش دیوالت	401000078	t	3	ارسال به واحد فنی	3	26	8	t
88	رول پرس	فنی	2022-10-30 09:15:55.950437+03:30	خرابی کلید رول پرس	401000079	t		ارسال به واحد فنی	3	23	8	t
95	رختکن پرسنل	فنی	2022-11-01 09:37:16.106034+03:30	مرتب کردن و داکت کشی سیم های شبکه و تلفن دفتر انبار	401000086	t	2	ارسال به واحد فنی	3	73	2	t
79	سوله سالن صفحه	فنی	2022-10-26 05:59:17.404256+03:30	باز بس نشدن درب سالن صفحه روبرو فنی	401000070	t	2	ارسال به واحد فنی	3	32	8	t
135	برش طولی	فنی	2022-11-21 09:10:32.423968+03:30	خرابی برش طولی	401000125	t	3	ارسال به واحد فنی	3	21	8	t
97	رول پرس	فنی	2022-11-02 12:15:55.968504+03:30	حرکت نکردن دستگاه موقع تولید	401000088	t	3	ارسال به واحد فنی	3	23	8	t
104	لیفتراک 3 تن دیزل	فنی	2022-11-07 10:05:56.802735+03:30	تعمیر چرخ جلو لیفتراک ۳ تن	401000095	t	3	ارسال به واحد فنی	3	10	2	t
96	برش طولی	فنی	2022-11-02 09:05:27.901603+03:30	تعویض تیغه نئوپان بر	401000087	t	3	ارسال به واحد فنی	3	21	8	t
100	رول پرس	فنی	2022-11-05 11:20:11.993463+03:30	صدا دادن دستگاه رول پرس	401000091	t	3	ارسال به واحد فنی	3	23	8	t
99	تنونر	فنی	2022-11-03 11:22:08.502095+03:30	خراب شدن یکی از رولیک های ریل زمینی تنونر	401000090	t	3	ارسال به واحد فنی	3	22	8	t
83	رول پرس	فنی	2022-10-27 11:18:32.742324+03:30	روشن نشدن چند عدد از المنت های پیش گرم رول پرس	401000074	t	3	ارسال به واحد فنی	3	23	8	t
77	تنونر	فنی	2022-10-25 11:16:24.333747+03:30	صدا دادن قاب موتور تنونر	401000068	t	2	ارسال به واحد فنی	3	22	8	t
89	دستگاه پست فرم 590	فنی	2022-10-30 11:38:55.692821+03:30	بستن چند عدد غلطک نگه دارنده ریل پست فوم	401000080	t	3	ارسال به واحد فنی	3	14	8	t
98	دستگاه هایگلاس HESSAN	فنی	2022-11-02 12:30:45.522121+03:30	نصب کلید استوپ به روی بالا بر روکار،\r\nموقعی بالا انداختن رول استوپ نمی‌کند یسره پائین میاد	401000089	t	3	ارسال به واحد فنی	3	2	7	t
102	تنونر	فنی	2022-11-07 08:57:29.449205+03:30	تعویض تیغه توپی ۴۸میل	401000093	t	3	ارسال به واحد فنی	3	22	8	t
103	سوله سالن صفحه	فنی	2022-11-07 09:01:27.130942+03:30	قطع شدن تلفون اتاق سالن صفحه	401000094	t	3	ارسال به واحد فنی	3	32	8	t
94	رول پرس	فنی	2022-10-31 12:03:30.61948+03:30	شکستگی خرک سنباده زنی	401000085	t	3	ارسال به واحد فنی	3	23	8	t
92	دستگاه پشت کار	تولید هایگلاس	2022-10-30 17:08:00.175107+03:30	نصب یک عددلامپ به ابتدای خط پشتکار، قسمت لیفت، درتاریکی شکسته ورق ها ی خام روی لیفت پیدا نیست،	401000083	t	2	ارسال به واحد فنی	2	3	7	t
74	دستگاه پشت کار	تولید هایگلاس	2022-10-23 16:26:00.416506+03:30	قسمت غلطک های پرس کننده روکش pvc جکهاش پنوماتیک شود، و روی آن 3عددغلطک هرزگرد نصب گردد،	401000065	t	2	ارسال به واحد فنی	2	3	7	t
80	میخ استوپ 1	تولید هایگلاس	2022-10-26 13:15:19.067858+03:30	بازدید دستگاه میخ استوپ، بیرون موندن ته میخها،	401000071	t	2	ارسال به واحد فنی	2	29	7	t
82	دستگاه هایگلاس HESSAN	تولید هایگلاس	2022-10-27 08:47:46.356796+03:30	رفع مشکل مترینگ روکار	401000073	t	2	ارسال به واحد فنی	2	2	7	t
68	تنونر	فنی	2022-10-22 14:00:35.723466+03:30	افتادن چند عدد از کفشک های ریل تنونر	401000059	t	3	ارسال به واحد فنی	3	22	8	t
59	رختکن پرسنل	فنی	2022-10-17 10:43:32.029287+03:30	ساخت یک درب برای ورود به اتاق سمپل \nقابل توجه یک عدد درب پی وی سی پشت کارخانه موجود بوده است الویت با آن میباشد	401000050	t	2	ارسال به واحد فنی	3	73	1	t
106	لیفتراک 7 تن دیزل	فنی	2022-11-09 07:42:07.860336+03:30	تعمیر استارت و منبع اگزوز لیفتراک ۷ تن	401000097	t	3	ارسال به واحد فنی	3	9	2	t
280	سوله انبار	فنی	2022-12-29 11:07:22.86023+03:30	ساخت جای شیلنگ و تسمه روی دیوار	401000254	t	3	ارسال به واحد فنی	3	41	2	t
93	میخ استوپ 2	فنی	2022-10-31 09:04:27.137645+03:30	خرابی میخ استپ	401000084	t	3	ارسال به واحد فنی	3	30	8	t
101	لیفتراک 5 تن	فنی	2022-11-06 12:35:23.019332+03:30	رغن ریزی موتور لیتفتراک ۵تن	401000092	t	2	ارسال به واحد فنی	3	76	8	t
110	برش طولی	فنی	2022-11-09 12:04:31.683957+03:30	تعویض تیغه برش طولی	401000101	t	3	ارسال به واحد فنی	3	21	8	t
122	برش طولی	فنی	2022-11-15 08:12:52.809197+03:30	تعویض تیغه برش طولی	401000112	t	3	ارسال به واحد فنی	3	21	8	t
124	تنونر	فنی	2022-11-15 14:03:36.029384+03:30	تعویض تیغه اره برش تنونر	401000114	t	2	ارسال به واحد فنی	3	22	8	t
113	لیفتراک 7 تن دیزل	فنی	2022-11-10 07:20:33.404607+03:30	تعمیر پمپ گازوئیل لیفتراک ۸ تن	401000103	t	2	ارسال به واحد فنی	3	9	2	t
125	لیفتراک 3/5 تن گازی	فنی	2022-11-16 08:23:06.148377+03:30	دودکردن لیفتراک گازی بیش از حد موقع مصرف بنزین،\r\nدرمصرف گاز همچون اتفاقی رخ نمی‌دهد،	401000115	t	3	ارسال به واحد فنی	3	12	7	t
126	پرس گرم 3 طبقه	فنی	2022-11-16 10:29:21.635835+03:30	تعویض بعضی  از پیچ های لبه صفحه سینی روی دستگاه پرس 3طبقه،	401000116	t	2	ارسال به واحد فنی	3	7	7	t
142	دستگاه جت پرینتر سمپل	فنی	2022-11-26 12:40:28.317169+03:30	اورهال شدن	401000132	t	3	ارسال به واحد فنی	3	\N	1	t
112	لیفتراک 5 تن	فنی	2022-11-09 15:23:32.313087+03:30	تعمیر چراغ های لیفتراک ۵	401000102	t	2	ارسال به واحد فنی	3	76	2	t
118	دستگاه پشت کار	فنی	2022-11-13 12:56:26.002751+03:30	ساخت تیغ دورگیری برای لبه کارهای ورق	401000108	t	3	ارسال به واحد فنی	3	3	1	t
128	تنونر	فنی	2022-11-16 11:01:50.390431+03:30	خرابی گونیا تنونر دویده داشتن صفحه تنون شده از طرف دوم	401000118	t	2	ارسال به واحد فنی	3	22	8	t
136	رول پرس	فنی	2022-11-22 08:52:23.171459+03:30	نصب پایه قابل تنظیم پیش گرم	401000126	t	2	ارسال به واحد فنی	3	23	8	t
114	دستگاه پست فرم 590	فنی	2022-11-12 09:33:28.351476+03:30	قطع شدن یکی از المنت های بالای پست فوم	401000104	t	3	ارسال به واحد فنی	3	14	8	t
117	دستگاه هایگلاس HESSAN	فنی	2022-11-13 12:56:06.622674+03:30	ساخت تیغ دورگیری برای لبه کارهای ورق	401000107	t	3	ارسال به واحد فنی	3	2	1	t
127	اره دیوالت	فنی	2022-11-16 10:39:23.984242+03:30	تعویض تیغه برش دیوالت	401000117	t	3	ارسال به واحد فنی	3	26	8	t
130	سوله سالن صفحه	فنی	2022-11-17 10:11:32.693316+03:30	ثابت کردن خرک بستبندی	401000120	t	2	ارسال به واحد فنی	3	32	8	t
132	برش طولی	فنی	2022-11-20 14:13:43.563658+03:30	تعویض تیغه برش طولی	401000122	t	3	ارسال به واحد فنی	3	21	8	t
129	سرویس بهداشتی بانوان	فنی	2022-11-16 12:30:32.831587+03:30	نصب فلاش تانک/ تعویض شلنگ سرویس بهداشتی/ تعمیر سیفون روشویی(نشت آب دارد)	401000119	t	3	ارسال به واحد فنی	3	60	3	t
119	محوطه کارخانه	فنی	2022-11-13 12:57:21.585539+03:30	رنگ آمیزی خط کشی های محوطه	401000109	t	2	ارسال به واحد فنی	3	44	1	t
137	دستگاه پشت کار	فنی	2022-11-22 11:41:18.50134+03:30	نشتی روغن از سر شفت کرم پشتکار ازسمت دیوار،	401000127	t	2	ارسال به واحد فنی	3	3	7	t
111	برش طولی	فنی	2022-11-09 12:04:31.695164+03:30	تعویض تیغه برش طولی	401000101	t	3	ارسال به واحد فنی	3	21	8	t
139	قیچی بالابر(لیفت) HESSAN	فنی	2022-11-26 12:08:12.736711+03:30	طرف اپراتور لیفت پایین تر است نسبت به طرف مقابل	401000129	t	2	ارسال به واحد فنی	3	6	7	t
150	دستگاه پست فرم 590	فنی	2022-11-30 08:28:14.817991+03:30	خرابی یکی از کلید های پست فوم	401000140	t	2	ارسال به واحد فنی	3	14	10	t
144	دستگاه هایگلاس HESSAN	فنی	2022-11-28 13:03:03.106732+03:30	هواکش های سقفی اتاقک هایگلاس تقویت شود\r\nموقع نظافت دستگاه اتاقک پر بخار میباشد،	401000134	t	2	ارسال به واحد فنی	3	2	10	t
153	لیفتراک 7 تن دیزل	فنی	2022-11-30 10:08:07.855521+03:30	تعمیر و سرویس رادیاتور لیفتراک ۷ تن	401000143	t	3	ارسال به واحد فنی	3	9	2	t
149	لیفتراک 5 تن	فنی	2022-11-30 08:27:34.824126+03:30	خرابی سرباطری لیفتراک ۵تن	401000139	t	3	ارسال به واحد فنی	3	76	10	t
145	دستگاه پشت کار	فنی	2022-11-28 13:42:39.583027+03:30	درپوش سرموتور سیلیکون پشتکار خلاصی دارد،\r\n خرابی آن رفع گردد	401000135	t	2	ارسال به واحد فنی	3	3	10	t
140	محوطه کارخانه	فنی	2022-11-26 12:35:45.393826+03:30	روشنایی تابلو شرکت جلوی درب انبار	401000130	t	2	ارسال به واحد فنی	3	44	1	t
107	سوله انبار	فنی	2022-11-09 07:43:26.110462+03:30	اضافه کردن روشنایی سالن انبار	401000098	t	2	ارسال به واحد فنی	3	41	2	t
120	سوله هایگلاس	فنی	2022-11-14 10:31:18.592163+03:30	تعویض 5عدد لامپ سقفی	401000110	t	2	ارسال به واحد فنی	3	40	7	t
131	چسب زن پرس دوبل 1	فنی	2022-11-20 12:14:54.322544+03:30	خرابی جک چسب زن پرس دوبل	401000121	t	2	ارسال به واحد فنی	3	17	8	t
116	اتاق اداری	فنی	2022-11-13 12:55:00.85276+03:30	بررسی تلفن اتاق خانم خلیلی	401000106	t	3	ارسال به واحد فنی	3	50	1	t
160	دستگاه پست فرم 590	فنی	2022-12-03 11:25:55.109636+03:30	خرابی یکی از المنت های پست فوم	401000150	t	3	ارسال به واحد فنی	3	14	10	t
143	دستگاه پشت کار	فنی	2022-11-27 07:20:31.726296+03:30	بازدید یکی از نازل پشتکار \r\nپایین بودن سرعت چسب	401000133	t	2	ارسال به واحد فنی	3	3	7	f
157	اور فرز 2	فنی	2022-12-01 13:23:04.489056+03:30	قطع شدن سیم اور فرز	401000147	t	3	ارسال به واحد فنی	3	28	10	t
167	تنونر	فنی	2022-12-05 12:35:53.202241+03:30	جابجای لامپ بالا سر دستگاه تنونر	401000157	t	3	ارسال به واحد فنی	3	22	10	t
161	دستگاه پست فرم 590	فنی	2022-12-03 11:36:41.520409+03:30	شکستگی قاب نگهدرنده المنت بالای پست فوم	401000151	t	3	ارسال به واحد فنی	3	14	10	t
162	لیفتراک 3/5 تن گازی	فنی	2022-12-03 12:10:20.241787+03:30	نشتی بنزین از کاربراتور	401000152	t	2	ارسال به واحد فنی	3	12	10	t
151	دستگاه پست فرم 590	فنی	2022-11-30 08:28:57.622918+03:30	تعویض چند عدد غلطک نگهدارنده ریل دستگاه پست فوم	401000141	t	2	ارسال به واحد فنی	3	14	10	t
173	سوله پرس طبقاتی	فنی	2022-12-05 16:26:42.363318+03:30	نشتی شیر اطمینان بویلر	401000163	t	3	ارسال به واحد فنی	3	93	16	t
179	دفتر مرکزی	فنی	2022-12-06 09:48:25.494576+03:30	جوشکاری نرده ورودی دفتر مرکزی	401000169	t	2	ارسال به واحد فنی	3	72	16	t
281	دستگاه هایگلاس HESSAN	فنی	2022-12-31 07:02:02.244104+03:30	نشتی روغن از قسمت گیربکس غلطک های پائینی طرف دیوار	401000255	t	2	ارسال به واحد فنی	3	2	10	t
158	دستگاه پشت کار	فنی	2022-12-01 13:54:52.928665+03:30	تعویض سیلیکون پشتکار	401000148	t	3	ارسال به واحد فنی	3	3	10	t
163	سوله هایگلاس	فنی	2022-12-03 17:29:09.903538+03:30	کمبود روشنایی انتهای سالن هایگلاس، نیاز به روشنای دارد	401000153	t	2	ارسال به واحد فنی	3	40	10	t
156	پرس گرم 3 طبقه	فنی	2022-12-01 12:05:14.195076+03:30	نشتی روغن یکی از شلنگهای پرس 3طبقه	401000146	t	2	ارسال به واحد فنی	3	7	10	t
159	دستگاه پشت کار	فنی	2022-12-01 14:09:26.475978+03:30	ثابت کردن پین های المنت پشتکار بین فرچه وچسب زن، بدليل درآمدن پین ها،	401000149	t	2	ارسال به واحد فنی	3	3	10	t
172	سوله پرس طبقاتی	فنی	2022-12-05 16:16:23.193106+03:30	نصب فولیتر برای برج خنک و لوله کشی جهت سرزیر آب داخل مخزن برج	401000162	t	3	ارسال به واحد فنی	3	93	16	t
165	گرماتاب سالن هایگلاس	فنی	2022-12-04 12:43:26.157577+03:30	گرما تاب سالن های گلاس بالاسر دستگاه سلفون کش بازديد شود، موقع روشن کردن حرارت حس نمی‌شود	401000155	t	3	ارسال به واحد فنی	3	38	10	t
152	محوطه کارخانه	فنی	2022-11-30 08:45:41.145659+03:30	نصب روشویی زیر پارکینگ پشت منبع آب (جهت شستشوی لیوان و....)	401000142	t	2	ارسال به واحد فنی	3	44	1	t
198	دستگاه هایگلاس HESSAN	فنی	2022-12-10 12:43:24.013386+03:30	موج ورداشتن روکش درانتهای ورقها بعداز خروج از پرس سیلیکونی.\r\nودویدگی ورق	401000188	t	3	ارسال به واحد فنی	3	2	10	t
193	رول پرس	فنی	2022-12-08 09:14:55.961953+03:30	ثابت کردن سینی چسب زن رول پرس	401000183	t	2	ارسال به واحد فنی	3	23	10	t
176	سوله پرس طبقاتی	فنی	2022-12-06 08:53:33.33858+03:30	خاموش شدن بویلر در زمان کار	401000166	t	3	ارسال به واحد فنی	3	93	16	t
182	دستگاه هایگلاس HESSAN	فنی	2022-12-07 07:46:22.880252+03:30	تعویض پیچ های النی روی میله باز بست چسب	401000172	t	2	ارسال به واحد فنی	3	2	10	t
174	دستگاه پشت کار	فنی	2022-12-06 07:27:35.034215+03:30	نصب 3راهی باد به روی دستگاه پشتکار	401000164	t	2	ارسال به واحد فنی	3	3	10	t
195	دستگاه پست فرم 590	فنی	2022-12-08 13:32:45.57261+03:30	خرابی چند عدد از غلطک نگهدارنده ریل دستجاه پست فوم	401000185	t	2	ارسال به واحد فنی	3	14	10	t
209	دستگاه پست فرم 590	فنی	2022-12-13 09:00:55.438143+03:30	تعویض یکی از المنت های بالای پست فوم	401000199	t	3	ارسال به واحد فنی	3	14	10	t
148	لیفتراک 7 تن دیزل	انبار	2022-11-29 13:15:49.305384+03:30	نشتی آب از رادیاتور	401000138	t	3	ارسال به واحد انبار	1	9	4	t
155	سوله هایگلاس	فنی	2022-11-30 16:12:49.441905+03:30	نصب دستگاه درایور به سیستم باد سالن های گلاس،	401000145	t	2	ارسال به واحد فنی	3	40	10	t
169	میخ استوپ 2	فنی	2022-12-05 14:06:10.790329+03:30	خرابی میخ استپ	401000159	t	3	ارسال به واحد فنی	3	30	10	t
154	پرس گرم سالن صفحه	فنی	2022-11-30 15:49:52.155127+03:30	ناهنواری سطح ورق پرس پرس گرم سالن صفحه	401000144	t	3	ارسال به واحد فنی	3	24	10	t
175	بویلر بخار	فنی	2022-12-06 08:28:51.720942+03:30	نشتی از شیر اضطراری روی دستگاه	401000165	t	3	ارسال به واحد فنی	3	85	17	t
183	ترمز پودری	فنی	2022-12-07 08:11:25.161597+03:30	ترمز استپ کرده و نمیچرخد	401000173	t	3	ارسال به واحد فنی	3	95	4	t
147	چسب زن پرس دوبل 2	فنی	2022-11-29 12:31:21.242316+03:30	نشتی باد از شلنگ باد پرس دوبل	401000137	t	3	ارسال به واحد فنی	3	18	10	t
170	کابل کشی	فنی	2022-12-05 14:31:51.870965+03:30	اتاق های تولید داخل سالن	401000160	t	3	ارسال به واحد فنی	3	94	16	t
185	لیفتراک 3/5 تن گازی	فنی	2022-12-07 10:02:12.96242+03:30	هنگام حرکت دو چرخ عقب چپ و راست می‌شود	401000175	t	2	ارسال به واحد فنی	3	12	10	t
192	رول پرس	فنی	2022-12-08 09:14:11.554755+03:30	نصب پایه برای خرک بعد چسب زن رول پرس	401000182	t	3	ارسال به واحد فنی	3	23	10	t
187	رول پرس	فنی	2022-12-07 12:53:42.684827+03:30	خرابی چند از المنت های رول پرس	401000177	t	2	ارسال به واحد فنی	3	23	10	t
190	سوله پرس طبقاتی	فنی	2022-12-08 07:47:15.482873+03:30	نصب گرماتاب سالن پرس طبقاطی	401000180	t	3	ارسال به واحد فنی	3	93	16	t
197	تنونر	فنی	2022-12-10 07:57:26.000265+03:30	خرابی چند عدد رولک ابتدای دستگاه تنونر	401000187	t	3	ارسال به واحد فنی	3	22	10	t
202	گرماتاب سالن هایگلاس	فنی	2022-12-12 09:52:12.87259+03:30	گرما تاب سالن های گلاس مجدداً بازدیدشود، آن‌چنان حرارتی ندارد،	401000192	t	3	ارسال به واحد فنی	3	38	10	t
199	برش طولی	فنی	2022-12-10 13:42:24.558406+03:30	تعویض تیغه برش طولی	401000189	t	3	ارسال به واحد فنی	3	21	10	t
228	سوله پرس طبقاتی	فنی	2022-12-18 09:21:07.344482+03:30	تنطیم میزهای انتهای خط، جهت سلفون کردن محصول	401000218	t	2	ارسال به واحد فنی	3	93	16	t
219	سوله پرس طبقاتی	فنی	2022-12-17 08:07:41.817214+03:30	تنظیم صفحات کروم( از بین بردن فضای خالی بین صفحه کروم و صفحه پرس)	401000209	t	3	ارسال به واحد فنی	3	93	16	t
282	سوله پرس طبقاتی	فنی	2022-12-31 07:28:47.148378+03:30	نصب پمپ جهت تخلیه اب موجود در صفحات پرس	401000256	t	2	ارسال به واحد فنی	3	93	16	t
196	لیفتراک 5 تن	فنی	2022-12-08 13:42:59.541941+03:30	گیریس کاری دکل لیفتراک	401000186	t	2	ارسال به واحد فنی	3	76	10	t
191	لیفتراک 5 تن هایستر	انبار	2022-12-08 08:26:13.223378+03:30	پنچری لاستیک عقب لیفتراک	401000181	t	3	ارسال به واحد انبار	1	81	17	t
181	خلال کن	فنی	2022-12-07 07:42:45.014362+03:30	تعویض تیغه برش خلال کن	401000171	t	2	ارسال به واحد فنی	3	20	10	t
189	سوله پرس طبقاتی	فنی	2022-12-08 07:15:42.013849+03:30	خرابی لیفتراک	401000179	t	3	ارسال به واحد فنی	3	93	16	t
206	رول پرس	فنی	2022-12-12 10:32:12.194647+03:30	تعویض فرچه چسب زن رول پرس	401000196	t	2	ارسال به واحد فنی	3	23	10	t
201	سوله پرس طبقاتی	فنی	2022-12-11 10:33:20.28153+03:30	رفع نشتی بخار از شلنگ ها، فلنج ها، جوش لوله	401000191	t	3	ارسال به واحد فنی	3	93	16	t
204	گرماتاب سالن هایگلاس	فنی	2022-12-12 09:52:24.191269+03:30	گرما تاب سالن های گلاس مجدداً بازدیدشود، آن‌چنان حرارتی ندارد،	401000194	t	3	ارسال به واحد فنی	3	38	10	t
180	سوله هایگلاس	فنی	2022-12-06 10:58:34.281611+03:30	مسیرخرک انتقال رول به اتاقک هایگلاس چال شده موقع انتقال باعث گیر کردن خرک می‌شود \r\nدرست کردن جا ریلی	401000170	t	2	ارسال به واحد فنی	3	40	10	t
205	سوله پرس طبقاتی	فنی	2022-12-12 10:12:29.063565+03:30	تنظیم طبقه ۴ آسانسور	401000195	t	3	ارسال به واحد فنی	3	93	16	t
210	تنونر	فنی	2022-12-13 11:24:05.476015+03:30	خرابی اهرم بالابر و عقب جلو کننده توپی.	401000200	t	3	ارسال به واحد فنی	3	22	10	t
200	سوله پرس طبقاتی	فنی	2022-12-11 10:33:10.191419+03:30	رفع نشتی بخار از شلنگ ها، فلنج ها، جوش لوله	401000190	t	3	ارسال به واحد فنی	3	93	16	t
203	گرماتاب سالن هایگلاس	فنی	2022-12-12 09:52:17.204028+03:30	گرما تاب سالن های گلاس مجدداً بازدیدشود، آن‌چنان حرارتی ندارد،	401000193	t	3	ارسال به واحد فنی	3	38	10	t
211	برش HPL	فنی	2022-12-14 08:31:52.320058+03:30	تعویض تیغه میز برش اچ پی ال \r\nتعمیر میکروسوئیچ	401000201	t	3	ارسال به واحد فنی	3	31	2	t
218	لیفتراک 3/5 تن گازی	فنی	2022-12-15 12:42:05.005969+03:30	نشتی روغن از لیفتراک گازی سالن های گلاس،	401000208	t	2	ارسال به واحد فنی	3	12	10	t
220	سوله پرس طبقاتی	فنی	2022-12-17 08:34:42.60283+03:30	رفع نشتی شیر دستی ورودی بخار داخل سالن	401000210	t	3	ارسال به واحد فنی	3	93	16	t
184	برش طولی	فنی	2022-12-07 09:02:11.240579+03:30	لرزش داشتن موتور برش طولی	401000174	t	3	ارسال به واحد فنی	3	21	10	t
186	سوله پرس طبقاتی	فنی	2022-12-07 11:45:39.022088+03:30	نصب هواکش جهت تهویه هوای داخل سالن	401000176	t	2	ارسال به واحد فنی	3	93	16	t
217	سوله پرس طبقاتی	فنی	2022-12-15 09:06:09.059759+03:30	تعویض لامپ های سوخته سالن تولید و اصلاح روشنایی	401000207	t	2	ارسال به واحد فنی	3	93	16	t
177	دستگاه تسویه RO	فنی	2022-12-06 09:07:05.452076+03:30	تعویض دو فیلتر بزرگ تسویه	401000167	t	1	ارسال به واحد فنی	3	87	17	t
231	برش کلگی	فنی	2022-12-18 10:53:33.517324+03:30	بستن لوله مکنده برش کلگی بر	401000221	t	3	ارسال به واحد فنی	3	19	10	t
224	دستگاه هایگلاس HESSAN	فنی	2022-12-17 13:07:20.126888+03:30	آب نپاشیدن قسمت آب پاش روی فرچه های عرضی	401000214	t	2	ارسال به واحد فنی	3	2	10	t
223	سوله هایگلاس	فنی	2022-12-17 12:32:44.877687+03:30	تعویض لامپ بالا سر دستگاه چسب زن های گلاس توی اتاقک هایگلاس	401000213	t	3	ارسال به واحد فنی	3	40	10	t
230	سوله پرس طبقاتی	فنی	2022-12-18 09:31:25.614398+03:30	ساخت هود مکنده برای قسمت بالایی فرچه	401000220	t	2	ارسال به واحد فنی	3	93	16	t
239	لیفتراک 3 تن دیزل	فنی	2022-12-20 11:34:49.357709+03:30		401000229	f	2	درانتظار تایید مدیریت	3	10	8	f
215	سوله پرس طبقاتی	فنی	2022-12-15 08:41:27.379164+03:30	تهیه محافظ دینام درب ریموتی سالن تولید و تهیه ریموت یدک	401000205	t	2	ارسال به واحد فنی\t\n	3	93	17	f
208	رول پرس	فنی	2022-12-12 11:03:52.492957+03:30	ساخت فرچه برای چسب زن رول پرس	401000198	t	2	ارسال به واحد فنی	3	23	10	f
221	دستگاه تانک چسب پشت کار	فنی	2022-12-17 09:52:09.461317+03:30	نیامدن چسب یکی از نازل پشتکار	401000211	t	2	ارسال به واحد فنی	3	4	10	f
214	دستگاه پشت کار	فنی	2022-12-15 08:31:02.166059+03:30	تغییر جهت فرچه ابتدای خط پشتکار	401000204	t	2	ارسال به واحد فنی	3	3	10	t
307	برش طولی	فنی	2023-01-04 09:41:41.822202+03:30	صدا دادن دستگاه برش طولی	401000281	t	3	ارسال به واحد فنی	3	21	10	t
234	دفتر مرکزی	فنی	2022-12-18 15:31:26.444371+03:30	ساختن کمد دیواری برای خانم نجفی	401000224	t	2	ارسال به واحد فنی	3	72	14	t
283	دستگاه پست فرم 590	فنی	2022-12-31 12:09:46.619922+03:30	خرابی کلید روشن خاموش کن تکی بالا	401000257	t	3	ارسال به واحد فنی	3	14	10	t
212	برش HPL	فنی	2022-12-14 08:32:11.742854+03:30	تعویض تیغه میز برش اچ پی ال \r\nتعمیر میکروسوئیچ	401000202	t	3	ارسال به واحد فنی	3	31	2	t
232	اره دیوالت	فنی	2022-12-18 12:18:50.580974+03:30	تعویض تیغ اره	401000222	t	3	ارسال به واحد فنی	3	26	10	t
237	رول پرس	فنی	2022-12-19 13:56:44.466531+03:30	خاموش شدن ناگهانی دستگاه چسب زن رول پرس	401000227	t	3	ارسال به واحد فنی	3	23	10	t
241	برش طولی	فنی	2022-12-21 08:23:37.307901+03:30	حرکت نکردن موتور برش طولی	401000231	t	3	ارسال به واحد فنی	3	21	10	t
238	رول پرس	فنی	2022-12-20 11:16:11.2562+03:30	تعویضه تیغه توپی ۴۸میل	401000228	t	3	ارسال به واحد فنی	3	23	10	t
227	لیفتراک 3/5 تن گازی	فنی	2022-12-18 07:12:09.323464+03:30	نشتی گاز از توپی شلنگ لیفتراک گازی	401000217	t	3	ارسال به واحد فنی	3	12	10	t
233	اره دیوالت	فنی	2022-12-18 14:21:51.716917+03:30	کج شدن دستگاه برش دیوالت ک باعت کج برشخوردن سر صفحه میشود	401000223	t	3	ارسال به واحد فنی	3	26	10	t
249	لیفتراک 3/5 تن گازی	فنی	2022-12-22 11:15:39.839885+03:30	بالا پائین بودن شاخ های لیفتراک، مشکل شاخهارفع گردد	401000239	t	3	ارسال به واحد فنی	3	12	10	t
35	اتاق نگهبانی	واحد فنی	2022-09-10 17:04:45.986316+04:30	جا ب جایی ال سی دی دوربین های نگهبانی	401000026	t	3	ارسال به واحد فنی	3	46	11	t
66	برش HPL	فنی	2022-10-22 08:09:56.632193+03:30	خرابی میکرو سوئیچ میز برش	401000057	t	2	ارسال به واحد فنی	3	31	2	t
255	سوله انبار	فنی	2022-12-24 12:41:02.461332+03:30	تعویض درب های سالن انبار و صفحه از آهنی به کرکره ای	401000243	t	2	ارسال به واحد فنی	3	41	2	t
252	سوله پرس طبقاتی	فنی	2022-12-24 07:42:05.947378+03:30	تنظیم صفحات پرس	401000240	t	2	ارسال به واحد فنی	3	93	16	t
257	گرماتاب سالن هایگلاس	فنی	2022-12-24 15:57:16.644426+03:30	گرما تاب سالن های گلاس مثل قبل حرارت ندارد، دمای سالن نسبت به قبل سردتر است،	401000245	t	3	ارسال به واحد فنی	3	38	10	t
85	دستگاه کاغذ خورد کن	اداری	2022-10-30 08:20:19.353746+03:30	فقط دور برعکس کار میکند \nاحتمال دارد که کاغذ گیر کرده باشد\nچک شود در صورت عدم توانایی سرویس در کارخانه به بیرون فرستاده شود.	401000076	t	2	ارسال به واحد فنی	6	75	1	t
146	اتاق تولید	تولید	2022-11-29 07:41:44.515288+03:30	نصب مهتابی سمت راست میز خانم عربلو(بدلیل کمبودنور و آزارچشم)	401000136	t	3	ارسال به واحد تولید	12	49	10	t
188	لیفتراک 3/5 تن گازی	فنی	2022-12-07 14:36:07.189062+03:30	دود کردن لیفتراک گازی سالن های گلاس موقع مصرف بنزین،	401000178	t	3	ارسال به واحد فنی	3	12	10	t
84	لیفتراک 3 تن دیزل	فنی	2022-10-29 10:49:45.004174+03:30	روشن نشدن لیفتراک ۵تن سالن صفحه	401000075	t	3	ارسال به واحد فنی	3	10	8	t
246	دستگاه تانک چسب پشت کار	فنی	2022-12-22 08:12:31.652103+03:30	رفع مشکل نازل پشتکار بعلت نیامدن چسب، قسمت المنت بازدید شود از نازل تست گرفته شد مشکل نداشت	401000236	t	3	ارسال به واحد فنی	3	4	10	t
171	سوله پرس طبقاتی	فنی	2022-12-05 16:14:28.903475+03:30	اضافه کردن روشنایی داخل سالن واضافه کردن روشنایی بالای میزهای انتهای خط	401000161	t	3	ارسال به واحد فنی	3	93	16	t
258	سوله پرس طبقاتی	فنی	2022-12-25 08:18:13.25803+03:30	تعویض شیرکلکتور  پرس(دسته گازی به جای فلکه ای)	401000246	t	2	ارسال به واحد فنی	3	93	16	t
229	سوله پرس طبقاتی	فنی	2022-12-18 09:30:07.962547+03:30	تنطیم جک پالت ابتدای خط	401000219	t	2	DN	3	93	16	t
76	دستگاه هایگلاس HESSAN	تولید هایگلاس	2022-10-24 09:17:23.970859+03:30	بازدید دمای غلطک سیلیکون وغلطک کرم\nدمای غلطک ها با مانیتور نشون دهنده دما یکی نمیباشد،باعث پشمکی شدن چسب میشود، بررسی شود	401000067	t	2	ارسال به واحد فنی	2	2	7	t
78	تنونر	فنی	2022-10-25 14:34:57.213835+03:30	پوست زنی توپی های ۳۲میل	401000069	t	2	ارسال به واحد فنی	3	22	8	t
254	دستگاه پست فرم 590	فنی	2022-12-24 11:46:11.553316+03:30	رشن نشدن لامپ بالای سر دستگاه پست فوم	401000242	t	3	ارسال به واحد فنی	3	14	10	f
19	سرویس بهداشتی بانوان	واحد فنی	2022-09-01 11:24:39.984906+04:30	خرابی هواکش سرویس بهداشتی بانوان	401000010	t	2	ارسال به واحد فنی	3	60	3	f
54	لیفتراک 3/5 تن گازی	فنی	2022-10-15 12:07:32.754722+03:30	بازدید چرخ عقب لیفتراک گاز سوز، موقع راه رفتن حرکت لاستیک چپ و راست می‌شود،	401000045	t	2	ارسال به واحد فنی	3	12	7	f
226	لیفتراک 3/5 تن گازی	فنی	2022-12-17 16:14:31.028585+03:30	نشتی بنزین از قسمت کاربراتور\r\nو موقع مصرف بنزین دود میکند	401000216	t	3	ارسال به واحد فنی	3	12	10	f
213	دستگاه پشت کار	فنی	2022-12-15 08:26:34.608673+03:30	تغییر جهت فرچه ابتدای خط پشت کار	401000203	t	2	ارسال به واحد فنی	3	3	10	f
207	رول پرس	فنی	2022-12-12 10:33:14.341798+03:30	تعویض فرچه چسب زن رول پرس	401000197	t		ارسال به واحد فنی	3	23	10	f
289	لیفتراک 3 تن دیزل	فنی	2023-01-02 07:55:25.139043+03:30	خرابی شیلنگ رابط ترمز لیفتراک 3 تن	401000263	f	3	\N	3	10	4	t
235	دفتر مرکزی	فنی	2022-12-19 10:16:45.551343+03:30	تعویض جا مایع دستشویی سرویس بانوان(جا مایع خریداری گردیده است)	401000225	t	1	ارسال به واحد فنی	3	72	14	t
91	دستگاه هایگلاس HESSAN	تولید هایگلاس	2022-10-30 16:00:23.234875+03:30	تعویض سیلیکون روکار	401000082	t	3	ارسال به واحد فنی	2	2	7	t
38	اتاق نگهبانی	واحد فنی	2022-09-12 06:52:32.461746+04:30	جا به جایی ال سی دی اتاق نگهبانی جهت نصب سریع تر دوربین ها	401000029	t	3	ارسال به واحد فنی\t\n	3	46	11	t
73	دستگاه پست فرم 590	فنی	2022-10-23 16:08:41.858298+03:30	نصب و راه اندازی دستگاه آب چک زن	401000064	t	3	ارسال به واحد فنی	3	14	1	t
121	لیفتراک 5 تن	فنی	2022-11-15 06:59:44.262556+03:30	روشن نشدن چراغ جلو ای لیفتراک ۵تن	401000111	t	3	ارسال به واحد فنی	3	76	8	t
164	دستگاه تانک چسب HESSAN	فنی	2022-12-04 07:11:28.914812+03:30	بالا  پائین شدن دما دستگاه چسب روکار ،\r\nباعث قطع شدن چسب می‌باشد	401000154	t	3	ارسال به واحد فنی	3	1	10	t
194	دستگاه پست فرم 590	فنی	2022-12-08 12:15:17.106282+03:30	خرابی کلید روشن خاموش کن المنت بالا پست فوم	401000184	t	3	ارسال به واحد فنی	3	14	10	t
133	گرماتاب سالن هایگلاس	انتظامات	2022-11-21 08:38:29.183536+03:30	اعلام  نشتی زیاد گاز از گرماتاب سمت راست انتهای سالن هایگلاس ..به نظر میرسد نشتی از دو محل اتصال شلنگ به لوله و اتصال شلنگ به گرماتاب که فوق العاده خطرناک می باشد \nلطفا هرچه سریع تر رسیدگی کنید \nبا تشکر واحد انتظامات	401000123	t	3	ارسال به واحد فنی	5	38	11	t
269	دفتر مرکزی	فنی	2022-12-25 09:57:00.695025+03:30	نصب جا دستمال کاغذی سرویس بانوان دفتر مرکزی( داخل هر سرویس  )	401000248	t	1	ارسال به واحد فنی	3	72	14	t
253	دفتر مرکزی	فنی	2022-12-24 11:20:47.750404+03:30	شیر اب اشپزخانه پایین دفتر مرکزی	401000241	t	1	ارسال به واحد فنی	3	72	14	t
265	رول پرس	فنی	2022-12-25 08:31:07.654217+03:30	ساختن یک عدد دستگاه رول پرس با عرض 130 یا 140	401000247	t	3	ارسال به واحد فنی	3	23	1	t
276	سوله پرس طبقاتی	فنی	2022-12-28 07:01:38.418745+03:30	عایق کاری لوله های بخار داخل موترخانه	401000250	t	2	ارسال به واحد فنی	3	93	16	t
272	سوله پرس طبقاتی	فنی	2022-12-26 08:30:00.230909+03:30	اصلاح سیستم حرکتی سورتینگ	401000249	t	2	ارسال به واحد فنی	3	93	16	t
284	اره دیوالت	فنی	2022-12-31 13:46:31.446404+03:30	تعویض تیغ اره برش دیوالت	401000258	t	3	ارسال به واحد فنی	3	26	10	t
299	سوله پرس طبقاتی	فنی	2023-01-02 17:43:16.509491+03:30	نصب سه راهی و پریز جهت اتاق تولید	401000273	t	1	ارسال به واحد فنی	3	93	16	t
134	گرماتاب سالن هایگلاس	انتظامات	2022-11-21 08:38:38.624498+03:30	اعلام  نشتی زیاد گاز از گرماتاب سمت راست انتهای سالن هایگلاس ..به نظر میرسد نشتی از دو محل اتصال شلنگ به لوله و اتصال شلنگ به گرماتاب که فوق العاده خطرناک می باشد \nلطفا هرچه سریع تر رسیدگی کنید \nبا تشکر واحد انتظامات	401000124	t	3	ارسال به واحد فنی	5	38	11	f
256	لیفتراک 3/5 تن گازی	فنی	2022-12-24 13:08:16.611707+03:30	بالا پائین بودن شاخ های لیفتراک گازی سالن های گلاس،	401000244	t	3	ارسال به واحد فنی	3	12	10	f
225	لیفتراک 7 تن دیزل	فنی	2022-12-17 13:08:00.451968+03:30	تست	401000215	t	1	ارسال به واحد فنی	3	9	1	f
290	لیفتراک 3 تن دیزل	فنی	2023-01-02 07:57:12.84389+03:30	خرابی شیلنگ واسط ترمز	401000264	f	2	\N	3	10	4	t
277	سوله هایگلاس	فنی	2022-12-28 17:56:25.977444+03:30	<p>ساخت میز به قسمت بسته بندی های گلاس،</p>	401000251	t	3	ارسال به واحد فنی	3	40	10	t
317	دستگاه هایگلاس HESSAN	فنی	2023-01-05 08:44:48.876864+03:30	نشتی چسب از قسمت گوشواره روکار	401000291	t	3	ارسال به واحد فنی	3	2	10	t
325	دستگاه پشت کار	فنی	2023-01-17 13:17:51.708623+03:30	test order	01000298	t	2	SV	3	3	1	f
327	صندلی ، میز و تجهیزات اداری	فنی	2023-01-09 10:55:42.461532+03:30	پیچ صندلی اتاق مهمان دفتر مرکزی	401000298	t	2	DN	3	99	14	t
343	نور ، روشنایی و لامپ	فنی	2023-01-19 11:38:53.888606+03:30	درخواست اضافه کردن مهتابی به واحد فروش	401000325	t	3	SV	3	98	26	t
344	برش طولی	فنی	2023-01-19 13:07:21.204429+03:30	خرابی برش طولی	401000326	t	3	SV	3	21	8	t
330	لیفتراک 10 تن tcm	فنی	2023-01-14 14:58:23.383184+03:30	اسمبل کردن دکل و متعلقات	401000312	t	2	DN	3	96	4	t
348	دستگاه هایگلاس HESSAN	فنی	2023-01-09 08:41:24.683183+03:30	تعویض تسمه های رولیک جلوی دستگاه سلفون کش	401000315	t	2	SV	12	2	10	f
331	برش کلگی	فنی	2023-01-16 15:07:32.706258+03:30	تیغ اره تعویض گردد	401000316	t	2	DN	11	19	8	t
337	دستگاه هایگلاس HESSAN	فنی	2023-01-11 08:40:56.492323+03:30	نشتی روغن از سر شفت سیلیکون رو کار از قسمت توپی سر المنت	401000300	t	2	DN	12	2	10	t
356	دستگاه هایگلاس HESSAN	فنی	2023-01-22 08:50:38.636466+03:30	قسمت پرس روکار 1سانت لازم به جابجایی دارد	401000331	t	2	SV	3	2	7	t
332	اتاق تولید	فنی	2023-01-14 15:15:24.038887+03:30	نصب صفحه 70 به عنوان میز سرتاسری	401000308	t	2	DN	3	49	1	t
352	دفتر مرکزی	فنی	2023-01-21 09:52:46.77388+03:30	چراغ اتاق کنار حسابداری -اتاق مدیر عامل- بالای میز منشی	401000327	t	2	SV	3	72	14	t
308	دستگاه پشت کار	فنی	2023-01-04 10:03:01.952952+03:30	جابجا شدن گوشواره که توشیار سیلیکون قرار گرفته  درحین چرخش بیش از حد عقب جلو می‌شود، طرف دیوار	401000282	t	3	DN	3	3	10	t
333	دستگاه هایگلاس HESSAN	فنی	2023-01-09 15:57:12.7427+03:30	تعویض تسمه های رولیک جلوی دستگاه سلفون کش	401000299	t	2	DN	3	2	10	t
338	بخاری	تولید پرس طبقاتی	2023-01-11 10:44:14.843383+03:30	خرابی بخاری اتاق تولید	401000301	t	2	DN	13	97	16	t
166	گرماتاب سالن هایگلاس	فنی	2022-12-05 09:59:19.386109+03:30	جابجا کردن گرما تاب انتهای سالن قسمت پشتکار \r\n، انتقال به وسط سقف سالن، \r\nجای فعلی آن باعث تاب برداشتن ام دی اف پشتکار خورده میباشد (درقسمت دپو پشتکار)	401000156	t	3	DN	3	38	10	t
323	دستگاه هایگلاس HESSAN	فنی	2023-01-08 12:51:21.178403+03:30	نشتی چسب از قسمت گوشواره هر دو طرف،	401000297	t	2	DN	3	2	10	t
353	برش کلگی	فنی	2023-01-22 07:29:56.77762+03:30	تعویض تیغه برش طولی	401000328	t	3	SV	3	19	8	t
339	اور فرز 2	تولید	2023-01-12 10:51:25.433488+03:30	تعویض تیغه اور فرز	401000304	t	2	DN	12	28	10	t
340	تنونر	تولید	2023-01-11 11:10:25.563155+03:30	نشتی باد از کنار دستگاه تنونر	401000303	t	2	DN	12	22	10	t
341	دستگاه پست فرم 590	تولید	2023-01-11 11:19:00.739256+03:30	خرابی کلید المنت تکی بالای پست فرم	401000302	t	2	DN	12	14	10	t
351	میخ استوپ 1	صفحه کابینت 	2023-01-17 09:12:05.113998+03:30	تعمیر 3 عدد  میخ استوپ	401000318	t	2	SV	11	29	8	t
342	مکنده مرکزی سالن صفحه	تولید	2023-01-14 11:25:29.610062+03:30	مشکل در مکنده	401000311	t	2	DN	12	61	10	t
345	تنونر	تولید	2023-01-14 13:35:19.007965+03:30	بستن دور لوله مکنده مرکزی	401000309	t	2	DN	12	22	10	t
346	سوله انبار	دفتر مرکزی	2023-01-09 13:40:55.623496+03:30	بررسی لوله خروجی سقف سوله انبار	401000310	t	2	DN	10	41	14	t
347	سوله پرس طبقاتی	فنی	2023-01-16 08:34:49.168895+03:30	نصب روشنایی در موتورخانه	401000314	t	2	SV	13	93	16	t
349	لیفتراک 3 تن دیزل	تولید	2023-01-11 08:59:01.283895+03:30	نشتی روغن از زیر لیفتراک 3 تن سالن صفحه	401000315	t	2	SV	12	10	10	t
350	سوله پرس طبقاتی	سالن پرس طبقاتی	2023-01-17 09:06:53.601393+03:30	خرابی گرماتاب ها - ایجاد دوده در سالن - خام سوزی - بوی شدید گاز در سالن	401000317	t	2	SV	13	93	16	t
357	دفتر مرکزی	فنی	2023-01-22 11:22:54.315793+03:30	کنده شدن پی اس دی میز منشی	401000332	t	1	SV	3	72	14	t
326	رول پرس	فنی	2023-01-18 08:14:11.961994+03:30	خرابی چشمی باد دستگاه چسب زن رول پرس	401000319	t	3	SV	3	23	8	t
328	دستگاه پشت کار	فنی	2023-01-18 11:36:16.814704+03:30	پنچر گیری شفت رول باز کن pvc	401000320	t	2	DN	3	3	7	t
329	پرس گرم 3 طبقه	فنی	2023-01-18 14:25:09.838258+03:30	نشتی روغن یکی از شلنگهای پرس 3طبقه، نشتی آن رفع گردد	401000321	t	2	SV	3	7	7	t
334	دستگاه پست فرم 590	فنی	2023-01-18 21:01:21.110689+03:30	ساخت پایه برای خرک انتهای پست فوم	401000322	t	2	SV	3	14	8	t
335	دستگاه پست فرم 590	فنی	2023-01-19 07:52:10.359334+03:30	خذابی پیستوله وسط پست فوم	401000323	t	3	SV	3	14	8	t
336	برش طولی	فنی	2023-01-19 07:53:09.666737+03:30	خرابی شلنگ باد دستگاه برش طولی	401000324	t	2	SV	3	21	8	t
354	سوله پرس طبقاتی	فنی	2023-01-22 07:49:36.390652+03:30	نشتی باد از فیتینگ ها و تفنگی های باد	401000329	t	2	SV	3	93	16	t
355	سوله سالن صفحه	فنی	2023-01-22 07:57:29.636447+03:30	بتون کاری یک تیک از سالن صفحه	401000330	t	2	SV	3	32	8	t
358	دستگاه تانک چسب HESSAN	فنی	2023-01-22 11:42:01.992306+03:30	نشتی چسب از زیر بس آبی داخل بشکه	401000333	t	2	SV	3	1	7	t
359	دستگاه هایگلاس HESSAN	فنی	2023-01-22 13:26:04.244745+03:30	تعویض چرخ دنده شفت رول باز کن روکار	401000334	t	3	SV	3	2	7	t
360	اره دیوالت	فنی	2023-01-22 13:30:59.730392+03:30	تعویض تیغ اره برش دیوالت .	401000335	t	2	SV	3	26	8	t
361	دستگاه هایگلاس HESSAN	فنی	2023-01-23 07:54:57.115292+03:30	نزدیک کردن گونیا به ورق ها داخل اتاقک، فاصله ش بیش از حد می باشد	401000336	t	2	SV	3	2	7	t
\.


--
-- Data for Name: base_order_subGroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."base_order_subGroup" (id, order_id, subgroup_id) FROM stdin;
28	9	1
29	13	4
31	12	29
32	10	14
34	14	17
35	15	2
36	16	3
37	17	39
38	18	2
39	19	2
40	20	2
41	21	9
42	22	2
43	23	3
44	24	3
45	25	7
46	26	1
47	27	2
50	28	1
51	29	2
52	30	2
53	31	1
54	32	9
55	33	1
56	34	2
57	35	3
58	36	3
59	37	3
63	39	2
64	38	3
65	40	1
66	41	2
68	42	3
69	43	1
71	45	2
72	46	2
73	46	3
74	47	2
75	48	1
76	44	1
78	50	1
79	49	4
83	51	27
84	53	2
86	55	1
88	56	1
89	54	1
90	57	1
91	58	1
92	59	4
93	60	6
94	61	2
96	63	2
99	62	1
100	64	1
101	65	2
102	66	2
103	67	2
104	68	1
105	69	1
106	70	1
107	71	1
108	72	1
109	73	1
110	73	2
111	74	1
112	75	1
113	76	2
114	77	1
115	78	1
116	79	1
117	80	1
118	81	1
119	82	1
120	83	2
121	84	1
122	85	1
123	86	1
124	87	1
125	88	2
126	89	1
127	90	9
128	91	1
129	92	2
130	93	1
131	94	1
132	95	2
133	96	1
134	97	1
135	98	2
136	99	1
137	100	1
138	101	1
139	102	1
140	103	2
141	104	1
142	105	1
143	106	2
144	107	2
145	108	2
146	109	1
147	110	1
148	111	1
149	112	2
151	113	1
152	114	2
153	115	9
154	116	2
155	117	4
156	118	4
157	119	3
158	120	2
159	121	2
160	122	6
161	123	1
162	124	6
163	125	1
164	126	1
165	127	6
166	128	1
168	130	1
169	129	47
171	132	6
172	131	1
173	133	3
174	134	3
175	135	2
176	136	1
177	137	1
178	138	1
179	139	1
180	140	2
181	141	9
182	142	1
183	143	1
184	144	1
185	145	1
186	146	2
187	147	1
188	148	1
189	149	1
190	150	2
191	151	1
192	152	3
193	152	4
194	153	1
195	154	1
196	155	1
197	156	1
199	158	1
200	159	1
201	160	2
202	161	1
203	162	1
204	157	2
205	163	2
206	164	2
207	165	2
208	166	1
209	167	2
210	168	1
211	169	1
212	170	2
213	171	2
214	172	1
215	173	1
216	174	1
217	175	1
218	175	3
219	176	1
220	177	3
221	178	1
222	179	4
223	180	9
224	181	6
225	182	1
228	183	2
229	184	1
230	185	1
231	186	3
232	187	2
233	188	1
234	189	1
235	190	1
236	191	1
237	192	1
238	193	1
239	194	2
240	195	1
242	196	1
243	197	1
244	198	1
245	199	6
246	216	3
247	217	2
248	218	1
249	219	1
250	220	1
251	221	1
252	222	1
253	223	2
254	224	1
255	225	1
256	226	1
257	227	1
258	228	1
259	229	1
260	230	4
261	231	1
262	232	1
263	232	6
264	233	1
265	234	4
266	235	3
267	236	2
268	237	2
269	238	1
270	239	4
271	240	1
272	241	2
273	242	3
274	243	3
275	244	1
276	245	1
277	246	1
278	247	1
279	248	1
280	249	1
282	252	1
283	253	3
284	254	2
285	255	4
286	256	1
287	257	2
288	258	1
289	265	4
290	269	3
291	272	1
292	276	1
293	277	1
294	278	1
295	279	2
296	280	4
297	281	1
298	282	1
299	283	2
300	284	1
301	284	6
302	285	2
303	286	1
304	298	1
305	299	2
306	300	2
307	301	1
308	302	1
309	303	2
310	304	2
311	305	1
312	306	6
313	307	1
314	308	1
315	309	1
316	310	1
317	311	3
318	312	4
319	313	3
320	314	4
321	315	2
322	316	6
323	317	1
324	318	1
325	319	1
326	320	3
327	321	1
328	322	4
329	323	1
330	325	3
331	325	16
332	326	2
334	328	1
335	329	1
336	330	1
337	331	6
338	332	4
339	333	1
340	334	1
341	335	1
342	336	1
343	337	1
344	338	3
345	339	1
346	339	7
347	340	1
348	341	2
349	342	1
350	343	2
351	344	2
352	345	1
353	346	3
354	327	3
355	347	2
356	348	1
357	349	1
358	350	1
359	351	1
360	352	3
361	353	6
362	354	1
363	355	1
364	356	1
365	357	3
366	358	1
367	359	1
369	360	6
370	361	1
\.


--
-- Data for Name: base_repairoperator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_repairoperator (id, operator_id) FROM stdin;
\.


--
-- Data for Name: base_subgroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_subgroup (id, name) FROM stdin;
1	مکانیک
2	برق
3	تأسیسات
4	ساخت
5	تعویض سیلیکون
6	تعویض تیغ اره 
7	تعویض تیغچه
8	تعویض روغن
9	بازدید
10	تعویض غلطک پست فرم
11	تعویض المنت
12	نازل چسب
13	غلطک کروم
14	دینام و گیربکس
15	تابلو برق
16	میز خرک
17	کفشک 
18	کیسه مکنده
19	مکنده
20	بلبرینگ
21	فرچه
22	غلطک لاستیکی
23	استارت
24	باطری
25	تسمه
26	گوشواره
27	شفت رول بازکن
28	گیربکس
29	دینام
30	پیستوله
31	روشنایی
32	زنجیر
33	کلید و شستی 
34	فیتینگی و شلنگ باد
35	جرثغیل
36	سیم بکسل
37	ریل نواری
38	چرخ و لاستیک
39	روغن ریزی
40	مترینگ
41	هیدرولیک
42	المنت میله ای
43	روتاری
44	سنسور
45	فن هواکش
46	کولر گازی
47	شیرآلات
48	جک پنوماتیک
\.


--
-- Data for Name: base_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_task (id, description, description2, date, start_time, end_time, hours, order_id, user_id, publish, operator_id, status) FROM stdin;
188	تعویض لامپ و سرلامپ بزرگ جهت بالای سر دستگاه پست فرم انجام شد 	لامپ 85 وات و سرپیچ بزرگ	2022-12-24	11:50:00	12:35:00	\N	254	4	t	\N	SV
292	نصب و راه اندازی موتور لیفتراک 3تن - نصب و هواگیری پمپ کلاچ - باز و بست پمپ ترمز لیفتراک 3 تن توسط تعمیر کار انجام شد .\r\nلیفتراک تحویل سالن گردید	شیلنگ واسط ترمز لیفتراک	2023-01-02	07:35:00	19:00:00	\N	55	4	t	\N	SV
311	تعمیر 3 عدد دستگاه میخ استوپ سالن صفحه پرس دوبل	1عدد سنبه	2023-01-05	07:30:00	08:50:00	\N	309	4	t	\N	SV
320	با سفت کردن لامپ مشکل حل شد	.	2023-01-07	09:00:00	09:10:00	\N	315	4	t	\N	SV
301	نصب دو عدد لامپ 60 وات استوک انجام شد	دوعدد لامپ 60 وات 	2023-01-04	12:00:00	01:00:00	\N	300	4	t	\N	SV
171	تست	تست	2022-12-19	12:00:00	12:00:00	\N	225	4	f	\N	SV
293	طبق شرح درخواست 401000046 انجام شد	.	2023-01-02	08:00:00	19:00:00	\N	115	4	t	\N	SV
303	سوراخ کاری جهت نصب لوله بخاری و نصب یک و نیم متر لوله بخاری در دفتر مدیریت انجام شد . نصب بخاری اتاق امور مالی نیز انجام گردید	یک و نیم متر لوله بخاری و یک عدد زانویی و دو متر شیلنگ و دوعدد بست و کلاهک و تست انجام شد	\N	\N	\N	\N	291	4	t	\N	SV
302	سوراخ کاری جهت نصب لوله بخاری و نصب یک و نیم متر لوله بخاری در دفتر مدیریت انجام شد . نصب بخاری اتاق امور مالی نیز انجام گردید	یک و نیم متر لوله بخاری و یک عدد زانویی و دو متر شیلنگ و دوعدد بست و کلاهک و تست انجام شد	2023-01-04	10:00:00	14:00:00	\N	291	4	t	\N	SV
312	بازدید انجام شد و اتصالی وجود نداشت . توضیحات لازم در مورد کارکردن با چای ساز داده شد .	.	2023-01-04	09:30:00	09:50:00	\N	285	4	t	\N	SV
274	کابل کشی و سربندی و نصب سرپیچ و یک عدد لامپ 60 وات جهت انبار قطعات (انتهای انبار ) انجام شد .	2متر کابل 2*2.5 - 1عدد سرپیچ و لامپ استوک	2022-12-31	08:00:00	09:50:00	\N	279	4	t	\N	SV
285	سیم کشی و سربندی میکروسوئیچ و شیربرقی نصب شده برروی دستگاه رولیک قبل سلفون کش	2متر سیم 2.5*1 - سه عدد وایرشو - نیم متر فلکسی 16	2023-01-03	07:30:00	08:30:00	\N	293	4	t	\N	SV
294	.	.	2023-01-03	12:00:00	13:00:00	\N	304	4	t	\N	SV
304	نصب شیر برقی و میکرو سوییچ و لوله کشی باد انجام شد	9متر لوله ppسایز دو /رابط بوشن دوعدد / سه راهی دو عدد /زانویی چهار عدد/بوشن داخل رزوه دو عدد /فیتینگی چهار راه یک عدد/تبدیل فیتینگی 10به12یک عدد/شیر برقی یک عدد/میکروسوییچ یک عدد /لوله ppسوراخ کاری شده دوعدد 130 سانتی	2022-12-31	08:00:00	17:00:00	\N	293	4	t	\N	SV
313	بازدید انجام شد . با پیمانکار لوله کشی گاز مشورت گردید و به نظر این واحد مدل لوله کشی گاز و استفاده پیمانکار بعد از لوله کشی گاز مشعل بویلر ادامه لوله کشی سالن اشتباه بوده و باعث کم شدن فشار گاز و قطع شدن رگولاتور میگردد . در مرخ 15/10/1401 پیمانکار جهت بازدید به کارخانه مراجعه می نماید	.	2023-01-04	14:30:00	15:00:00	\N	310	4	t	\N	SV
275	تکراری	.	2023-01-02	12:00:00	12:05:00	\N	287	4	t	\N	SV
286	برش کاری و جوش کاری و نصب پایه جهت تسمه های داخل انبار قطعات	4عدد الکترود - قوطی 2*2 - 2عدد صفحه استیل بر	2023-01-02	11:50:00	12:35:00	\N	280	4	t	\N	SV
295	تنظیم گونیای رولیک های انتقال صفحه قبل از چسب زن روکار انجام شد 	0	2023-01-03	15:45:00	16:30:00	\N	302	4	t	\N	SV
305	بخشی از عایق کاری لوله بخار انجام شد	پشم سنگ	2022-12-29	09:00:00	13:00:00	\N	276	4	t	\N	SV
314	باز کردن دینام و متعلقات اره برش طولی. عیب یابی و تنظیم بلبرینگ مربوط به شفت نگه دارنده تیغه که جابه جا شده بود  . نصب و راه اندازی و تست انجام شد.تعویض تسمه بعلت فرسودگی انجام شد 	سه عدد تسمه a25	2023-01-05	12:00:00	18:50:00	\N	319	4	t	\N	SV
128	تنظیم بیمتال دمنده انجام شد	.	2022-11-30	08:00:00	08:20:00	\N	150	4	t	\N	SV
276	تکراری	.	2023-01-02	12:00:00	12:05:00	\N	288	4	t	\N	SV
287	تعویض سنبه میخ استوپ هایگلاس بدلیل شکستگس سنبه انجام شد	1 عدد سنبه بلند	2023-01-02	08:00:00	08:10:00	\N	295	4	t	\N	SV
296	در حال حاضر امکان پذیر نمی باشد	0	2023-01-03	12:00:00	13:00:00	\N	214	4	t	\N	SV
306	بازدید انجام شد و باید با حضور سرپرست سالن پرس تنظیم انجام شود.	.	2022-12-26	12:00:00	12:30:00	\N	252	4	t	\N	SV
315	تعویض تیغه برش طولی انجام شد 	یک عدد تیغه تیز شده	2023-01-05	10:30:00	10:40:00	\N	316	4	t	\N	SV
151	تعویض 7عدد تیغه 18 سانتی کند شده برش خلال کن	7عدد تیغه تیز شده	2022-12-07	15:45:00	17:30:00	\N	181	4	t	\N	SV
153	تعویض هر دو فیلتر تسویه آب دستگاه 	دو عدد فیلتر پنبه‌ای 	2022-12-11	14:20:00	14:48:00	\N	177	17	t	\N	SV
277	تکراری	.	2023-01-02	12:00:00	12:05:00	\N	289	4	t	\N	SV
288	با شرکت مربوطه هماهنگ شد و سرویس دستگاه توسط تعمیرکار مجاز شرکت مربوطه انجام شد 	جک اره 	2022-12-21	09:00:00	17:00:00	\N	305	4	t	\N	SV
297	بازدید انجام شد . بلبرینگ های نگه دارنده موتور خراب می باشد  و در اولین فرصت تعویض میشود .	.	2023-01-04	10:00:00	10:35:00	\N	307	4	t	\N	SV
316	نصب سه راهی محافظ جهت میز سرپرست سالن پرس انجام شد و مشکل رفع گردید	یک عدد پیچ ام دی اف	2023-01-05	14:00:00	14:35:00	\N	299	4	t	\N	SV
186	تنظیم کردن تیغه دستگاه برش دیوالت	.	2022-12-18	15:45:00	16:50:00	\N	233	4	t	\N	SV
195	تعمیر کوپلینگی انجام شد	.	2022-11-29	12:00:00	13:00:00	\N	147	4	t	\N	SV
278	تهیه و نصب شیلنگ واسط ترمز لیفتراک 3تن انجام شد	شیلنگ واسط ترمز لیفتراک	2023-01-01	17:00:00	18:00:00	\N	290	4	t	\N	SV
289	 ساخت میز چوبی جهت بسته بندی های گلاس انجام شد و تحویل سالن گردید 	3عدد ام دی اف 100*144 -  15 عدد پیچ ام دی اف 3سانتی - 1عدد فوم 103*144	2023-01-03	09:00:00	11:00:00	\N	277	4	t	\N	SV
298	بازدید انجام شد . بعد از توقف دستگاه تعمیرات اجرا میشود	.	2023-01-04	10:20:00	10:45:00	\N	308	4	t	\N	SV
308	اندازه گیری انجام شد . لوازم مورد نیاز در صورت نبودن در لوازم استوک درخواست خرید داده خواهد شد .	.	2023-01-04	09:00:00	09:30:00	\N	314	4	t	\N	SV
317	تیغه تعویض شد	تیغه برش	2023-01-03	16:00:00	19:00:00	\N	306	4	t	\N	SV
227	دکل باز شد و بررسی شد بلبرینگ های دکل مورد داشتن و درحال اقدام جهت رفع مشکل هستیم	.	2022-12-26	09:00:00	12:00:00	\N	245	4	t	\N	SV
290	تنظیم پارامتر مرجع تغییر فرکانس بر روی کلید افزایش و کاهش انجام شد و مشکل تغییر سرعت حل شد .	.	2023-01-03	11:50:00	12:30:00	\N	303	4	t	\N	SV
299	.	..	2023-01-05	12:00:00	13:00:00	\N	302	4	t	\N	SV
272	تکراری 401000123	.	\N	\N	\N	\N	134	4	f	\N	SV
12	درخواست تکراری	هیچ	2022-09-04	08:00:00	08:30:00	\N	20	4	f	\N	SV
15	درخواست تکراری	هیچ	2022-09-04	12:00:00	13:00:00	\N	19	4	f	\N	SV
16	درخواست تکراری	هیچ	2022-09-04	12:00:00	12:55:00	\N	18	4	f	\N	SV
279	تهیه و نصب شیلنگ واسط انجام شد	شیلنگ واسط	2023-01-01	17:00:00	18:00:00	\N	292	4	t	\N	SV
19	یک عدد شیلنگ پشتی لیفتراک که نشتی روغن داشت  و یکی از جک های دکل تعمیر شد و روغن ریزی بطور کامل رفع شد فقط نشتی شیرهای لیور های لیفتراک در موقع مناسب باید حل شود  	ارسالی به تعمیرگاه	2022-09-04	15:00:00	16:00:00	\N	9	4	t	\N	SV
14	شیشه بالای درب برداشته شد تا هوا راحتر ورود و خروج کند 	بدون لوازم	2022-09-04	12:00:00	13:00:00	\N	20	4	t	\N	SV
20	تعویض بلبرینگ ها و روان‌کاری ریل ها	بلبرینگ	2022-09-06	10:00:00	11:00:00	\N	26	4	t	\N	SV
6	بازدید انجام شد .بعداز اتمام کار سالن تعمیرات اعمال میشود 	فعلا نه	2022-09-01	08:55:00	09:00:00	\N	17	4	t	\N	SV
7	فیلتر هوا تمیز شد و روغن ریزی از اطراف گیربکس رفع شد	چسب مزدا	2022-09-01	10:30:00	11:00:00	\N	17	4	t	\N	SV
8	برق کشی و کابل کشی شبکه و سیم کشی دوربین مداربسته ومرتب سازی سیم ها 	سوکت شبکه یک عدد و داکت 2متر 	2022-09-01	08:00:00	15:00:00	\N	15	4	t	\N	SV
9	بدلیل خاموش بودن کلید های بانک خازنی این اتفاق رخ داده که مشکل برطرف شد 	بدون لوازم	2022-09-03	09:00:00	09:20:00	\N	22	4	t	\N	SV
10	اتمام مراحل قبل 	لوازم قبل	2022-09-03	08:00:00	12:00:00	\N	15	4	t	\N	SV
11	تعویض لوله تخلیه اب	چسب 	2022-09-03	11:00:00	13:00:00	\N	23	4	t	\N	SV
21	درب دینام سفت شد 	هیچ	2022-09-05	10:00:00	10:20:00	\N	12	4	t	\N	SV
29	کنده کاری شد و دوباره بتن ریخته شد	سیمان و ماسه	2022-09-11	14:00:00	17:00:00	\N	37	4	t	\N	SV
17	سوراخ کاری دیوار و تعویض شیلنگ گاز	شیلنگ گاز 3متر	2022-09-01	11:00:00	00:00:00	\N	16	4	t	\N	SV
22	پین بریده شده اصلاح شد	سیم جوش 70184عدد	2022-09-07	14:00:00	15:00:00	\N	28	4	t	\N	SV
23	شل بودن پایه رله 	پایه رله	2022-09-08	08:00:00	08:10:00	\N	27	4	t	\N	SV
24	تعمیر کردن پایه نگهدارنده المنت و تعویض کردن المنت های معیوب	المنت پستفورم	2022-09-08	13:00:00	15:00:00	\N	29	4	t	\N	SV
25	تعویض تیغه 	تیغه تنونر	2022-09-07	09:00:00	10:30:00	\N	25	4	t	\N	SV
26	رفع عیب آمپر کشیدن یکی از مدار های برق 	کلید مینیاتوری	2022-09-08	12:00:00	13:00:00	\N	30	4	t	\N	SV
27	باز کردن و تمیز کردن لوله ها و باد گرفتن فرچه ها 	بدون وسیله	2022-09-11	08:00:00	10:00:00	\N	32	4	t	\N	SV
28	تنظیم شد 	بدون لوازم	2022-09-11	09:00:00	10:00:00	\N	33	4	t	\N	SV
30	رفع عیب تلفن	بدون لوازم	2022-09-12	10:00:00	11:00:00	\N	39	4	t	\N	SV
32	سرویس کلی انجام شد 	شیلنگ فشار قوی و گیج و سوپاپ اطمینان و تعویض لوله مکش چسب 	2022-09-18	08:00:00	13:00:00	\N	31	4	t	\N	SV
33	نصب دستگیره	دستگیره	2022-09-16	09:30:00	10:00:00	\N	21	4	t	\N	SV
34	تعویض سمبه	سمبه	2022-09-12	09:00:00	09:30:00	\N	36	4	t	\N	SV
35	کفشک نصب شد \r\nروان‌کاری قسمت‌های مربوطه	۴عدد کفشک	2022-09-07	16:00:00	19:00:00	\N	14	4	t	\N	SV
36	بدلیل نشتی خیلی خیلی کم درحد نمناک شدن جک بود که فعلا لازم به تعمیر نیست	بدون لوازم	2022-09-19	12:00:00	12:20:00	\N	40	4	t	\N	SV
264	با سازنده جهت بازدید هماهنگ شد	.	2022-12-19	12:00:00	12:20:00	\N	230	4	t	\N	SV
265	جهت بازدید نصاب بویلر هماهنگ شد	.	2022-12-07	12:00:00	20:00:00	\N	176	4	t	\N	SV
266	ساخت دو عدد میز  به ارتفاع 88و طول 3.40 با پایه ساخته شد شامل برش کاری و جوشکاری و رنگ آمیزی 	10عدد قوطی 40*60و 5شاخه40*40 و 16عدد پایه شماره 20	2022-12-20	07:00:00	19:00:00	\N	278	4	t	\N	SV
267	بستن  پیچ های صفحه پرس سه طبقه هایگلاس.\r\nبرش کاری و جوشکاری قوطی های نگه دارنده صفحه کرم.	25 عدد پیچ - 25 عدد واسطه - 3 عدد الکترود	2022-12-29	07:50:00	09:35:00	\N	126	4	t	\N	SV
268	باز کردن فیلتر و تعویض فیلتر و بستن فیلتر و شیلنگ نازل	1 عدد فیلتر	2022-12-29	09:50:00	14:25:00	\N	246	4	t	\N	SV
269	تعمیر کلید سلکتوری المنت تکی بالا انجام شد	.	2022-12-31	17:00:00	17:20:00	\N	283	4	t	\N	SV
203	تعویض انجام شد	غلطک سیلیکونی	2022-10-30	03:00:00	07:00:00	\N	91	4	t	\N	SV
270	تعویض تیغ اره کند شده برش دیوالت انجام شد .	تیغ اره تیز شده	2022-12-31	15:45:00	16:20:00	\N	284	4	t	\N	SV
309	رید نشده تا نصب گردد. به محض خرید نصب خواهد شد	/	2023-01-04	11:00:00	11:10:00	\N	313	4	t	\N	SV
18	ساخت شاسی و سوراخ کاری جای یاتاقان \r\nدرخواست لوازم تکمیلی \r\nتغیرات روی غلط کرم اعمال شد و به تراشکاری فرستاده شده\r\nتابلو برق دستگاه نسبتا تکمیل شده 	اینورتر 2عدد\r\nپروفیل 4*6 12متر\r\nناودانی سایز8   .....1/5متر\r\n	2022-09-18	08:00:00	19:00:00	\N	13	4	t	\N	SV
37	مشکل برق و بانک خازن بود که حل شد	تعمیر کردن رگولاتور بانک خازن	2022-09-20	10:00:00	12:00:00	\N	41	4	t	\N	SV
38	نصب انجام شد	بدون لوازم	2022-10-01	10:00:00	11:00:00	\N	38	4	t	\N	SV
39	نصب انجام شد	بدون لوازم	2022-10-01	10:00:00	11:00:00	\N	38	4	t	\N	SV
40	تعویض تیغه انجام شد	تیغه دیوالت	2022-09-20	10:00:00	10:30:00	\N	42	4	t	\N	SV
41	مشکل برقی داشت که رفع شد	بدون لوازم	2022-09-21	11:15:00	12:05:00	\N	45	4	t	\N	SV
42	مشکل در آمدن یکی از فنرهای متصل به دستگاه بود رفع شد	بدون لوازم	2022-09-28	13:00:00	14:30:00	\N	46	4	t	\N	SV
43	تعویض سنسور انجام شد	سنسور 	2022-09-22	09:00:00	09:20:00	\N	47	4	t	\N	SV
44	نشتی انچنان ندارددرحد نمناک کردن شفت جک که نیاز به تعمیر ندارد 	هیچ	2022-09-20	12:00:00	13:00:00	\N	44	4	t	\N	SV
46	کاسه نمد تعویض شد	کاسه نمد 	2022-09-21	10:00:00	10:30:00	\N	48	4	t	\N	SV
13	بدلیل نداشتن قطعه معیوب درخواست خرید زده شده / تکمیل شد\r\n	پکینگ داخل پیستون	2022-09-05	08:00:00	08:22:00	\N	24	4	t	\N	SV
47	شل بودن درب موتور بود که باعث ایجاد صدا میشد	بدون لوازم	2022-09-01	09:00:00	09:20:00	\N	10	4	t	\N	SV
45	دستگاه تنظیم شد و محکم به زمین بلت شد	هیچ	2022-09-21	10:00:00	10:30:00	\N	43	4	t	\N	SV
48	سوراخکاری و جابجایی انجام شد 	رول پلاک 4 عدد	2022-10-11	09:00:00	09:30:00	\N	49	4	t	\N	SV
49	ریگلاژ کردن درب و روغنکاری لولا	هیچ	2022-10-11	11:20:00	11:45:00	\N	50	4	t	\N	SV
5	بدلیل زمان بر بودن تعمیرات زمان تحویل لیفتراک به واحد فنی به عهده انبار می‌باشد قطعه معیوبی جهت تعمیر باید به بیرون از سازمان انتقال داده  شود . زمان تعمیر 3 روز می باشد\r\nشیر لیور لیفتراک بطور کامل باز شد و جهت سرویس کلی به تعمیرگاه ارسال شد \r\nو اکسل عقب لیفتراک بطور کامل به تعمیرگاه ارسال شد \r\nکلیه شیلنگ های لیفتراک تعویض شد 	فاکتورها پیوست شده 	2022-10-12	07:00:00	19:05:00	\N	9	4	t	\N	SV
50	تعمیر شد	بدون لوازم\r\n	2022-10-15	02:00:00	07:00:00	\N	51	4	t	\N	SV
51	رادیاتور تعویض شد تنظیمات برقی و سوختی  انجام شد 	رادیاتور	2022-10-15	12:00:00	16:00:00	\N	56	4	t	\N	SV
52	درخواست تکراری میباشد ودر حال انجام تعمیرات میباشد از طریق درخواست اقای پایداری پیگری میشود	بدون لوازم	2022-10-18	09:00:00	10:00:00	\N	56	4	t	\N	SV
59	تعویض تیغ اره نئوپان بر جهت برش طولی انجام شد	تیغه اره نئوپان بر	2022-10-19	14:30:00	14:40:00	\N	60	4	t	\N	SV
54	درب خریداری شد و نصب گردید 	درب چوبی 	2022-10-19	07:00:00	11:00:00	\N	59	4	t	\N	SV
55	بازدید انجام شد .سیبک خراب و خوردگی دارد و سوراخ سرشفت جک اکسل لوبیایی شده و باید بوش زده شود	.	2022-10-17	09:45:00	10:30:00	\N	54	4	t	\N	SV
53	رادیاتور تعویض شد و درهنگام تست کردن متوجه کمپرس موتور شدیم که موتور لیفتراک و پمپ هیدرولیک و جک دکل توسط تعمیرکار اقای غلامی باز شده و به تراشکاری به بیرون از کارخانه انتقال داده شد تا تعمیرات بروی موتور انجام شود 	فعلا بدون لوازم	2022-10-16	08:00:00	06:00:00	\N	55	4	t	\N	SV
60	سوراخ کاری و نصب کلید استوپ استارت\r\nنصب کنتاکتور\r\nسیم کشی فرمان و اصلاح سیم کشی قدرت انجام گردید .	 1 عدد کنتاکتور 25 آمپر 220 ولت\r\n2.5 متر سیم سایز 4\r\n1 عدد کلید استوپ استارت استوک\r\n6عدد وایرشو سایز 4\r\n20 عدد وایر شو 0.75	2022-10-22	10:00:00	15:00:00	\N	65	4	t	\N	SV
57	تعمیرات تکمیل شد 	طبق بالا	2022-10-16	09:00:00	13:00:00	\N	53	4	t	\N	SV
56	تعمیرات و کلیه کارهای مربوطه انجام شد 	میکروسوییچ 220 ولت و سیم پیچ کردن ترانس و تعویض شیلنگ اصلی 5متر	2022-10-15	08:00:00	11:00:00	\N	53	4	t	\N	SV
58	تعویض یک عدد المنت به علت شکستگی و تعمیر دو عدد المنت بعلت سولفاته شدن سر سیم و قطع شدن سیم آن.	یک عدد المنت یک متری شیشه ای 2300 وات	2022-10-19	13:00:00	17:00:00	\N	61	4	t	\N	SV
61	تعویض شیلنگ هیدرولیک و شارژ روغن انجام شد	70 سانتیمتر شیلنگ هیدرولیک\r\n4 لیتر روغن هیدرولیک	2022-10-22	08:00:00	09:15:00	\N	64	4	t	\N	SV
62	تعویض سرپیچ بعلت خرابی انجام شد	1عدد سرپیچ سایز کوچک استوک	2022-10-22	16:00:00	16:30:00	\N	63	4	t	\N	SV
63	نظافت و چسب کاری سرشفت کرم پشت کار انجام شد .	چسب حرارتی\r\nنوارتفلون	2022-10-22	09:30:00	11:00:00	\N	62	4	t	\N	SV
64	خرید لوازم مربوط به موتور شامل میل لنگ و ... انجام شد	لوازم موتور	2022-10-22	12:00:00	13:00:00	\N	55	4	t	\N	SV
65	تعویض میکروسوئیچ ابتدای برش اچ پی ال بدلیل خرابی آن انجام گردید	یک عدد میکروسوئیچ فنر دار 	2022-10-22	05:15:00	05:20:00	\N	67	4	t	\N	SV
66	جوشکاری خرک برش نایلون انجام گردید .	5 عدد الکترود 2.5	2022-10-23	08:20:00	08:50:00	\N	69	4	t	\N	SV
67	دو عدد المنت 2300 وات جایگزین المنت 1000 وات معیوب گردید	دو عدد المنت 2300 وات	2022-10-29	17:00:00	17:45:00	\N	83	4	t	\N	SV
68	سوراخ کاری زمین جهت نصب میلگرد به پایه خرک زمینی ( رولیک )\r\nجوشکاری میلگرد های 30 سانتی به پایه خرک های زمینی	الکترود 2.5 به تعداد 15 عدد\r\n4 عدد میلگرد سایز 12  (30سانتی )\r\n1 عدد صفحه استیل بر مینی سنگ	2022-10-24	12:00:00	14:00:00	\N	71	4	t	\N	SV
69	نازل دستگاه گرفتگی داشت که باز شد\r\nسری نازل گرفتگی داشت که باز شد	.	2022-10-27	08:00:00	13:00:00	\N	73	4	t	\N	SV
71	دینام را آزاد کرده و فرچه سر دینام را باز کرده و فرچه نو جایگزین شد .\r\n\r\nاپراتور تعمیرات : ابراهیمی	فرچه پارچه ای	2022-10-29	12:00:00	12:05:00	\N	72	4	t	\N	SV
70	دینام را آزاد کرده و فرچه سر دینام را باز کرده و فرچه نو جایگزین شد .\r\n\r\nاپراتور تعمیرات : ابراهیمی	فرچه پارچه ای	2022-10-29	12:00:00	12:05:00	\N	72	4	t	\N	SV
72	تیغه تعویض گردید	تیغه ام دل لف بر تیز شده	2022-10-27	09:00:00	10:00:00	\N	81	4	t	\N	SV
73	تعویض تیغه و تمیز کاری\r\n\r\nاپراتور تعمیرات : ابراهیمی	12 عدد تیغه 32 میل	2022-10-26	08:00:00	09:00:00	\N	78	4	t	\N	SV
74	آقای غلامیان ( تعمیر کار لیفتراک ) جهت سرویس و تعمیر  پمپ گازوئیل به کارخانه آمد .	سرویس پمپ	2022-10-29	08:00:00	09:00:00	\N	84	4	t	\N	SV
75	جهت تعمیر به بیرون از شرکت ارسال شد	بدون لوازم 	2022-10-30	09:00:00	09:30:00	\N	86	4	t	\N	SV
140	جابجا کردن لامپ بالاسر تنونر و نظافت آن انجام شد	.	2022-12-05	13:00:00	13:20:00	\N	167	4	t	\N	SV
168	بازدید انجام شد . گرماتاب مشکلی ندارد و مشکل فشار گاز شهری است \r\n	.	2022-12-12	09:45:00	11:00:00	\N	204	4	t	\N	SV
76	سرویس جت پرینتر شامل شستشو و تعویض مرکب و ... توسط تعمیرکار در  بیرون از شرکت انجام شده است . 	مرکب	2022-10-30	13:00:00	13:05:00	\N	90	4	t	\N	SV
77	تعویض یک عدد المنت 2300 وات و اصلاح و مرتب کردن سیم بندی انجام گردید .	یک عدد المنت 2300 وات	2022-10-30	16:00:00	18:50:00	\N	83	4	t	\N	SV
78	باز کردن قاب دینام توپی شماره 2 دستگاه تنونر که بعد از باز کردن یک قطعه فلزی داخل قاب پیدا شد .\r\nاپراتور تعمیر : ابراهیمی	.	2022-10-30	12:20:00	12:35:00	\N	77	4	t	\N	SV
79	تعویض 10 عدد غلطک فشاری ریل پست فرم انجام شد .\r\nاپراتور تعمیرات : ابراهیمی	10 عدد غلطک 	2022-10-30	15:45:00	16:20:00	\N	89	4	t	\N	SV
80	تعویض تیغه تیز شده برش دیوالت انجام شد . \r\nاپراتور تعمیرات : ابراهیمی	یک عدد تیغه تیز شده	2022-10-30	09:25:00	09:40:00	\N	87	4	t	\N	SV
81	تعمیر کلید امرجنسی ابتدای دستگاه رول پرس انجام شد .\r\nاپراتور تعمیر : ابوالهادی	.	2022-10-30	13:00:00	13:10:00	\N	88	4	t	\N	SV
82	تعمیر خشاب دستگاه میخ استوپ واحد پرس دوبل انجام شد\r\nعلت خرابی : گیر کردن خشاب	.	2022-10-31	11:10:00	11:20:00	\N	93	4	t	\N	SV
83	تعویض قاب کنترل دستی جرثقیل و نصب دو عدد شستی استوپ استارت و سربندی و تست انجام گردید .	یک عدد باکس دو خانه\r\nدو عدد شستی استوپ استارت استوک	2022-11-02	13:25:00	14:05:00	\N	98	4	t	\N	SV
84	تعویض زنجیر بعلت خرابی آن انجام شد .	40 سانت زنجیر سایز 40 --\r\n1 عدد قفل زنجیر سایز 40--	2022-11-02	12:30:00	01:00:00	\N	97	4	t	\N	SV
85	تعویض تیغه تیز شده جهت دستگاه برش طولی انجام شد .	یک عدد تیغه تیز شده نئوپان بر	2022-11-02	16:00:00	16:10:00	\N	96	4	t	\N	SV
86	نصب دو عدد پریز و یک عدد کلید برای پنکه سقفی و اصلاح سیم کشی آن ها  - حذف داکت و پریز فرسوده - نصب باکس جهت سوئیچ شبکه - نصب 3شاخه داکت و مرتب کردن سیم های تلفن و شبکه و کابل برق - ساخت و نصب باکس جهت پایه تلفن	یک عدد باکس 10*15- یک عدد کلید تک پل صنعتی روکار - دو عدد پریز صنعتی روکار استوک - 2 شاخه داکت 4 سانت- 25 عدد بست کمربندی 30سانت - 10 عدد پیچ و رول پلاک چهار سانت 	2022-11-05	07:30:00	15:00:00	\N	95	4	t	\N	SV
87	نصب هرزه گرد و زنجیر سفت کن و تنظیم چرخ دنده ها	.	2022-11-05	13:00:00	14:00:00	\N	100	4	t	\N	SV
88	تعویض رولیک معیوب انجام شد .	یک عدد رولیک 50سانت 	2022-11-03	14:00:00	14:10:00	\N	99	4	t	\N	SV
89	سرویبس کامل پمپ گازوییل تعویض لوازم ان 	فاکتور پیوست شد  	2022-11-06	12:25:00	12:40:00	\N	55	4	t	\N	SV
90	خرید واشر سینی بغل و تعویض ان 	واشر سینی بغل 	2022-11-06	12:46:00	15:00:00	\N	101	4	t	\N	SV
91	تعویض دو دست تیغه توپی 48 میل تنونر انجام شد	دو دست تیغه توپی 48 میل	2022-11-07	14:00:00	13:45:00	\N	102	4	t	\N	SV
92	چک کردن سالم بودن سیم تلفن انجام شد .\r\nریست سانترال انجام شد و مشکل مرتفع گردید .	.	2022-11-08	07:40:00	08:00:00	\N	103	4	t	\N	SV
93	بدون ایراد سرویس شد و برگشت شد.	.	2022-11-10	12:00:00	12:05:00	\N	86	4	t	\N	SV
94	تعویض تیغه کند شده	تیغه تیز شده	2022-11-09	14:00:00	14:20:00	\N	109	4	t	\N	SV
95	کاسه چرخ به تراشکاری ارسال گردید . پین های پایه فنر بعلت شکستگی به تراشکاری ارسال شد . وسایل کامل چرخ جلو تعویض شد به همراه پیستون ترمز لنت ها جهت کوبیدن لنت به بیرون از شرکت  ارسال شد . 	پک کامل ترمز .\r\nلنت ترمز . \r\nپیستون ترمز	2022-11-09	21:00:00	17:00:00	\N	104	4	t	\N	SV
96	تعمیر رولیک های خرک سمباده زنی و تعویض دو عدد رولیک 50 سانتی	دو عدد رولیک 50 سانتی	2022-11-01	11:45:00	12:10:00	\N	94	4	t	\N	SV
97	فعلا آقای فلاح تنظیم کرده و به درستی کار می کند .\r\n	.	2022-11-12	10:00:00	11:00:00	\N	113	4	t	\N	SV
98	تنظیم پمپ گازوئیل و جا زدن فیش دینام .	.	2022-11-12	10:00:00	11:00:00	\N	106	4	t	\N	SV
135	برطرف کردن گیر سوزن ژیگلور کاربراتور لیفتراک گازسوز	.	2022-12-03	12:50:00	13:20:00	\N	162	4	t	\N	SV
99	داکت کشی و مرتب کردن سیم ها جهت جلوگیری از درآمدن سوکت تلفن انجام گردید .	یک متر داکت چسبی 2.5	2022-11-13	13:25:00	13:45:00	\N	116	4	t	\N	SV
100	بتونه کاری لیفتراک جهت رنگ آمیزی آن انجام شد .	.	2022-11-13	12:00:00	14:00:00	\N	115	4	t	\N	SV
101	درخواست خرید پروژکتور داده شد	.	2022-11-09	12:00:00	12:05:00	\N	107	4	t	\N	SV
102	تعویض کلید دو حالته	کلید دوحالته 	2022-11-12	08:00:00	09:00:00	\N	114	4	t	\N	SV
106	جوشکاری بین غلطک های ریل زیر درب سالن صفحه و روان کاری بلبرینگ ها و ریل ها.	1عدد الکترود 2.5	2022-11-15	09:35:00	09:50:00	\N	79	4	t	\N	SV
105	تعویض تیغه سی سانتی جهت دستگاه برش طولی انجام شد .	تیغه استوک	2022-11-15	08:30:00	08:40:00	\N	122	4	t	\N	SV
103	برای ساخت با اقای سجادی جهت ساخت دور گیر ورق های هایگلاس هماهنگ شد (با هماهنگی مدیریت )	.	2022-11-14	10:00:00	10:00:00	\N	117	4	t	\N	SV
107	تعمیر جای فیوز(پایه فیوز ) و تعویض فیوز	فیوز 10	2022-11-15	14:00:00	14:30:00	\N	121	4	t	\N	SV
108	تعمیر جای فیوز (پایه فیوز ) و تعویض فیوز لیفتراک 5 تن . 	فیوز 10	2022-11-15	14:00:00	14:30:00	\N	112	4	t	\N	SV
170	تعویض تیغه کند شده برش طولی انجام شد 	تیغه تیز شده	2022-12-10	08:00:00	08:10:00	\N	199	4	t	\N	SV
121	فیلر کردن فک های بالای ریل تنونر و ریگلاژ کردن پیچ های تسمه داخل فک و تراز کردن دستگاه و تنظیم توپی هاو تیغه های بغل بر و تعویض یک عدد تیغه سمت دیوار بعلت درست تیز شدن تیغه مه بغل صفحه را میسوزاند	یک عدد تیغه تیز شده	2022-11-19	12:20:00	02:45:00	\N	128	4	t	\N	SV
110	تعویض یک جفت تیغه کند شده تنونر\r\n	یک جفت تیغه تیز شده	2022-11-17	10:30:00	12:40:00	\N	124	4	t	\N	SV
111	تعویض قطعات و سرویس کاربراتور و پمپ بنزین	سوزن ژیگلور - پرده دیافراگم - سرویس پمپ بنزین	2022-11-16	18:00:00	23:00:00	\N	125	4	t	\N	SV
112	تعویض تیغه کند شده برش دیوالت انجام شد .	یک عدد تیغه نو	2022-11-19	08:20:00	08:50:00	\N	127	4	t	\N	SV
113	نصب میلگرد جهت نگهدارنده پایه خرک بسته بندی	سه عدد میل سوپاپ - 4 عدد الکترود	2022-11-19	10:40:00	11:20:00	\N	130	4	t	\N	SV
114	نصب پروژکتور در انتهای انبار انجام شد .\r\nتعویض یک عدد لامپ 60 وات انجام شد .	پروژکتور 200 وات یک عدد - لامپ 60وات یک عدد.	2022-11-19	16:00:00	18:00:00	\N	107	4	t	\N	SV
104	تعداد 3 عدد لامپ خاموش مشاهده گردید که  داخل سرپیچ محکم شدند و رفع عیب شدند	.	2022-11-15	11:00:00	11:30:00	\N	120	4	t	\N	SV
122	باز کردن لوله روغن سمت المنت و برطرف کردن نشتی روغن از سرشفت انجام شد .	دو عدد نوارتفلون- یک عدد چسب مزدا	2022-11-21	08:30:00	10:50:00	\N	137	4	t	\N	SV
115	عیب یابی و تعویض 1 عدد کنتاکتور 220 ولت بعلت خرابی ناشی از ضعیف شدن بوبین و گرد و خاک و یک عدد کنتاکتور بعلت سوختن آن انجام شد .\r\nآچارکشی تابلو برق انجام شد .	یک عدد کنتاکتور 220 ولت 12 آمپر - یک عدد رله هشت پایه	2022-11-21	08:30:00	09:30:00	\N	135	4	t	\N	SV
116	شیر و شیلنگ سالم می باشد که باید نظافت گردد . \r\nفلش تانک هم نصب نمیشود چون از پایه وصل نیست .	.	2022-11-16	10:00:00	10:30:00	\N	129	4	t	\N	SV
117	تعویض شیلنگ انجام شد .	شیلنگ هیدرولیک 2 متر	2022-11-16	09:00:00	10:00:00	\N	123	4	t	\N	SV
118	تعویض تیغه کند شده انجام شد .	یک عدد تیغه تیز شده .	2022-11-20	11:50:00	12:10:00	\N	132	4	t	\N	SV
119	تعمیر جک چسب زن پرس دوبل . تعویض پیچ های آلنی کلگی جک . \r\nعلت خرابی هرز شدن پیچ ها و نشتی باد .	دو عدد پیچ آلنی	2022-11-22	14:40:00	16:35:00	\N	131	4	t	\N	SV
120	جوشکاری پایه های پیش گرم سالن صفحه انجام شد .\r\n	دو عدد الکترود . \r\nیک عدد ورق دوازده میل 10*8	2022-11-22	16:50:00	17:15:00	\N	136	4	t	\N	SV
167	بازدید انجام شد . گرماتاب مشکلی ندارد و مشکل فشار گاز شهری است \r\n\r\n	.	2022-12-12	10:45:00	11:00:00	\N	203	4	t	\N	SV
123	از طرف شرکت مربوطه برای سرویس و تعویض جوهر اقدام شد .	جوهر جت پرینتر	2022-11-26	13:00:00	14:00:00	\N	142	4	t	\N	SV
124	جوشکاری پایه قیچی لیفت روکار و گونیا کردن قیچی و تراز کردن لیفت با کانوایر	7 عدد الکترود	2022-11-26	16:50:00	17:35:00	\N	139	4	t	\N	SV
125	قلاویز کاری و بستن سه عدد پیچ آلنی یک سانت  انجام شد . 	سه عدد پیچ آلنی یک سانت	2022-11-29	08:00:00	08:35:00	\N	145	4	t	\N	SV
126	تعویض یک عدد فیش نری مربوط به میکسر پیجر انجام شد\r\nباز کردن میکسر جهت ارسال به تعمیر به بیرون از شرکت انجام شد .	یک عدد فیش نری	2022-11-29	12:00:00	12:30:00	\N	141	4	t	\N	SV
127	بازدید انجام شد که معلوم شد که خود نازل های چسب پشت کار سالم اند و گرفتگی ندارند.	.	2022-11-29	10:00:00	11:00:00	\N	143	4	t	\N	SV
129	رادیاتور سرویس شد .و تعمیر شد .شیلنگ های معیوب تعویض شد 	شیلنگ سه عدد	2022-11-29	12:00:00	15:00:00	\N	153	1	t	\N	SV
130	تزریق سرب به سر باطری خراب شده ی لیفتراک 5 تن انجام شد .	سرب پلمب 100 گرم	2022-11-30	08:45:00	09:05:00	\N	149	4	t	\N	SV
131	تعویض 6 عدد غلطک جهت ریل دستگاه پست فرم انجام شد .	6 عدد غلطک کششی	2022-11-30	15:40:00	16:45:00	\N	151	4	t	\N	SV
132	تعویض یک المنت پایین از پست فرم بدلیل شکستگی انجام شد .	المنت بک متری 2300وات	2022-12-03	12:00:00	12:10:00	\N	160	4	t	\N	SV
133	تعویض کابل اورفرز بدلیل قطعی و کوتاه بودن کابل انجام شد.	1.5متر کابل 2*1.5	2022-12-03	08:00:00	08:20:00	\N	157	4	t	\N	SV
134	جوشکاری نگهدارنده المنت های دستگاه پست فرم انجام شد .	یک عدد الکترود	2022-12-03	15:45:00	16:20:00	\N	161	4	t	\N	SV
136	تعویض غلطک سیلیکونی پشت کار و باز و بسته کردن غلطک سیلیکون انجام شد .	غلطک سیلیکونی 	2022-12-03	16:40:00	18:35:00	\N	158	4	t	\N	SV
137	تعویض غلطک سیلیکونی	.	2022-12-04	07:50:00	10:40:00	\N	158	4	t	\N	SV
280	تکراری 267	.	2023-01-02	12:00:00	13:00:00	\N	294	4	t	\N	SV
138	باز کردن پین های قدیمی و نصب پین جدید	.	2022-12-04	11:30:00	11:45:00	\N	159	4	t	\N	SV
139	تعویض شیلنگ بعلت نشتی از پرس گرم های گلاس انجام شد 	شیلنگ هیدرولیک 40سانتی	2022-12-04	01:35:00	02:30:00	\N	156	4	t	\N	SV
169	تعویض تیغه کند شده برش طولی انجام شد 	تیغه تیز شده	2022-12-10	08:00:00	08:10:00	\N	199	4	t	\N	SV
109	با آقای سجادی هماهنگی های لازم جهت ساخت دورگیر انجام شد . ابتدابرای دستگاه روکار انجام می شود و مهندسی معکوس می شود برای دستگاه پشت کار .	.	2022-11-16	10:00:00	11:00:00	\N	118	4	t	\N	SV
142	طبق هماهنگی هایی که با مدیریت انجام شد تعویض ورق پرس فعلا امکان پذیر نیست .	.	2022-12-06	08:15:00	08:20:00	\N	154	4	t	\N	SV
141	طبق هماهنگی هایی که با مدیریت انجام شد تعویض ورق پرس فعلا امکان پذیر نیست .	.	2022-12-06	08:15:00	08:20:00	\N	154	4	t	\N	SV
143	مشعل گرماتاب بازشد.\r\n3عدد مشعل گرماتاب توسط تعمیر کار سرویس و تعمیر شد .\r\nمشعل گرماتاب روکار هایگلاس و قسمت رول انبار نصب گردید .	.	2022-12-05	16:00:00	19:00:00	\N	165	4	t	\N	SV
144	بعداز بازدید دقیق مشخص شد مقداری نشتی از واسطه خود شیر اضطراری می باشد و مقداری از فلنج رابط هر دو قسمت آچار کشی انجام شد دستگاه روشن بعد از گرم شدن مجددا بازدید میگردد	لوازم استفاده نشد	2022-12-06	08:30:00	08:45:00	\N	175	17	t	\N	SV
145	نصب سه راهی باد برروی دستگاه پشت کار انجام شد .	یک عدد سه راهی باد . سه عدد نری باد	2022-12-06	13:00:00	13:30:00	\N	174	4	t	\N	SV
146	جهت تعمیر به تعمیرگاه ارسال شد	فاکتور پیوست شده	2022-12-06	12:00:00	14:00:00	\N	183	4	t	\N	SV
147	جهت تعمیر به تعمیرگاه ارسال شد	فاکتور پیوست شده	2022-12-06	12:00:00	14:00:00	\N	183	4	t	\N	SV
148	تعویض سیم نسوز یکی از المنت ها که سولفاته و قطع شده بود.\r\nنظافت المنت ها و شینه های مسی محفظه وسطی	یک متر سیم نسوز 2.5	2022-12-07	15:50:00	17:40:00	\N	187	4	t	\N	SV
149	تعویض کلید بعلت خرابی انجام شد	کلید دوحالته	2022-12-08	14:00:00	14:20:00	\N	194	4	t	\N	SV
150	طبق سرویس دوره ای که لیفتراک ها دارن انجام میگیرد 	.	2022-12-10	08:00:00	08:10:00	\N	196	4	t	\N	SV
152	رنگ کاری محوطه و خط کشی خطوط بارگیری انجام شد .	رنگ ترافیکی -یک لیتر بنزین	2022-11-27	16:00:00	18:00:00	\N	119	4	t	\N	SV
154	باز کردن لاستیک عقب لیفتراک جهت جهت گرفتن پنچری	تیوپ لاستیک	2022-12-08	07:30:00	11:00:00	\N	191	17	t	\N	SV
155	پایه های طبقه چهارم بعداز اندازه گیری باز شد و مجددا تنظیم در حضور آقای دوستی گردید البته تنظیم دقیق میبایست با برنامه دستگاه باشد که هماهنگی گردیده مشکل فعلا رفع گردید	بدون لوازم 	2022-12-13	16:55:00	19:20:00	\N	205	17	t	\N	SV
156	واشر نسوز بین فلنج تعویض گردید دو عدد شیلنگ نشتی داشت که واشر تعویض شد و مابقی شیلنگهای پرس شل بود آچار کشی شد و قسمت سوراخ شده لوله جوشکاری گردید	واشر نسوز دو اینچ 1عدد ،واشر نسوز شیلنگ چهار عدد	2022-12-12	07:15:00	09:00:00	\N	201	17	t	\N	SV
157	به علت خالی شدن گازوئیل لیفتراک هوا گرفته بود که بعد انجام هواگیری از سوزنها و پمپ روشن و تحویل شد	بدون لوازم 	2022-12-08	14:35:00	15:00:00	\N	189	17	t	\N	SV
158	یک دستگاه گرماتاب در سالن بدون مشعل وجود داشت که نصب گردید ویک دستگاه از سالن بغل باز شد و وی سقف سالن تولید نصب شد کابل کشی برق وشیلنگ گاز انجام شده مشکل فشار گاز ورودی می‌باشد که بعد از رفع مشکل است میگردد 	کابل دو در یک ونیم حدود 40متر،شیلنگ گاز 3متر ،بست گازی 4عدد	2022-12-14	08:00:00	17:10:00	\N	190	17	t	\N	SV
159	واشر نسوز بین فلنج تعویض گردید دو عدد شیلنگ نشتی داشت واشر نسوز تعویض گردید ولوله جلوی آسانسور نشتی داشت که جوشکاری گردید	واشر دواینچ 1عدد،واشر نسوز2.5دوعدد،	2022-12-12	07:15:00	08:45:00	\N	200	17	t	\N	SV
160	تعویض تیغه برش HPL و چک کردن عملکرد میکروسوئیچ انجام شد	یک عدد تیغه تیز شده	2022-12-14	13:05:00	13:30:00	\N	212	4	t	\N	SV
161	تعویض تیغه برش HPL و چک کردن عملکرد میکروسوئیچ انجام شد\r\n\r\n	تیغه تیز شده	2022-12-14	13:05:00	13:30:00	\N	211	4	t	\N	SV
162	جوشکاری و تعویض 2 عدد رولیک استوک جهت پایه خرک زمینی تنونر و نصب میلگرد 30 سانتی جهت نگهدارنده خرک .	دو عدد رولیک 50 سانتی - 4عدد میلگرد سی سانتی -	2022-12-10	11:10:00	13:40:00	\N	197	4	t	\N	SV
163	نصب روشویی و ولوله کشی و نصب شیر بیسوار و زانویی و سه راهی داخل رزوه 1/2 و شیر مخلوط آب سرد و گرم و ساخت پایه جهت نگهدارنده روشویی و نصب صفحه ام دی اف به ابعاد 110*60 و 110*50	شیر روشویی کامل 1عدد - چهار عدد زانویی 1/2 - یک عدد بوشن 1/2 - یک عدد سه راهی 1/2 - دو عدد داخل رزوه 1/2 - دو عدد شیر بیسوار 1/2	2022-12-10	10:20:00	14:55:00	\N	152	4	t	\N	SV
164	نصب زانویی پولیکا و نصب بست لوله جهت خرطومی مکنده برش کلگی انجام گرفت .	یک عدد زانویی پولیکا - یک عدد بست لوله 10	2022-12-18	10:45:00	11:30:00	\N	231	4	t	\N	SV
165	علت ناتراز بودن دستگاه بود که رفع شد .	.	2022-12-10	07:30:00	08:15:00	\N	198	4	t	\N	SV
166	بازدید انجام شد . گرماتاب مشکلی ندارد و مشکل فشار گاز شهری میباشد .	.	2022-12-12	10:45:00	11:00:00	\N	202	4	t	\N	SV
173	تعویض یک عدد لامپ 60 وات بعلت سوختن LED های آن و روشن نشدن لامپ	یک عدد لامپ 60 وات ال ای دی سرپیچ کوچک	2022-12-17	18:10:00	18:20:00	\N	223	4	t	\N	SV
174	سیمان کاری جای ریل انتقال رول هایگلاس انجام شد	.	2022-12-10	18:10:00	18:45:00	\N	180	4	t	\N	SV
175	کابل کشی و نصب پروژکتور در انتهای سالن هایگلاس انجام شد .	9 متر کابل 2*2.5 و یک عدد پروژکتور 200 وات	2022-12-10	15:45:00	17:10:00	\N	163	4	t	\N	SV
176	تعویض 4عدد پیچ آلنی سایز 6 جهت میله باز و بست کرم و سیلیکون چسب زن هایگلاس	4عدد پیچ آلنی 6	2022-12-07	10:00:00	10:30:00	\N	182	4	t	\N	SV
177	تعویض 4 عدد غلطک جهت ریل پست فرم انجام شد .	4 عدد غلطک ابری	2022-12-10	15:45:00	16:05:00	\N	195	4	t	\N	SV
178	جوشکاری و نصب قوطی 4*4   ده سانتی جهت مهار زیر سینی چسب زن رول پرس .	20 سانت قوطی 4*4 -  سه عدد الکترود 2	2022-12-10	16:35:00	17:10:00	\N	193	4	t	\N	SV
179	سوراخ کاری و نصب میلگرد جهت نگه دارنده پایه خرک بعد از چسب زن رول پرس	4عدد میلگرد ده 50 سانتی	2022-12-10	15:45:00	16:30:00	\N	192	4	t	\N	SV
180	تعویض یک عدد المنت بعلت شکستگی انجام شد	1 عدد المنت 2300 وات 	2022-12-13	10:10:00	10:30:00	\N	209	4	t	\N	SV
172	تعویض تیغه تیز شده برش دیوالت	یک عدد  تیغه	2022-12-13	15:45:00	16:20:00	\N	232	4	t	\N	SV
181	آچار کشی تابلو برق و سربندی مجدد دو عرر سیم انجام گردید و عیب رفع گردید .	.	2022-12-19	13:50:00	14:20:00	\N	237	4	t	\N	SV
182	علت : خرابی کنتاکتور فرمان k7 بعلت گرد و خاک\r\nتعویض کنتاکتور با رله 11 پایه که حساسیت آن نسبت به گرد و خاک و خاک اره کمتر میباشد .	رله و پایه رله 11 پایه فیندر استوک یک عدد	2022-12-21	08:10:00	08:20:00	\N	241	4	t	\N	SV
183	جوشکاری پایه خرک سمباده زنی جلوی تنونر	5عدد الکترود 2.5	2022-12-21	10:10:00	10:30:00	\N	244	4	t	\N	SV
184	تعویض 12 عدد تیغه 48 میل جهت توپی 48 میل تنونر	12 عدد تیغه 48 میل	2022-12-20	17:15:00	18:40:00	\N	238	4	t	\N	SV
185	تعویض توپی و نصب شیر گازی 1/2 و پرس شیلنگ گاز و نصب مغزی 1/2 و نصب به کپسول لیفتراک	1عدد شیرگازی\r\n2عدد مغزی 1/2-\r\nیک متر شیلنگ 1/2	2022-12-18	15:45:00	16:05:00	\N	227	4	t	\N	SV
187	جهت نصب کرکره نصاب مربوطه اقای نور علی با توجه به اندازه گیری های انجام داده بعد از مراحل تهیه اقلام مصرفی اقدام میکند	فاکتور ضمیمه میشود	2022-12-24	12:00:00	13:00:00	\N	255	4	t	\N	SV
189	 جا به جایی و نصب ال سی دی نگهبانی انجام شد	4 عدد پیچ رول پلاک  7سانت	2022-09-20	12:00:00	13:00:00	\N	35	4	t	\N	SV
190	جابه جایی و نصب ال سی دی انجام شد 	4 عدد پیچ رول پلاک 7 سانت 	2022-09-20	12:00:00	13:00:00	\N	34	4	t	\N	SV
191	تعویض میکرو سوییچ انجام شد	میکرو سوییچ فنر دار	2022-10-22	12:00:00	13:00:00	\N	66	4	t	\N	SV
192	دستگاه در بیرون از شرکت توسط تعمیرکار سرویس گردید	.	2022-11-07	12:00:00	13:00:00	\N	85	4	t	\N	SV
193	نصب یک عدد پروژکتور 50 وات و کلید دوپل روکار انجام گردید	20 متر کابل 2*2.5-\r\nپروژکتور 50وات استوک	2022-12-29	12:00:00	13:00:00	\N	92	4	t	\N	SV
194	نصب یک عدد مهتابی براکت انجام شد	براکت 60سانت یک عدد	2022-11-29	12:00:00	13:00:00	\N	146	4	t	\N	SV
196	رادیاتور جهت تعمیر به بیرون از شرکت ارسال شد .\r\nجنت آب تعویض شد	شیلنگ 2عدد	2022-11-29	15:00:00	17:00:00	\N	148	4	t	\N	SV
197	دستگیره اصلاح شد و بسته شد .	/	2022-11-16	15:00:00	17:00:00	\N	58	4	t	\N	SV
198	تعویض سنبه انجام شد	یک عدد سنبه	2022-10-23	12:00:00	13:00:00	\N	70	4	t	\N	SV
199	نصب انجام شد	دو عدد غلطک	2022-10-23	15:00:00	19:00:00	\N	74	4	t	\N	SV
200	تعویض سیم انجام شد	5متر سیم بکسل	2022-10-24	15:00:00	17:00:00	\N	75	4	t	\N	SV
201	تعویض میخ انجام شد	میخ استوپ	2022-10-26	11:00:00	12:00:00	\N	80	4	t	\N	SV
202	سربندی کانتر مربوط به مترینگ انجام شد	.	2022-10-27	08:30:00	09:00:00	\N	82	4	t	\N	SV
204	تعویض انجام شد	غلطک سیلیکونی	2022-10-30	15:00:00	19:00:00	\N	91	4	t	\N	SV
205	تعویض انجام شد	غلطک سیلیکونی	2022-10-30	15:00:00	19:00:00	\N	91	4	t	\N	SV
206	بازدید انجام شد . موردی نبود	.	2022-11-21	09:00:00	10:00:00	\N	133	4	t	\N	SV
207	بدستور آقای کاظمی کنسل شد .	.	2022-12-06	12:00:00	13:00:00	\N	140	4	t	\N	SV
208	با نصاب مربوطه تماس گرفته شد ه جهت رفع عیب	.	2022-12-28	14:00:00	14:30:00	\N	224	4	t	\N	SV
209	بدلیل زمان بر بودن و ساخت تجهیزات مناسب در زمان مناسب انجام میگیرد .	.	2022-12-28	14:00:00	14:30:00	\N	210	4	t	\N	SV
211	 بدلیل ساخت کشنده در ابتدای خط و طراحی آن در حال حاضر در دست اقدام میباشد .	.	2022-12-15	10:00:00	11:00:00	\N	214	4	t	\N	SV
213	شیر گازی از انبار قطعات تحویل گرفته شد و بعد از باز کردن شیر فلکه ای روی کار نصب گردید 	شیر گازی 4 یک عدد . تبدیل چهار به یک اینچ دو عدد 	2022-12-28	12:55:00	13:30:00	\N	258	17	t	\N	SV
215	علمک شیر تهیه شده روی کار نصب گردید	علمک شیر اهرمی 1عدد	2022-12-27	11:00:00	11:20:00	\N	253	17	t	\N	SV
216	بدلیل خرابی درایر موجود کارهای استعلام در حال پیگیری است . باید درایر جدید خریداری شود و نصب شود	.	2022-12-28	13:00:00	14:00:00	\N	155	4	t	\N	SV
217	نشتی از شیلنگ بوده که پرس مورددار شده که باید سر فرصت (5شنبه ) تعمیر شود .	.	2022-12-15	10:00:00	11:00:00	\N	218	4	t	\N	SV
214	تکراری 401000204	.	2022-12-28	12:00:00	12:00:00	\N	213	4	f	\N	SV
212	تکراری 401000204	.	2022-12-28	12:00:00	12:00:00	\N	105	4	f	\N	SV
210	تکراری 401000200	.	2022-12-28	12:00:00	12:00:00	\N	138	4	f	\N	SV
281	تکراری 269	.	\N	\N	\N	\N	296	4	f	\N	SV
218	در دست اقدام جهت ساخت و نصب فرچه 	.	2022-12-12	10:00:00	10:30:00	\N	206	4	t	\N	SV
219	3عدد جای دستمال در قسمت سرویسهای بهداشتی آقایان و2عدد در سرویس بانوان نصب گردید 	پایه نگهدارنده دستمال کاغذی 5عدد.10عدد پیچ ورولپلاک 	2022-12-26	07:20:00	08:20:00	\N	269	17	t	\N	SV
220	3عدد جای دستمال در قسمت سرویسهای بهداشتی آقایان و2عدد در سرویس بانوان نصب گردید 	پایه نگهدارنده دستمال کاغذی 5عدد.10عدد پیچ ورولپلاک 	2022-12-26	07:20:00	08:20:00	\N	269	17	t	\N	SV
223	شیلنگ گاز سوراخ شده و باعث نشتی گاز شده بود که رفع گردید و شیر گازی آشپزخانه خراب بود که تعمیر گردید	بست شیلنگ گازی 1عدد	2022-12-25	07:30:00	09:00:00	\N	243	17	t	\N	SV
224	دستگاه مورد نظر در حال ساخت می باشد . نقشه کشی های لازم انجام شده که جهت ساخت باکس المنت و پیشگرم در حال انجام شود	.	2022-12-25	09:30:00	10:20:00	\N	265	4	t	\N	SV
228	بازدید انجام شد . در فرصت مناسب تعمیر میشود	.	2022-12-07	10:00:00	11:00:00	\N	185	4	t	\N	SV
229	صفحه داخل هیتر باز شد و بعداز نظافت کامل ترموکوپل سمباده زنی گردیده و اتصالی سیم فندک گرفته شده 	سمباده 5سانتی متر. چسب برق 1عدد	2022-12-25	07:30:00	09:00:00	\N	236	17	t	\N	SV
232	رفع عیب شد . فشار تنظیم شد . پرشر سوئیچ تعویض شد	یک عدد پرشر سوئیچ	2022-12-28	09:50:00	10:30:00	\N	257	4	t	\N	SV
233	بدلیل شکستگی شاخ و تعمیر دوباره این اتفاق افتاد که باید شاخ جدید خریداری گردد .	/	2022-12-28	13:00:00	13:30:00	\N	249	4	t	\N	SV
234	مشکل دود کردن درست شد با تعویض سوزن و ژیگلور ولی بدلیل کارکردن زیاد با گاز دوباره دچار مشکل میشود . با وجود نصب سوزن گیر و تنظیم کاربراتور دوباره مشکل دود کردن بوجود آمد	یک عدد سوزن - سوزنگیر - ژیگلور	2022-12-07	16:00:00	20:00:00	\N	188	4	t	\N	SV
236	خرابی جک دستگاه که تعویض شد 	جک 80*100	2022-12-25	16:00:00	17:00:00	\N	184	4	t	\N	SV
237	تعویض دو عدد رولیک 50 سانت جهت خرک زمینی تنونر	2عدد رولیک 50سانت	2022-12-24	18:30:00	18:50:00	\N	240	4	t	\N	SV
238	بازدید انجام شد بدلیل بریده شدن پیچ ها تعمیر کفشک ها در زمان مناسب باید انجام شود	.	2022-12-28	12:00:00	13:00:00	\N	68	4	t	\N	SV
243	داکت کشی و کابل کشی و نصب روشنایی  و پریز و کابل کشی و سوکت زنی شبکه  و نصب تابلو مینیاتوری  انجام شد 	10 عدد داکت چسبی 3سانت - \r\n1 عدد پریز روکار -\r\n4 متر کابل شبکه استوک -\r\n50 متر سیم 2.5-\r\n60 متر کابل 2*2.5-\r\nیک شاخه ترمینال پلاستیکی - \r\n15 عدد وایرشو2.5 - \r\n4 عدد مینیاتوری 16 و 25 آمپر - \r\nتابلو برق مینیاتوری 8خانه -\r\n20 عدد پیچ ام دی افی 2سانت\r\n\r\n	2022-12-24	08:00:00	19:00:00	\N	170	4	t	\N	SV
244	نصب کاسه چراغ سقفی و روشنایی و کابل کشی انجام شد-\r\nکابل کشی گرماتاب ها (4عدد ) انجام شد	باکس 10*20 یک عدد -\r\nسه شاخه ترمینال پلاستیکی - \r\nوایرشو 2.5 به تعداد 35 عدد -\r\nبست کمر بندی 50 و 30 و 20 سانت جمعا 110 عدد - \r\n10 متر زنجیر 4 -\r\n10 عدد قلاب s -\r\n10 عدد لامپ اس ام دی فن دار - \r\n10 عدد کاسه چراغ -\r\n45 متر کابل 4*2.5 -\r\n100 متر کابل 3*2.5 -\r\n150 متر کابل 2*2.5-	2022-12-21	07:00:00	19:00:00	\N	171	4	t	\N	SV
245	جوشکاری و نصب هواکش ( سه عدد ) و کابل کشی انجام شد	5 عدد الکترود 2.5\r\n1شاخه قوطی -\r\n150 متر کابل 2.5*3 -\r\nسه عدد کلید حرارتی	2022-12-25	07:00:00	19:00:00	\N	186	4	t	\N	SV
247	تعویض لامپ ها ی سوخته و اضافه کردن روشنایی انجام شد 	طبق درخواست 401000161 	2022-12-25	11:00:00	13:00:00	\N	217	4	t	\N	SV
248	خرابی سنبه که تعویض شد .	یک عدد سنبه	2022-12-05	10:00:00	10:30:00	\N	169	4	t	\N	SV
249	تعویض بلبرینگ و تعویض پیچ های ترمز	یک عدد بلبرینگ	2022-12-05	16:00:00	19:00:00	\N	168	4	t	\N	SV
250	بازدید انجام شد و موردی از خرابی و خطای دستگاه یافت نشد	.	2022-10-25	10:00:00	10:30:00	\N	76	4	t	\N	SV
252	رفع عیب شد	علمک	2022-12-29	10:00:00	12:00:00	\N	242	4	t	\N	SV
253	موتور تعمیر اساسی شد و به کارخانه عودت داده شده تا تعمیرکار مربوطه جهت بستن ان اقدام کند 	طبق فاکتور 	2022-12-29	13:00:00	13:30:00	\N	55	4	t	\N	SV
256	درخواست ساخت برای انجام کار تحویل اقای نظری گردید	/	2023-01-17	10:00:00	10:20:00	\N	234	4	t	\N	SV
257	برش کاری و جوشکاری و رنگ آمیزی جهت نرده ورودی نگهبانی انجام شد	۶۰سانت قوطی۴سانت\r\nچهار عدد الکترود	2022-12-06	07:30:00	10:00:00	\N	179	4	t	\N	SV
230	تکراری 401000175	.	2022-12-28	12:00:00	12:00:00	\N	54	4	f	\N	SV
222	تکراری 401000196	.	2022-12-28	12:00:00	12:00:00	\N	208	4	f	\N	SV
240	تکراری 401000236	.	2022-12-28	12:00:00	12:00:00	\N	221	4	f	\N	SV
231	تکراری 401000239	.	2022-12-28	12:00:00	12:00:00	\N	256	4	f	\N	SV
251	درخواست تکراری میباشد	.	2022-12-29	12:00:00	13:00:00	\N	239	4	f	\N	SV
235	تکراری 401000178	.	2022-12-28	12:00:00	12:00:00	\N	226	4	f	\N	SV
255	تکراری ۱۶۷	.	2022-12-29	12:00:00	12:00:00	\N	178	4	f	\N	SV
239	تکراری 401000133\n	.	2022-12-28	12:00:00	12:00:00	\N	143	4	f	\N	SV
242	تکراری 238	.	2022-12-28	12:00:00	12:00:00	\N	222	4	f	\N	SV
225	کار انجام شده تکراری می باشد 	بدون لوازم	2022-12-23	12:00:00	14:00:00	\N	242	17	f	\N	SV
221	تکراری 401000196	.	2022-12-28	12:00:00	12:00:00	\N	207	4	f	\N	SV
246	تکراری 205	.	2022-12-28	12:00:00	12:00:00	\N	216	4	f	\N	SV
226	کار انجام شده تکراری می باشد 	بدون لوازم	2022-12-22	12:00:00	16:00:00	\N	242	17	f	\N	SV
241	تکراری 238	.	2022-12-28	12:00:00	12:00:00	\N	247	4	f	\N	SV
258	نصب پایه و تنظیم و تراز کردن میز سلفون کش و جوشکاری و ثابت کردن میز سلفون کش و رنگ آمیزی	چهار عدد الکترود	2022-12-25	16:00:00	18:30:00	\N	228	4	t	\N	SV
254	شیر اطمینان باز شد و شیر جدید نصب شد و شیر خراب جهت تعمیر ارسال گردید	شیر اطمینان	2023-01-04	04:00:00	07:00:00	\N	173	4	t	\N	SV
271	تعمیر چراغ های لیفتراک هفت تن توسط آقای سعادتمند انجام شد	.	2022-11-21	07:30:00	11:00:00	\N	108	4	t	\N	SV
273	تکراری 401000123	.	2022-12-31	12:00:00	13:00:00	\N	134	4	f	\N	SV
259	تکراری 401000206	و	2022-12-29	12:00:00	12:00:00	\N	215	4	f	\N	SV
262	با اندازه کردن هازبس های حرارتی با همکاری آقای دوستی فعلا مشکلی ندارد	.	2022-12-21	01:00:00	04:00:00	\N	219	4	t	\N	SV
282	تکراری 269	.	2023-01-01	12:00:00	12:05:00	\N	296	4	t	\N	SV
260	نصب جا دستمال کاغذی  در سرویس بهداشتی بانوان به تعداد سه عدد و در سرویس بهداشتی آقایان دو عدد - نصب جامایعی انجام شد	پنج عدد جا دستمال کاغذی	2022-12-26	07:20:00	08:20:00	\N	235	4	t	\N	SV
291	کابل کشی و نصب مهتابی و سربندی داخل تابلو برق و کلید دوپل انجام شد	قاب مهتابی FPL استوک 1 عدد - مهتابی FPL  استوک 4 عدد   - 8.5 متر کابل 1.5 * 2 -  2 عدد پیچ و رول پلاک 4 سانت 	2023-01-03	09:00:00	14:40:00	\N	304	4	t	\N	SV
261	قطعه باز شده و به تراشکاری ارسال گردیده	.	2022-12-28	12:00:00	01:00:00	\N	272	4	t	\N	SV
300	تعویض غلطک سیلیکونی رو.کار و تمیر پمپ روغن و نصب پمپ و باز کردن پمپ روغن که نشتی داشت که برطرف شده و شارژ روغن	1 عدد غلطک سیلیکونی - 20 لیتر روغن حرارتی	2023-01-04	07:30:00	18:45:00	\N	301	4	t	\N	SV
310	بعلت باز شدن درب بزرگ ریلی لوله آب شکسته بود که بعد از جابجایی لوله مشکل حل شد .	1 عدد زانویی pp	2023-01-04	10:30:00	11:10:00	\N	311	4	t	\N	SV
319	برطرف کردن نشتی روغن از کاسه نمد گیربکس غلطک های زیرین چسب زن روکار	.	2023-01-05	16:05:00	16:25:00	\N	281	4	t	\N	SV
323	test task	nothing	\N	\N	\N	\N	325	1	t	\N	SV
331	تعویض 13 عدد کانوایر آخر خط دستگاه روکار جلوی سلفون کش	تسمه مخصوص طبق نمونه 13 عدد	2023-01-10	07:30:00	08:50:00	\N	333	4	t	\N	SV
324	test task	nothing	2023-01-17	12:00:00	14:00:00	\N	325	1	f	\N	SV
325	تعمیر گردید و تحویل داده شد 	-	2023-01-11	04:10:00	04:40:00	\N	327	17	t	\N	SV
326	دکل و قطعات و شیلنگ های موردنیاز همه صحیح و سالم نصب گردید	پیچ دکل 2 عدد 	2023-01-14	08:00:00	12:00:00	\N	330	4	t	\N	SV
327	تعویض تیغه برش کلگی انجام شد 	یک عدد تیغه تیز شده 	2023-01-16	11:10:00	11:30:00	\N	331	4	t	\N	SV
328	پایه ها ساخته شدند و رنگ سفید زده شد و نصب به اتمام رسید 	قوطی 20*30    تعداد: 4 شاخه \nرنگ سفید روغنی   مقدار : 1 کیلو 	2023-01-14	10:00:00	18:15:00	\N	332	4	t	\N	SV
329	شیلنگ تعویض شد و تحویل شد	شیلنگ 150 سانت	2023-01-18	12:00:00	12:30:00	\N	328	4	t	\N	SV
332	جا به جایی انجام شد 	شیلنگ 5 متر \r\nکابل برق 5 متر 	2023-01-09	11:30:00	12:50:00	\N	166	4	t	\N	SV
330	خرابی پولکی 10/14 در تاریخ 10/18 سیلیکون تعویض شد و تحویل خط تولید داده شد 	سیلیکون پشت کار	2023-01-08	07:35:00	11:45:00	\N	308	4	t	\N	SV
337	در حضور سرپرست تولید لیفت تنظیم گردید و تحویل شد 	-	2023-01-08	09:30:00	10:05:00	\N	229	4	t	\N	SV
333	در حال آماده سازی برای جا به جایی	-	2023-01-07	09:50:00	10:45:00	\N	166	4	t	\N	SV
334	با جایگزین کردن گوشواره های سیلیکون مشکل به کلی برطرف شد 	گوشواره	2023-01-09	08:00:00	09:00:00	\N	323	4	t	\N	SV
335	مشکل رفع گردید	-	2023-01-11	14:30:00	14:50:00	\N	337	4	t	\N	SV
338	مشکل رفع گردید و در حین تولید باز هم بررسی می شود 	- 	2023-01-09	14:00:00	15:20:00	\N	286	4	t	\N	SV
336	نصب شیلنگ آب سرویس بهداشتی 	شیلنگ کامل	2023-01-10	16:50:00	17:00:00	\N	320	4	t	\N	SV
263	شیر تعویض شد و تحویل داده شد	شری گازی دو اینچ	2023-01-09	17:30:00	18:45:00	\N	220	4	t	\N	SV
340	تعویض تیغه انجام شد 	تیغه اور فرز  یک عدد 	2023-01-12	08:00:00	08:15:00	\N	339	4	t	\N	SV
339	باز شد تا جهت تعمیر به خارج از شرکت ارسال گردد . بخاری تست گردید و سالم می باشد . احتمالا فشار گاز بالا می باشد که می بایست فشار شکن نصب گردد	-	2023-01-15	14:00:00	14:25:00	\N	338	4	t	\N	SV
343	نصب پیچ سرمته و جوشکاری و زدن چسب آکواریوم جهت درب مکنده مرکزی صفحه 	پیچ سر مته 2 سانت 10 عدد	2023-01-16	15:45:00	17:10:00	\N	342	4	t	\N	SV
341	نشتی باد رفع گردید	-	2023-01-11	17:00:00	18:30:00	\N	340	4	t	\N	SV
342	کلید تعویض شد 	کلید دو حالته 	2023-01-11	15:45:00	16:10:00	\N	341	4	t	\N	SV
344	دور لوله مکنده با ام دی اف 3 میل پوشانده شد و پنجره بالای تنونر نیز با ام دی اف پوشانده شد 	ام دی اف 3 میل ضایعاتی	2023-01-14	15:45:00	18:00:00	\N	345	4	t	\N	SV
345	کلیه لوله های خروجی سرجای خود محکم و جوشکاری شدن که اقدامات در گزارش آمده است 	-	2023-01-14	09:30:00	14:30:00	\N	346	4	t	\N	SV
346	عایق کاری لوله های بخار انجام شد 	پشم سنگ 3 متر 	2023-01-16	10:30:00	12:00:00	\N	321	4	t	\N	DN
307	با اندازه کردن هازبس های حرارتی با همکاری آقای دوستی فعلا مشکلی ندارد 	-	2022-12-21	01:00:00	04:00:00	\N	312	4	t	\N	SV
347	کلیه مراحل ساخت در برگه گزارش توضیح داده شده است 	پولکی 25 سانت 10 عدد\nقوطی 10 در 10 5 عدد	2023-01-15	07:30:00	09:00:00	\N	312	16	t	\N	DN
348	کابل کشی و نصب پریز و کلید تک پل و روشنایی انجام شد 	لامپ 65 وات 1عدد \nسرپیچ چینی استوک 1 عدد\nسیم 1.5 استوک 13 متر\nفلکسی 16 6 متر\nیک عدد کلید تک پل \nده عدد بست کمربندی	2023-01-16	08:30:00	12:00:00	\N	347	4	t	4	DN
349	تعویض 13 عدد کانوایر آخر خط دستگاه روکار جلوی سلفون کش 	تسمه مخصوص طبق نمونه 13 عدد	2023-01-10	07:30:00	08:50:00	\N	348	1	f	\N	DN
350	یکی از مهره های شیلنگ پمپ هیدرولیک شل شده بود که سفت شد 	-	2023-01-11	15:40:00	16:40:00	\N	349	4	t	\N	DN
351	در حال پیگیری و مشورت برای خرید رگولاتور مناسب هستیم 	-	2023-01-18	12:00:00	12:30:00	\N	350	4	t	\N	DG
352	تعمیر سه دستگاه میخ استپ سالن صفحه انجام شد 	سنبه میخ استوپ 	2023-01-17	08:00:00	21:05:00	\N	351	1	t	\N	DN
\.


--
-- Data for Name: base_task_operators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base_task_operators (id, task_id, user_id) FROM stdin;
3	325	17
4	326	4
5	327	4
6	328	21
7	328	23
8	329	21
9	329	23
10	330	4
11	331	24
12	332	4
13	333	4
14	334	4
15	335	17
16	336	4
17	337	17
18	337	22
19	338	17
20	338	22
21	339	17
22	340	17
23	341	21
24	342	25
25	343	4
26	344	24
27	344	21
28	344	22
29	345	24
30	345	22
31	345	23
32	346	24
33	346	22
34	347	24
35	347	17
36	347	22
37	307	24
38	307	17
39	307	22
40	348	20
41	349	17
42	349	20
43	349	25
44	350	21
45	351	4
46	352	21
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-12-22 16:05:00.58187+03:30	250	401000240	3		7	1
2	2022-12-28 19:03:29.330833+03:30	190	xx	1	[{"added": {}}]	9	1
3	2022-12-28 19:09:04.032752+03:30	193	x4	1	[{"added": {}}]	9	1
4	2022-12-28 19:13:10.095064+03:30	193	x4	3		9	1
5	2022-12-28 19:13:10.102466+03:30	192	x3	3		9	1
6	2022-12-28 19:13:10.105412+03:30	191	x2	3		9	1
7	2022-12-28 19:13:10.108848+03:30	190	xx	3		9	1
8	2022-12-28 19:13:10.111645+03:30	189	ترمز پودری	3		9	1
9	2022-12-28 19:13:10.114738+03:30	188	کابل کشی	3		9	1
10	2022-12-28 19:13:10.118228+03:30	187	سوله پرس طبقاتی	3		9	1
11	2022-12-28 19:13:10.121526+03:30	186	تسمه کش بادی شماره 3	3		9	1
12	2022-12-28 19:13:10.12437+03:30	185	گرماتاب سالن پرس	3		9	1
13	2022-12-28 19:13:10.126937+03:30	184	ژنراطور دفتر مرکزی	3		9	1
14	2022-12-28 19:13:10.129386+03:30	183	اتاق تولید پرس	3		9	1
15	2022-12-28 19:13:10.132018+03:30	182	مخزن فلزی برگشت آب گرم	3		9	1
16	2022-12-28 19:13:10.136255+03:30	181	دستگاه تسویه RO	3		9	1
17	2022-12-28 19:13:10.13983+03:30	180	کمپرسور 22 کیلو وات	3		9	1
18	2022-12-28 19:13:10.142153+03:30	179	بویلر بخار	3		9	1
19	2022-12-28 19:13:10.144585+03:30	178	لیفت بالابر طبقاتی	3		9	1
20	2022-12-28 19:13:10.147339+03:30	177	کولین تاور	3		9	1
21	2022-12-28 19:13:10.149736+03:30	176	سلفون کش طبقاتی	3		9	1
22	2022-12-28 19:13:10.152361+03:30	175	لیفتراک 5 تن هایستر	3		9	1
23	2022-12-28 19:13:10.156852+03:30	174	پرس طبقاتی	3		9	1
24	2022-12-28 19:13:10.160281+03:30	173	دستگاه جت پرینتر سپند افزار	3		9	1
25	2022-12-28 19:13:10.163016+03:30	172	دستگاه جت پرینتر آرن جت	3		9	1
26	2022-12-28 19:13:10.165553+03:30	171	دستگاه جت پرینتر متسا 2128	3		9	1
27	2022-12-28 19:13:10.169021+03:30	170	لیفتراک 5 تن	3		9	1
28	2022-12-28 19:13:10.171859+03:30	169	دستگاه کاغذ خورد کن	3		9	1
29	2022-12-28 19:13:10.176323+03:30	168	اتاق سمپل	3		9	1
30	2022-12-28 19:13:10.179171+03:30	167	رختکن پرسنل	3		9	1
31	2022-12-28 19:13:10.182387+03:30	166	دفتر مرکزی	3		9	1
32	2022-12-28 19:13:10.185372+03:30	165	ساخت	3		9	1
33	2022-12-28 19:13:10.188714+03:30	164	آب سرد کن سالن هایگلاس	3		9	1
34	2022-12-28 19:13:10.192305+03:30	163	آب سرد کن سالن صفحه	3		9	1
35	2022-12-28 19:13:10.197271+03:30	162	کمپرسور مرکزی	3		9	1
36	2022-12-28 19:13:10.199954+03:30	161	پیجر	3		9	1
37	2022-12-28 19:13:10.202439+03:30	160	دستگاه فرچه هایگلاس	3		9	1
38	2022-12-28 19:13:10.204957+03:30	159	دستگاه اره دور کن	3		9	1
39	2022-12-28 19:13:10.207783+03:30	158	دستگاه نوار لبه	3		9	1
40	2022-12-28 19:13:10.210779+03:30	157	مکنده 4 قلو پشت کار	3		9	1
41	2022-12-28 19:13:10.213449+03:30	156	مکنده مرکزی هایگلاس	3		9	1
42	2022-12-28 19:13:10.219102+03:30	155	مکنده مرکزی سالن صفحه	3		9	1
43	2022-12-28 19:13:10.221938+03:30	154	سرویس بهداشتی بانوان	3		9	1
44	2022-12-28 19:13:10.224599+03:30	153	سرویس بهداشتی محوطه	3		9	1
45	2022-12-28 19:13:10.227545+03:30	152	سرویس بهداستی صفحه	3		9	1
46	2022-12-28 19:13:10.230207+03:30	151	آشپزخانه بالا	3		9	1
47	2022-12-28 19:13:10.23318+03:30	150	سالن غذا خوری	3		9	1
48	2022-12-28 19:13:10.237696+03:30	149	سوئیت	3		9	1
49	2022-12-28 19:13:10.240643+03:30	148	اتاق منشی	3		9	1
50	2022-12-28 19:13:10.243269+03:30	147	اتاق مدیریت	3		9	1
51	2022-12-28 19:13:10.245578+03:30	146	اتاق کنفرانس	3		9	1
52	2022-12-28 19:13:10.248476+03:30	145	اتاق لجستیک	3		9	1
53	2022-12-28 19:13:10.251446+03:30	144	اتاق اداری	3		9	1
54	2022-12-28 19:13:10.25374+03:30	143	اتاق تولید	3		9	1
55	2022-12-28 19:13:10.258006+03:30	142	اتاق برنامه ریزی	3		9	1
56	2022-12-28 19:13:10.260584+03:30	141	اتاق کنترل کیفی	3		9	1
57	2022-12-28 19:13:10.263196+03:30	140	اتاق نگهبانی	3		9	1
58	2022-12-28 19:13:10.265386+03:30	139	ژنراطور	3		9	1
59	2022-12-28 19:13:10.267741+03:30	138	محوطه کارخانه	3		9	1
60	2022-12-28 19:13:10.270006+03:30	137	سلفون کش2	3		9	1
61	2022-12-28 19:13:10.272539+03:30	136	سلفون کش 1	3		9	1
62	2022-12-28 19:13:10.277414+03:30	135	سوله انبار	3		9	1
63	2022-12-28 19:13:10.279679+03:30	134	سوله هایگلاس	3		9	1
64	2022-12-28 19:13:10.281903+03:30	133	گرماتاب سالن صفحه	3		9	1
65	2022-12-28 19:13:10.284193+03:30	132	گرماتاب سالن هایگلاس	3		9	1
66	2022-12-28 19:13:10.286377+03:30	131	تابلو برق سالن صفحه	3		9	1
67	2022-12-28 19:13:10.288837+03:30	130	تابلو برق سالن هایگلاس	3		9	1
68	2022-12-28 19:13:10.291037+03:30	129	کولر آبی سالن هایگلاس	3		9	1
69	2022-12-28 19:13:10.293234+03:30	128	دستگاه هایگلاس نایس	3		9	1
70	2022-12-28 19:13:10.296296+03:30	127	تسمه کش بادی 2	3		9	1
71	2022-12-28 19:13:10.298455+03:30	126	تسمه کش بادی 1	3		9	1
72	2022-12-28 19:13:10.300656+03:30	125	پرس گرم 3 طبقه	3		9	1
73	2022-12-28 19:13:10.303259+03:30	124	قیچی بالابر(لیفت) HESSAN	3		9	1
74	2022-12-28 19:13:10.305524+03:30	123	قیچی بالابر(لیفت) پشت کار	3		9	1
75	2022-12-28 19:13:10.307757+03:30	122	دستگاه تانک چسب HESSAN	3		9	1
76	2022-12-28 19:13:10.31022+03:30	121	دستگاه تانک چسب پشت کار	3		9	1
77	2022-12-28 19:13:10.312787+03:30	120	دستگاه پشت کار	3		9	1
78	2022-12-28 19:13:10.315967+03:30	119	دستگاه هایگلاس HESSAN	3		9	1
79	2022-12-28 19:13:10.318469+03:30	118	سوله سالن صفحه	3		9	1
80	2022-12-28 19:13:10.320671+03:30	117	برش HPL	3		9	1
81	2022-12-28 19:13:10.323767+03:30	116	میخ استوپ 2	3		9	1
82	2022-12-28 19:13:10.326039+03:30	115	میخ استوپ 1	3		9	1
83	2022-12-28 19:13:10.32821+03:30	114	اور فرز 2	3		9	1
84	2022-12-28 19:13:10.330378+03:30	113	اورفرز 1	3		9	1
85	2022-12-28 19:13:10.332511+03:30	112	اره دیوالت	3		9	1
86	2022-12-28 19:13:10.336156+03:30	111	کولر سالن صفحه	3		9	1
87	2022-12-28 19:13:10.338754+03:30	110	پرس گرم سالن صفحه	3		9	1
88	2022-12-28 19:13:10.341626+03:30	109	رول پرس	3		9	1
89	2022-12-28 19:13:10.3439+03:30	108	تنونر	3		9	1
90	2022-12-28 19:13:10.346542+03:30	107	برش طولی	3		9	1
91	2022-12-28 19:13:10.349662+03:30	106	خلال کن	3		9	1
92	2022-12-28 19:13:10.354451+03:30	105	برش کلگی	3		9	1
93	2022-12-28 19:13:10.358277+03:30	104	چسب زن پرس دوبل 2	3		9	1
94	2022-12-28 19:13:10.360776+03:30	103	چسب زن پرس دوبل 1	3		9	1
95	2022-12-28 19:13:10.363692+03:30	102	پرس پنوماتیک 2	3		9	1
96	2022-12-28 19:13:10.36589+03:30	101	پرس پنوماتیک 1	3		9	1
97	2022-12-28 19:13:10.368141+03:30	100	دستگاه پست فرم 590	3		9	1
98	2022-12-28 19:13:10.370409+03:30	99	لیفتراک 3/5 تن گازی	3		9	1
99	2022-12-28 19:13:10.372818+03:30	98	لیفتراک 3/5 تن دیزل	3		9	1
100	2022-12-28 19:13:10.376654+03:30	97	لیفتراک 3 تن دیزل	3		9	1
101	2022-12-28 19:13:10.379029+03:30	96	لیفتراک 7 تن دیزل	3		9	1
102	2022-12-28 19:13:59.510249+03:30	194	لیفتراک 7 تن دیزل	1	[{"added": {}}]	9	1
103	2022-12-28 19:15:01.088458+03:30	195	asdw	1	[{"added": {}}]	9	1
104	2022-12-28 19:15:06.845141+03:30	195	asdw	3		9	1
105	2022-12-28 19:15:06.884027+03:30	194	لیفتراک 7 تن دیزل	3		9	1
106	2022-12-28 19:18:25.955994+03:30	196	amir	1	[{"added": {}}]	9	1
107	2022-12-28 19:24:39.250484+03:30	196	amir	3		9	1
108	2022-12-28 19:25:58.400452+03:30	197	kl	1	[{"added": {}}]	9	1
109	2022-12-28 19:38:22.007167+03:30	198	fgh	1	[{"added": {}}]	9	1
110	2022-12-28 19:38:56.773438+03:30	199	2	1	[{"added": {}}]	9	1
111	2022-12-28 19:39:02.961954+03:30	199	2	3		9	1
112	2022-12-28 19:39:02.967643+03:30	198	fgh	3		9	1
113	2022-12-28 19:39:02.970254+03:30	0	kl	3		9	1
114	2022-12-28 19:39:13.48916+03:30	200	swq	1	[{"added": {}}]	9	1
115	2022-12-28 19:39:59.371365+03:30	1	213	1	[{"added": {}}]	9	1
116	2022-12-28 19:40:05.136756+03:30	2	333	1	[{"added": {}}]	9	1
117	2022-12-28 19:40:21.272886+03:30	200	swq	3		9	1
118	2022-12-28 19:40:21.280414+03:30	2	333	3		9	1
119	2022-12-28 19:40:21.28447+03:30	1	213	3		9	1
120	2022-12-28 19:41:14.357055+03:30	1	دستگاه تانک چسب HESSAN	1	[{"added": {}}]	9	1
121	2022-12-28 19:41:22.638568+03:30	2	دستگاه هایگلاس HESSAN	1	[{"added": {}}]	9	1
122	2022-12-28 19:41:26.979443+03:30	3	دستگاه پشت کار	1	[{"added": {}}]	9	1
123	2022-12-28 19:41:34.122846+03:30	4	دستگاه تانک چسب پشت کار	1	[{"added": {}}]	9	1
124	2022-12-28 19:41:38.604692+03:30	5	قیچی بالابر(لیفت) پشت کار	1	[{"added": {}}]	9	1
125	2022-12-28 19:41:42.722076+03:30	6	قیچی بالابر(لیفت) HESSAN	1	[{"added": {}}]	9	1
126	2022-12-28 19:41:47.462705+03:30	7	پرس گرم 3 طبقه	1	[{"added": {}}]	9	1
127	2022-12-28 19:41:55.67195+03:30	8	تسمه کش بادی 1	1	[{"added": {}}]	9	1
128	2022-12-28 19:41:59.750943+03:30	9	لیفتراک 7 تن دیزل	1	[{"added": {}}]	9	1
129	2022-12-28 19:42:03.329986+03:30	10	لیفتراک 3 تن دیزل	1	[{"added": {}}]	9	1
130	2022-12-28 19:42:13.279551+03:30	11	لیفتراک 3/5 تن دیزل	1	[{"added": {}}]	9	1
131	2022-12-28 19:42:16.560818+03:30	12	لیفتراک 3/5 تن گازی	1	[{"added": {}}]	9	1
132	2022-12-28 19:42:21.676569+03:30	13	دستگاه پست فرم 590	1	[{"added": {}}]	9	1
133	2022-12-28 19:42:25.51096+03:30	14	پرس پنوماتیک 1	1	[{"added": {}}]	9	1
134	2022-12-28 19:42:35.681704+03:30	15	پرس پنوماتیک 2	1	[{"added": {}}]	9	1
135	2022-12-28 19:42:43.345948+03:30	16	چسب زن پرس دوبل 1	1	[{"added": {}}]	9	1
136	2022-12-28 19:44:57.607851+03:30	13	دستگاه پست فرم 590	3		9	1
137	2022-12-28 19:45:39.817935+03:30	14	دستگاه پست فرم 590	2	[{"changed": {"fields": ["name"]}}]	9	1
138	2022-12-28 19:45:48.921525+03:30	15	پرس پنوماتیک 1	2	[{"changed": {"fields": ["name"]}}]	9	1
139	2022-12-28 19:45:57.956679+03:30	16	پرس پنوماتیک 2	2	[{"changed": {"fields": ["name"]}}]	9	1
140	2022-12-28 19:46:04.642328+03:30	17	چسب زن پرس دوبل 1	1	[{"added": {}}]	9	1
141	2022-12-28 19:46:10.88924+03:30	18	چسب زن پرس دوبل 2	1	[{"added": {}}]	9	1
142	2022-12-28 19:46:15.460295+03:30	19	برش کلگی	1	[{"added": {}}]	9	1
143	2022-12-28 19:46:19.329642+03:30	20	خلال کن	1	[{"added": {}}]	9	1
144	2022-12-28 19:46:22.950746+03:30	21	برش طولی	1	[{"added": {}}]	9	1
145	2022-12-28 19:46:26.760217+03:30	22	تنونر	1	[{"added": {}}]	9	1
146	2022-12-28 19:46:32.070084+03:30	23	رول پرس	1	[{"added": {}}]	9	1
147	2022-12-28 19:46:37.57011+03:30	24	پرس گرم سالن صفحه	1	[{"added": {}}]	9	1
148	2022-12-28 19:46:41.924462+03:30	25	کولر سالن صفحه	1	[{"added": {}}]	9	1
149	2022-12-28 19:46:44.90055+03:30	26	اره دیوالت	1	[{"added": {}}]	9	1
150	2022-12-28 19:46:49.137513+03:30	27	اورفرز 1	1	[{"added": {}}]	9	1
151	2022-12-28 19:46:56.717409+03:30	28	اور فرز 2	1	[{"added": {}}]	9	1
152	2022-12-28 19:47:00.622535+03:30	29	میخ استوپ 1	1	[{"added": {}}]	9	1
153	2022-12-28 19:47:06.168192+03:30	30	میخ استوپ 2	1	[{"added": {}}]	9	1
154	2022-12-28 19:47:09.728868+03:30	30	میخ استوپ 2	2	[]	9	1
155	2022-12-28 19:47:25.570637+03:30	31	برش HPL	1	[{"added": {}}]	9	1
156	2022-12-28 19:47:30.52002+03:30	32	سوله سالن صفحه	1	[{"added": {}}]	9	1
157	2022-12-28 19:47:34.622317+03:30	33	تسمه کش بادی 2	1	[{"added": {}}]	9	1
158	2022-12-28 19:47:38.871216+03:30	34	دستگاه هایگلاس نایس	1	[{"added": {}}]	9	1
159	2022-12-28 19:47:43.818115+03:30	35	کولر آبی سالن هایگلاس	1	[{"added": {}}]	9	1
160	2022-12-28 19:47:47.481092+03:30	36	تابلو برق سالن هایگلاس	1	[{"added": {}}]	9	1
161	2022-12-28 19:47:53.854717+03:30	37	تابلو برق سالن صفحه	1	[{"added": {}}]	9	1
162	2022-12-28 19:47:57.172603+03:30	38	گرماتاب سالن هایگلاس	1	[{"added": {}}]	9	1
163	2022-12-28 19:48:00.901199+03:30	39	گرماتاب سالن صفحه	1	[{"added": {}}]	9	1
164	2022-12-28 19:48:04.269955+03:30	40	سوله هایگلاس	1	[{"added": {}}]	9	1
165	2022-12-28 19:48:06.325354+03:30	40	سوله هایگلاس	2	[]	9	1
166	2022-12-28 19:48:17.42106+03:30	41	سوله انبار	1	[{"added": {}}]	9	1
167	2022-12-28 19:48:23.730126+03:30	42	سلفون کش 1	1	[{"added": {}}]	9	1
168	2022-12-28 19:48:29.26185+03:30	43	سلفون کش2	1	[{"added": {}}]	9	1
169	2022-12-28 19:48:33.87493+03:30	44	محوطه کارخانه	1	[{"added": {}}]	9	1
170	2022-12-28 19:48:37.13253+03:30	45	ژنراطور	1	[{"added": {}}]	9	1
171	2022-12-28 19:48:40.388227+03:30	46	اتاق نگهبانی	1	[{"added": {}}]	9	1
172	2022-12-28 19:48:43.153296+03:30	47	اتاق کنترل کیفی	1	[{"added": {}}]	9	1
173	2022-12-28 19:48:45.796689+03:30	48	اتاق برنامه ریزی	1	[{"added": {}}]	9	1
174	2022-12-28 19:48:49.227558+03:30	49	اتاق تولید	1	[{"added": {}}]	9	1
175	2022-12-28 19:48:52.787165+03:30	50	اتاق اداری	1	[{"added": {}}]	9	1
176	2022-12-28 19:48:55.743838+03:30	51	اتاق لجستیک	1	[{"added": {}}]	9	1
177	2022-12-28 19:48:59.341434+03:30	52	اتاق کنفرانس	1	[{"added": {}}]	9	1
178	2022-12-28 19:49:01.546126+03:30	52	اتاق کنفرانس	2	[]	9	1
179	2022-12-28 19:49:08.15201+03:30	53	اتاق مدیریت	1	[{"added": {}}]	9	1
180	2022-12-28 19:49:11.706472+03:30	54	اتاق منشی	1	[{"added": {}}]	9	1
181	2022-12-28 19:49:14.52541+03:30	55	سوئیت	1	[{"added": {}}]	9	1
182	2022-12-28 19:49:18.755043+03:30	56	سالن غذا خوری	1	[{"added": {}}]	9	1
183	2022-12-28 19:49:25.531839+03:30	57	آشپزخانه بالا	1	[{"added": {}}]	9	1
184	2022-12-28 19:49:29.090092+03:30	58	سرویس بهداستی صفحه	1	[{"added": {}}]	9	1
185	2022-12-28 19:49:32.788593+03:30	59	سرویس بهداشتی محوطه	1	[{"added": {}}]	9	1
186	2022-12-28 19:49:36.489839+03:30	60	سرویس بهداشتی بانوان	1	[{"added": {}}]	9	1
187	2022-12-28 19:49:38.236951+03:30	60	سرویس بهداشتی بانوان	2	[]	9	1
188	2022-12-28 19:49:41.909494+03:30	61	مکنده مرکزی سالن صفحه	1	[{"added": {}}]	9	1
189	2022-12-28 19:49:44.998254+03:30	62	مکنده مرکزی هایگلاس	1	[{"added": {}}]	9	1
190	2022-12-28 19:49:48.39571+03:30	63	مکنده 4 قلو پشت کار	1	[{"added": {}}]	9	1
191	2022-12-28 19:49:51.87751+03:30	64	دستگاه نوار لبه	1	[{"added": {}}]	9	1
192	2022-12-28 19:49:55.718405+03:30	65	دستگاه اره دور کن	1	[{"added": {}}]	9	1
193	2022-12-28 19:49:59.757598+03:30	66	دستگاه فرچه هایگلاس	1	[{"added": {}}]	9	1
194	2022-12-28 19:50:03.384824+03:30	67	پیجر	1	[{"added": {}}]	9	1
195	2022-12-28 19:50:08.844046+03:30	68	کمپرسور مرکزی	1	[{"added": {}}]	9	1
196	2022-12-28 19:50:12.382111+03:30	69	آب سرد کن سالن صفحه	1	[{"added": {}}]	9	1
197	2022-12-28 19:50:15.787708+03:30	70	آب سرد کن سالن هایگلاس	1	[{"added": {}}]	9	1
198	2022-12-28 19:50:18.019078+03:30	70	آب سرد کن سالن هایگلاس	2	[]	9	1
199	2022-12-28 19:50:23.828166+03:30	71	ساخت	1	[{"added": {}}]	9	1
200	2022-12-28 19:50:26.805466+03:30	72	دفتر مرکزی	1	[{"added": {}}]	9	1
201	2022-12-28 19:50:29.537384+03:30	73	رختکن پرسنل	1	[{"added": {}}]	9	1
202	2022-12-28 19:50:33.034699+03:30	74	اتاق سمپل	1	[{"added": {}}]	9	1
203	2022-12-28 19:50:36.370353+03:30	75	دستگاه کاغذ خورد کن	1	[{"added": {}}]	9	1
204	2022-12-28 19:50:40.101174+03:30	76	لیفتراک 5 تن	1	[{"added": {}}]	9	1
205	2022-12-28 19:50:44.712253+03:30	77	دستگاه جت پرینتر متسا 2128	1	[{"added": {}}]	9	1
206	2022-12-28 19:50:47.980543+03:30	78	دستگاه جت پرینتر آرن جت	1	[{"added": {}}]	9	1
207	2022-12-28 19:50:51.886918+03:30	79	دستگاه جت پرینتر سپند افزار	1	[{"added": {}}]	9	1
208	2022-12-28 19:50:55.750369+03:30	80	پرس طبقاتی	1	[{"added": {}}]	9	1
209	2022-12-28 19:50:56.92404+03:30	80	پرس طبقاتی	2	[]	9	1
210	2022-12-28 19:51:03.847272+03:30	81	لیفتراک 5 تن هایستر	1	[{"added": {}}]	9	1
211	2022-12-28 19:51:07.520225+03:30	82	سلفون کش طبقاتی	1	[{"added": {}}]	9	1
212	2022-12-28 19:51:11.029083+03:30	83	کولین تاور	1	[{"added": {}}]	9	1
213	2022-12-28 19:51:14.933021+03:30	84	لیفت بالابر طبقاتی	1	[{"added": {}}]	9	1
214	2022-12-28 19:51:18.562992+03:30	85	بویلر بخار	1	[{"added": {}}]	9	1
215	2022-12-28 19:51:22.786734+03:30	86	کمپرسور 22 کیلو وات	1	[{"added": {}}]	9	1
216	2022-12-28 19:51:26.355813+03:30	87	دستگاه تسویه RO	1	[{"added": {}}]	9	1
217	2022-12-28 19:51:29.644834+03:30	88	مخزن فلزی برگشت آب گرم	1	[{"added": {}}]	9	1
218	2022-12-28 19:51:33.145171+03:30	89	اتاق تولید پرس	1	[{"added": {}}]	9	1
219	2022-12-28 19:51:36.83307+03:30	90	ژنراطور دفتر مرکزی	1	[{"added": {}}]	9	1
220	2022-12-28 19:51:38.40151+03:30	90	ژنراطور دفتر مرکزی	2	[]	9	1
221	2022-12-28 19:51:45.55372+03:30	91	گرماتاب سالن پرس	1	[{"added": {}}]	9	1
222	2022-12-28 19:51:49.435411+03:30	92	تسمه کش بادی شماره 3	1	[{"added": {}}]	9	1
223	2022-12-28 19:51:52.686021+03:30	93	سوله پرس طبقاتی	1	[{"added": {}}]	9	1
224	2022-12-28 19:51:56.03549+03:30	94	کابل کشی	1	[{"added": {}}]	9	1
225	2022-12-28 19:52:01.096666+03:30	95	ترمز پودری	1	[{"added": {}}]	9	1
226	2022-12-28 19:53:00.149687+03:30	277	401000251	2	[{"changed": {"fields": ["operation", "description"]}}]	7	1
227	2023-01-18 10:21:36.841555+03:30	49	12313	3		4	1
228	2023-01-18 11:12:47.719899+03:30	4	11	2	[{"changed": {"fields": ["Groups"]}}]	4	1
229	2023-01-18 11:12:48.864101+03:30	4	11	2	[]	4	1
230	2023-01-18 11:16:56.364128+03:30	17	22	2	[{"changed": {"fields": ["Groups"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	base	order
8	base	department
9	base	operation
10	base	subgroup
11	base	task
12	users	profile
13	review	review
14	review	part
15	review	reviewtask
16	review	machine
17	base	repairoperator
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
91	contenttypes	0001_initial	2023-01-08 00:58:55.173464+03:30
92	auth	0001_initial	2023-01-08 00:58:55.177941+03:30
93	admin	0001_initial	2023-01-08 00:58:55.180911+03:30
94	admin	0002_logentry_remove_auto_add	2023-01-08 00:58:55.183965+03:30
95	admin	0003_logentry_add_action_flag_choices	2023-01-08 00:58:55.186741+03:30
96	contenttypes	0002_remove_content_type_name	2023-01-08 00:58:55.189405+03:30
97	auth	0002_alter_permission_name_max_length	2023-01-08 00:58:55.192316+03:30
98	auth	0003_alter_user_email_max_length	2023-01-08 00:58:55.195149+03:30
99	auth	0004_alter_user_username_opts	2023-01-08 00:58:55.197992+03:30
100	auth	0005_alter_user_last_login_null	2023-01-08 00:58:55.20076+03:30
101	auth	0006_require_contenttypes_0002	2023-01-08 00:58:55.203714+03:30
102	auth	0007_alter_validators_add_error_messages	2023-01-08 00:58:55.207113+03:30
103	auth	0008_alter_user_username_max_length	2023-01-08 00:58:55.210136+03:30
104	auth	0009_alter_user_last_name_max_length	2023-01-08 00:58:55.21367+03:30
105	auth	0010_alter_group_name_max_length	2023-01-08 00:58:55.21669+03:30
106	auth	0011_update_proxy_permissions	2023-01-08 00:58:55.219836+03:30
107	base	0001_initial	2023-01-08 00:58:55.223708+03:30
108	review	0001_initial	2023-01-08 00:58:55.226621+03:30
109	sessions	0001_initial	2023-01-08 00:58:55.230014+03:30
110	users	0001_initial	2023-01-08 00:58:55.234615+03:30
111	auth	0012_alter_user_first_name_max_length	2023-01-17 11:19:05.443465+03:30
112	base	0002_remove_task_operator	2023-01-17 11:19:12.358431+03:30
113	base	0003_task_operator	2023-01-17 11:19:12.3648+03:30
114	base	0004_remove_task_operator	2023-01-17 11:19:58.011113+03:30
115	base	0005_task_operator	2023-01-17 11:20:17.55248+03:30
116	base	0006_auto_20230117_0946	2023-01-17 13:17:07.876714+03:30
117	base	0007_remove_order_iscompleted	2023-01-17 13:17:29.393206+03:30
118	base	0008_task_completed	2023-01-17 13:20:37.550372+03:30
119	base	0009_remove_task_completed	2023-01-17 13:20:57.955504+03:30
120	base	0010_remove_task_operators	2023-01-17 13:22:04.940469+03:30
121	base	0011_task_operators	2023-01-17 13:22:28.01715+03:30
122	base	0012_task_status	2023-01-19 17:51:39.82409+03:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
a2fkq2sf43ei6bm2zhlzym35jjnakfum	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-09-14 15:00:35.027584+04:30
7ieixrwtpsrce6nq4urgz33nad3ao0ix	N2ZjNDhlZWQ5YmQzZjcyZTA2MTljY2FlYmEwYWE5ZDMyMzA0NjFkYTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTE0ODkyNjg1NmViMzdlYjI4ZWVmNTdlMzNmNDNlYjIwMjhjNzE3YyJ9	2022-09-15 07:38:41.91726+04:30
f7q6bkn0n4cd4seaugy2wu2jdsqiaoey	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-09-20 08:46:20.454577+04:30
aw46l33fen4ehq6k5adpu2tbgrypau0h	OWUzZDRlZWI1ZTU4NzFlZDU5YmExMjQ0MmM0NzU0MDQ4ZWQwOGI4OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-09-15 11:17:40.770106+04:30
bejwwrwie7ibvjk2r2vu6kc3pnnuo9sn	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-09-15 11:44:38.249741+04:30
dzdnozaebrsn7rnplmhzpdj2gqeiinwi	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-09-23 12:24:52.780867+03:30
rb8viaz7j1t2vxvgmzipd3m0d40pdq8i	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-09-15 12:20:32.50115+04:30
dqlyly3rzy8f6jny7o9v9amb9zhzn6to	NGZjOTU0NTViYjFiOWNlYmE3NDhkNzYzMDc1ZjVjNDc0M2FiY2UxNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkYjdiM2IwZjQyNWIyMWE1YzVlMTAwZTI0NTIxNzU0N2ExNDdmMDNjIn0=	2022-09-12 11:19:06.928478+04:30
5p5e6e1hm4c01dqcfze6oammeft80mem	OGU1ZDYxNDFjMGI3NWExNTg4NjE2OTA0ZWNiZjAwNDU1NGUyOGEyNjp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDlhOWM5OWI0YjZmYmZkMzY1MDZmYjQ1NDgzZjcxNTEwMmY5N2RiNyJ9	2022-09-28 06:52:57.342905+03:30
ng699liblbllu353wzji2f1w5t1ftu60	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-09-14 09:07:46.972508+04:30
se0f7ffl23uz29hhg3u82hm0xmibwnr6	YmU4OWNhODhlMjliNjExMTZiOGQ2NjViYjMyODNkMzcyNGQwNGZkZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-09-14 09:12:14.511468+04:30
jsofqji2ppxymv95l9k1jzlkti08iwvz	YmU4OWNhODhlMjliNjExMTZiOGQ2NjViYjMyODNkMzcyNGQwNGZkZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-09-14 09:14:31.735782+04:30
3j1iu5o27ls9afhyno1e7evb9zvipo14	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-10-02 08:45:01.027094+03:30
nz0qcvq69exy0i51sx7c65gue1d04wkw	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-09-14 09:26:20.209167+04:30
ms0dvrr95sdk8q0agfjsuaauq2dzqzy3	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-10-03 07:47:43.629849+03:30
kmhiu64usqa037fuw5pdveswu50pjoq1	YmU4OWNhODhlMjliNjExMTZiOGQ2NjViYjMyODNkMzcyNGQwNGZkZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-10-03 08:07:17.620465+03:30
osj01jczhp8xsyg6s8h8qjg5hf2iioxh	YzBiOWNlYTljNDkxYmYxMWQyNDlhZGEwNGIwMTgyOGIyZDdmY2NkNDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTc3ZGY1YTliNzA5MDk2NGVjNWU5MDY3MjJiZmVmODI5ZTQ2MjdjIn0=	2022-09-14 09:32:12.054527+04:30
ql063vmzvaq6wgi4pequuys2hvwdfy3t	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-10-04 07:45:44.744516+03:30
h8sa2irpbvtwu2yzemdfp7j9aolj49tv	OWUzZDRlZWI1ZTU4NzFlZDU5YmExMjQ0MmM0NzU0MDQ4ZWQwOGI4OTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-10-12 09:48:52.390964+03:30
asxnk22f5e1hsv4ljaxgutvmtli9twno	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-09-17 15:22:57.784824+04:30
lvqs00k21dgvhwfjjs45gemrvw2xj6mk	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-09-17 20:29:57.097036+04:30
3a62fvka9114rfdwnyogbzw46h93ncdu	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-09-18 13:41:25.827993+04:30
rbd9ryehfim7tr92s6u8ehzz6wnwfarv	YzBiOWNlYTljNDkxYmYxMWQyNDlhZGEwNGIwMTgyOGIyZDdmY2NkNDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTc3ZGY1YTliNzA5MDk2NGVjNWU5MDY3MjJiZmVmODI5ZTQ2MjdjIn0=	2022-10-04 08:32:33.759973+03:30
gsycpg5gdq7g0qwop83yh92ygsa9vvaj	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-10-04 08:37:48.327193+03:30
r15cfq97h3ho787mkk52s29bw56h5ncu	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-11-12 09:44:32.958689+03:30
xsoih6ga7nb7m3zkshusxqesm1zyo7u5	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-10-22 13:40:52.212552+03:30
f1r51m2u19iyaghir2fmfkjb1yhdtuf1	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-11-12 10:03:07.491679+03:30
l6sgzmoibakix4o2mdgz1t9nq09lk7hd	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-10-22 15:21:09.299357+03:30
q6ys0vh1nqe937cwf3vfuyfr9gb6q20k	OGU1ZDYxNDFjMGI3NWExNTg4NjE2OTA0ZWNiZjAwNDU1NGUyOGEyNjp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDlhOWM5OWI0YjZmYmZkMzY1MDZmYjQ1NDgzZjcxNTEwMmY5N2RiNyJ9	2022-10-24 08:26:32.813544+03:30
jl4tbtjam8rk41onzqi0z6wsw1go4zsb	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-11-16 12:50:43.232722+03:30
578u5uoohj3px4zdfjgwvzac6fnrizgm	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-11-16 12:52:31.617448+03:30
7uwq36c9v5p07vbhziomb5lawo5bfra2	YzBiOWNlYTljNDkxYmYxMWQyNDlhZGEwNGIwMTgyOGIyZDdmY2NkNDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTc3ZGY1YTliNzA5MDk2NGVjNWU5MDY3MjJiZmVmODI5ZTQ2MjdjIn0=	2022-11-17 11:21:21.797412+03:30
q75n52hwsy0nc864i26q0wyko2in1z8g	M2FlZTNhMjE1YjdiZGYyZGEzZGNkMjEwNDM1OGE2MDhkMDk3MjkxMTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTg4ZWI1OGMxZTM5NzhmYTI1MGFlMzYxMmNhYWUxNmQ1NGU0MDczNSJ9	2022-10-25 14:31:12.664776+03:30
b6nxg2rp711sx5spxe9giy6piy2wgvla	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-10-25 16:14:54.961213+03:30
dz9bqpkzdowj3ev7zd6bx6mtijpaanv3	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-11-20 11:57:35.542611+03:30
isg3fdr13bjhhhby5yb2gnx0pyatlvmy	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-10-29 09:00:10.886869+03:30
muemcla32cying2g7iqk7v7h9cknhlbz	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-11-21 12:50:57.977863+03:30
6rrvzi1kaj47cyxam6ft659ybuqrp6sg	YTA3ZDZjODI3ODFkODMzMDQ5Nzc5ODc1OGRjZDM0ZWVlODI3MTdiOTp7fQ==	2022-10-29 09:06:27.663257+03:30
t943njdxhjdbdqvm6ao83ufv1qvfe19i	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-11-26 09:48:52.486675+03:30
rc5o63va3i0o6mfr521lzbvzbmmqsg3m	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-11-28 12:19:45.369275+03:30
dpe5zmy1327ilxq2kjlv18unlumaz6yp	MTczMWZhYTI4YzRkZTZiZjE0Y2E2YzRmZGExMGNkMDAzMjRhODYyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMmViY2FkMmI5YmEyMTYwMTU4NzZmNDQ1YWI0ZGZmNDc4MTU0NjZlIn0=	2022-10-30 10:07:36.175018+03:30
sv4lhjzm656005ldunbbofrvs62wgypw	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-10-31 08:36:50.934131+03:30
9ghaxb2qvuig07guyiyscwhbdfzfa19v	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-11-02 08:51:14.533721+03:30
uues1r08wptwi1e2l258zrpzum9uglm4	YzBiOWNlYTljNDkxYmYxMWQyNDlhZGEwNGIwMTgyOGIyZDdmY2NkNDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMTc3ZGY1YTliNzA5MDk2NGVjNWU5MDY3MjJiZmVmODI5ZTQ2MjdjIn0=	2022-11-02 14:30:24.500757+03:30
ab58qjvkc1qcxmhzuv6nuz82j0i5cd8x	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-11-04 09:54:59.14489+03:30
488759nkm3uzvo09fetgm6eqyseesadh	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-11-04 12:27:38.518478+03:30
9wbl7pleg0pqfuaq57lj89zeosi6pmlw	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-11-08 08:23:50.743787+03:30
jsd2mgfgfydz4je11tmppg8qhr0oea9h	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-11-08 15:39:06.518909+03:30
2l6g1sr2367npq4kxuwtlhh3g8v3k6wc	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-12-18 11:23:46.826066+03:30
q99kca6iwlu46266ueozlxeq2tq51p0w	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-12-19 10:15:06.494603+03:30
2l02ckv9tr7cqj7126b3udu19fs5w1df	YmI0YmQzMzdjODUxNDBlMWY0ZDkxOTliZjUwNTYzMDIzOTM1MmViODp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjZhMDFkMTQ3NzY1YTQ2NThiYjVhMGNlMTMxNmMxNDRiZTU4OWQxZiJ9	2023-01-18 09:20:18.604425+03:30
twdybdvexzelbydsk5l2c7up7q2fox0n	YzNkZTkyOGQ0ZWFkZDFiYWUyMjgxNmRjNGIzYjQ1ZGYwMjY5MDg1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzU3NWYwOTI4NzU3ZDJmY2JjNzNiZjg0MjViNjZkZGQ4NzA4MjI3MyJ9	2022-12-19 15:04:57.664906+03:30
f1deda5uxnvxwxw4xdfgcic415701x8p	MTczMWZhYTI4YzRkZTZiZjE0Y2E2YzRmZGExMGNkMDAzMjRhODYyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMmViY2FkMmI5YmEyMTYwMTU4NzZmNDQ1YWI0ZGZmNDc4MTU0NjZlIn0=	2022-11-24 07:19:07.508515+03:30
826cyzgo2ypoxpebj7zv3xgatwcszqco	NmQwYmNlYmY5YzY0MjNjZDBkMDY1M2JlMmY1ODViMTU0NGFkMGIzMjp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGVmMjA2MGVkZDE5ZDJlMGIyNjE3OThjNmI5MDk0MWRiYzRhZTc0YSJ9	2022-12-31 11:26:42.657667+03:30
vwhnio0pba2ix08j1zxvqokdusbxwl0a	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-12-20 08:24:55.921304+03:30
ps73007cq8w09lticd1ppgtgkcj28ieg	MTE3OWRmYjBmYjkwYTRjMzhlNDU1ZGI3ZmFlODRhMzhlZjQ1OWRhNDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNjA0ZTUwZDY0NjE4OWJmZGJhZjQ1MTNiZjU3Y2NmNzYzN2Q3NjM0In0=	2022-12-31 12:57:54.889057+03:30
7nqt4fweni2jgahyre728dbgvovu5iyq	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-12-20 23:48:49.112261+03:30
x3hqyyyw8aqh0uc1grdah807ma9pm120	YWQxZTliMzY4YzU1Nzg0Nzg0MzZjNmFjN2QyMWQ5NWI5N2JmMjliMTp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYzgzNmUzM2Q4ZGEyMWViZGVhNDVjMjFjNDZmNmVlZjhiMzNjNDUxIn0=	2023-01-12 08:53:36.726738+03:30
39jtyes9s0xybivjwbnx35hfhf0gh94q	MWNiNDYxYjBkM2FhNWFhNzkyNWY1MzYzNzI5NzI4MWFlOGY3OWM1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmE1NDNhOTA3MGQxN2Y0MTI3MGY3MjA4ZWFlY2MxOGE4OTA4YjI5MyJ9	2023-01-01 15:33:49.66609+03:30
uizqcm8nd4fi23duffoq32zvjeu38qcu	MTE3OWRmYjBmYjkwYTRjMzhlNDU1ZGI3ZmFlODRhMzhlZjQ1OWRhNDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNjA0ZTUwZDY0NjE4OWJmZGJhZjQ1MTNiZjU3Y2NmNzYzN2Q3NjM0In0=	2022-12-24 14:32:07.592279+03:30
d6sii569pugafnnghh9m3fr26bgq2wmi	MTE3OWRmYjBmYjkwYTRjMzhlNDU1ZGI3ZmFlODRhMzhlZjQ1OWRhNDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNjA0ZTUwZDY0NjE4OWJmZGJhZjQ1MTNiZjU3Y2NmNzYzN2Q3NjM0In0=	2023-01-03 09:37:03.555923+03:30
b7woskj8v3xau2t7hmnkgq6dftwwkfa0	.eJxVjDsOwjAQBe_iGln-xR9Kes5g7dprHEC2FCcV4u4QKQW0b2bei0XY1hq3QUucMzszyU6_G0J6UNtBvkO7dZ56W5cZ-a7wgw5-7Zmel8P9O6gw6reGZD0KH3yaCNFodGiVI6dVAQkahQYvilXWQzAyWCpCF0NCuAm9osTeH-gSN84:1pBvQ2:Ct4SQPI7ZheMzU9a79Pv1Zkfsqg2K0-cbS8tTcBh9f8	2023-01-15 13:48:18.246108+03:30
5l0t65y7dqplbg8kjl95eplavtv1h0s5	MTE3OWRmYjBmYjkwYTRjMzhlNDU1ZGI3ZmFlODRhMzhlZjQ1OWRhNDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNjA0ZTUwZDY0NjE4OWJmZGJhZjQ1MTNiZjU3Y2NmNzYzN2Q3NjM0In0=	2023-01-03 10:39:37.086634+03:30
5mc19d4yus4bnhho2t30hv2krw0z6srd	.eJxVjEEOwiAQRe_C2pDSwgAu3XuGZpgZbNVAUtqV8e7apAvd_vfef6kRt3UatybLOLM6K2PV6XdMSA8pO-E7llvVVMu6zEnvij5o09fK8rwc7t_BhG361ilkO_TRZwiuCyjoOuI0DAAQwfsEfWYQcYaBAJwQGuKeIQfrY4yden8ABDk3_g:1pCCUK:uadLZYrziz86rb3EM5g9EDBCCvrSbqUPeuu2tDfmiV0	2023-01-16 08:01:52.328031+03:30
qh163g4v4jblubtopyfibv2cczlix29m	.eJxVjEEOwiAQRe_C2pDSwgAu3XuGZpgZbNVAUtqV8e7apAvd_vfef6kRt3UatybLOLM6K2PV6XdMSA8pO-E7llvVVMu6zEnvij5o09fK8rwc7t_BhG361ilkO_TRZwiuCyjoOuI0DAAQwfsEfWYQcYaBAJwQGuKeIQfrY4yden8ABDk3_g:1pCCUL:3dxXV9WS_X4OftaW7Y3dVYJySRIITMcp9UnupFZLS2U	2023-01-16 08:01:53.253838+03:30
pwnp4rtrxssp9a2el5wo3ii850m8xwil	Mjk5NjY4MzBmMTQ2Njc2NjJhNDBmM2M2NjhlMjI1NDZmNDZjN2JjZTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDJjY2RhYWY4MTE4MzhjMDA3NzU4MDQyNWMxYjYyNzE1MzYzN2RjNyJ9	2023-01-04 09:20:58.968854+03:30
r6httgsczoglqgxfjx6p9lq8pqb4oqjx	.eJxVjE0OwiAYRO_C2pCC_IhL9z0DGeBDqgaS0q6Md7dNutDlzHszb-axLsWvnWY_JXZlwrLTbxkQn1R3kh6o98Zjq8s8Bb4r_KCdjy3R63a4fwcFvWxrJeE0RRgVKBKIDC7koIjOZLXMbktZJESjXR6gBkDmpIUSLqlsLPt8AUqIOWg:1p8JYl:RJ7GmGp3uOU5D6OpBVunhzyVJXauZIlF33CyGAgm99c	2023-01-05 14:46:23.748812+03:30
vgjfsm5zcmndvubs0em9i3m6bob1y82p	MWMyMDU5ZjZjMTY4YWVjN2M0MzJjMzNhOTdmN2IzZDcxZWYyZDg3MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyZDc0MjY2MGZjYWZjNGJiMTgyYjE1NGU2MjBhZjUwYTVlYzBkODg3In0=	2023-01-05 16:14:51.086324+03:30
z3sv8zpqzeoqmjl6138bx2jvz5lckz66	NmQwYmNlYmY5YzY0MjNjZDBkMDY1M2JlMmY1ODViMTU0NGFkMGIzMjp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGVmMjA2MGVkZDE5ZDJlMGIyNjE3OThjNmI5MDk0MWRiYzRhZTc0YSJ9	2022-12-29 08:51:49.677713+03:30
7vi4tju8oijsot8sxwwgotdz8yx1d3b0	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-12-01 12:30:12.640796+03:30
nk9s0wk7s6frcaaa1gdoezot0blmmmtt	NTdiYTNkZTk3ZGU2NzM1MWI5N2JmMjc0ZTJhZDkyODkzYTA4OTE3ODp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2Y1OWQ3MGNhNjdiYmU4ZjA5NmUzZTBiMThiNmZlNzNhNDFmNDlmYyJ9	2022-12-29 12:40:22.890808+03:30
onk2lgc6fxqjsfmnl2rtts4eed1vj37j	NmQwYmNlYmY5YzY0MjNjZDBkMDY1M2JlMmY1ODViMTU0NGFkMGIzMjp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGVmMjA2MGVkZDE5ZDJlMGIyNjE3OThjNmI5MDk0MWRiYzRhZTc0YSJ9	2022-12-31 12:40:33.26088+03:30
04ablgcujfl2rswegvagdlrynfm0ieyr	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-12-05 08:27:24.86773+03:30
upj3ol3krnktog5sag2t3oyh2zu1wf8v	NDllY2Y3ZDFkNWE5OTNkZGI0ODA1NWJlYWU0NzcxYzZkYzBkNDJlZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTAwMDQxNGZhYzJhOGJhNWU4NmYwNjdkMTI0OWRiYTJiMjcyMzdjZiJ9	2022-12-05 08:29:05.316322+03:30
zijfjm06xbtnrc4u6s1ltg7peqv5fxfx	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-12-06 06:31:03.884891+03:30
pn6r5bfxr8aps2qzhbipaq4u30bh5u8l	ODUzYzNmMDBhOWNjYmEyNzllMTYxMWRlZTg5NmJmMzAxN2I0M2E0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWI3MDM0ZTA3Yjg5NmNhYTg5NTQyZThhMGRmYTA4M2I0YTBmZjQwYyJ9	2022-12-19 14:29:52.57436+03:30
k2o7uc9rvwsatomb652snz77v9iipuq3	MWNiNDYxYjBkM2FhNWFhNzkyNWY1MzYzNzI5NzI4MWFlOGY3OWM1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmE1NDNhOTA3MGQxN2Y0MTI3MGY3MjA4ZWFlY2MxOGE4OTA4YjI5MyJ9	2023-01-01 15:28:48.16601+03:30
2s6jug6beju4k6p3s042o2uby959ofla	YzNkZTkyOGQ0ZWFkZDFiYWUyMjgxNmRjNGIzYjQ1ZGYwMjY5MDg1Nzp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzU3NWYwOTI4NzU3ZDJmY2JjNzNiZjg0MjViNjZkZGQ4NzA4MjI3MyJ9	2022-12-19 15:05:04.304743+03:30
8ijthekc4p9dkcs7ljwmjimaqbncz3wd	NmQwYmNlYmY5YzY0MjNjZDBkMDY1M2JlMmY1ODViMTU0NGFkMGIzMjp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGVmMjA2MGVkZDE5ZDJlMGIyNjE3OThjNmI5MDk0MWRiYzRhZTc0YSJ9	2022-12-19 15:08:19.360617+03:30
bc0iobg1flijmyk1xst1vubo0tukevdv	MWNiNDYxYjBkM2FhNWFhNzkyNWY1MzYzNzI5NzI4MWFlOGY3OWM1Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmE1NDNhOTA3MGQxN2Y0MTI3MGY3MjA4ZWFlY2MxOGE4OTA4YjI5MyJ9	2023-01-01 15:34:47.244094+03:30
0ug80g1xoq1dx4fo1kx32f6dt8r398o7	ODUzYzNmMDBhOWNjYmEyNzllMTYxMWRlZTg5NmJmMzAxN2I0M2E0Zjp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWI3MDM0ZTA3Yjg5NmNhYTg5NTQyZThhMGRmYTA4M2I0YTBmZjQwYyJ9	2022-12-19 16:38:24.95685+03:30
2645p51im4imtqy63ie0ry46n6skd5fm	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-12-13 11:38:06.135052+03:30
6s97c2mfbo7rgk2tr6qs9i1745jlb4q5	MTE3OWRmYjBmYjkwYTRjMzhlNDU1ZGI3ZmFlODRhMzhlZjQ1OWRhNDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkNjA0ZTUwZDY0NjE4OWJmZGJhZjQ1MTNiZjU3Y2NmNzYzN2Q3NjM0In0=	2023-01-02 11:48:03.343898+03:30
0muiqd3e8yway3u9coxz0mesr80ihuwu	MTczMWZhYTI4YzRkZTZiZjE0Y2E2YzRmZGExMGNkMDAzMjRhODYyZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMmViY2FkMmI5YmEyMTYwMTU4NzZmNDQ1YWI0ZGZmNDc4MTU0NjZlIn0=	2022-12-13 13:12:01.479018+03:30
0mns9rkg07ur8nw63yuianqaztdrurhu	ZjUyOTZmY2YwNDcxNDc4YTc5ZmJhNzdlMzk5NDYxMDMxZDdkNmMxNDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzMDA0ZWU1MGUyNGNiMTM4NzA0Yjk0OTQ2Yzg0NmRhNWZjZjdlZWFlIn0=	2023-01-12 11:03:34.760056+03:30
04xuc9n3pwo1l3e92aq2c4hzv3roepvy	OWEyNzkxYzk0OWNlNzEwOTQ5ZjRiNTNjY2MxYzViMWU1ODQ1NGZkODp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzYzNWNkZmI1NDBjZDRiZDRkZWE5MjFlNDY0NTg2OTFhN2IxZjQwMSJ9	2023-01-15 07:14:54.536854+03:30
ekj1tsecxo5grinvdjd2nhq8emuq9qd2	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-12-24 10:30:05.670631+03:30
qlhbd9je1r9nbfci0ygho4l0dkfhninv	YzEzNDJkMGJjNmQ1NTRhZjE0YmExMjFlOGE4ZTZjMmE2N2RlYzk4Yjp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOWE5Yzk5YjRiNmZiZmQzNjUwNmZiNDU0ODNmNzE1MTAyZjk3ZGI3In0=	2022-12-17 08:11:22.045255+03:30
dfcdw16new12gbyz2i3piegc5y7cez4k	NTdiYTNkZTk3ZGU2NzM1MWI5N2JmMjc0ZTJhZDkyODkzYTA4OTE3ODp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiN2Y1OWQ3MGNhNjdiYmU4ZjA5NmUzZTBiMThiNmZlNzNhNDFmNDlmYyJ9	2022-12-26 11:03:10.443548+03:30
u1m8ad6ru3odli4ih6ymb91yalbeyixs	ZDhmZGIxNTg5OWY1N2Y4MDIxODM2MDQzZWY0YTc2OTE5MDhiMGQxZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYzc5MGE2YTExNDZmOGRiOWVkNWQzZTNhYjk0OTM5NGMyODVkYTMxIn0=	2022-12-26 17:15:01.011827+03:30
m4p5cwrn7q5xbu52zqtes0o9bsa0z7u1	MTczMTM0MjU3OWM5ZjhkZjQ0ODQ4NTgwNmZjYzUzNGE3MWVlMzEwNDp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTc0NjFhNDc1NGQ3N2ExNmNkMzNiNzhiNmFhYmE5MmY5ODE2ZTZiZCJ9	2023-01-18 11:52:59.43857+03:30
sa8opb6k6fjwn40mu6una5mf7jwu7s8z	ODBhMmZmMjAxMzA1ZjI3YTVhM2RmYjk4ZGI3OTg1NDVlMzE4MDU4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYxZjU3ZTg1MDJlNTMzOWMwMzNmZTdiZmM0ZWQyNDZkYWVlNjFjIn0=	2023-01-18 16:05:20.247128+03:30
176jpk9jcpxvtr7nsgse6sj1xmte506m	ODBhMmZmMjAxMzA1ZjI3YTVhM2RmYjk4ZGI3OTg1NDVlMzE4MDU4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYxZjU3ZTg1MDJlNTMzOWMwMzNmZTdiZmM0ZWQyNDZkYWVlNjFjIn0=	2023-01-19 09:25:47.563889+03:30
9z9e695wm3t25ozuq227sonabot5qieb	MzQ5MDQxNDFhM2U3YWYyZDI1NzQzYjk4MWRiMGI4YzRiZjkxMzAwMzp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ODg5OTMzMGY0NTI0ZjFhOGMwNTQxOTJiODk5MDc5YTFiNmMzZmQwIn0=	2023-01-11 00:55:13.208178+03:30
3ekpoos2o1gd40mkjj79uj5vgvb9spov	ODBhMmZmMjAxMzA1ZjI3YTVhM2RmYjk4ZGI3OTg1NDVlMzE4MDU4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYxZjU3ZTg1MDJlNTMzOWMwMzNmZTdiZmM0ZWQyNDZkYWVlNjFjIn0=	2023-01-19 10:13:28.305615+03:30
icgku39kpuu7jskmixym3n7vqhn5f60n	ODBhMmZmMjAxMzA1ZjI3YTVhM2RmYjk4ZGI3OTg1NDVlMzE4MDU4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYxZjU3ZTg1MDJlNTMzOWMwMzNmZTdiZmM0ZWQyNDZkYWVlNjFjIn0=	2023-01-20 00:50:19.879688+03:30
x7tha4xokxbxo42qn3v031ixn5tvgg39	ODBhMmZmMjAxMzA1ZjI3YTVhM2RmYjk4ZGI3OTg1NDVlMzE4MDU4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYxZjU3ZTg1MDJlNTMzOWMwMzNmZTdiZmM0ZWQyNDZkYWVlNjFjIn0=	2023-01-20 19:28:36.194638+03:30
608d1zaia1pm7ljb0i2ne9vnni5aoxqe	ODBhMmZmMjAxMzA1ZjI3YTVhM2RmYjk4ZGI3OTg1NDVlMzE4MDU4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYxZjU3ZTg1MDJlNTMzOWMwMzNmZTdiZmM0ZWQyNDZkYWVlNjFjIn0=	2023-01-22 00:16:16.649382+03:30
y6yqysfoiq6dbtlwas2ggc36z6nii754	ODBhMmZmMjAxMzA1ZjI3YTVhM2RmYjk4ZGI3OTg1NDVlMzE4MDU4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYxZjU3ZTg1MDJlNTMzOWMwMzNmZTdiZmM0ZWQyNDZkYWVlNjFjIn0=	2023-01-22 00:47:55.064317+03:30
2gb0t0pwm7271tja4yaplvlpbkzxr3gc	ODBhMmZmMjAxMzA1ZjI3YTVhM2RmYjk4ZGI3OTg1NDVlMzE4MDU4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIwZDYxZjU3ZTg1MDJlNTMzOWMwMzNmZTdiZmM0ZWQyNDZkYWVlNjFjIn0=	2023-01-22 11:41:18.851473+03:30
8psdtfltq7eir68gh8ymthxnhg1j74pt	.eJxVjDsOwjAQBe_iGln-xR9Kes5g7dprHEC2FCcV4u4QKQW0b2bei0XY1hq3QUucMzszyU6_G0J6UNtBvkO7dZ56W5cZ-a7wgw5-7Zmel8P9O6gw6reGZD0KH3yaCNFodGiVI6dVAQkahQYvilXWQzAyWCpCF0NCuAm9osTeH-gSN84:1pCFcP:wx4k8DrATSxwdSYK5EVqdcsWcgDd0IhZh7ZAreJltX8	2023-01-16 11:22:25.403346+03:30
660uwchmk73w58yu1tkuj57f416ginc8	YmI0YmQzMzdjODUxNDBlMWY0ZDkxOTliZjUwNTYzMDIzOTM1MmViODp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjZhMDFkMTQ3NzY1YTQ2NThiYjVhMGNlMTMxNmMxNDRiZTU4OWQxZiJ9	2023-01-22 12:50:37.800852+03:30
uxh7q3cvxu6g45rvn1dozqpenh7beaz5	MDkwNGQwMjQ0YzYyNTViNThiNDgyMjI3NzM3ZGMxYTU3ZGM2YjBhZTp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjI3NjFjMDIyMjU1MjcyMmY2MTIyNTZjZDNjODllMjk5M2JkYjRiNCJ9	2023-01-16 17:42:15.529437+03:30
s3hmm1wy5ka50gggqwmjky7wkaww3hnm	MDU4NjY1MGJlMTliMjhkZDkxY2U5ZTkwMTBiMDk4NDJhMTVjMjI2NDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MWNiM2RmNmIzZWQzZDMwOWVkMzM3ZTY2MWE1YzIxZDNkOTk2OTFmIn0=	2023-01-16 19:06:55.031634+03:30
wx0njmdqnafj8kuprbkx9ftmeudks3ur	MDU4NjY1MGJlMTliMjhkZDkxY2U5ZTkwMTBiMDk4NDJhMTVjMjI2NDp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MWNiM2RmNmIzZWQzZDMwOWVkMzM3ZTY2MWE1YzIxZDNkOTk2OTFmIn0=	2023-01-17 08:35:29.198169+03:30
jh2zlg0655v4ocereh3nx6hbu30110h7	MDkwNGQwMjQ0YzYyNTViNThiNDgyMjI3NzM3ZGMxYTU3ZGM2YjBhZTp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjI3NjFjMDIyMjU1MjcyMmY2MTIyNTZjZDNjODllMjk5M2JkYjRiNCJ9	2023-01-17 12:36:25.586031+03:30
fx30667ax9zwz1rfxei12llyaatxqgfz	.eJxVjEEOwiAQRe_C2hBgsBSX7j0DgZlBqgaS0q6Md7dNutDte-__twhxXUpYO89hInERWpx-WYr45LoLesR6bxJbXeYpyT2Rh-3y1ohf16P9Oyixl209GOPYxtEBE1g1aGshI6vzRkBjznqEbH0ktOTAGyJkzJCc91opIPH5AsxAN6c:1pHgkf:9vAhdSyAHmD5JjZ5BTLZv4EMDyOOE16hIShsv4T8K2Y	2023-01-31 11:21:25.939598+03:30
5z5fxwrusqmk6nl64r2otdww74pdch59	.eJxVjMsOwiAQAP-FsyGUxwoevfsNzS4sUjWQlPZk_HdD0oNeZybzFjPuW5n3zuu8JHERVpx-GWF8ch0iPbDem4ytbutCciTysF3eWuLX9Wj_BgV7GVtnzhNzdhTAk1VkcwavwCfikCZkAxZMYBu98zEg6kDGaA2gtbKOxOcL3943VQ:1pHhey:_EjlN0miLOyVcnPTmQ-LlQwp3lrJVzc9cbQ7DJJ5leQ	2023-01-31 12:19:36.491196+03:30
ag1m6tw5jbmemtburol7q9mzafo6hd11	.eJxVjEEOwiAQRe_C2hBgsBSX7j0DgZlBqgaS0q6Md7dNutDte-__twhxXUpYO89hInERWpx-WYr45LoLesR6bxJbXeYpyT2Rh-3y1ohf16P9Oyixl209GOPYxtEBE1g1aGshI6vzRkBjznqEbH0ktOTAGyJkzJCc91opIPH5AsxAN6c:1pHjhj:rcpxPhHGE4PhRcn58QRRoT4g2_7NqD7ZCn7AJTbBjHw	2023-01-31 14:30:35.298673+03:30
8rpzpsatnjray07kkjyftgkcz9r4n5w1	.eJxVjMsOwiAQAP-FsyGUxwoevfsNzS4sUjWQlPZk_HdD0oNeZybzFjPuW5n3zuu8JHERVpx-GWF8ch0iPbDem4ytbutCciTysF3eWuLX9Wj_BgV7GVtnzhNzdhTAk1VkcwavwCfikCZkAxZMYBu98zEg6kDGaA2gtbKOxOcL3943VQ:1pHnQz:z0zg_aw_9cVrnfSEk9PfhOKwcN3eXXG-NfmEvzw9_U4	2023-01-31 18:29:33.539327+03:30
tiwhljeroqwtao6d8qpn3cna7jgscmo1	.eJxVjDsOwjAQBe_iGlne-E9JnzNYu2uDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM4CnDj9joT8KG0n-Y7tNkue27pMJHdFHrTLcc7leTncv4OKvX5rwhiVgVh0MW6I1jtDQQMhMLDNCohYo_EQouFs_IB4ZWUVk0YHwYr3B_dPN74:1pHyzi:GqU6W7XSsPV_XZf-4v9ndDby3AFeOA5g5pFEy0DuFII	2023-02-01 06:50:10.612529+03:30
9xs24884yu71s35zawt4argf5tmscrz7	.eJxVjEEOwiAQRe_C2pBCoVCX7nsGMsMMUjWQlHZlvLtt0oVu_3vvv0WAbc1ha7yEmcRVeHH53RDik8sB6AHlXmWsZV1mlIciT9rkVIlft9P9O8jQ8l5r4NFpJI7J9A5j50ixGzAaTwMkq3WinTvLo0rKGfKorWJmY3vbEYvPFwtYOJ8:1pHzjp:sgH0z58lR5PLHKLNutmmn3ys4D8K_BzV99imYrU3Nhs	2023-02-01 07:37:49.323858+03:30
97q5oe112cm3l59df1en9rh2yvfrau1v	.eJxVjDkOwjAUBe_iGlnyblHScwbrb8EBZEtxUiHuDpFSQPtm5r1UgW2tZRuylJnVWRmvTr8jAj2k7YTv0G5dU2_rMqPeFX3Qoa-d5Xk53L-DCqN-aydMKUTrGHNiyFk8AWDmKZIDDsBWGKJgTGRMCCZEH50kmhAtJlTvDz7_OYI:1pI0Za:2IPGX9pUS-A401xsi3Dt2e8jfGa0x_vg7LLa0LQ4UbY	2023-02-01 08:31:18.819724+03:30
kdtqehzqy9cqy37z78dj8lrktndwcqo9	.eJxVjMEOwiAQRP-FsyFLKUU9eu83kF12kaqBpLQn47_bJj3oaZJ5b-atAq5LDmuTOUysrsp4dfotCeNTyk74geVedaxlmSfSu6IP2vRYWV63w_07yNjytobURU7eDzaeL30PDMRoGMR5Nuw7Z8UgJga2hG5wyW1BUSwBJGNIfb4iDjj_:1pI0dY:t9TQHwdYb4h5xoPDHL7aL1qCAzSyythwmKxgBvuBDbw	2023-02-01 08:35:24.986658+03:30
9kpvbqduvyxqq4s91gplexgwrwbbxdsj	.eJxVjMsOwiAQAP-FsyGUxwoevfsNzS4sUjWQlPZk_HdD0oNeZybzFjPuW5n3zuu8JHERVpx-GWF8ch0iPbDem4ytbutCciTysF3eWuLX9Wj_BgV7GVtnzhNzdhTAk1VkcwavwCfikCZkAxZMYBu98zEg6kDGaA2gtbKOxOcL3943VQ:1pI1xm:naI1bwHHVa3fhuVPxpcgzEVQq1owa8_-tyvdHiFPkQE	2023-02-01 10:00:22.610298+03:30
18mi55v6fjuqmn0dglh5da63pm9bpsqn	.eJxVjEEOwiAQRe_C2hBgsBSX7j0DgZlBqgaS0q6Md7dNutDte-__twhxXUpYO89hInERWpx-WYr45LoLesR6bxJbXeYpyT2Rh-3y1ohf16P9Oyixl209GOPYxtEBE1g1aGshI6vzRkBjznqEbH0ktOTAGyJkzJCc91opIPH5AsxAN6c:1pI2HI:pr3RF44BaMFG_yx7KPGcsmc_VL9QGnS1A-8rODcz9UA	2023-02-01 10:20:32.227523+03:30
hqflo4csrmsy1hs6wmbyty6j5xicth5e	.eJxVjEEOwiAQRe_C2hBgsBSX7j0DgZlBqgaS0q6Md7dNutDte-__twhxXUpYO89hInERWpx-WYr45LoLesR6bxJbXeYpyT2Rh-3y1ohf16P9Oyixl209GOPYxtEBE1g1aGshI6vzRkBjznqEbH0ktOTAGyJkzJCc91opIPH5AsxAN6c:1pI3d0:h9arxupLR_s-r1uwhTPoQPTSxy2PSE2_rPACmyra2D8	2023-02-01 11:47:02.248997+03:30
r5ylz66su5ywuhwqnc4pukcb1vxh5g8p	.eJxVjMsOwiAQRf-FtSFTBujg0r3fQHgMUjU0Ke3K-O_apAvd3nPOfQkftrX6rfPipyzOQllx-h1jSA9uO8n30G6zTHNblynKXZEH7fI6Z35eDvfvoIZevzVgAEXo0GQm5tFZdojODYk4O6sNgaFEZVTaGCqMWQ8IAEWVCDGQeH8A4n83NA:1pIRAY:fvSvGy_ZCgSWAkqL2PfV9_vQraZnT7u-Y6RQnJueWi8	2023-02-02 12:55:14.431278+03:30
rtx0bfv6unvfysics50fjvb1tad0mvjq	.eJxVjMsOwiAQRf-FtSFTBujg0r3fQHgMUjU0Ke3K-O_apAvd3nPOfQkftrX6rfPipyzOQllx-h1jSA9uO8n30G6zTHNblynKXZEH7fI6Z35eDvfvoIZevzVgAEXo0GQm5tFZdojODYk4O6sNgaFEZVTaGCqMWQ8IAEWVCDGQeH8A4n83NA:1pISGs:gnNkTjQEz0NR3-N51M20_dS47u8eXDW0kxvcaimiaKg	2023-02-02 14:05:50.537411+03:30
k4g5eoaksejajk94aextrtze09i1wul9	.eJxVjDsOwjAQBe_iGlne-E9JnzNYu2uDA8iR4qRC3B0ipYD2zcx7iYTbWtPWy5KmLM4CnDj9joT8KG0n-Y7tNkue27pMJHdFHrTLcc7leTncv4OKvX5rwhiVgVh0MW6I1jtDQQMhMLDNCohYo_EQouFs_IB4ZWUVk0YHwYr3B_dPN74:1pJCgW:N_h9bvXyMbHlHYEEXm-kr72Rzzt-m_o4riOTu2FVjCQ	2023-02-04 15:39:24.325074+03:30
512mueu9vxbhzle77jhmajeyq39vpylg	.eJxVjE0OwiAYBe_C2hD-Ay7dewby4AOpGpqUdmW8uzbpQrdvZt6LRWxri9soS5yInZlip98tIT9K3wHd0W8zz3NflynxXeEHHfw6U3leDvfvoGG0b22Lg9WSkhYO1YmKLMjbAu0ECAaQpqokdfBW2ayV9SaQ9iG57ECevT_u9zfy:1pJo1Y:91dfH0-MDvpjSwbgJfTXJoJ1w9h3mBQwLX9Yby2SiW8	2023-02-06 07:31:36.453806+03:30
i8ayc82q0eyokto8vkle48iicv12mewt	.eJxVjDsOwjAQBe_iGlmJWf8o6TmDtd61cQDZUpxUiLuTSCmgnZn33iLgupSw9jSHicVFWHH6ZRHpmeou-IH13iS1usxTlHsiD9vlrXF6XY_276BgL9uaWEPS5AFczkA2w6BZe4JkOKkNxGHUWY2RXUTnjFJWGwSPdKasiMTnC_i4OHM:1pJoMj:MIr2bmvNZehAuwVLe3ad-bhafwgOchy1W9x-2EUQdZs	2023-02-06 07:53:29.80672+03:30
\.


--
-- Data for Name: review_machine; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_machine (id, name, description, "isActive", "createdAt") FROM stdin;
1	لیفتراک	\N	t	2022-08-29 08:57:03.197579+04:30
\.


--
-- Data for Name: review_part; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_part (id, name, description, "isActive", "createdAt") FROM stdin;
1	بلبرینگ		t	2022-08-29 08:57:10.447126+04:30
2	آچارکشی		t	2022-09-03 10:32:54.394846+04:30
\.


--
-- Data for Name: review_review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_review (id, "partName", "machineName", "reviewPeriod", "reviewCount", "createdAt", machine_id, part_id, user_id) FROM stdin;
1	بلبرینگ	لیفتراک	day	20	2022-08-29 08:57:22.350384+04:30	1	1	1
2	آچارکشی	لیفتراک	day	15	2022-09-03 10:33:51.476933+04:30	1	2	1
\.


--
-- Data for Name: review_reviewtask; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_reviewtask (id, description, done, "createdAt", review_id) FROM stdin;
\.


--
-- Data for Name: users_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_profile (id, "mobileNumber", department_id, user_id) FROM stdin;
8	09123456789	2	7
10	09123456789	4	9
5	09123456789	12	3
2	09127594620	\N	1
6	09192955815	3	4
13	09123456789	6	12
16	09123456789	5	15
4	09198551205	1	2
12	09191713600	5	11
11	09120774578	12	10
17	09123517086	13	16
15	09121642825	10	14
18	09127476419	3	17
9	09123456789	11	8
19	09120695512	10	18
21	09111111111	10	20
22		10	21
23		10	22
24		10	23
25		10	24
26	09191234567	10	25
27	09196644235	14	26
28	09161114628	10	27
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 4, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 84, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 70, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 60, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 27, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: base_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_department_id_seq', 15, true);


--
-- Name: base_operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_operation_id_seq', 100, true);


--
-- Name: base_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_order_id_seq', 361, true);


--
-- Name: base_order_subGroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."base_order_subGroup_id_seq"', 370, true);


--
-- Name: base_repairoperator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_repairoperator_id_seq', 1, false);


--
-- Name: base_subgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_subgroup_id_seq', 48, true);


--
-- Name: base_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_task_id_seq', 352, true);


--
-- Name: base_task_operators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_task_operators_id_seq', 46, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 230, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 122, true);


--
-- Name: review_machine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_machine_id_seq', 1, true);


--
-- Name: review_part_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_part_id_seq', 2, true);


--
-- Name: review_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_review_id_seq', 2, true);


--
-- Name: review_reviewtask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_reviewtask_id_seq', 1, false);


--
-- Name: users_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_profile_id_seq', 28, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: base_department base_department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_department
    ADD CONSTRAINT base_department_pkey PRIMARY KEY (id);


--
-- Name: base_operation base_operation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_operation
    ADD CONSTRAINT base_operation_pkey PRIMARY KEY (id);


--
-- Name: base_order base_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_order
    ADD CONSTRAINT base_order_pkey PRIMARY KEY (id);


--
-- Name: base_order_subGroup base_order_subGroup_order_id_subgroup_id_17a604f7_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."base_order_subGroup"
    ADD CONSTRAINT "base_order_subGroup_order_id_subgroup_id_17a604f7_uniq" UNIQUE (order_id, subgroup_id);


--
-- Name: base_order_subGroup base_order_subGroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."base_order_subGroup"
    ADD CONSTRAINT "base_order_subGroup_pkey" PRIMARY KEY (id);


--
-- Name: base_repairoperator base_repairoperator_operator_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_repairoperator
    ADD CONSTRAINT base_repairoperator_operator_id_key UNIQUE (operator_id);


--
-- Name: base_repairoperator base_repairoperator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_repairoperator
    ADD CONSTRAINT base_repairoperator_pkey PRIMARY KEY (id);


--
-- Name: base_subgroup base_subgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_subgroup
    ADD CONSTRAINT base_subgroup_pkey PRIMARY KEY (id);


--
-- Name: base_task_operators base_task_operators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_task_operators
    ADD CONSTRAINT base_task_operators_pkey PRIMARY KEY (id);


--
-- Name: base_task_operators base_task_operators_task_id_user_id_7469f070_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_task_operators
    ADD CONSTRAINT base_task_operators_task_id_user_id_7469f070_uniq UNIQUE (task_id, user_id);


--
-- Name: base_task base_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_task
    ADD CONSTRAINT base_task_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: review_machine review_machine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_machine
    ADD CONSTRAINT review_machine_pkey PRIMARY KEY (id);


--
-- Name: review_part review_part_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_part
    ADD CONSTRAINT review_part_pkey PRIMARY KEY (id);


--
-- Name: review_review review_review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_review
    ADD CONSTRAINT review_review_pkey PRIMARY KEY (id);


--
-- Name: review_reviewtask review_reviewtask_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_reviewtask
    ADD CONSTRAINT review_reviewtask_pkey PRIMARY KEY (id);


--
-- Name: users_profile users_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_pkey PRIMARY KEY (id);


--
-- Name: users_profile users_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: base_order_department_id_bc22841d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_order_department_id_bc22841d ON public.base_order USING btree (department_id);


--
-- Name: base_order_operation_id_1d9a91ca; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_order_operation_id_1d9a91ca ON public.base_order USING btree (operation_id);


--
-- Name: base_order_subGroup_order_id_5473402d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "base_order_subGroup_order_id_5473402d" ON public."base_order_subGroup" USING btree (order_id);


--
-- Name: base_order_subGroup_subgroup_id_f49743a2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "base_order_subGroup_subgroup_id_f49743a2" ON public."base_order_subGroup" USING btree (subgroup_id);


--
-- Name: base_order_user_id_8ad0adec; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_order_user_id_8ad0adec ON public.base_order USING btree (user_id);


--
-- Name: base_task_operator_id_22e22d96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_task_operator_id_22e22d96 ON public.base_task USING btree (operator_id);


--
-- Name: base_task_operators_task_id_f8431c48; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_task_operators_task_id_f8431c48 ON public.base_task_operators USING btree (task_id);


--
-- Name: base_task_operators_user_id_2efa75c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_task_operators_user_id_2efa75c2 ON public.base_task_operators USING btree (user_id);


--
-- Name: base_task_order_id_d3cd6d9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_task_order_id_d3cd6d9f ON public.base_task USING btree (order_id);


--
-- Name: base_task_user_id_63dd9a3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX base_task_user_id_63dd9a3b ON public.base_task USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: review_review_machine_id_c18a719b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX review_review_machine_id_c18a719b ON public.review_review USING btree (machine_id);


--
-- Name: review_review_part_id_0ba798e9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX review_review_part_id_0ba798e9 ON public.review_review USING btree (part_id);


--
-- Name: review_review_user_id_ff798828; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX review_review_user_id_ff798828 ON public.review_review USING btree (user_id);


--
-- Name: review_reviewtask_review_id_f11c6b7b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX review_reviewtask_review_id_f11c6b7b ON public.review_reviewtask USING btree (review_id);


--
-- Name: users_profile_department_id_c65780ab; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_profile_department_id_c65780ab ON public.users_profile USING btree (department_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_order base_order_department_id_bc22841d_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_order
    ADD CONSTRAINT base_order_department_id_bc22841d_fk FOREIGN KEY (department_id) REFERENCES public.base_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_order base_order_operation_id_1d9a91ca_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_order
    ADD CONSTRAINT base_order_operation_id_1d9a91ca_fk FOREIGN KEY (operation_id) REFERENCES public.base_operation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_order_subGroup base_order_subGroup_order_id_5473402d_fk_base_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."base_order_subGroup"
    ADD CONSTRAINT "base_order_subGroup_order_id_5473402d_fk_base_order_id" FOREIGN KEY (order_id) REFERENCES public.base_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_order_subGroup base_order_subGroup_subgroup_id_f49743a2_fk_base_subgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."base_order_subGroup"
    ADD CONSTRAINT "base_order_subGroup_subgroup_id_f49743a2_fk_base_subgroup_id" FOREIGN KEY (subgroup_id) REFERENCES public.base_subgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_order base_order_user_id_8ad0adec_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_order
    ADD CONSTRAINT base_order_user_id_8ad0adec_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_repairoperator base_repairoperator_operator_id_bdde9f21_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_repairoperator
    ADD CONSTRAINT base_repairoperator_operator_id_bdde9f21_fk_auth_user_id FOREIGN KEY (operator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_task base_task_operator_id_22e22d96_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_task
    ADD CONSTRAINT base_task_operator_id_22e22d96_fk_auth_user_id FOREIGN KEY (operator_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_task_operators base_task_operators_task_id_f8431c48_fk_base_task_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_task_operators
    ADD CONSTRAINT base_task_operators_task_id_f8431c48_fk_base_task_id FOREIGN KEY (task_id) REFERENCES public.base_task(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_task_operators base_task_operators_user_id_2efa75c2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_task_operators
    ADD CONSTRAINT base_task_operators_user_id_2efa75c2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_task base_task_order_id_d3cd6d9f_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_task
    ADD CONSTRAINT base_task_order_id_d3cd6d9f_fk FOREIGN KEY (order_id) REFERENCES public.base_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base_task base_task_user_id_63dd9a3b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base_task
    ADD CONSTRAINT base_task_user_id_63dd9a3b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: review_review review_review_machine_id_c18a719b_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_review
    ADD CONSTRAINT review_review_machine_id_c18a719b_fk FOREIGN KEY (machine_id) REFERENCES public.review_machine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: review_review review_review_part_id_0ba798e9_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_review
    ADD CONSTRAINT review_review_part_id_0ba798e9_fk FOREIGN KEY (part_id) REFERENCES public.review_part(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: review_review review_review_user_id_ff798828_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_review
    ADD CONSTRAINT review_review_user_id_ff798828_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: review_reviewtask review_reviewtask_review_id_f11c6b7b_fk_review_review_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_reviewtask
    ADD CONSTRAINT review_reviewtask_review_id_f11c6b7b_fk_review_review_id FOREIGN KEY (review_id) REFERENCES public.review_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profile users_profile_department_id_c65780ab_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_department_id_c65780ab_fk FOREIGN KEY (department_id) REFERENCES public.base_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_profile users_profile_user_id_2112e78d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_profile
    ADD CONSTRAINT users_profile_user_id_2112e78d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

