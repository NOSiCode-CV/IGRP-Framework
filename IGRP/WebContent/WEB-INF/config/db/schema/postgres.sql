--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2017-06-07 11:10:54

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2433 (class 1262 OID 25123)
-- Name: db_igrp; Type: DATABASE; Schema: -; Owner: postgres
--

ALTER DATABASE db_igrp OWNER TO postgres;


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 185 (class 1259 OID 25356)
-- Name: config_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE config_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE config_id_sequence OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 25358)
-- Name: env_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE env_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE env_id_sequence OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 25360)
-- Name: id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE id_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 192 (class 1259 OID 25411)
-- Name: glb_t_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_menu (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    descr character varying(50) NOT NULL,
    link character varying(200) DEFAULT NULL::character varying,
    self_id integer,
    env_fk integer NOT NULL,
    img_src character varying(50) DEFAULT NULL::character varying,
    area character varying(20) DEFAULT NULL::character varying,
    action_fk integer,
    orderby integer,
    status smallint DEFAULT (1)::smallint,
    code character varying(20) DEFAULT NULL::character varying,
    flg_base smallint DEFAULT (0)::smallint,
    target character varying(20) DEFAULT '_self'::character varying
);


ALTER TABLE glb_t_menu OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 25661)
-- Name: glb_mv_all_menus; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_mv_all_menus AS
 SELECT a.id,
    (((b.descr)::text || ' - '::text) || (a.descr)::text) AS descr,
    a.descr AS descr_menu,
    a.link,
    a.self_id,
    a.env_fk,
    a.img_src,
    a.area,
    a.action_fk,
    a.orderby
   FROM glb_t_menu a,
    glb_t_menu b
  WHERE ((b.id = a.self_id) AND (a.self_id IS NOT NULL));


ALTER TABLE glb_mv_all_menus OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 25665)
-- Name: glb_mv_menu; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_mv_menu AS
 SELECT glb_t_menu.id,
    glb_t_menu.descr,
    glb_t_menu.link,
    glb_t_menu.self_id,
    glb_t_menu.env_fk,
    glb_t_menu.img_src,
    glb_t_menu.area,
    glb_t_menu.action_fk,
    glb_t_menu.orderby,
    glb_t_menu.status,
    glb_t_menu.code,
    glb_t_menu.flg_base,
    glb_t_menu.target
   FROM glb_t_menu;


ALTER TABLE glb_mv_menu OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 25430)
-- Name: glb_t_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_profile (
    prof_type_fk integer NOT NULL,
    user_fk integer NOT NULL,
    type character varying(20) NOT NULL,
    type_fk integer NOT NULL,
    org_fk integer NOT NULL
);


ALTER TABLE glb_t_profile OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25678)
-- Name: glb_mv_profile; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_mv_profile AS
 SELECT glb_t_profile.prof_type_fk,
    glb_t_profile.user_fk,
    glb_t_profile.type,
    glb_t_profile.type_fk,
    glb_t_profile.org_fk
   FROM glb_t_profile;


ALTER TABLE glb_mv_profile OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 25433)
-- Name: glb_t_profile_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_profile_type (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    descr character varying(50) NOT NULL,
    code character varying(20) DEFAULT NULL::character varying,
    env_fk integer,
    self_fk integer,
    org_fk integer,
    status smallint DEFAULT (1)::smallint
);


ALTER TABLE glb_t_profile_type OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25682)
-- Name: glb_mv_profile_type; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_mv_profile_type AS
 SELECT glb_t_profile_type.id,
    glb_t_profile_type.descr,
    glb_t_profile_type.code,
    glb_t_profile_type.env_fk,
    glb_t_profile_type.self_fk,
    glb_t_profile_type.status,
    glb_t_profile_type.org_fk
   FROM glb_t_profile_type;


ALTER TABLE glb_mv_profile_type OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 25439)
-- Name: glb_t_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_transaction (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    code character varying(150) NOT NULL,
    descr character varying(250) DEFAULT NULL::character varying,
    env_fk integer,
    status smallint DEFAULT (1)::smallint NOT NULL
);


ALTER TABLE glb_t_transaction OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25703)
-- Name: glb_mv_transaction; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_mv_transaction AS
 SELECT glb_t_transaction.id,
    glb_t_transaction.code,
    glb_t_transaction.descr,
    glb_t_transaction.env_fk,
    glb_t_transaction.status
   FROM glb_t_transaction;


ALTER TABLE glb_mv_transaction OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 25362)
-- Name: glb_t_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_action (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    env_fk integer NOT NULL,
    page character varying(30) NOT NULL,
    action character varying(30) NOT NULL,
    table_name character varying(80) DEFAULT NULL::character varying,
    xsl_src character varying(1000) DEFAULT NULL::character varying,
    img_src character varying(100) DEFAULT NULL::character varying,
    page_type character varying(30) DEFAULT NULL::character varying,
    page_descr character varying(100) DEFAULT NULL::character varying,
    action_descr character varying(100) DEFAULT NULL::character varying,
    flg_menu smallint DEFAULT (0)::smallint,
    flg_transaction smallint DEFAULT (0)::smallint,
    self_id integer,
    self_fw_id integer,
    version character varying(3),
    db_connection character varying(30) DEFAULT NULL::character varying,
    flg_offline smallint DEFAULT (0)::smallint,
    flg_internet smallint DEFAULT (0)::smallint,
    status smallint DEFAULT (1)::smallint,
    proc_name character varying(12200)
);


ALTER TABLE glb_t_action OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 25381)
-- Name: glb_t_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_config (
    name character varying(30) NOT NULL,
    value character varying(4000) NOT NULL
);


ALTER TABLE glb_t_config OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 25387)
-- Name: glb_t_config_env; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_config_env (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    port integer,
    type_db character varying(8) NOT NULL,
    host character varying(100) NOT NULL,
    name_db character varying(100) NOT NULL,
    username character varying(250) NOT NULL,
    password character varying(1000) NOT NULL,
    charset character varying(20) NOT NULL,
    name character varying(20) NOT NULL,
    env_fk integer NOT NULL
);


