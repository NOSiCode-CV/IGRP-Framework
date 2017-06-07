--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.19
-- Dumped by pg_dump version 9.2.19
-- Started on 2017-04-11 14:34:44

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 169 (class 1259 OID 16394)
-- Name: config_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE config_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_id_sequence OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 16396)
-- Name: env_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE env_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.env_id_sequence OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16398)
-- Name: id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_sequence OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 16400)
-- Name: glb_t_action; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    flg_menu smallint DEFAULT 0::smallint,
    flg_transaction smallint DEFAULT 0::smallint,
    self_id integer,
    self_fw_id integer,
    version double precision,
    db_connection character varying(30) DEFAULT NULL::character varying,
    flg_offline smallint DEFAULT 0::smallint,
    flg_internet smallint DEFAULT 0::smallint,
    status smallint DEFAULT 1::smallint,
    proc_name character varying(12200)
);


ALTER TABLE public.glb_t_action OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16419)
-- Name: glb_t_config; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE glb_t_config (
    name character varying(30) NOT NULL,
    value character varying(4000) NOT NULL
);


ALTER TABLE public.glb_t_config OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 16425)
-- Name: glb_t_config_env; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


ALTER TABLE public.glb_t_config_env OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16432)
-- Name: glb_t_env; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE glb_t_env (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    dad character varying(30) NOT NULL,
    img_src character varying(50) DEFAULT NULL::character varying,
    description character varying(500) DEFAULT NULL::character varying,
    action_fk integer,
    flg_old smallint DEFAULT 0::smallint,
    link_menu character varying(2000) DEFAULT NULL::character varying,
    link_center character varying(2000) DEFAULT NULL::character varying,
    apache_dad character varying(30) DEFAULT NULL::character varying,
    templates character varying(30) DEFAULT NULL::character varying,
    host character varying(30) DEFAULT NULL::character varying,
    flg_external smallint DEFAULT 0::smallint,
    status smallint DEFAULT 1::smallint NOT NULL
);


ALTER TABLE public.glb_t_env OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 16449)
-- Name: glb_t_menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    status smallint DEFAULT 1::smallint,
    code character varying(20) DEFAULT NULL::character varying,
    flg_base smallint DEFAULT 0::smallint,
    target character varying(20) DEFAULT '_self'::character varying
);


ALTER TABLE public.glb_t_menu OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16460)
-- Name: glb_t_organization; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE glb_t_organization (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(1000) NOT NULL,
    sigof_fk integer,
    env_fk integer NOT NULL,
    status smallint DEFAULT 1::smallint NOT NULL,
    user_create_fk integer,
    self_fk integer
);


ALTER TABLE public.glb_t_organization OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 16468)
-- Name: glb_t_profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE glb_t_profile (
    prof_type_fk integer NOT NULL,
    user_fk integer NOT NULL,
    type character varying(20) NOT NULL,
    type_fk integer NOT NULL,
    org_fk integer NOT NULL
);


ALTER TABLE public.glb_t_profile OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 16471)
-- Name: glb_t_profile_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE glb_t_profile_type (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    descr character varying(50) NOT NULL,
    code character varying(20) DEFAULT NULL::character varying,
    env_fk integer,
    self_fk integer,
    org_fk integer,
    status smallint DEFAULT 1::smallint
);


ALTER TABLE public.glb_t_profile_type OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 16477)
-- Name: glb_t_transaction; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE glb_t_transaction (
    id integer DEFAULT nextval('id_sequence'::regclass) NOT NULL,
    code character varying(150) NOT NULL,
    descr character varying(250) DEFAULT NULL::character varying,
    env_fk integer,
    status smallint DEFAULT 1::smallint NOT NULL
);


ALTER TABLE public.glb_t_transaction OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16483)
-- Name: glb_t_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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
    status smallint DEFAULT 10::smallint NOT NULL,
    created_at integer NOT NULL,
    updated_at integer NOT NULL
);


ALTER TABLE public.glb_t_user OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16497)
-- Name: menu_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_sequence OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 16499)
-- Name: organization_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE organization_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organization_id_sequence OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16501)
-- Name: profile_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profile_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_id_sequence OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16503)
-- Name: transaction_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE transaction_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_id_sequence OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16505)
-- Name: user_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_sequence OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 169
-- Name: config_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('config_id_sequence', 0, true);


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 170
-- Name: env_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('env_id_sequence', 0, true);