ALTER TABLE glb_t_config_env OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 25394)
-- Name: glb_t_env; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_env (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    dad character varying(30) NOT NULL,
    img_src character varying(50) DEFAULT NULL::character varying,
    description character varying(500) DEFAULT NULL::character varying,
    action_fk integer,
    flg_old smallint DEFAULT (0)::smallint,
    link_menu character varying(2000) DEFAULT NULL::character varying,
    link_center character varying(2000) DEFAULT NULL::character varying,
    apache_dad character varying(30) DEFAULT NULL::character varying,
    templates character varying(30) DEFAULT NULL::character varying,
    host character varying(30) DEFAULT NULL::character varying,
    flg_external smallint DEFAULT (0)::smallint,
    status smallint DEFAULT (1)::smallint NOT NULL
);


ALTER TABLE glb_t_env OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 25422)
-- Name: glb_t_organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_organization (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(1000) NOT NULL,
    sigof_fk integer,
    env_fk integer NOT NULL,
    status smallint DEFAULT (1)::smallint NOT NULL,
    user_create_fk integer,
    self_fk integer
);


ALTER TABLE glb_t_organization OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 25623)
-- Name: glb_t_session_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE glb_t_session_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE glb_t_session_id_sequence OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 25631)
-- Name: glb_t_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_session (
    id integer DEFAULT nextval('glb_t_session_id_sequence'::regclass) NOT NULL,
    session_id character varying(50),
    start_time bigint,
    end_time bigint,
    user_id integer,
    ip_address character varying(15),
    user_name character varying(50),
    env_id integer DEFAULT 1 NOT NULL,
    target character varying(20),
    org_id integer,
    prof_type_id integer,
    https smallint DEFAULT 0,
    session_old_id character varying(50),
    host character varying(30),
    host_name character varying(100),
    media_type character varying(30)
);


ALTER TABLE glb_t_session OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25445)
-- Name: glb_t_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE glb_t_user (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(80) NOT NULL,
    pass_hash character varying(65) NOT NULL,
    userprofile character varying(20) DEFAULT 'USER'::character varying NOT NULL,
    valid_until date,
    remarks character varying(400) DEFAULT NULL::character varying,
    activation_key character varying(11) DEFAULT NULL::character varying,
    user_name character varying(80) NOT NULL,
    photo_id integer,
    signature_id integer,
    mobile character varying(20) DEFAULT NULL::character varying,
    phone character varying(20) DEFAULT NULL::character varying,
    password_reset_token character varying(255) DEFAULT NULL::character varying,
    auth_key character varying(255) NOT NULL,
    status smallint DEFAULT (10)::smallint NOT NULL,
    created_at bigint NOT NULL,
    updated_at bigint NOT NULL
);


ALTER TABLE glb_t_user OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 25669)
-- Name: glb_v_menu; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_menu AS
 SELECT a.id,
    (((b.descr)::text || ' - '::text) || (a.descr)::text) AS descr,
    a.descr AS descr_menu,
    a.link,
    a.self_id,
    a.env_fk,
    a.img_src,
    a.area,
    a.action_fk,
    a.orderby
   FROM glb_mv_menu a,
    glb_mv_menu b
  WHERE ((b.id = a.self_id) AND (a.self_id IS NOT NULL));


ALTER TABLE glb_v_menu OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25673)
-- Name: glb_v_org_menu; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_org_menu AS
 SELECT a.id,
    (((e.descr)::text || ' - '::text) || (a.descr)::text) AS descr,
    a.orderby,
    a.env_fk,
    a.self_id,
    b.prof_type_fk,
    b.user_fk,
    'ALL' AS prof_code,
    'ALL PROFILE' AS prof_name,
    b.org_fk,
    a.flg_base
   FROM glb_t_menu a,
    glb_t_menu e,
    glb_t_profile b
  WHERE ((e.id = a.self_id) AND (a.self_id IS NOT NULL) AND (a.id = b.type_fk) AND ((b.type)::text = 'MEN'::text) AND (b.prof_type_fk = 0));


ALTER TABLE glb_v_org_menu OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25686)
-- Name: glb_v_profile; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_profile AS
 SELECT b.org_fk,
    b.prof_type_fk,
    b.user_fk,
    b.type,
    b.type_fk,
    d.code AS prof_code,
    d.descr AS prof_name,
    (((d.code)::text || ' - '::text) || (d.descr)::text) AS prof_name_desc,
    d.env_fk,
    d.self_fk
   FROM glb_mv_profile b,
    glb_mv_profile_type d
  WHERE (d.id = b.prof_type_fk);


ALTER TABLE glb_v_profile OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25707)
-- Name: glb_v_profile_trans; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_profile_trans AS
 SELECT a.id,
    a.code,
    a.descr,
    a.env_fk,
    b.prof_type_fk,
    b.user_fk,
    b.prof_code,
    b.prof_name,
    b.org_fk
   FROM glb_t_transaction a,
    glb_v_profile b
  WHERE ((a.id = b.type_fk) AND ((b.type)::text = 'TRANS'::text));


ALTER TABLE glb_v_profile_trans OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25715)
-- Name: glb_v_org_trans; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_org_trans AS
 SELECT glb_v_profile_trans.id,
    glb_v_profile_trans.code,
    glb_v_profile_trans.descr,
    glb_v_profile_trans.env_fk,
    glb_v_profile_trans.prof_type_fk,
    glb_v_profile_trans.user_fk,
    glb_v_profile_trans.prof_code,
    glb_v_profile_trans.prof_name,
    glb_v_profile_trans.org_fk
   FROM glb_v_profile_trans
  WHERE (glb_v_profile_trans.prof_type_fk = 0);


ALTER TABLE glb_v_org_trans OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25690)
-- Name: glb_v_profile_menu; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_profile_menu AS
 SELECT a.id,
    e.descr,
    a.descr AS descr_menu,
    a.orderby,
    a.env_fk,
    a.self_id,
    a.action_fk,
    b.prof_type_fk,
    b.user_fk,
    d.code AS prof_code,
    d.descr AS prof_name,
    b.org_fk,
    a.status,
    a.target,
    d.env_fk AS env_fk_prof_type
   FROM glb_mv_menu a,
    glb_mv_menu e,
    glb_mv_profile b,
    glb_mv_profile_type d
  WHERE ((e.id = a.self_id) AND (a.self_id IS NOT NULL) AND (a.id = b.type_fk) AND ((b.type)::text = 'MEN'::text) AND (d.id = b.prof_type_fk));


ALTER TABLE glb_v_profile_menu OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25699)
-- Name: glb_v_prof_menu; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_prof_menu AS
 SELECT glb_v_profile_menu.id,
    glb_v_profile_menu.descr,
    glb_v_profile_menu.descr_menu,
    glb_v_profile_menu.orderby,
    glb_v_profile_menu.env_fk,
    glb_v_profile_menu.self_id,
    glb_v_profile_menu.action_fk,
    glb_v_profile_menu.prof_type_fk,
    glb_v_profile_menu.user_fk,
    glb_v_profile_menu.prof_code,
    glb_v_profile_menu.prof_name,
    glb_v_profile_menu.org_fk,
    glb_v_profile_menu.status,
    glb_v_profile_menu.target,
    glb_v_profile_menu.env_fk_prof_type
   FROM glb_v_profile_menu
  WHERE ((glb_v_profile_menu.prof_type_fk <> 0) AND (glb_v_profile_menu.user_fk = 0));


ALTER TABLE glb_v_prof_menu OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25711)
-- Name: glb_v_prof_trans; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_prof_trans AS
 SELECT glb_v_profile_trans.id,
    glb_v_profile_trans.code,
    glb_v_profile_trans.descr,
    glb_v_profile_trans.env_fk,
    glb_v_profile_trans.prof_type_fk,
    glb_v_profile_trans.user_fk,
    glb_v_profile_trans.prof_code,
    glb_v_profile_trans.prof_name,
    glb_v_profile_trans.org_fk
   FROM glb_v_profile_trans
  WHERE ((glb_v_profile_trans.prof_type_fk <> 0) AND (glb_v_profile_trans.user_fk = 0));


ALTER TABLE glb_v_prof_trans OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25695)
-- Name: glb_v_user_menu; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_user_menu AS
 SELECT glb_v_profile_menu.id,
    glb_v_profile_menu.descr,
    glb_v_profile_menu.orderby,
    glb_v_profile_menu.env_fk,
    glb_v_profile_menu.self_id,
    glb_v_profile_menu.prof_type_fk,
    glb_v_profile_menu.user_fk,
    glb_v_profile_menu.prof_code,
    glb_v_profile_menu.prof_name,
    glb_v_profile_menu.org_fk
   FROM glb_v_profile_menu
  WHERE (glb_v_profile_menu.user_fk <> 0);


ALTER TABLE glb_v_user_menu OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25719)
-- Name: glb_v_user_trans; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW glb_v_user_trans AS
 SELECT glb_v_profile_trans.id,
    glb_v_profile_trans.code,
    glb_v_profile_trans.descr,
    glb_v_profile_trans.env_fk,
    glb_v_profile_trans.prof_type_fk,
    glb_v_profile_trans.user_fk,
    glb_v_profile_trans.prof_code,
    glb_v_profile_trans.prof_name,
    glb_v_profile_trans.org_fk
   FROM glb_v_profile_trans
  WHERE (glb_v_profile_trans.user_fk <> 0);


ALTER TABLE glb_v_user_trans OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 25459)
-- Name: menu_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE menu_id_sequence OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 25461)
-- Name: organization_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE organization_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE organization_id_sequence OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 25463)
-- Name: profile_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profile_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profile_id_sequence OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 25604)
-- Name: tbl_marcao_consulta_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_marcao_consulta_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_marcao_consulta_id_sequence OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 25606)
-- Name: tbl_marcao_consulta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbl_marcao_consulta (
    id integer DEFAULT nextval('tbl_marcao_consulta_id_sequence'::regclass) NOT NULL,
    id_medico integer NOT NULL,
    id_utente integer NOT NULL,
    data_consulta date NOT NULL,
    estado smallint DEFAULT '0'::smallint NOT NULL
);


ALTER TABLE tbl_marcao_consulta OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 25587)
-- Name: tbl_medico_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_medico_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_medico_id_sequence OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25589)
-- Name: tbl_medico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbl_medico (
    id integer DEFAULT nextval('tbl_medico_id_sequence'::regclass) NOT NULL,
    nome character varying(100) NOT NULL,
    morada character varying(100) NOT NULL,
    num_consulta_dia integer DEFAULT 1 NOT NULL
);


ALTER TABLE tbl_medico OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 25596)
-- Name: tbl_utente_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tbl_utente_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tbl_utente_id_sequence OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25598)
-- Name: tbl_utente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tbl_utente (
    id integer DEFAULT nextval('tbl_utente_id_sequence'::regclass) NOT NULL,
    nome character varying(100) NOT NULL,
    morada character varying(100) NOT NULL,
    data_nascimento date NOT NULL,
    sexo smallint NOT NULL
);

CREATE VIEW view_consulta_dash  AS  Select count(*) as total_m, 0 as total_f,date_part('year',data_consulta) as Ano 
				from TBL_MARCAO_CONSULTA m, tbl_utente u 
				where m.estado =1 AND m.id_utente=u.id AND u.sexo=2 group by date_part('year',data_consulta)
				 union 
				Select 0 as Total_Masculino, count(*) as Total_Feminino,date_part('year',data_consulta) as Ano 
				from TBL_MARCAO_CONSULTA m, tbl_utente u
				 where m.estado =1 AND m.id_utente=u.id AND u.sexo=1 group by date_part('year',data_consulta) ;
 
ALTER TABLE tbl_utente OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 25465)
-- Name: transaction_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transaction_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transaction_id_sequence OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 25467)
-- Name: user_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_sequence OWNER TO postgres;

--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 185
-- Name: config_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('config_id_sequence', 0, true);


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 186
-- Name: env_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('env_id_sequence', 0, true);