--
-- TOC entry 2082 (class 0 OID 16400)
-- Dependencies: 172
-- Data for Name: glb_t_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (2, 1, 'FormEnv', 'formEnv', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_ENV_FORM_form.xsl', NULL, NULL, 'Gestão Aplicação', 'form', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.formEnv.controller.FormEnv.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (5, 1, 'ListEnv', 'listEnv', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_ENV_BULK_dash.xsl', NULL, NULL, 'Gestão Aplicação', 'lista', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.listEnv.controller.ListEnv.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (1, 1, 'DefaultPage', 'defaultPage', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_APLIC_INFO_4_dash.xsl', NULL, NULL, 'Suporte Aplicação', NULL, 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.defaultPage.controller.DefaultPage.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (15, 1, 'ListUser', 'listUser', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_USER_BULK_dash.xsl', NULL, NULL, 'Gestão Utilizador', 'lista', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.listUser.controller.ListUser.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (16, 1, 'Settings', 'viewSettings', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_APLIC_INFO_3_dash.xsl', NULL, NULL, 'Settings', 'Info User', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.settings.controller.Settings.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (7, 1, 'ListMenu', 'listMenu', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_MENU_BULK_dash.xsl', NULL, NULL, 'Gestão Menu', 'lista', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.listMenu.controller.ListMenu.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (17, 1, 'MenuPerfil', 'atributeMenuPerfil', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_PROFILE_TYPE_MENU_table.xsl', NULL, NULL, 'Menu   ', 'table', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.menuPerfil.controller.MenuPerfil.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (18, 1, 'Generator', 'viewGenerator', NULL, 'images/IGRPLAB2.3/app/RED/RED_FORM_1_dash.xsl', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.generator.controller.Generator.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (19, 1, 'MenuOrganica', 'atributeMenuOrganica', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_PROFILE_TYPE_MENU_table.xsl', NULL, NULL, 'Menu', 'table', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.menuOrganica.controller.MenuOrganica.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (99, 1, 'Menu', 'errorPage', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (20, 1, 'MenuUser', 'atributeMenuUser', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_PROFILE_TYPE_MENU_table.xsl', NULL, NULL, 'Menu', 'table', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.menuUser.controller.MenuUser.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (8, 1, 'ListOrganica', 'listOrganica', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_ORGANIZATION_BULK_dash.xsl', NULL, NULL, 'Gestão Organica', 'lista', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.listOrganica.controller.ListOrganica.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (9, 1, 'ListPerfil', 'listPerfil', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_PROFILE_TYPE_BULK_dash.xsl', NULL, NULL, 'Gestão Perfil', 'lista', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.listPerfil.controller.ListPerfil.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (10, 1, 'FormMenu', 'formMenu', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_MENU_FORM_form.xsl', NULL, NULL, 'Gestão Menu', 'form', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.formMenu.controller.FormMenu.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (6, 1, 'ListAction', 'listAction', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_ACTION_BULK_dash.xsl', NULL, NULL, 'Gestão Pagina', 'lista', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.listAction.controller.ListAction.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (3, 1, 'FormOrganica', 'formOrganica', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_ORGANIZATION_FORM_form.xsl', NULL, NULL, 'Gestão Organica', 'form', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.formOrganica.controller.FormOrganica.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (4, 1, 'FormPerfil', 'formPerfil', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_PROFILE_TYPE_FORM_form.xsl', NULL, NULL, 'Gestão Perfil', 'form', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.formPerfil.controller.FormPerfil.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (12, 1, 'FormAddUser', 'formAddUser', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_USER_FORM_NOVO_form.xsl', NULL, NULL, 'Gestão User-Novo', 'form', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.formAddUser.controller.FormAddUser.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (13, 1, 'FormInviteUser', 'formInviteUser', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_USER_FORM_INVITE_form.xsl', NULL, NULL, 'Gestão User-Convidar', 'form', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.formInviteUser.controller.FormInviteUser.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (14, 1, 'FormEditUser', 'formEditUser', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_USER_FORM_form.xsl', NULL, NULL, 'Gestão User-Editar', 'form', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.formEditUser.controller.FormEditUser.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (116, 2, 'page', 'action', NULL, 'images/IGRPLAB2.3/app/TESTE1/Person.xsl', NULL, NULL, 'descr page', 'descr action', 0, 0, NULL, NULL, 2.2999999999999998, NULL, 0, 0, 1, 'nosi.app.TESTE1.pack.controller.Person.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (11, 1, 'FormAction', 'formAction', NULL, 'images/IGRPLAB2.3/app/REDGLOBAL/REDGLOBAL_GLB_T_ACTION_FORM_form.xsl', NULL, NULL, 'Gestão Pagina', 'form', 0, 0, NULL, NULL, 2.1000000000000001, NULL, 0, 0, 1, 'nosi.app.REDGLOBAL.formAction.controller.FormAction.list');
INSERT INTO glb_t_action (id, env_fk, page, action, table_name, xsl_src, img_src, page_type, page_descr, action_descr, flg_menu, flg_transaction, self_id, self_fw_id, version, db_connection, flg_offline, flg_internet, status, proc_name) VALUES (117, 2, 'page1', 'action1', NULL, 'images/IGRPLAB2.3/app/TESTE1/Pessoa.xsl', NULL, NULL, 'descr1', 'action descr1', 0, 0, NULL, NULL, 2.2999999999999998, NULL, 0, 0, 1, 'nosi.app.TESTE1.pack.controller.Pessoa.list');


--
-- TOC entry 2083 (class 0 OID 16419)
-- Dependencies: 173
-- Data for Name: glb_t_config; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2084 (class 0 OID 16425)
-- Dependencies: 174
-- Data for Name: glb_t_config_env; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2085 (class 0 OID 16432)
-- Dependencies: 175
-- Data for Name: glb_t_env; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_env (id, name, dad, img_src, description, action_fk, flg_old, link_menu, link_center, apache_dad, templates, host, flg_external, status) VALUES (1, 'IGRP', 'REDGLOBAL', 'asasasa', 'abc', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO glb_t_env (id, name, dad, img_src, description, action_fk, flg_old, link_menu, link_center, apache_dad, templates, host, flg_external, status) VALUES (86, 'teste21', 'TESTE2', 'default.png', 'vdfvdfvdvf', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO glb_t_env (id, name, dad, img_src, description, action_fk, flg_old, link_menu, link_center, apache_dad, templates, host, flg_external, status) VALUES (92, 'testenbnbn', 'TESTE3', NULL, '', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO glb_t_env (id, name, dad, img_src, description, action_fk, flg_old, link_menu, link_center, apache_dad, templates, host, flg_external, status) VALUES (2, 'teste21', 'TESTE1', NULL, 'aaa', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO glb_t_env (id, name, dad, img_src, description, action_fk, flg_old, link_menu, link_center, apache_dad, templates, host, flg_external, status) VALUES (107, 'vsdvs', 'vfx', 'default.png', 'vsdvs', 1, 0, NULL, NULL, NULL, NULL, NULL, 0, 1);


--
-- TOC entry 2086 (class 0 OID 16449)
-- Dependencies: 176
-- Data for Name: glb_t_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (1, 'GESTÃO APLICAÇÃO', NULL, NULL, 1, NULL, NULL, NULL, 1, 1, 'GA', 1, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (2, 'Detalhe de Aplicacao', NULL, 1, 1, NULL, NULL, 5, 2, 1, 'DA', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (3, 'PARAMETROS GERAIS', NULL, NULL, 1, NULL, NULL, NULL, 5, 1, 'PG', 1, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (4, 'Gestao de Organica', NULL, 3, 1, NULL, NULL, 8, 6, 1, 'GO', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (7, 'Gestao de Pagina', NULL, 1, 1, NULL, NULL, 6, 3, 1, 'GP', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (8, 'Gestao de Menu', NULL, 1, 1, NULL, NULL, 7, 4, 1, 'GM', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (9, 'Gestao de Perfil', NULL, 3, 1, NULL, NULL, 9, 7, 1, 'GP', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (18, 'Gestao de Utilizador', NULL, 3, 1, NULL, NULL, 15, 8, 1, 'GU', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (19, 'Settings', NULL, 3, 1, NULL, NULL, 16, 9, 1, 'S', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (24, 'Menu3', NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, 'm', 1, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (80, 'subMenu3.1', NULL, 24, 2, NULL, NULL, 116, NULL, 1, 'm', 0, '_self');
INSERT INTO glb_t_menu (id, descr, link, self_id, env_fk, img_src, area, action_fk, orderby, status, code, flg_base, target) VALUES (81, 'subMenu3.2', NULL, 24, 2, NULL, NULL, 117, NULL, 1, 'm', 0, '_self');


--
-- TOC entry 2087 (class 0 OID 16460)
-- Dependencies: 177
-- Data for Name: glb_t_organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_organization (id, code, name, sigof_fk, env_fk, status, user_create_fk, self_fk) VALUES (100, 'fr', 'gr', NULL, 86, 1, NULL, NULL);
INSERT INTO glb_t_organization (id, code, name, sigof_fk, env_fk, status, user_create_fk, self_fk) VALUES (17, 'E', 'Nosi', NULL, 1, 1, NULL, NULL);
INSERT INTO glb_t_organization (id, code, name, sigof_fk, env_fk, status, user_create_fk, self_fk) VALUES (99, 'o2', 'org teste', NULL, 92, 1, NULL, NULL);
INSERT INTO glb_t_organization (id, code, name, sigof_fk, env_fk, status, user_create_fk, self_fk) VALUES (18, 'Ab', 'ORG12', NULL, 1, 1, NULL, NULL);
INSERT INTO glb_t_organization (id, code, name, sigof_fk, env_fk, status, user_create_fk, self_fk) VALUES (101, 'vxcvxc', 'vxfvx', NULL, 92, 1, NULL, NULL);
INSERT INTO glb_t_organization (id, code, name, sigof_fk, env_fk, status, user_create_fk, self_fk) VALUES (83, 'OT1', 'OrganicaTeste1', NULL, 2, 1, NULL, NULL);


--
-- TOC entry 2088 (class 0 OID 16468)
-- Dependencies: 178
-- Data for Name: glb_t_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 2, 'PROF', 17, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 2, 'ENV', 1, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 1, 'ENV', 1, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (18, 0, 'MEN', 9, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (18, 0, 'MEN', 19, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (84, 0, 'MEN', 21, 83);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (84, 0, 'MEN', 23, 83);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (84, 0, 'MEN', 81, 83);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (84, 0, 'MEN', 80, 83);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (84, 1, 'ENV', 2, 83);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (84, 1, 'PROF', 84, 83);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 0, 'MEN', 9, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 0, 'MEN', 18, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 0, 'MEN', 19, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 0, 'MEN', 4, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 0, 'MEN', 7, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 0, 'MEN', 8, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 0, 'MEN', 2, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (17, 1, 'PROF', 17, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (18, 2, 'PROF', 18, 17);
INSERT INTO glb_t_profile (prof_type_fk, user_fk, type, type_fk, org_fk) VALUES (18, 1, 'PROF', 18, 17);


--
-- TOC entry 2089 (class 0 OID 16471)
-- Dependencies: 179
-- Data for Name: glb_t_profile_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_profile_type (id, descr, code, env_fk, self_fk, org_fk, status) VALUES (17, 'Administrador', 'A', 1, NULL, 17, 1);
INSERT INTO glb_t_profile_type (id, descr, code, env_fk, self_fk, org_fk, status) VALUES (84, 'perfilORgTeste1', 'PFT1', 2, NULL, 83, 1);
INSERT INTO glb_t_profile_type (id, descr, code, env_fk, self_fk, org_fk, status) VALUES (18, 'User', 'U', 1, NULL, 17, 1);


--
-- TOC entry 2090 (class 0 OID 16477)
-- Dependencies: 180
-- Data for Name: glb_t_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2091 (class 0 OID 16483)
-- Dependencies: 181
-- Data for Name: glb_t_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO glb_t_user (id, name, email, pass_hash, userprofile, valid_until, remarks, activation_key, user_name, photo_id, signature_id, mobile, phone, password_reset_token, auth_key, status, created_at, updated_at) VALUES (3, 'Cleisson Erasmos', 'CleissonErasmos@gmail.com', '123', 'user', NULL, NULL, '123456789', 'cleisson', NULL, NULL, NULL, NULL, '123456789', 'a3b', 1, 111, 111);
INSERT INTO glb_t_user (id, name, email, pass_hash, userprofile, valid_until, remarks, activation_key, user_name, photo_id, signature_id, mobile, phone, password_reset_token, auth_key, status, created_at, updated_at) VALUES (56, 'nome', 'email@nosi.cv', 'password', 'user', NULL, NULL, '123456789', 'userName', NULL, NULL, NULL, NULL, NULL, 'auth key', 0, 1, 1);
INSERT INTO glb_t_user (id, name, email, pass_hash, userprofile, valid_until, remarks, activation_key, user_name, photo_id, signature_id, mobile, phone, password_reset_token, auth_key, status, created_at, updated_at) VALUES (1, 'Ivanick Santos', 'ivanicksantos@gmail.com', '123', 'user', NULL, NULL, '123456789', 'ivanick', NULL, NULL, NULL, NULL, '123456789', 'a2b', 1, 111, 111);
INSERT INTO glb_t_user (id, name, email, pass_hash, userprofile, valid_until, remarks, activation_key, user_name, photo_id, signature_id, mobile, phone, password_reset_token, auth_key, status, created_at, updated_at) VALUES (0, 'a', 'b', 'vfvd', 'user', NULL, NULL, 'dvdfv', 'dvdf', NULL, NULL, NULL, NULL, 'vfdv', 'dvdfv', 0, 11, 11);
INSERT INTO glb_t_user (id, name, email, pass_hash, userprofile, valid_until, remarks, activation_key, user_name, photo_id, signature_id, mobile, phone, password_reset_token, auth_key, status, created_at, updated_at) VALUES (63, 'teste', 'teste@nosi.cv', 'password', 'user', NULL, NULL, '123456789', 'teste', NULL, NULL, NULL, NULL, NULL, 'auth key', 1, 1, 1);
INSERT INTO glb_t_user (id, name, email, pass_hash, userprofile, valid_until, remarks, activation_key, user_name, photo_id, signature_id, mobile, phone, password_reset_token, auth_key, status, created_at, updated_at) VALUES (4, 'grbegbetb', 'tbtebtbt', 'btbt', 'user', NULL, NULL, 'btbthb', 'btbtb', NULL, NULL, NULL, NULL, 'btbty', 'btbtybt', 0, 11, 11);
INSERT INTO glb_t_user (id, name, email, pass_hash, userprofile, valid_until, remarks, activation_key, user_name, photo_id, signature_id, mobile, phone, password_reset_token, auth_key, status, created_at, updated_at) VALUES (2, 'Rui matias', 'ruisousa@gmail.com', '12345', 'user', NULL, NULL, '123456789', 'rui', NULL, NULL, NULL, NULL, '123456789', 'a1b', 1, 111, 1111);


--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 171
-- Name: id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('id_sequence', 117, true);


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 182
-- Name: menu_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_id_sequence', 0, true);


--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 183
-- Name: organization_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('organization_id_sequence', 0, true);


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 184
-- Name: profile_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('profile_id_sequence', 0, true);


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 185
-- Name: transaction_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('transaction_id_sequence', 0, true);


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 186
-- Name: user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_sequence', 0, true);


--
-- TOC entry 1926 (class 2606 OID 16508)
-- Name: dad; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_env
    ADD CONSTRAINT dad UNIQUE (dad);


--
-- TOC entry 1952 (class 2606 OID 16510)
-- Name: email; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_user
    ADD CONSTRAINT email UNIQUE (email);


--
-- TOC entry 1916 (class 2606 OID 16512)
-- Name: glb_t_action_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_action
    ADD CONSTRAINT glb_t_action_pkey PRIMARY KEY (id);


--
-- TOC entry 1918 (class 2606 OID 16514)
-- Name: glb_t_action_uk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_action
    ADD CONSTRAINT glb_t_action_uk UNIQUE (env_fk, page, action);


--
-- TOC entry 1923 (class 2606 OID 16516)
-- Name: glb_t_config_env_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_config_env
    ADD CONSTRAINT glb_t_config_env_pkey PRIMARY KEY (id);


--
-- TOC entry 1928 (class 2606 OID 16518)
-- Name: glb_t_env_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_env
    ADD CONSTRAINT glb_t_env_pkey PRIMARY KEY (id);


--
-- TOC entry 1932 (class 2606 OID 16520)
-- Name: glb_t_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_menu
    ADD CONSTRAINT glb_t_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 1935 (class 2606 OID 16522)
-- Name: glb_t_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_organization_pkey PRIMARY KEY (id);


--
-- TOC entry 1937 (class 2606 OID 16524)
-- Name: glb_t_organization_uk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_organization_uk UNIQUE (code, env_fk);


--
-- TOC entry 1940 (class 2606 OID 16526)
-- Name: glb_t_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_profile
    ADD CONSTRAINT glb_t_profile_pkey PRIMARY KEY (prof_type_fk, user_fk, type, type_fk, org_fk);


--
-- TOC entry 1946 (class 2606 OID 16528)
-- Name: glb_t_profile_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_profile_type
    ADD CONSTRAINT glb_t_profile_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1948 (class 2606 OID 16530)
-- Name: glb_t_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_transaction
    ADD CONSTRAINT glb_t_transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 1950 (class 2606 OID 16532)
-- Name: glb_t_transaction_uk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_transaction
    ADD CONSTRAINT glb_t_transaction_uk UNIQUE (env_fk, code);


--
-- TOC entry 1954 (class 2606 OID 16534)
-- Name: glb_t_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_user
    ADD CONSTRAINT glb_t_user_pkey PRIMARY KEY (id);


--
-- TOC entry 1920 (class 2606 OID 16536)
-- Name: name; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_config
    ADD CONSTRAINT name PRIMARY KEY (name);


--
-- TOC entry 1956 (class 2606 OID 16538)
-- Name: user_name; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY glb_t_user
    ADD CONSTRAINT user_name UNIQUE (user_name);


--
-- TOC entry 1924 (class 1259 OID 16539)
-- Name: config_env_action_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX config_env_action_fk ON glb_t_env USING btree (action_fk);


--
-- TOC entry 1921 (class 1259 OID 16540)
-- Name: config_env_env_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX config_env_env_fk ON glb_t_config_env USING btree (env_fk);


--
-- TOC entry 1929 (class 1259 OID 16541)
-- Name: glb_t_menu_action_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX glb_t_menu_action_fk ON glb_t_menu USING btree (action_fk);


--
-- TOC entry 1930 (class 1259 OID 16542)
-- Name: glb_t_menu_env_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX glb_t_menu_env_fk ON glb_t_menu USING btree (env_fk);


--
-- TOC entry 1933 (class 1259 OID 16543)
-- Name: glb_t_menu_self_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX glb_t_menu_self_fk ON glb_t_menu USING btree (self_id);


--
-- TOC entry 1942 (class 1259 OID 16544)
-- Name: glb_t_prof_type_self_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX glb_t_prof_type_self_fk ON glb_t_profile_type USING btree (self_fk);


--
-- TOC entry 1938 (class 1259 OID 16545)
-- Name: glb_t_profile_org_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX glb_t_profile_org_fk ON glb_t_profile USING btree (org_fk);


--
-- TOC entry 1943 (class 1259 OID 16546)
-- Name: glb_t_profile_type_env_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX glb_t_profile_type_env_fk ON glb_t_profile_type USING btree (env_fk);


--
-- TOC entry 1944 (class 1259 OID 16547)
-- Name: glb_t_profile_type_org_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX glb_t_profile_type_org_fk ON glb_t_profile_type USING btree (org_fk);


--
-- TOC entry 1941 (class 1259 OID 16548)
-- Name: glb_t_profile_user_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX glb_t_profile_user_fk ON glb_t_profile USING btree (user_fk);


--
-- TOC entry 1958 (class 2606 OID 16549)
-- Name: config_env_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_config_env
    ADD CONSTRAINT config_env_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1957 (class 2606 OID 16554)
-- Name: glb_t_action_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_action
    ADD CONSTRAINT glb_t_action_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1959 (class 2606 OID 16559)
-- Name: glb_t_env_action_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_env
    ADD CONSTRAINT glb_t_env_action_fk FOREIGN KEY (action_fk) REFERENCES glb_t_action(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1960 (class 2606 OID 16564)
-- Name: glb_t_menu_action_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_menu
    ADD CONSTRAINT glb_t_menu_action_fk FOREIGN KEY (action_fk) REFERENCES glb_t_action(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1961 (class 2606 OID 16569)
-- Name: glb_t_menu_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_menu
    ADD CONSTRAINT glb_t_menu_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1962 (class 2606 OID 16574)
-- Name: glb_t_menu_self_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_menu
    ADD CONSTRAINT glb_t_menu_self_fk FOREIGN KEY (self_id) REFERENCES glb_t_menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1963 (class 2606 OID 16579)
-- Name: glb_t_org_user_create_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_org_user_create_fk FOREIGN KEY (user_create_fk) REFERENCES glb_t_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1964 (class 2606 OID 16584)
-- Name: glb_t_organization_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_organization_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1965 (class 2606 OID 16589)
-- Name: glb_t_organization_self_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_organization
    ADD CONSTRAINT glb_t_organization_self_fk FOREIGN KEY (self_fk) REFERENCES glb_t_organization(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1969 (class 2606 OID 16594)
-- Name: glb_t_prof_type_self_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile_type
    ADD CONSTRAINT glb_t_prof_type_self_fk FOREIGN KEY (self_fk) REFERENCES glb_t_profile_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1966 (class 2606 OID 16599)
-- Name: glb_t_profile_org_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile
    ADD CONSTRAINT glb_t_profile_org_fk FOREIGN KEY (org_fk) REFERENCES glb_t_organization(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1970 (class 2606 OID 16604)
-- Name: glb_t_profile_type_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile_type
    ADD CONSTRAINT glb_t_profile_type_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1967 (class 2606 OID 16609)
-- Name: glb_t_profile_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile
    ADD CONSTRAINT glb_t_profile_type_fk FOREIGN KEY (prof_type_fk) REFERENCES glb_t_profile_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1971 (class 2606 OID 16614)
-- Name: glb_t_profile_type_org_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile_type
    ADD CONSTRAINT glb_t_profile_type_org_fk FOREIGN KEY (org_fk) REFERENCES glb_t_organization(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1968 (class 2606 OID 16619)
-- Name: glb_t_profile_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_profile
    ADD CONSTRAINT glb_t_profile_user_fk FOREIGN KEY (user_fk) REFERENCES glb_t_user(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 1972 (class 2606 OID 16624)
-- Name: glb_t_transaction_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY glb_t_transaction
    ADD CONSTRAINT glb_t_transaction_env_fk FOREIGN KEY (env_fk) REFERENCES glb_t_env(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-04-11 14:34:46

--
-- PostgreSQL database dump complete


-------------------------------- Base dados do demo Marcacao de consultas --------------------------------------	 

-- --------------------------------------------------------
--
-- Estrutura da tabela `tbl_medico`
--
CREATE SEQUENCE tbl_medico_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;

CREATE TABLE  IF NOT EXISTS tbl_medico (
  id integer DEFAULT nextval('tbl_medico_id_sequence'::regclass) NOT NULL ,
  nome character varying(100) NOT NULL,
  morada character varying(100) NOT NULL,
  num_consulta_dia integer NOT NULL DEFAULT '1'
)

ALTER TABLE tbl_medico 
    ADD CONSTRAINT glb_tbl_medico_pkey PRIMARY KEY (id);

INSERT INTO tbl_medico(nome,morada,num_consulta_dia) 
values 
('Agostinho','Palmarejo',2), 
('Eliza Barbosa','Fazenda',3);




-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_utente`
--
CREATE SEQUENCE tbl_utente_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;

CREATE TABLE  IF NOT EXISTS tbl_utente (
  id integer default nextval('tbl_utente_id_sequence'::regclass) NOT NULL,
  nome character varying(100) NOT NULL,
  morada character varying(100) NOT NULL,
  data_nascimento date NOT NULL,
  sexo smallint NOT NULL
)

ALTER TABLE tbl_utente 
    ADD CONSTRAINT glb_tbl_utente_pkey PRIMARY KEY (id);

INSERT INTO tbl_utente(nome,morada,data_nascimento,sexo) 
values 
('Zequinha','Achadinha','2000-01-30',2), 
('Maria','Safende','1995-01-25',1), 
('Jidea','Castelao','1949-03-20',1), 
('Ana','Achada Mato','1969-03-20',1), 
('Paulinho','Achada Grande Frente','1989-03-20',2);


--
-- Estrutura da tabela `tbl_marcao_consulta`
--

-- --------------------------------------------------------

CREATE SEQUENCE tbl_marcao_consulta_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;

CREATE TABLE IF NOT EXISTS tbl_marcao_consulta (
  id integer default nextval('tbl_marcao_consulta_id_sequence'::regclass) NOT NULL,
  id_medico integer NOT NULL,
  id_utente integer NOT NULL,
  data_consulta date NOT NULL,
  estado smallint NOT NULL DEFAULT '0',
)

Alter Table tbl_marcao_consulta 
    ADD CONSTRAINT glb_tbl_marcao_consulta_pkey PRIMARY KEY (id);

ALTER TABLE tbl_marcao_consulta
    ADD CONSTRAINT tbl_medico_fk FOREIGN KEY (id_medico) REFERENCES tbl_medico(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE tbl_marcao_consulta
    ADD CONSTRAINT tbl_utente_fk FOREIGN KEY (id_utente) REFERENCES tbl_utente(id) ON UPDATE CASCADE ON DELETE CASCADE;

  INSERT INTO tbl_marcao_consulta(id_medico,id_utente,data_consulta,estado) 
  values 
  (1,1,'2017-01-30 00:00:00.0',1), 
  (2,2,'2017-01-30 00:00:00.0',1), 
  (1,2,'2016-12-30 00:00:00.0',1), 
  (1,3,'2016-12-30 00:00:00.0',1), 
  (2,4,'2016-12-30 00:00:00.0',1), 
  (2,5,'2017-05-30 00:00:00.0',1);
  
  
------------    Tabela Session ----------------
 CREATE SEQUENCE GLB_T_SESSION_id_sequence
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;

    CREATE TABLE  IF NOT EXISTS GLB_T_SESSION 
    (  
      ID integer Default nextval('GLB_T_SESSION_id_sequence'::regclass) NOT NULL,
      SESSION_ID character varying(50), 
      START_TIME bigint, 
      END_TIME bigint, 
      USER_ID integer, 
      IP_ADDRESS character varying(15), 
      USER_NAME character varying(50), 
      ENV_ID integer DEFAULT 1 NOT NULL, 
      TARGET character varying(20), 
      ORG_ID integer, 
      PROF_TYPE_ID integer, 
      HTTPS smallint DEFAULT 0,
      SESSION_OLD_ID character varying(50), 
      HOST character varying(30),
      HOST_NAME character varying(100), 
      MEDIA_TYPE character varying(30)
    )

    Alter Table GLB_T_SESSION 
        ADD CONSTRAINT GLB_T_SESSION_pkey PRIMARY KEY (ID);

    ALTER TABLE GLB_T_SESSION
        ADD CONSTRAINT GLB_T_SESSION_SESSION_ID UNIQUE (SESSION_ID);

    ALTER TABLE GLB_T_SESSION
        ADD CONSTRAINT GLB_T_SESSION_ENV_FK FOREIGN KEY (ENV_ID) REFERENCES glb_t_env (ID) ON DELETE CASCADE ON UPDATE CASCADE;

    ALTER TABLE GLB_T_SESSION
        ADD CONSTRAINT GLB_T_SESSION_USER_FK FOREIGN KEY (USER_ID) REFERENCES glb_t_user (ID) ON DELETE CASCADE ON UPDATE CASCADE;

    ALTER TABLE GLB_T_SESSION
        ADD CONSTRAINT GLB_T_SESSION_ORG_FK FOREIGN KEY (ORG_ID) REFERENCES glb_t_organization (ID) ON DELETE CASCADE ON UPDATE CASCADE;

    ALTER TABLE GLB_T_SESSION
        ADD CONSTRAINT GLB_T_SESSION_PROF_TYPE_FK FOREIGN KEY (PROF_TYPE_ID) REFERENCES glb_t_profile_type (ID) ON DELETE CASCADE ON UPDATE CASCADE;
        
        
        
        
----------------------------- CREATE VIEWS ------------------------------------
 CREATE OR REPLACE VIEW GLB_MV_ALL_MENUS (ID, DESCR, DESCR_MENU, LINK, SELF_ID, ENV_FK, IMG_SRC, AREA, ACTION_FK, ORDERBY) AS 
    SELECT  a.ID,
            b.descr || ' - ' || a.DESCR descr,
            a.descr descr_menu,
            a.LINK,
            a.SELF_ID,
            a.ENV_FK,
            a.IMG_SRC,
            a.AREA,
            a.ACTION_FK,
            a.ORDERBY
    FROM  glb_t_menu A,
            glb_t_menu b
    WHERE  b.id = a.self_id AND a.self_id IS NOT NULL;

CREATE OR REPLACE VIEW GLB_MV_MENU (ID, DESCR, LINK, SELF_ID, ENV_FK, IMG_SRC, AREA, ACTION_FK, ORDERBY, STATUS, CODE, FLG_BASE, TARGET) AS 
    SELECT ID,DESCR,LINK,SELF_ID,ENV_FK,IMG_SRC,AREA,ACTION_FK,ORDERBY,STATUS,CODE,FLG_BASE,TARGET 
    FROM GLB_T_MENU;

CREATE OR REPLACE VIEW GLB_V_MENU (ID, DESCR, DESCR_MENU, LINK, SELF_ID, ENV_FK, IMG_SRC, AREA, ACTION_FK, ORDERBY) AS 
    SELECT a.ID,
        b.descr
        || ' - '
        || a.DESCR descr,
        a.descr descr_menu,
        a.LINK,
        a.SELF_ID,
        a.ENV_FK,
        a.IMG_SRC,
        a.AREA,
        a.ACTION_FK,
        a.ORDERBY
     FROM glb_mv_menu A,
        glb_mv_menu b
     WHERE b.id     = a.self_id
     AND a.self_id IS NOT NULL;


 CREATE OR REPLACE VIEW GLB_V_ORG_MENU (ID, DESCR, ORDERBY, ENV_FK, SELF_ID, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK, FLG_BASE) AS 
    SELECT a.id,
        e.descr
        || ' - '
        || a.descr descr,
        a.orderby,
        a.env_fk,
        a.self_id,
        b.prof_type_fk,
        b.user_fk,
        'ALL' prof_code,
        'ALL PROFILE' prof_name,
        b.org_fk,
        a.flg_base
      FROM glb_t_menu a,
        glb_t_menu e,
        glb_t_profile b
      WHERE e.id         = a.self_id
      AND a.self_id     IS NOT NULL
      AND a.id           = b.type_fk
      AND b.TYPE         = 'MEN'
      AND b.prof_type_fk = 0;

CREATE OR REPLACE VIEW GLB_MV_PROFILE (PROF_TYPE_FK, USER_FK, TYPE, TYPE_FK, ORG_FK) AS 
  SELECT PROF_TYPE_FK,USER_FK,TYPE,TYPE_FK,ORG_FK 
  FROM GLB_T_PROFILE;

CREATE OR REPLACE VIEW GLB_MV_PROFILE_TYPE (ID, DESCR, CODE, ENV_FK, SELF_FK, STATUS, ORG_FK) AS 
   SELECT ID,DESCR,CODE,ENV_FK,SELF_FK,STATUS,ORG_FK 
   FROM GLB_T_PROFILE_TYPE;

CREATE OR REPLACE VIEW GLB_V_PROFILE(ORG_FK, PROF_TYPE_FK, USER_FK, TYPE, TYPE_FK, PROF_CODE, PROF_NAME, PROF_NAME_DESC, ENV_FK, SELF_FK) AS 
  SELECT   b.org_fk,
         b.prof_type_fk,
         b.user_fk,
         b.TYPE,
         b.type_fk,
         d.code prof_code,
         d.descr prof_name,
         d.code || ' - ' || d.descr prof_name_desc,
         d.env_fk,
         d.self_fk
  FROM   glb_mv_profile b,
         glb_mv_profile_type d
 WHERE   d.id = b.prof_type_fk;

 CREATE OR REPLACE VIEW GLB_V_PROFILE_MENU (ID, DESCR, DESCR_MENU, ORDERBY, ENV_FK, SELF_ID, ACTION_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS 
    SELECT a.id,
        e.descr descr,
        a.descr descr_menu,
        a.orderby,
        a.env_fk,
        a.self_id,
        a.action_fk,
        b.prof_type_fk,
        b.user_fk,
        d.code prof_code,
        d.descr prof_name,
        b.org_fk,
        a.status,
        a.target,
        d.env_fk as env_fk_prof_type
    FROM glb_mv_menu a,
        glb_mv_menu e,
        glb_mv_profile b,
        glb_mv_profile_type d
    WHERE e.id     = a.self_id
    AND a.self_id IS NOT NULL
    AND a.id       = b.type_fk
    AND b.TYPE     = 'MEN'
    AND d.id       = b.prof_type_fk;

 CREATE OR REPLACE VIEW GLB_V_USER_MENU (ID, DESCR, ORDERBY, ENV_FK, SELF_ID, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS 
  SELECT ID,DESCR,ORDERBY,ENV_FK,SELF_ID,PROF_TYPE_FK,USER_FK,PROF_CODE,PROF_NAME,ORG_FK
  FROM GLB_V_PROFILE_MENU 
  WHERE USER_FK<>0;

CREATE OR REPLACE VIEW GLB_V_PROF_MENU (ID, DESCR, DESCR_MENU, ORDERBY, ENV_FK, SELF_ID, ACTION_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS 
    SELECT  ID,
            DESCR,
            DESCR_MENU,
            ORDERBY,
            ENV_FK,
            SELF_ID,
            ACTION_FK,
            PROF_TYPE_FK,
            USER_FK,
            PROF_CODE,
            PROF_NAME,
            ORG_FK,
            STATUS,
            TARGET,
            env_fk_prof_type
    FROM  GLB_V_PROFILE_MENU
    WHERE  PROF_TYPE_FK <> 0 AND USER_FK = 0;

CREATE OR REPLACE VIEW GLB_MV_TRANSACTION (ID, CODE, DESCR, ENV_FK, STATUS) AS 
  select ID,CODE,DESCR,ENV_FK,STATUS from GLB_T_TRANSACTION;
  

CREATE OR REPLACE VIEW GLB_V_PROFILE_TRANS (ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS 
  SELECT   a.id,
         a.code,
         a.descr,
         a.env_fk,
         b.prof_type_fk,
         b.user_fk,
         b.prof_code,
         b.prof_name,
         b.org_fk
  FROM   glb_t_transaction a,
         glb_v_profile b
  WHERE   a.id = b.type_fk AND b.TYPE = 'TRANS';
  
CREATE OR REPLACE VIEW GLB_V_PROF_TRANS(ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS 
  SELECT ID,CODE,DESCR,ENV_FK,PROF_TYPE_FK,USER_FK,PROF_CODE,PROF_NAME,ORG_FK FROM GLB_V_PROFILE_TRANS WHERE PROF_TYPE_FK<>0 AND USER_FK=0;

CREATE OR REPLACE VIEW GLB_V_ORG_TRANS(ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS 
  SELECT ID,CODE,DESCR,ENV_FK,PROF_TYPE_FK,USER_FK,PROF_CODE,PROF_NAME,ORG_FK FROM GLB_V_PROFILE_TRANS WHERE PROF_TYPE_FK=0;
  
CREATE OR REPLACE VIEW GLB_V_USER_TRANS (ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS 
  SELECT ID,CODE,DESCR,ENV_FK,PROF_TYPE_FK,USER_FK,PROF_CODE,PROF_NAME,ORG_FK FROM GLB_V_PROFILE_TRANS WHERE USER_FK<>0;
 
  ----------------------------- END CREATE VIEWS --------------------------------
  
  

-- ------------------------------------------ Config demo app (App marcacao consulta) --------------------------------

INSERT INTO glb_t_env (ID, NAME, DAD,IMG_SRC, DESCRIPTION, ACTION_FK, FLG_OLD, LINK_MENU, LINK_CENTER, APACHE_DAD, TEMPLATES, HOST, FLG_EXTERNAL, STATUS)
    VALUES (2, 'Marcacao de Consulta', 'marcao_consulta', 'icon_saude.png', 'App para marcacao de consulta', 0, 0, '', '', '', '', '', 0, 1);

INSERT INTO glb_t_organization (ID, CODE, NAME, SIGOF_FK, ENV_FK, STATUS, USER_CREATE_FK, SELF_FK) 
    VALUES(2, 'org-m.consulta', 'Tec. Marcacao Consulta',NULL, 2, 1,1, NULL);


INSERT INTO glb_t_profile_type (ID, DESCR, CODE, ENV_FK, SELF_FK, ORG_FK, STATUS) 
    VALUES (2, 'Tec. Marcacao Consulta', 'Perf-m.consulta', 2,NULL, 2, 1);

INSERT INTO glb_t_action (ID,ENV_FK, PAGE, ACTION,  XSL_SRC,PAGE_DESCR,ACTION_DESCR) 
    VALUES
    (23, 2, 'ListaMedico', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/listamedico/ListaMedico.xsl','Lista de Medicos', 'Lista de Medicos'),
    (24, 2, 'RegistarMedico', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/registarmedico/RegistarMedico.xsl', 'Registar Medico', 'Registar Medico'),
    (25, 2, 'MarcarConsulta', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/marcarconsulta/MarcarConsulta.xsl','Marcar Consulta', 'Marcar Consulta'),
    (26, 2, 'RegistarUtente', 'index',  'images/IGRP/IGRP2.3/app/marcao_consulta/registarutente/RegistarUtente.xsl','Registar Utente', 'Registar Utente'),
    (27, 2, 'ListarUtente', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/listarutente/ListarUtente.xsl', 'Listar Utente', 'Listar Utente'),
    (28, 2, 'ConsultaPendente', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/consultapendente/ConsultaPendente.xsl', 'Consultas Pendentes', 'Consultas Pendentes'),
    (29, 2, 'DashBoard', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/dashboard/DashBoard.xsl', 'Dash Board', 'Dash Board');

    
INSERT INTO glb_t_action (ID,ENV_FK, PAGE, ACTION,  XSL_SRC) 
    VALUES
        (19,1, 'ErrorPage','index','images/IGRP/IGRP2.3/app/igrp/errorpage/ErrorPage.xsl'),
        (20,1, 'TransacaoOrganica','index','images/IGRP/IGRP2.3/app/igrp/transacaoorganica/TransacaoOrganica.xsl'),
        (21,1, 'EditarTransacao','index','images/IGRP/IGRP2.3/app/igrp/editartransacao/EditarTransacao.xsl'),
        (22,1, 'Session','index','images/IGRP/IGRP2.3/app/igrp/session/Session.xsl');
        
INSERT INTO glb_t_menu (ID, DESCR,ACTION_FK, SELF_ID, LINK, ENV_FK, IMG_SRC, AREA, ORDERBY, STATUS, CODE, FLG_BASE, TARGET) 
    VALUES
        (11, 'Auditoria', NULL, NULL,NULL, 1, NULL, NULL, NULL, 1, NULL, 1, '_self'),
        (12, 'Gestão de Sessão', 22, 11,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self');



INSERT INTO glb_t_menu (ID, DESCR,ACTION_FK, SELF_ID, LINK, ENV_FK, IMG_SRC, AREA, ORDERBY, STATUS, CODE, FLG_BASE, TARGET) 
    VALUES
    (13, 'Gestao de Utente',NULL,NULL,'',2, '','', 1, 1, '', 1, ''),
    (14, 'Gestao de Medico',NULL,NULL,'',2, '','', 1, 1, '', 1, ''),
    (15, 'Gestao de Consultas',NULL,NULL,'',2, '', '', 1, 1, '', 1, ''),
    (16, 'Registar Utente', 26,11, '', 2,'','', 0, 1, '', 0, '_self'),
    (17, 'Listar Utentes', 27, 11, '', 2,'','', 0, 1, '', 0, '_self'),
    (18, 'Registar Medico', 24,12, '', 2,'','', 0, 1, '', 0, '_self'),
    (19, 'Listar Medicos', 23, 12, '', 2,'','', 0, 1, '', 0, '_self'),
    (20, 'Marcar Consultas',25,13, '', 2,'','', 0, 1, '', 0, '_self'),
    (21, 'Consultas Pendentes',28,13, '', 2,'','', 0, 1, '', 0, '_self'),
    (22, 'Dash Board',29,13, '', 2,'','', 0, 1, '', 0, '_self');

INSERT INTO glb_t_profile_type (ID, DESCR, CODE, ENV_FK, SELF_FK, ORG_FK, STATUS) 
    VALUES (0, 'ALL PROFILE', 'ALL', NULL, NULL, NULL, 1);

    
    INSERT INTO glb_t_user (ID, NAME, EMAIL, PASS_HASH, USERPROFILE, VALID_UNTIL, REMARKS, ACTIVATION_KEY, USER_NAME, PHOTO_ID, SIGNATURE_ID, MOBILE, PHONE, PASSWORD_RESET_TOKEN, AUTH_KEY, STATUS, CREATED_AT, UPDATED_AT) 
    VALUES (0, 'IGRP', 'igrp@nosi.cv', 'admin', 'ADMIN', NULL, NULL, '123456789', 'admin', NULL, NULL, NULL, NULL, NULL, 'SRRKZ1a2n77nDcdLmXBJCt3HQWoRKozc', 1, 2017, 2017);

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
  
  
  