--
-- TOC entry 2406 (class 0 OID 25362)
-- Dependencies: 188
-- Data for Name: glb_t_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (1, 1, 'ListaPage', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/listapage/ListaPage.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (2, 1, 'Env', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/env/Env.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (4, 1, 'Dominio', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/dominio/Dominio.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (5, 1, 'NovoDominio', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/novodominio/NovoDominio.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (6, 1, 'PesquisarOrganica', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/pesquisarorganica/PesquisarOrganica.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (7, 1, 'NovaOrganica', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/novaorganica/NovaOrganica.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (8, 1, 'NovoMenu', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/novomenu/NovoMenu.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (9, 1, 'PesquisarMenu', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/pesquisarmenu/PesquisarMenu.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (10, 1, 'NovoPerfil', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/novoperfil/NovoPerfil.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (11, 1, 'PesquisarPerfil', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/pesquisarperfil/PesquisarPerfil.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (12, 1, 'PesquisarUtilizador', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/pesquisarutilizador/PesquisarUtilizador.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (13, 1, 'NovoUtilizador', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/novoutilizador/NovoUtilizador.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (14, 1, 'Settings', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/settings/Settings.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (15, 1, 'RegistarUtilizador', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/registarutilizador/RegistarUtilizador.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (16, 1, 'transaccao', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/transaccao/Transaccao.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (17, 1, 'Page', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/page/Page.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (3, 1, 'ListaEnv', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/listaenv/ListaEnv.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (18, 1, 'MenuOrganica', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/menuorganica/MenuOrganica.xsl', NULL, NULL, 'Associar Menu a Organica e Perfil', NULL, NULL, 0, NULL, 0, '2.3', NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (220, 219, 'Teste', 'index', '', '', '', '', 'T', 'T', 0, 0, 0, 0, '2.3', '', 0, 0, 0, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (23, 2, 'ListaMedico', 'index', NULL, 'images/IGRP/IGRP2.3/app/marcao_consulta/listamedico/ListaMedico.xsl', NULL, NULL, 'Lista de Medicos', 'Lista de Medicos', 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (24, 2, 'RegistarMedico', 'index', NULL, 'images/IGRP/IGRP2.3/app/marcao_consulta/registarmedico/RegistarMedico.xsl', NULL, NULL, 'Registar Medico', 'Registar Medico', 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (25, 2, 'MarcarConsulta', 'index', NULL, 'images/IGRP/IGRP2.3/app/marcao_consulta/marcarconsulta/MarcarConsulta.xsl', NULL, NULL, 'Marcar Consulta', 'Marcar Consulta', 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (26, 2, 'RegistarUtente', 'index', NULL, 'images/IGRP/IGRP2.3/app/marcao_consulta/registarutente/RegistarUtente.xsl', NULL, NULL, 'Registar Utente', 'Registar Utente', 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (27, 2, 'ListarUtente', 'index', NULL, 'images/IGRP/IGRP2.3/app/marcao_consulta/listarutente/ListarUtente.xsl', NULL, NULL, 'Listar Utente', 'Listar Utente', 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (28, 2, 'ConsultaPendente', 'index', NULL, 'images/IGRP/IGRP2.3/app/marcao_consulta/consultapendente/ConsultaPendente.xsl', NULL, NULL, 'Consultas Pendentes', 'Consultas Pendentes', 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (29, 2, 'DashBoard', 'index', NULL, 'images/IGRP/IGRP2.3/app/marcao_consulta/dashboard/DashBoard.xsl', NULL, NULL, 'Dash Board', 'Dash Board', 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (19, 1, 'ErrorPage', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/errorpage/ErrorPage.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (20, 1, 'TransacaoOrganica', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/transacaoorganica/TransacaoOrganica.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (21, 1, 'EditarTransacao', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/editartransacao/EditarTransacao.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (22, 1, 'Session', 'index', NULL, 'images/IGRP/IGRP2.3/app/igrp/session/Session.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);


--
-- TOC entry 2407 (class 0 OID 25381)
-- Dependencies: 189
-- Data for Name: glb_t_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_config (name, value) VALUES ('path_class', 'C:/Users/Yma/git/IGRP-Framework/IGRP/src/');
INSERT INTO glb_t_config (name, value) VALUES ('footer_note', '2011 - Copyright NOSI');
INSERT INTO glb_t_config (name, value) VALUES ('version', '1.0');
INSERT INTO glb_t_config (name, value) VALUES ('welcome_note', 'Ola');
INSERT INTO glb_t_config (name, value) VALUES ('link_slide_menu', 'webapps?r=igrp/pesquisar-menu/myMenu');
INSERT INTO glb_t_config (name, value) VALUES ('path_xsl', 'C:/Users/Yma/git/IGRP-Framework/IGRP/WebContent/');
INSERT INTO glb_t_config (name, value) VALUES ('link_img', 'images/IGRP/IGRP2.3');


--
-- TOC entry 2408 (class 0 OID 25387)
-- Dependencies: 190
-- Data for Name: glb_t_config_env; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2409 (class 0 OID 25394)
-- Dependencies: 191
-- Data for Name: glb_t_env; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_env (id, name, dad, img_src, description, action_fk, flg_old, link_menu, link_center, apache_dad, templates, host, flg_external, status) VALUES (1, 'igrp', 'igrp', 'app_casacidadao.png', 'IGRP Open Source', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO glb_t_env (id, name, dad, img_src, description, action_fk, flg_old, link_menu, link_center, apache_dad, templates, host, flg_external, status) VALUES (219, 'Casa Cidadao', 'c_cidadao', '', '', 0, 0, '', '', '', '', '', 0, 1);
INSERT INTO glb_t_env (id, name, dad, img_src, description, action_fk, flg_old, link_menu, link_center, apache_dad, templates, host, flg_external, status) VALUES (2, 'Marcacao de Consulta', 'marcao_consulta', 'icon_saude.png', 'App para marcacao de consulta', 0, 0, '', '', '', '', '', 0, 1);


--
-- TOC entry 2410 (class 0 OID 25411)
-- Dependencies: 192
-- Data for Name: glb_t_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (1, 'Gestão de Aplicação', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (5, 'Parâmetros Gerais', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (3, 'Gestão de Pagina', NULL, 1, 1, NULL, NULL, 1, NULL, 0, NULL, 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (4, 'Gestão de Menu', NULL, 1, 1, NULL, NULL, 9, NULL, 0, NULL, 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (6, 'Gestão de Organica', NULL, 5, 1, NULL, NULL, 6, NULL, 0, NULL, 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (7, 'Gestão de Perfil', NULL, 5, 1, NULL, NULL, 11, NULL, 0, NULL, 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (8, 'Gestão de Utilizador', NULL, 5, 1, NULL, NULL, 12, NULL, 0, NULL, 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (9, 'Settings', NULL, 5, 1, NULL, NULL, 14, NULL, 0, NULL, 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (10, 'Gestão de Transação', NULL, 1, 1, NULL, NULL, 15, NULL, 0, NULL, 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (2, 'Detalhes de Aplicação', NULL, 1, 1, NULL, NULL, 3, NULL, 0, NULL, 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (11, 'Auditoria', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, NULL, 1, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (12, 'Gestão de Sessão', NULL, 11, 1, NULL, NULL, 22, NULL, 1, NULL, 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (13, 'Gestao de Utente', '', NULL, 2, '', '', NULL, 1, 1, '', 1, '');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (14, 'Gestao de Medico', '', NULL, 2, '', '', NULL, 1, 1, '', 1, '');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (15, 'Gestao de Consultas', '', NULL, 2, '', '', NULL, 1, 1, '', 1, '');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (16, 'Registar Utente', '', 11, 2, '', '', 26, 0, 1, '', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (17, 'Listar Utentes', '', 11, 2, '', '', 27, 0, 1, '', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (18, 'Registar Medico', '', 12, 2, '', '', 24, 0, 1, '', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (19, 'Listar Medicos', '', 12, 2, '', '', 23, 0, 1, '', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (20, 'Marcar Consultas', '', 13, 2, '', '', 25, 0, 1, '', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (21, 'Consultas Pendentes', '', 13, 2, '', '', 28, 0, 1, '', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (22, 'Dash Board', '', 13, 2, '', '', 29, 0, 1, '', 0, '_self');


--
-- TOC entry 2411 (class 0 OID 25422)
-- Dependencies: 193
-- Data for Name: glb_t_organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_organization (id, code, name, sigof_fk, env_fk, status, user_create_fk, self_fk) VALUES (1, 'ADMS', 'Administrador', NULL, 1, 1, 1, NULL);
INSERT INTO glb_t_organization (id, code, name, sigof_fk, env_fk, status, user_create_fk, self_fk) VALUES (2, 'org-m.consulta', 'Tec. Marcacao Consulta', NULL, 2, 1, 1, NULL);


--
-- TOC entry 2412 (class 0 OID 25430)
-- Dependencies: 194
-- Data for Name: glb_t_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_profile (PROF_TYPE_FK, USER_FK, TYPE, TYPE_FK, ORG_FK) 
	VALUES (1, 1, 'ENV', 1, 1),
		   (1, 1, 'PROF', 1, 1), 
		   (0, 0, 'MEN', 2, 1), 
		   (0, 0, 'MEN', 3, 1), 
		   (0, 0, 'MEN', 4, 1), 
		   (0, 0, 'MEN', 6, 1), 
		   (0, 0, 'MEN', 7, 1), 
		   (0, 0, 'MEN', 8, 1), 
		   (0, 0, 'MEN', 9, 1), 
		   (0, 0, 'MEN', 10, 1),
		   (0, 0, 'MEN', 12, 1),
		   (1, 0, 'MEN', 2, 1), 
		   (1, 0, 'MEN', 3, 1), 
		   (1, 0, 'MEN', 4, 1), 
		   (1, 0, 'MEN', 6, 1), 
		   (1, 0, 'MEN', 7, 1), 
		   (1, 0, 'MEN', 8, 1), 
		   (1, 0, 'MEN', 9, 1), 
		   (1, 0, 'MEN', 10, 1), 
		   (1, 0, 'MEN', 12, 1); 
		   
INSERT INTO glb_t_profile (PROF_TYPE_FK, USER_FK, TYPE, TYPE_FK, ORG_FK) 
	VALUES 
	(0, 0, 'MEN', 9, 2),
	(0, 0, 'MEN', 13, 2),
	(0, 0, 'MEN', 14, 2),
	(0, 0, 'MEN', 15, 2),
	(0, 0, 'MEN', 16, 2),
	(0, 0, 'MEN', 17, 2),
	(0, 0, 'MEN', 18, 2),
	(0, 0, 'MEN', 19, 2),
	(0, 0, 'MEN', 20, 2),
	(0, 0, 'MEN', 21, 2),
	(0, 0, 'MEN', 22, 2),
	(2, 0, 'MEN', 9, 2),
	(2, 0, 'MEN', 13, 2),
	(2, 0, 'MEN', 14, 2),
	(2, 0, 'MEN', 15, 2),
	(2, 0, 'MEN', 16, 2),
	(2, 0, 'MEN', 17, 2),
	(2, 0, 'MEN', 18, 2),
	(2, 0, 'MEN', 19, 2),
	(2, 0, 'MEN', 20, 2),
	(2, 0, 'MEN', 21, 2),
	(2, 0, 'MEN', 22, 2),
	(2, 1, 'ENV', 2, 2),
	(2, 1, 'PROF', 2, 2);

--
-- TOC entry 2413 (class 0 OID 25433)
-- Dependencies: 195
-- Data for Name: glb_t_profile_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_profile_type (id, descr, code, env_fk, self_fk, org_fk, status) VALUES (1, 'Administrador', 'Admin', 1, NULL, 1, 1);
INSERT INTO glb_t_profile_type (id, descr, code, env_fk, self_fk, org_fk, status) VALUES (2, 'Tec. Marcacao Consulta', 'Perf-m.consulta', 2, NULL, 2, 1);
INSERT INTO glb_t_profile_type (id, descr, code, env_fk, self_fk, org_fk, status) VALUES (0, 'ALL PROFILE', 'ALL', NULL, NULL, NULL, 1);


--
-- TOC entry 2428 (class 0 OID 25631)
-- Dependencies: 210
-- Data for Name: glb_t_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_session (id, session_id, start_time, end_time, user_id, ip_address, user_name, env_id, target, org_id, prof_type_id, https, session_old_id, host, host_name, media_type) VALUES (1, 'B254809147661C6C3EDBE6D6C41926F5', 1496763249614, 1496763390565, 1, '0:0:0:0:0:0:0:1', 'demo', 1, '_blank', 1, 1, 0, 'B254809147661C6C3EDBE6D6C41926F5', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'WEB');
INSERT INTO glb_t_session (id, session_id, start_time, end_time, user_id, ip_address, user_name, env_id, target, org_id, prof_type_id, https, session_old_id, host, host_name, media_type) VALUES (2, 'A48F4DD25A3E1BADEAC243A1DA9ECFBC', 1496765488418, 1496765502514, 1, '0:0:0:0:0:0:0:1', 'demo', 1, '_blank', 1, 1, 0, 'A48F4DD25A3E1BADEAC243A1DA9ECFBC', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'WEB');
INSERT INTO glb_t_session (id, session_id, start_time, end_time, user_id, ip_address, user_name, env_id, target, org_id, prof_type_id, https, session_old_id, host, host_name, media_type) VALUES (3, '49769643395FD1CEDD9B69487B5CF4A6', 1496765535064, 1496767351355, 1, '0:0:0:0:0:0:0:1', 'demo', 1, '_blank', 1, 1, 0, '49769643395FD1CEDD9B69487B5CF4A6', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'WEB');
INSERT INTO glb_t_session (id, session_id, start_time, end_time, user_id, ip_address, user_name, env_id, target, org_id, prof_type_id, https, session_old_id, host, host_name, media_type) VALUES (4, '43662357C1488DCB6D38B090FE98060B', 1496772438546, 1496772440346, 1, '0:0:0:0:0:0:0:1', 'demo', 1, '_blank', 1, 1, 0, '43662357C1488DCB6D38B090FE98060B', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'WEB');
INSERT INTO glb_t_session (id, session_id, start_time, end_time, user_id, ip_address, user_name, env_id, target, org_id, prof_type_id, https, session_old_id, host, host_name, media_type) VALUES (5, 'D9CAA2400BB2B524616B23F574E02FD9', 1496834938038, 1496834939838, 1, '0:0:0:0:0:0:0:1', 'demo', 1, '_blank', 1, 1, 0, 'D9CAA2400BB2B524616B23F574E02FD9', '0:0:0:0:0:0:0:1', '0:0:0:0:0:0:0:1', 'WEB');


--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 209
-- Name: glb_t_session_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('glb_t_session_id_sequence', 5, true);


--
-- TOC entry 2414 (class 0 OID 25439)
-- Dependencies: 196
-- Data for Name: glb_t_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2415 (class 0 OID 25445)
-- Dependencies: 197
-- Data for Name: glb_t_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_user (id, name, email, pass_hash, userprofile, valid_until, remarks, activation_key, user_name, photo_id, signature_id, mobile, phone, password_reset_token, auth_key, status, created_at, updated_at) VALUES (1, 'demo', 'admin@gmail.com', 'fe01ce2a7fbac8fafaed7c982a04e229', 'USER', NULL, NULL, '123456789', 'demo', NULL, NULL, NULL, NULL, NULL, 'SRRKZ1a2n77nDcdLmXBJCt3HQWoRKozc', 1, 2017, 2017);
INSERT INTO glb_t_user (id, name, email, pass_hash, userprofile, valid_until, remarks, activation_key, user_name, photo_id, signature_id, mobile, phone, password_reset_token, auth_key, status, created_at, updated_at) VALUES (0, 'IGRP', 'igrp@nosi.cv', 'admin', 'ADMIN', NULL, NULL, '123456789', 'admin', NULL, NULL, NULL, NULL, NULL, 'SRRKZ1a2n77nDcdLmXBJCt3HQWoRKozc', 1, 2017, 2017);


--
-- TOC entry 2439 (class 0 OID 0)
-- Dependencies: 187
-- Name: id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_sequence', 220, true);


--
-- TOC entry 2440 (class 0 OID 0)
-- Dependencies: 198
-- Name: menu_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_id_sequence', 0, true);


--
-- TOC entry 2441 (class 0 OID 0)
-- Dependencies: 199
-- Name: organization_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('organization_id_sequence', 0, true);


--
-- TOC entry 2442 (class 0 OID 0)
-- Dependencies: 200
-- Name: profile_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profile_id_sequence', 0, true);


--
-- TOC entry 2426 (class 0 OID 25606)
-- Dependencies: 208
-- Data for Name: tbl_marcao_consulta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_marcao_consulta (id, id_medico, id_utente, data_consulta, estado) VALUES (1, 1, 1, '2017-01-30', 1);
INSERT INTO tbl_marcao_consulta (id, id_medico, id_utente, data_consulta, estado) VALUES (2, 2, 2, '2017-01-30', 1);
INSERT INTO tbl_marcao_consulta (id, id_medico, id_utente, data_consulta, estado) VALUES (3, 1, 2, '2016-12-30', 1);
INSERT INTO tbl_marcao_consulta (id, id_medico, id_utente, data_consulta, estado) VALUES (4, 1, 3, '2016-12-30', 1);
INSERT INTO tbl_marcao_consulta (id, id_medico, id_utente, data_consulta, estado) VALUES (5, 2, 4, '2016-12-30', 1);
INSERT INTO tbl_marcao_consulta (id, id_medico, id_utente, data_consulta, estado) VALUES (6, 2, 5, '2017-05-30', 1);


--
-- TOC entry 2443 (class 0 OID 0)
-- Dependencies: 207
-- Name: tbl_marcao_consulta_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_marcao_consulta_id_sequence', 6, true);


--
-- TOC entry 2422 (class 0 OID 25589)
-- Dependencies: 204
-- Data for Name: tbl_medico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_medico (id, nome, morada, num_consulta_dia) VALUES (1, 'Agostinho', 'Palmarejo', 2);
INSERT INTO tbl_medico (id, nome, morada, num_consulta_dia) VALUES (2, 'Eliza Barbosa', 'Fazenda', 3);


--
-- TOC entry 2444 (class 0 OID 0)
-- Dependencies: 203
-- Name: tbl_medico_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_medico_id_sequence', 2, true);


--
-- TOC entry 2424 (class 0 OID 25598)
-- Dependencies: 206
-- Data for Name: tbl_utente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tbl_utente (id, nome, morada, data_nascimento, sexo) VALUES (1, 'Zequinha', 'Achadinha', '2000-01-30', 2);
INSERT INTO tbl_utente (id, nome, morada, data_nascimento, sexo) VALUES (2, 'Maria', 'Safende', '1995-01-25', 1);
INSERT INTO tbl_utente (id, nome, morada, data_nascimento, sexo) VALUES (3, 'Jidea', 'Castelao', '1949-03-20', 1);
INSERT INTO tbl_utente (id, nome, morada, data_nascimento, sexo) VALUES (4, 'Ana', 'Achada Mato', '1969-03-20', 1);
INSERT INTO tbl_utente (id, nome, morada, data_nascimento, sexo) VALUES (5, 'Paulinho', 'Achada Grande Frente', '1989-03-20', 2);


--
-- TOC entry 2445 (class 0 OID 0)
-- Dependencies: 205
-- Name: tbl_utente_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tbl_utente_id_sequence', 5, true);


--
-- TOC entry 2446 (class 0 OID 0)
-- Dependencies: 201
-- Name: transaction_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transaction_id_sequence', 0, true);


--
-- TOC entry 2447 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_sequence', 0, true);


--
-- TOC entry 2209 (class 2606 OID 25470)
-- Name: glb_t_env dad; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_env
    ADD CONSTRAINT dad UNIQUE (dad);


--
-- TOC entry 2235 (class 2606 OID 25472)
-- Name: glb_t_user email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_user
    ADD CONSTRAINT email UNIQUE (email);


--
-- TOC entry 2199 (class 2606 OID 25474)
-- Name: glb_t_action glb_t_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_action
    ADD CONSTRAINT glb_t_action_pkey PRIMARY KEY (id);


--
-- TOC entry 2201 (class 2606 OID 25476)
-- Name: glb_t_action glb_t_action_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_action
    ADD CONSTRAINT glb_t_action_uk UNIQUE (env_fk, page, action);


--
-- TOC entry 2206 (class 2606 OID 25478)
-- Name: glb_t_config_env glb_t_config_env_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_config_env
    ADD CONSTRAINT glb_t_config_env_pkey PRIMARY KEY (id);


--
-- TOC entry 2211 (class 2606 OID 25480)
-- Name: glb_t_env glb_t_env_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_env
    ADD CONSTRAINT glb_t_env_pkey PRIMARY KEY (id);


--
-- TOC entry 2215 (class 2606 OID 25482)
-- Name: glb_t_menu glb_t_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_menu
    ADD CONSTRAINT glb_t_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 25484)
-- Name: glb_t_organization glb_t_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_organization_pkey PRIMARY KEY (id);


--
-- TOC entry 2220 (class 2606 OID 25486)
-- Name: glb_t_organization glb_t_organization_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_organization_uk UNIQUE (code, env_fk);


--
-- TOC entry 2223 (class 2606 OID 25488)
-- Name: glb_t_profile glb_t_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile
    ADD CONSTRAINT glb_t_profile_pkey PRIMARY KEY (prof_type_fk, user_fk, type, type_fk, org_fk);


--
-- TOC entry 2229 (class 2606 OID 25490)
-- Name: glb_t_profile_type glb_t_profile_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile_type
    ADD CONSTRAINT glb_t_profile_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2247 (class 2606 OID 25638)
-- Name: glb_t_session glb_t_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_session
    ADD CONSTRAINT glb_t_session_pkey PRIMARY KEY (id);


--
-- TOC entry 2249 (class 2606 OID 25640)
-- Name: glb_t_session glb_t_session_session_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_session
    ADD CONSTRAINT glb_t_session_session_id UNIQUE (session_id);


--
-- TOC entry 2231 (class 2606 OID 25492)
-- Name: glb_t_transaction glb_t_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_transaction
    ADD CONSTRAINT glb_t_transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 2233 (class 2606 OID 25494)
-- Name: glb_t_transaction glb_t_transaction_uk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_transaction
    ADD CONSTRAINT glb_t_transaction_uk UNIQUE (env_fk, code);


--
-- TOC entry 2237 (class 2606 OID 25496)
-- Name: glb_t_user glb_t_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_user
    ADD CONSTRAINT glb_t_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 25612)
-- Name: tbl_marcao_consulta glb_tbl_marcao_consulta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_marcao_consulta
    ADD CONSTRAINT glb_tbl_marcao_consulta_pkey PRIMARY KEY (id);


--
-- TOC entry 2241 (class 2606 OID 25595)
-- Name: tbl_medico glb_tbl_medico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_medico
    ADD CONSTRAINT glb_tbl_medico_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 25603)
-- Name: tbl_utente glb_tbl_utente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_utente
    ADD CONSTRAINT glb_tbl_utente_pkey PRIMARY KEY (id);


--
-- TOC entry 2203 (class 2606 OID 25498)
-- Name: glb_t_config name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_config
    ADD CONSTRAINT name PRIMARY KEY (name);


--
-- TOC entry 2239 (class 2606 OID 25500)
-- Name: glb_t_user user_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_user
    ADD CONSTRAINT user_name UNIQUE (user_name);


--
-- TOC entry 2207 (class 1259 OID 25501)
-- Name: config_env_action_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX config_env_action_fk ON glb_t_env USING btree (action_fk);


--
-- TOC entry 2204 (class 1259 OID 25502)
-- Name: config_env_env_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX config_env_env_fk ON glb_t_config_env USING btree (env_fk);


--
-- TOC entry 2212 (class 1259 OID 25503)
-- Name: glb_t_menu_action_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX glb_t_menu_action_fk ON glb_t_menu USING btree (action_fk);


--
-- TOC entry 2213 (class 1259 OID 25504)
-- Name: glb_t_menu_env_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX glb_t_menu_env_fk ON glb_t_menu USING btree (env_fk);


--
-- TOC entry 2216 (class 1259 OID 25505)
-- Name: glb_t_menu_self_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX glb_t_menu_self_fk ON glb_t_menu USING btree (self_id);


--
-- TOC entry 2225 (class 1259 OID 25506)
-- Name: glb_t_prof_type_self_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX glb_t_prof_type_self_fk ON glb_t_profile_type USING btree (self_fk);


--
-- TOC entry 2221 (class 1259 OID 25507)
-- Name: glb_t_profile_org_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX glb_t_profile_org_fk ON glb_t_profile USING btree (org_fk);


--
-- TOC entry 2226 (class 1259 OID 25508)
-- Name: glb_t_profile_type_env_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX glb_t_profile_type_env_fk ON glb_t_profile_type USING btree (env_fk);


--
-- TOC entry 2227 (class 1259 OID 25509)
-- Name: glb_t_profile_type_org_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX glb_t_profile_type_org_fk ON glb_t_profile_type USING btree (org_fk);


--
-- TOC entry 2224 (class 1259 OID 25510)
-- Name: glb_t_profile_user_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX glb_t_profile_user_fk ON glb_t_profile USING btree (user_fk);


--
-- TOC entry 2251 (class 2606 OID 25511)
-- Name: glb_t_config_env config_env_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_config_env
    ADD CONSTRAINT config_env_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2250 (class 2606 OID 25516)
-- Name: glb_t_action glb_t_action_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_action
    ADD CONSTRAINT glb_t_action_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2252 (class 2606 OID 25521)
-- Name: glb_t_menu glb_t_menu_action_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_menu
    ADD CONSTRAINT glb_t_menu_action_fk FOREIGN KEY (action_fk) REFERENCES glb_t_action(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2253 (class 2606 OID 25526)
-- Name: glb_t_menu glb_t_menu_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_menu
    ADD CONSTRAINT glb_t_menu_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2254 (class 2606 OID 25531)
-- Name: glb_t_menu glb_t_menu_self_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_menu
    ADD CONSTRAINT glb_t_menu_self_fk FOREIGN KEY (self_id) REFERENCES glb_t_menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2255 (class 2606 OID 25536)
-- Name: glb_t_organization glb_t_org_user_create_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_org_user_create_fk FOREIGN KEY (user_create_fk) REFERENCES glb_t_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2256 (class 2606 OID 25541)
-- Name: glb_t_organization glb_t_organization_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_organization_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2257 (class 2606 OID 25546)
-- Name: glb_t_organization glb_t_organization_self_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_organization_self_fk FOREIGN KEY (self_fk) REFERENCES glb_t_organization(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2261 (class 2606 OID 25551)
-- Name: glb_t_profile_type glb_t_prof_type_self_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile_type
    ADD CONSTRAINT glb_t_prof_type_self_fk FOREIGN KEY (self_fk) REFERENCES glb_t_profile_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2258 (class 2606 OID 25556)
-- Name: glb_t_profile glb_t_profile_org_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile
    ADD CONSTRAINT glb_t_profile_org_fk FOREIGN KEY (org_fk) REFERENCES glb_t_organization(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2262 (class 2606 OID 25561)
-- Name: glb_t_profile_type glb_t_profile_type_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile_type
    ADD CONSTRAINT glb_t_profile_type_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2259 (class 2606 OID 25566)
-- Name: glb_t_profile glb_t_profile_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile
    ADD CONSTRAINT glb_t_profile_type_fk FOREIGN KEY (prof_type_fk) REFERENCES glb_t_profile_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2263 (class 2606 OID 25571)
-- Name: glb_t_profile_type glb_t_profile_type_org_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile_type
    ADD CONSTRAINT glb_t_profile_type_org_fk FOREIGN KEY (org_fk) REFERENCES glb_t_organization(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2260 (class 2606 OID 25576)
-- Name: glb_t_profile glb_t_profile_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile
    ADD CONSTRAINT glb_t_profile_user_fk FOREIGN KEY (user_fk) REFERENCES glb_t_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2267 (class 2606 OID 25641)
-- Name: glb_t_session glb_t_session_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_session
    ADD CONSTRAINT glb_t_session_env_fk FOREIGN KEY (env_id) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2269 (class 2606 OID 25651)
-- Name: glb_t_session glb_t_session_org_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_session
    ADD CONSTRAINT glb_t_session_org_fk FOREIGN KEY (org_id) REFERENCES glb_t_organization(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2270 (class 2606 OID 25656)
-- Name: glb_t_session glb_t_session_prof_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_session
    ADD CONSTRAINT glb_t_session_prof_type_fk FOREIGN KEY (prof_type_id) REFERENCES glb_t_profile_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2268 (class 2606 OID 25646)
-- Name: glb_t_session glb_t_session_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_session
    ADD CONSTRAINT glb_t_session_user_fk FOREIGN KEY (user_id) REFERENCES glb_t_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2264 (class 2606 OID 25581)
-- Name: glb_t_transaction glb_t_transaction_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_transaction
    ADD CONSTRAINT glb_t_transaction_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2265 (class 2606 OID 25613)
-- Name: tbl_marcao_consulta tbl_medico_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_marcao_consulta
    ADD CONSTRAINT tbl_medico_fk FOREIGN KEY (id_medico) REFERENCES tbl_medico(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2266 (class 2606 OID 25618)
-- Name: tbl_marcao_consulta tbl_utente_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tbl_marcao_consulta
    ADD CONSTRAINT tbl_utente_fk FOREIGN KEY (id_utente) REFERENCES tbl_utente(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2017-06-07 11:11:00

--
-- PostgreSQL database dump complete
--

