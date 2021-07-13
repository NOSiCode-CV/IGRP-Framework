--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

-- Started on 2021-07-12 15:37:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3240 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 551595)
-- Name: glb_t_acl; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE glb_t_acl (
    id integer NOT NULL,
    processkey character varying(255),
    status integer NOT NULL,
    taskkey character varying(255),
    type character varying(255),
    type_fk integer NOT NULL,
    env_fk integer,
    env_owner_fk integer
);


--
-- TOC entry 197 (class 1259 OID 551601)
-- Name: glb_t_acl_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE glb_t_acl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3241 (class 0 OID 0)
-- Dependencies: 197
-- Name: glb_t_acl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE glb_t_acl_id_seq OWNED BY glb_t_acl.id;


--
-- TOC entry 198 (class 1259 OID 551603)
-- Name: tbl_action; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_action (
    id integer NOT NULL,
    action character varying(255) NOT NULL,
    action_descr character varying(255),
    iscomponent smallint NOT NULL,
    nomemodulo character varying(255),
    package_name character varying(255),
    page character varying(255) NOT NULL,
    page_descr character varying(255),
    processkey character varying(255),
    status integer NOT NULL,
    tipo smallint NOT NULL,
    versao character varying(255),
    xmlcontent character varying(255),
    xslcontent character varying(255),
    xsl_src character varying(255),
    env_fk integer NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 551609)
-- Name: tbl_action_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_action_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3242 (class 0 OID 0)
-- Dependencies: 199
-- Name: tbl_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_action_id_seq OWNED BY tbl_action.id;


--
-- TOC entry 200 (class 1259 OID 551611)
-- Name: tbl_activity_execute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_activity_execute (
    id integer NOT NULL,
    custom_permission text,
    execution_type character varying(400) NOT NULL,
    proccess_key character varying(200) NOT NULL,
    process_name character varying(250),
    processid character varying(255) NOT NULL,
    task_key character varying(200) NOT NULL,
    taskid character varying(255) NOT NULL,
    updatedatetime timestamp without time zone,
    env_fk integer NOT NULL,
    org_fk integer NOT NULL,
    prof_fk integer NOT NULL,
    user_fk integer
);


--
-- TOC entry 201 (class 1259 OID 551617)
-- Name: tbl_activity_execute_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_activity_execute_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3243 (class 0 OID 0)
-- Dependencies: 201
-- Name: tbl_activity_execute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_activity_execute_id_seq OWNED BY tbl_activity_execute.id;


--
-- TOC entry 202 (class 1259 OID 551619)
-- Name: tbl_clob; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_clob (
    id integer NOT NULL,
    c_lob_content bytea NOT NULL,
    createdatetime timestamp without time zone,
    dt_created date NOT NULL,
    dt_updated date,
    estado character varying(255),
    mime_type character varying(255),
    name character varying(255),
    updatedatetime timestamp without time zone,
    uuid character varying(255),
    env_fk integer,
    env_updated_fk integer,
    user_created_fk integer
);


--
-- TOC entry 203 (class 1259 OID 551625)
-- Name: tbl_clob_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_clob_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3244 (class 0 OID 0)
-- Dependencies: 203
-- Name: tbl_clob_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_clob_id_seq OWNED BY tbl_clob.id;


--
-- TOC entry 204 (class 1259 OID 551627)
-- Name: tbl_config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_config (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL
);


--
-- TOC entry 205 (class 1259 OID 551633)
-- Name: tbl_config_env; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_config_env (
    id integer NOT NULL,
    charset character varying(255),
    connection_identify character varying(255),
    driver_connection character varying(255) NOT NULL,
    host character varying(255),
    isdefault smallint NOT NULL,
    name character varying(255) NOT NULL,
    name_db character varying(255),
    password character varying(255) NOT NULL,
    port character varying(255),
    type_db character varying(255) NOT NULL,
    url_connection character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    env_fk integer NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 551639)
-- Name: tbl_config_env_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_config_env_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3245 (class 0 OID 0)
-- Dependencies: 206
-- Name: tbl_config_env_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_config_env_id_seq OWNED BY tbl_config_env.id;


--
-- TOC entry 207 (class 1259 OID 551641)
-- Name: tbl_config_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3246 (class 0 OID 0)
-- Dependencies: 207
-- Name: tbl_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_config_id_seq OWNED BY tbl_config.id;


--
-- TOC entry 208 (class 1259 OID 551643)
-- Name: tbl_domain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_domain (
    id integer NOT NULL,
    description character varying(250) NOT NULL,
    domain_type character varying(8),
    dominio character varying(100) NOT NULL,
    ordem integer NOT NULL,
    status character varying(8) NOT NULL,
    valor character varying(150) NOT NULL,
    env_fk integer
);


--
-- TOC entry 209 (class 1259 OID 551649)
-- Name: tbl_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_domain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3247 (class 0 OID 0)
-- Dependencies: 209
-- Name: tbl_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_domain_id_seq OWNED BY tbl_domain.id;


--
-- TOC entry 210 (class 1259 OID 551651)
-- Name: tbl_env; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_env (
    id integer NOT NULL,
    dad character varying(255) NOT NULL,
    description character varying(255),
    externo integer NOT NULL,
    img_src character varying(255),
    name character varying(255) NOT NULL,
    plsql_code character varying(255),
    status integer NOT NULL,
    template character varying(255),
    url character varying(255),
    action_fk integer
);


--
-- TOC entry 211 (class 1259 OID 551657)
-- Name: tbl_env_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_env_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3248 (class 0 OID 0)
-- Dependencies: 211
-- Name: tbl_env_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_env_id_seq OWNED BY tbl_env.id;


--
-- TOC entry 212 (class 1259 OID 551659)
-- Name: tbl_historic; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_historic (
    id integer NOT NULL,
    comentario character varying(255),
    data timestamp without time zone,
    descricao character varying(255) NOT NULL,
    idutilizador integer,
    nome character varying(255) NOT NULL,
    page_fk integer NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 551665)
-- Name: tbl_historic_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_historic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3249 (class 0 OID 0)
-- Dependencies: 213
-- Name: tbl_historic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_historic_id_seq OWNED BY tbl_historic.id;


--
-- TOC entry 214 (class 1259 OID 551667)
-- Name: tbl_importexport; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_importexport (
    id integer NOT NULL,
    aplicacao character varying(255),
    data character varying(255),
    tipo character varying(255),
    usuario character varying(255)
);


--
-- TOC entry 215 (class 1259 OID 551673)
-- Name: tbl_importexport_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_importexport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3250 (class 0 OID 0)
-- Dependencies: 215
-- Name: tbl_importexport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_importexport_id_seq OWNED BY tbl_importexport.id;


--
-- TOC entry 216 (class 1259 OID 551675)
-- Name: tbl_mapping; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_mapping (
    id integer NOT NULL,
    dad_destino character varying(255),
    dad_origem character varying(255),
    tipo integer NOT NULL,
    valor_destino character varying(255),
    valor_origem character varying(255)
);


--
-- TOC entry 217 (class 1259 OID 551681)
-- Name: tbl_mapping_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3251 (class 0 OID 0)
-- Dependencies: 217
-- Name: tbl_mapping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_mapping_id_seq OWNED BY tbl_mapping.id;


--
-- TOC entry 218 (class 1259 OID 551683)
-- Name: tbl_menu; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_menu (
    id integer NOT NULL,
    descr character varying(255) NOT NULL,
    flg_base integer NOT NULL,
    link character varying(2000),
    menu_icon character varying(255),
    orderby integer NOT NULL,
    status integer NOT NULL,
    target character varying(255),
    action_fk integer,
    env_fk integer NOT NULL,
    self_fk integer
);


--
-- TOC entry 219 (class 1259 OID 551689)
-- Name: tbl_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3252 (class 0 OID 0)
-- Dependencies: 219
-- Name: tbl_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_menu_id_seq OWNED BY tbl_menu.id;


--
-- TOC entry 220 (class 1259 OID 551691)
-- Name: tbl_modulo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_modulo (
    id integer NOT NULL,
    descricao character varying(255),
    name character varying(255) NOT NULL,
    env_fk integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 551697)
-- Name: tbl_modulo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_modulo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3253 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbl_modulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_modulo_id_seq OWNED BY tbl_modulo.id;


--
-- TOC entry 222 (class 1259 OID 551699)
-- Name: tbl_organization; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_organization (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    plsql_code character varying(255),
    status integer NOT NULL,
    env_fk integer NOT NULL,
    self_fk integer,
    user_created_fk integer
);


--
-- TOC entry 223 (class 1259 OID 551705)
-- Name: tbl_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_organization_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3254 (class 0 OID 0)
-- Dependencies: 223
-- Name: tbl_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_organization_id_seq OWNED BY tbl_organization.id;


--
-- TOC entry 224 (class 1259 OID 551707)
-- Name: tbl_profile; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_profile (
    id integer NOT NULL,
    type character varying(255) NOT NULL,
    type_fk integer NOT NULL,
    org_fk integer NOT NULL,
    prof_type_fk integer NOT NULL,
    user_fk integer
);


--
-- TOC entry 225 (class 1259 OID 551710)
-- Name: tbl_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3255 (class 0 OID 0)
-- Dependencies: 225
-- Name: tbl_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_profile_id_seq OWNED BY tbl_profile.id;


--
-- TOC entry 226 (class 1259 OID 551712)
-- Name: tbl_profile_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_profile_type (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    descr character varying(255) NOT NULL,
    plsql_code character varying(255),
    status integer NOT NULL,
    env_fk integer NOT NULL,
    firstpage integer,
    org_fk integer,
    self_fk integer
);


--
-- TOC entry 227 (class 1259 OID 551718)
-- Name: tbl_profile_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_profile_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3256 (class 0 OID 0)
-- Dependencies: 227
-- Name: tbl_profile_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_profile_type_id_seq OWNED BY tbl_profile_type.id;


--
-- TOC entry 228 (class 1259 OID 551720)
-- Name: tbl_rep_instance; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_rep_instance (
    id integer NOT NULL,
    contra_prova character varying(255) NOT NULL,
    dt_created date NOT NULL,
    ref_fk integer NOT NULL,
    reference character varying(255),
    updatedatetime timestamp without time zone,
    env_fk integer NOT NULL,
    rep_template_fk integer,
    user_fk integer,
    xml_content_fk integer NOT NULL,
    xsl_content_fk integer NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 551726)
-- Name: tbl_rep_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_rep_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3257 (class 0 OID 0)
-- Dependencies: 229
-- Name: tbl_rep_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_rep_instance_id_seq OWNED BY tbl_rep_instance.id;


--
-- TOC entry 230 (class 1259 OID 551728)
-- Name: tbl_rep_source; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_rep_source (
    id integer NOT NULL,
    dt_created date,
    dt_updated date,
    formkey character varying(100),
    name character varying(255),
    processid character varying(100),
    source_identify character varying(255),
    status integer NOT NULL,
    taskid character varying(100),
    type character varying(255) NOT NULL,
    type_fk integer,
    type_name character varying(255),
    type_query text,
    env_fk integer NOT NULL,
    env_source_fk integer,
    config_env_fk integer,
    user_created_fk integer NOT NULL,
    user_updated_fk integer NOT NULL
);


--
-- TOC entry 231 (class 1259 OID 551734)
-- Name: tbl_rep_source_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_rep_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3258 (class 0 OID 0)
-- Dependencies: 231
-- Name: tbl_rep_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_rep_source_id_seq OWNED BY tbl_rep_source.id;


--
-- TOC entry 232 (class 1259 OID 551736)
-- Name: tbl_rep_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_rep_template (
    id integer NOT NULL,
    code character varying(255),
    dt_created date,
    dt_updated date,
    name character varying(255) NOT NULL,
    report_identify character varying(255),
    status integer NOT NULL,
    env_fk integer NOT NULL,
    user_created_fk integer NOT NULL,
    user_updated_fk integer NOT NULL,
    xml_content_fk integer NOT NULL,
    xsl_content_fk integer NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 551742)
-- Name: tbl_rep_template_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_rep_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3259 (class 0 OID 0)
-- Dependencies: 233
-- Name: tbl_rep_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_rep_template_id_seq OWNED BY tbl_rep_template.id;


--
-- TOC entry 234 (class 1259 OID 551744)
-- Name: tbl_rep_template_param; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_rep_template_param (
    id integer NOT NULL,
    parameter character varying(255) NOT NULL,
    rep_template_fk integer NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 551747)
-- Name: tbl_rep_template_param_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_rep_template_param_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3260 (class 0 OID 0)
-- Dependencies: 235
-- Name: tbl_rep_template_param_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_rep_template_param_id_seq OWNED BY tbl_rep_template_param.id;


--
-- TOC entry 236 (class 1259 OID 551749)
-- Name: tbl_rep_template_source; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_rep_template_source (
    id integer NOT NULL,
    rep_source_fk integer NOT NULL,
    rep_template_fk integer NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 551752)
-- Name: tbl_rep_template_source_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_rep_template_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3261 (class 0 OID 0)
-- Dependencies: 237
-- Name: tbl_rep_template_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_rep_template_source_id_seq OWNED BY tbl_rep_template_source.id;


--
-- TOC entry 238 (class 1259 OID 551754)
-- Name: tbl_rep_template_source_param; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_rep_template_source_param (
    id integer NOT NULL,
    parameter character varying(70) NOT NULL,
    parameter_type character varying(50) NOT NULL,
    rep_template_source_fk integer NOT NULL
);


--
-- TOC entry 239 (class 1259 OID 551757)
-- Name: tbl_rep_template_source_param_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_rep_template_source_param_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3262 (class 0 OID 0)
-- Dependencies: 239
-- Name: tbl_rep_template_source_param_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_rep_template_source_param_id_seq OWNED BY tbl_rep_template_source_param.id;


--
-- TOC entry 240 (class 1259 OID 551759)
-- Name: tbl_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_session (
    id integer NOT NULL,
    endtime bigint,
    host character varying(255),
    hostname character varying(255),
    https integer NOT NULL,
    ipaddress character varying(255),
    mediatype character varying(255),
    sessionid character varying(255),
    sessionoldid character varying(255),
    starttime bigint,
    target character varying(255),
    url character varying(255),
    username character varying(255),
    env_fk integer NOT NULL,
    org_fk integer,
    prof_type_fk integer NOT NULL,
    user_fk integer
);


--
-- TOC entry 241 (class 1259 OID 551765)
-- Name: tbl_session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3263 (class 0 OID 0)
-- Dependencies: 241
-- Name: tbl_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_session_id_seq OWNED BY tbl_session.id;


--
-- TOC entry 242 (class 1259 OID 551767)
-- Name: tbl_task_access; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_task_access (
    id integer NOT NULL,
    processname character varying(150),
    taskdescription character varying(255),
    taskname character varying(100),
    user_fk integer,
    org_fk integer NOT NULL,
    prof_fk integer
);


--
-- TOC entry 243 (class 1259 OID 551773)
-- Name: tbl_task_access_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_task_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3264 (class 0 OID 0)
-- Dependencies: 243
-- Name: tbl_task_access_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_task_access_id_seq OWNED BY tbl_task_access.id;


--
-- TOC entry 244 (class 1259 OID 551775)
-- Name: tbl_task_component; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_task_component (
    id integer NOT NULL,
    codigo character varying(255) NOT NULL,
    ordem smallint NOT NULL,
    processid character varying(255) NOT NULL,
    taskid character varying(255) NOT NULL,
    title character varying(255),
    action_fk integer NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 551781)
-- Name: tbl_task_component_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_task_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3265 (class 0 OID 0)
-- Dependencies: 245
-- Name: tbl_task_component_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_task_component_id_seq OWNED BY tbl_task_component.id;


--
-- TOC entry 246 (class 1259 OID 551783)
-- Name: tbl_task_file; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_task_file (
    id integer NOT NULL,
    estado character varying(255),
    task_id character varying(20) NOT NULL,
    uuid character varying(255),
    clob_fk integer NOT NULL,
    tipo_documento_etapa_fk integer NOT NULL
);


--
-- TOC entry 247 (class 1259 OID 551789)
-- Name: tbl_task_file_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_task_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3266 (class 0 OID 0)
-- Dependencies: 247
-- Name: tbl_task_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_task_file_id_seq OWNED BY tbl_task_file.id;


--
-- TOC entry 248 (class 1259 OID 551791)
-- Name: tbl_task_unassigned; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_task_unassigned (
    id integer NOT NULL,
    noassumed boolean NOT NULL,
    processkey character varying(150) NOT NULL,
    taskid character varying(50) NOT NULL,
    taskkey character varying(150) NOT NULL,
    user_fk integer NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 551794)
-- Name: tbl_task_unassigned_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_task_unassigned_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3267 (class 0 OID 0)
-- Dependencies: 249
-- Name: tbl_task_unassigned_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_task_unassigned_id_seq OWNED BY tbl_task_unassigned.id;


--
-- TOC entry 250 (class 1259 OID 551796)
-- Name: tbl_temp_file; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_temp_file (
    uuid character varying(255) NOT NULL,
    content bytea NOT NULL,
    date_created date,
    mime_type character varying(255),
    name character varying(255),
    size bigint NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 551802)
-- Name: tbl_tipo_documento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_tipo_documento (
    id integer NOT NULL,
    codigo character varying(50),
    descricao character varying(500),
    nome character varying(100) NOT NULL,
    status integer NOT NULL,
    env_fk integer NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 551808)
-- Name: tbl_tipo_documento_etapa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_tipo_documento_etapa (
    id integer NOT NULL,
    processid character varying(100) NOT NULL,
    required integer NOT NULL,
    status integer NOT NULL,
    taskid character varying(100) NOT NULL,
    tipo character varying(4) NOT NULL,
    report_fk integer,
    tipo_documento_fk integer
);


--
-- TOC entry 253 (class 1259 OID 551811)
-- Name: tbl_tipo_documento_etapa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_tipo_documento_etapa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3268 (class 0 OID 0)
-- Dependencies: 253
-- Name: tbl_tipo_documento_etapa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_tipo_documento_etapa_id_seq OWNED BY tbl_tipo_documento_etapa.id;


--
-- TOC entry 254 (class 1259 OID 551813)
-- Name: tbl_tipo_documento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_tipo_documento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3269 (class 0 OID 0)
-- Dependencies: 254
-- Name: tbl_tipo_documento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_tipo_documento_id_seq OWNED BY tbl_tipo_documento.id;


--
-- TOC entry 255 (class 1259 OID 551815)
-- Name: tbl_transaction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_transaction (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    descr character varying(255) NOT NULL,
    external integer,
    status integer NOT NULL,
    env_fk integer NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 551821)
-- Name: tbl_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3270 (class 0 OID 0)
-- Dependencies: 256
-- Name: tbl_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_transaction_id_seq OWNED BY tbl_transaction.id;


--
-- TOC entry 257 (class 1259 OID 551823)
-- Name: tbl_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tbl_user (
    id integer NOT NULL,
    activation_key character varying(255) NOT NULL,
    auth_key character varying(255),
    created_at bigint NOT NULL,
    email character varying(255),
    is_authenticated integer,
    mobile character varying(255),
    name character varying(255),
    oidc_id_token text,
    oidc_state character varying(255),
    pass_hash character varying(255),
    password_reset_token character varying(255),
    phone character varying(255),
    photo_id character varying(255),
    refresh_token character varying(255),
    remarks character varying(255),
    signature_id character varying(255),
    status integer NOT NULL,
    updated_at bigint NOT NULL,
    userprofile character varying(255),
    user_name character varying(255),
    valid_until character varying(255)
);


--
-- TOC entry 258 (class 1259 OID 551829)
-- Name: tbl_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tbl_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3271 (class 0 OID 0)
-- Dependencies: 258
-- Name: tbl_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tbl_user_id_seq OWNED BY tbl_user.id;


--
-- TOC entry 2880 (class 2604 OID 551831)
-- Name: glb_t_acl id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY glb_t_acl ALTER COLUMN id SET DEFAULT nextval('glb_t_acl_id_seq'::regclass);


--
-- TOC entry 2881 (class 2604 OID 551832)
-- Name: tbl_action id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_action ALTER COLUMN id SET DEFAULT nextval('tbl_action_id_seq'::regclass);


--
-- TOC entry 2882 (class 2604 OID 551833)
-- Name: tbl_activity_execute id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_activity_execute ALTER COLUMN id SET DEFAULT nextval('tbl_activity_execute_id_seq'::regclass);


--
-- TOC entry 2883 (class 2604 OID 551834)
-- Name: tbl_clob id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_clob ALTER COLUMN id SET DEFAULT nextval('tbl_clob_id_seq'::regclass);


--
-- TOC entry 2884 (class 2604 OID 551835)
-- Name: tbl_config id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_config ALTER COLUMN id SET DEFAULT nextval('tbl_config_id_seq'::regclass);


--
-- TOC entry 2885 (class 2604 OID 551836)
-- Name: tbl_config_env id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_config_env ALTER COLUMN id SET DEFAULT nextval('tbl_config_env_id_seq'::regclass);


--
-- TOC entry 2886 (class 2604 OID 551837)
-- Name: tbl_domain id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_domain ALTER COLUMN id SET DEFAULT nextval('tbl_domain_id_seq'::regclass);


--
-- TOC entry 2887 (class 2604 OID 551838)
-- Name: tbl_env id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_env ALTER COLUMN id SET DEFAULT nextval('tbl_env_id_seq'::regclass);


--
-- TOC entry 2888 (class 2604 OID 551839)
-- Name: tbl_historic id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_historic ALTER COLUMN id SET DEFAULT nextval('tbl_historic_id_seq'::regclass);


--
-- TOC entry 2889 (class 2604 OID 551840)
-- Name: tbl_importexport id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_importexport ALTER COLUMN id SET DEFAULT nextval('tbl_importexport_id_seq'::regclass);


--
-- TOC entry 2890 (class 2604 OID 551841)
-- Name: tbl_mapping id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_mapping ALTER COLUMN id SET DEFAULT nextval('tbl_mapping_id_seq'::regclass);


--
-- TOC entry 2891 (class 2604 OID 551842)
-- Name: tbl_menu id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_menu ALTER COLUMN id SET DEFAULT nextval('tbl_menu_id_seq'::regclass);


--
-- TOC entry 2892 (class 2604 OID 551843)
-- Name: tbl_modulo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_modulo ALTER COLUMN id SET DEFAULT nextval('tbl_modulo_id_seq'::regclass);


--
-- TOC entry 2893 (class 2604 OID 551844)
-- Name: tbl_organization id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_organization ALTER COLUMN id SET DEFAULT nextval('tbl_organization_id_seq'::regclass);


--
-- TOC entry 2894 (class 2604 OID 551845)
-- Name: tbl_profile id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile ALTER COLUMN id SET DEFAULT nextval('tbl_profile_id_seq'::regclass);


--
-- TOC entry 2895 (class 2604 OID 551846)
-- Name: tbl_profile_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile_type ALTER COLUMN id SET DEFAULT nextval('tbl_profile_type_id_seq'::regclass);


--
-- TOC entry 2896 (class 2604 OID 551847)
-- Name: tbl_rep_instance id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_instance ALTER COLUMN id SET DEFAULT nextval('tbl_rep_instance_id_seq'::regclass);


--
-- TOC entry 2897 (class 2604 OID 551848)
-- Name: tbl_rep_source id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_source ALTER COLUMN id SET DEFAULT nextval('tbl_rep_source_id_seq'::regclass);


--
-- TOC entry 2898 (class 2604 OID 551849)
-- Name: tbl_rep_template id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template ALTER COLUMN id SET DEFAULT nextval('tbl_rep_template_id_seq'::regclass);


--
-- TOC entry 2899 (class 2604 OID 551850)
-- Name: tbl_rep_template_param id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_param ALTER COLUMN id SET DEFAULT nextval('tbl_rep_template_param_id_seq'::regclass);


--
-- TOC entry 2900 (class 2604 OID 551851)
-- Name: tbl_rep_template_source id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_source ALTER COLUMN id SET DEFAULT nextval('tbl_rep_template_source_id_seq'::regclass);


--
-- TOC entry 2901 (class 2604 OID 551852)
-- Name: tbl_rep_template_source_param id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_source_param ALTER COLUMN id SET DEFAULT nextval('tbl_rep_template_source_param_id_seq'::regclass);


--
-- TOC entry 2902 (class 2604 OID 551853)
-- Name: tbl_session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_session ALTER COLUMN id SET DEFAULT nextval('tbl_session_id_seq'::regclass);


--
-- TOC entry 2903 (class 2604 OID 551854)
-- Name: tbl_task_access id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_access ALTER COLUMN id SET DEFAULT nextval('tbl_task_access_id_seq'::regclass);


--
-- TOC entry 2904 (class 2604 OID 551855)
-- Name: tbl_task_component id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_component ALTER COLUMN id SET DEFAULT nextval('tbl_task_component_id_seq'::regclass);


--
-- TOC entry 2905 (class 2604 OID 551856)
-- Name: tbl_task_file id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_file ALTER COLUMN id SET DEFAULT nextval('tbl_task_file_id_seq'::regclass);


--
-- TOC entry 2906 (class 2604 OID 551857)
-- Name: tbl_task_unassigned id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_unassigned ALTER COLUMN id SET DEFAULT nextval('tbl_task_unassigned_id_seq'::regclass);


--
-- TOC entry 2907 (class 2604 OID 551858)
-- Name: tbl_tipo_documento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_tipo_documento ALTER COLUMN id SET DEFAULT nextval('tbl_tipo_documento_id_seq'::regclass);


--
-- TOC entry 2908 (class 2604 OID 551859)
-- Name: tbl_tipo_documento_etapa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_tipo_documento_etapa ALTER COLUMN id SET DEFAULT nextval('tbl_tipo_documento_etapa_id_seq'::regclass);


--
-- TOC entry 2909 (class 2604 OID 551860)
-- Name: tbl_transaction id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_transaction ALTER COLUMN id SET DEFAULT nextval('tbl_transaction_id_seq'::regclass);


--
-- TOC entry 2910 (class 2604 OID 551861)
-- Name: tbl_user id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_user ALTER COLUMN id SET DEFAULT nextval('tbl_user_id_seq'::regclass);


--
-- TOC entry 3171 (class 0 OID 551595)
-- Dependencies: 196
-- Data for Name: glb_t_acl; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3173 (class 0 OID 551603)
-- Dependencies: 198
-- Data for Name: tbl_action; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tbl_action VALUES (1, 'index', 'Page builder', 0, NULL, 'nosi.webapps.igrp_studio.pages.listapage', 'ListaPage', 'Page builder', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/listapage/ListaPage.xsl', 3);
INSERT INTO tbl_action VALUES (2, 'index', 'Registar Aplicacao', 0, NULL, 'nosi.webapps.igrp_studio.pages.env', 'Env', 'Registar Aplicacao', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/env/Env.xsl', 3);
INSERT INTO tbl_action VALUES (3, 'index', 'Application builder', 0, NULL, 'nosi.webapps.igrp_studio.pages.listaenv', 'ListaEnv', 'Application builder', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/listaenv/ListaEnv.xsl', 3);
INSERT INTO tbl_action VALUES (4, 'index', 'Gestão de Domínios', 0, NULL, 'nosi.webapps.igrp.pages.dominio', 'Dominio', 'Gestão de Domínios', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/dominio/Dominio.xsl', 1);
INSERT INTO tbl_action VALUES (5, 'index', 'Registar Dominio', 0, NULL, 'nosi.webapps.igrp.pages.novodominio', 'NovoDominio', 'Registar Dominio', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novodominio/NovoDominio.xsl', 1);
INSERT INTO tbl_action VALUES (6, 'index', 'Gestão de Organica', 0, NULL, 'nosi.webapps.igrp.pages.pesquisarorganica', 'PesquisarOrganica', 'Gestão de Organica', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisarorganica/PesquisarOrganica.xsl', 1);
INSERT INTO tbl_action VALUES (7, 'index', 'Registar Organica', 0, NULL, 'nosi.webapps.igrp.pages.novaorganica', 'NovaOrganica', 'Registar Organica', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novaorganica/NovaOrganica.xsl', 1);
INSERT INTO tbl_action VALUES (8, 'index', 'Registar Menu', 0, NULL, 'nosi.webapps.igrp.pages.novomenu', 'NovoMenu', 'Registar Menu', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novomenu/NovoMenu.xsl', 1);
INSERT INTO tbl_action VALUES (9, 'index', 'Gestão de Menu', 0, NULL, 'nosi.webapps.igrp.pages.pesquisarmenu', 'PesquisarMenu', 'Gestão de Menu', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisarmenu/PesquisarMenu.xsl', 1);
INSERT INTO tbl_action VALUES (10, 'index', 'Registar Perfil', 0, NULL, 'nosi.webapps.igrp.pages.novoperfil', 'NovoPerfil', 'Registar Perfil', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novoperfil/NovoPerfil.xsl', 1);
INSERT INTO tbl_action VALUES (11, 'index', 'Gestão de Perfil', 0, NULL, 'nosi.webapps.igrp.pages.pesquisarperfil', 'PesquisarPerfil', 'Gestão de Perfil', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisarperfil/PesquisarPerfil.xsl', 1);
INSERT INTO tbl_action VALUES (12, 'index', 'Gestão de Utilizador', 0, NULL, 'nosi.webapps.igrp.pages.pesquisarutilizador', 'PesquisarUtilizador', 'Gestão de Utilizador', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisarutilizador/PesquisarUtilizador.xsl', 1);
INSERT INTO tbl_action VALUES (13, 'index', 'Convidar Utilizador', 0, NULL, 'nosi.webapps.igrp.pages.novoutilizador', 'NovoUtilizador', 'Convidar Utilizador', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novoutilizador/NovoUtilizador.xsl', 1);
INSERT INTO tbl_action VALUES (14, 'index', 'Área pessoal', 0, NULL, 'nosi.webapps.igrp.pages.settings', 'Settings', 'Área pessoal', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/settings/Settings.xsl', 1);
INSERT INTO tbl_action VALUES (15, 'index', 'Registar Utilizador', 0, NULL, 'nosi.webapps.igrp.pages.registarutilizador', 'RegistarUtilizador', 'Registar Utilizador', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/registarutilizador/RegistarUtilizador.xsl', 1);
INSERT INTO tbl_action VALUES (16, 'index', 'Transaccao', 0, NULL, 'nosi.webapps.igrp.pages.transaccao', 'Transaccao', 'Transaccao', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/transaccao/Transaccao.xsl', 1);
INSERT INTO tbl_action VALUES (17, 'index', 'Registar Pagina', 0, NULL, 'nosi.webapps.igrp.pages.page', 'Page', 'Registar Pagina', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/page/Page.xsl', 1);
INSERT INTO tbl_action VALUES (18, 'index', 'Associar Menu a Organica', 0, NULL, 'nosi.webapps.igrp.pages.menuorganica', 'MenuOrganica', 'Associar Menu a Organica', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/menuorganica/MenuOrganica.xsl', 1);
INSERT INTO tbl_action VALUES (19, 'index', 'Pagina de Erro', 0, NULL, 'nosi.webapps.igrp.pages.errorpage', 'ErrorPage', 'Pagina de Erro', NULL, 1, 1, '2.3', NULL, NULL, 'igrp/errorpage/ErrorPage.xsl', 1);
INSERT INTO tbl_action VALUES (20, 'index', 'Associar Transacao a Organica', 0, NULL, 'nosi.webapps.igrp.pages.transacaoorganica', 'TransacaoOrganica', 'Associar Transacao a Organica', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/transacaoorganica/TransacaoOrganica.xsl', 1);
INSERT INTO tbl_action VALUES (21, 'index', 'Editar Transacao', 0, NULL, 'nosi.webapps.igrp.pages.editartransacao', 'EditarTransacao', 'Editar Transacao', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/editartransacao/EditarTransacao.xsl', 1);
INSERT INTO tbl_action VALUES (22, 'index', 'Gestao de Sessao', 0, NULL, 'nosi.webapps.igrp.pages.session', 'Session', 'Gestao de Sessao', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/session/Session.xsl', 1);
INSERT INTO tbl_action VALUES (23, 'index', 'Report Builder', 0, NULL, 'nosi.webapps.igrp_studio.pages.webreport', 'WebReport', 'Report Builder', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/webreport/WebReport.xsl', 3);
INSERT INTO tbl_action VALUES (24, 'index', 'Registar Data Source', 0, NULL, 'nosi.webapps.igrp.pages.datasource', 'DataSource', 'Registar Data Source', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/datasource/DataSource.xsl', 1);
INSERT INTO tbl_action VALUES (25, 'index', 'Lista de Pagina Para Lookup', 0, NULL, 'nosi.webapps.igrp.pages.lookuplistpage', 'LookupListPage', 'Lista de Pagina Para Lookup', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/lookuplistpage/LookupListPage.xsl', 1);
INSERT INTO tbl_action VALUES (26, 'index', 'Migrate IGRP', 0, NULL, 'nosi.webapps.igrp.pages.migrate', 'Migrate', 'Migrate IGRP', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/migrate/Migrate.xsl', 1);
INSERT INTO tbl_action VALUES (27, 'index', 'Lista de credenciais OAuth', 0, NULL, 'nosi.webapps.igrp.pages.oauthclientlist', 'OAuthClientList', 'Lista de credenciais OAuth', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/oauthclientlist/OAuthClientList.xsl', 1);
INSERT INTO tbl_action VALUES (28, 'index', 'Registar cliente OAuth', 0, NULL, 'nosi.webapps.igrp.pages.oauthclient', 'OAuthClient', 'Registar cliente OAuth', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/oauthclient/OAuthClient.xsl', 1);
INSERT INTO tbl_action VALUES (29, 'index', 'Mapa Processo', 0, NULL, 'nosi.webapps.igrp.pages.mapaprocesso', 'MapaProcesso', 'Mapa Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/mapaprocesso/MapaProcesso.xsl', 1);
INSERT INTO tbl_action VALUES (30, 'index', 'Execucao Tarefas', 0, NULL, 'nosi.webapps.igrp.pages.execucaotarefas', 'ExecucaoTarefas', 'Execucao Tarefas', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/execucaotarefas/ExecucaoTarefas.xsl', 1);
INSERT INTO tbl_action VALUES (31, 'index', 'Lookup Lista Utilizador', 0, NULL, 'nosi.webapps.igrp.pages.lookuplistuser', 'LookupListUser', 'Lookup Lista Utilizador', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/lookuplistuser/LookupListUser.xsl', 1);
INSERT INTO tbl_action VALUES (32, 'index', 'Alter prioridade tarefa', 0, NULL, 'nosi.webapps.igrp.pages.alter_prioridade_tarefa', 'Alter_prioridade_tarefa', 'Alter prioridade tarefa', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/alter_prioridade_tarefa/Alter_prioridade_tarefa.xsl', 1);
INSERT INTO tbl_action VALUES (33, 'index', 'Transferir tarefas', 0, NULL, 'nosi.webapps.igrp.pages.transferir_tarefas', 'Transferir_tarefas', 'Transferir tarefas', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/transferir_tarefas/Transferir_tarefas.xsl', 1);
INSERT INTO tbl_action VALUES (34, 'index', 'BPMN Designer', 0, NULL, 'nosi.webapps.igrp_studio.pages.bpmndesigner', 'BPMNDesigner', 'BPMN Designer', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/bpmndesigner/BPMNDesigner.xsl', 3);
INSERT INTO tbl_action VALUES (35, 'index', 'Import export', 0, NULL, 'nosi.webapps.igrp.pages.import_export', 'Import_export', 'Import export', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/import_export/Import_export.xsl', 1);
INSERT INTO tbl_action VALUES (36, 'index', 'Import Arquivo', 0, NULL, 'nosi.webapps.igrp_studio.pages.importarquivo', 'ImportArquivo', 'Import Arquivo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/importarquivo/ImportArquivo.xsl', 3);
INSERT INTO tbl_action VALUES (37, 'index', 'Configurar Base de Dados de uma aplicação', 0, NULL, 'nosi.webapps.igrp.pages.configdatabase', 'ConfigDatabase', 'Configurar Base de Dados', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/configdatabase/ConfigDatabase.xsl', 1);
INSERT INTO tbl_action VALUES (38, 'index', 'Pesquisar BI', 0, NULL, 'nosi.webapps.igrp.pages.pesquisabi', 'PesquisaBI', 'Pesquisar BI', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisabi/PesquisaBI.xsl', 1);
INSERT INTO tbl_action VALUES (39, 'index', 'Pesquisar NIF', 0, NULL, 'nosi.webapps.igrp.pages.pesquisanif', 'PesquisaNIF', 'Pesquisar NIF', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisanif/PesquisaNIF.xsl', 1);
INSERT INTO tbl_action VALUES (40, 'index', 'Pesquisar Nascimento', 0, NULL, 'nosi.webapps.igrp.pages.pesquisanascimento', 'PesquisaNascimento', 'Pesquisar Nascimento', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisanascimento/PesquisaNascimento.xsl', 1);
INSERT INTO tbl_action VALUES (41, 'index', 'Gestao de Acesso', 0, NULL, 'nosi.webapps.igrp.pages.gestaodeacesso', 'Gestaodeacesso', 'Gestao de Acesso', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/gestaodeacesso/Gestaodeacesso.xsl', 1);
INSERT INTO tbl_action VALUES (42, 'index', 'O que fazer dentro do IGRP JAVA...', 0, NULL, 'nosi.webapps.tutorial.pages.geralapresentacao', 'GeralApresentacao', 'O que fazer dentro do IGRP JAVA...', NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/geralapresentacao/GeralApresentacao.xsl', 2);
INSERT INTO tbl_action VALUES (43, 'index', 'HomeStudio', 0, NULL, 'nosi.webapps.igrp_studio.pages.homestudio', 'HomeStudio', 'HomeStudio', NULL, 0, 0, '2.3', NULL, NULL, 'igrp_studio/homestudio/HomeStudio.xsl', 3);
INSERT INTO tbl_action VALUES (44, 'index', 'CRUD Generator', 0, NULL, 'nosi.webapps.igrp_studio.pages.crudgenerator', 'CRUDGenerator', 'CRUDGenerator', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/crudgenerator/CRUDGenerator.xsl', 3);
INSERT INTO tbl_action VALUES (45, 'index', 'LdapUser', 0, NULL, 'nosi.webapps.igrp.pages.ldapuser', 'LdapUser', 'LdapUser', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/ldapuser/LdapUser.xsl', 1);
INSERT INTO tbl_action VALUES (46, 'index', 'ChangePassword', 0, NULL, 'nosi.webapps.igrp.pages.changepassword', 'ChangePassword', 'ChangePassword', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/changepassword/ChangePassword.xsl', 1);
INSERT INTO tbl_action VALUES (47, 'index', 'Consulta Processo', 0, NULL, 'nosi.webapps.igrp.pages._cons_proc', '_CONS_PROC', 'Consulta Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/_cons_proc/_CONS_PROC.xsl', 1);
INSERT INTO tbl_action VALUES (48, 'index', 'Detalhes Processo', 0, NULL, 'nosi.webapps.igrp.pages.detalhesprocesso', 'DetalhesProcesso', 'Detalhes Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/detalhesprocesso/DetalhesProcesso.xsl', 1);
INSERT INTO tbl_action VALUES (49, 'index', 'Partilha Inter-Aplicações', 0, NULL, 'nosi.webapps.igrp_studio.pages.partilhageral', 'Partilhageral', 'Partilha Inter-Aplicações', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/partilhageral/Partilhageral.xsl', 3);
INSERT INTO tbl_action VALUES (50, 'index', 'Módulo', 0, NULL, 'nosi.webapps.igrp_studio.pages.modulo', 'Modulo', 'Módulo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/modulo/Modulo.xsl', 3);
INSERT INTO tbl_action VALUES (51, 'index', 'Lookup list organica', 0, NULL, 'nosi.webapps.igrp.pages', 'Lookup_list_organica', 'Lookup list organica', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/lookup_list_organica/Lookup_list_organica.xsl', 1);
INSERT INTO tbl_action VALUES (52, 'index', 'SQL Tool', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Sql_tools', 'SQL Tool', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/sql_tools/Sql_tools.xsl', 3);
INSERT INTO tbl_action VALUES (53, 'index', 'File', 0, NULL, 'nosi.webapps.igrp.pages', 'File', 'File', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/file/File.xsl', 1);
INSERT INTO tbl_action VALUES (54, 'index', 'EtapaAccess', 0, NULL, 'nosi.webapps.igrp.pages', 'Etapaaccess', 'EtapaAccess', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/etapaaccess/Etapaaccess.xsl', 1);
INSERT INTO tbl_action VALUES (55, 'index', 'AddFileTask', 0, NULL, 'nosi.webapps.igrp.pages', 'Addfiletask', 'AddFileTask', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/addfiletask/Addfiletask.xsl', 1);
INSERT INTO tbl_action VALUES (56, 'index', 'video gestão de aplicação', 0, NULL, 'nosi.webapps.tutorial.pages.video_gestao_de_aplicacao', 'Video_gestao_de_aplicacao', 'video gestão de aplicação', NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/video_gestao_de_aplicacao/Video_gestao_de_aplicacao.xsl', 2);
INSERT INTO tbl_action VALUES (57, 'index', 'video instalar igrp web', 0, NULL, 'nosi.webapps.tutorial.pages.video_instalar_igrp_web', 'Video_instalar_igrp_web', 'video instalar igrp web', NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/video_instalar_igrp_web/Video_instalar_igrp_web.xsl', 2);
INSERT INTO tbl_action VALUES (58, 'index', 'video my first app', 0, NULL, 'nosi.webapps.tutorial.pages.video_my_first_app', 'Video_my_first_app', 'video my first app', NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/video_my_first_app/Video_my_first_app.xsl', 2);
INSERT INTO tbl_action VALUES (59, 'index', 'File Editor', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'File_editor', 'File Editor', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/file_editor/File_editor.xsl', 3);
INSERT INTO tbl_action VALUES (60, 'index', 'Gestao Tipo Documento', 0, NULL, 'nosi.webapps.igrp.pages', 'Gestao_tipo_documento', 'Gestao Tipo Documento', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/gestao_tipo_documento/Gestao_tipo_documento.xsl', 1);
INSERT INTO tbl_action VALUES (61, 'index', 'Start Process', 0, NULL, 'nosi.webapps.igrp.pages', 'Startprocess', 'Start Process', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/startprocess/Startprocess.xsl', 1);
INSERT INTO tbl_action VALUES (62, 'index', 'Default Page', 0, NULL, 'nosi.webapps.tutorial.pages', 'DefaultPage', 'Default Page', NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/defaultpage/DefaultPage.xsl', 2);
INSERT INTO tbl_action VALUES (63, 'index', 'Dash Board Processo', 0, NULL, 'nosi.webapps.igrp.pages', 'Dash_board_processo', 'Dash Board Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/dash_board_processo/Dash_board_processo.xsl', 1);
INSERT INTO tbl_action VALUES (64, 'index', 'Lista Tarefa de Processo', 0, NULL, 'nosi.webapps.igrp.pages', 'Lista_terfa_de_processo', 'Lista Tarefa de Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/lista_terfa_de_processo/Lista_terfa_de_processo.xsl', 1);
INSERT INTO tbl_action VALUES (65, 'index', 'Export Wizard Step 1', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Wizard_export_step_1', 'Export Wizard Step 1', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/wizard_export_step_1/Wizard_export_step_1.xsl', 3);
INSERT INTO tbl_action VALUES (66, 'index', 'Export Wizard Step 2', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Wizard_export_step_2', 'Export Wizard Step 2', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/wizard_export_step_2/Wizard_export_step_2.xsl', 3);
INSERT INTO tbl_action VALUES (67, 'index', 'Reset by email', 0, NULL, 'nosi.webapps.igrp.pages', 'Resetbyemail', 'Reset by email', NULL, 1, 1, '2.3', NULL, NULL, 'igrp/resetbyemail/Resetbyemail.xsl', 1);
INSERT INTO tbl_action VALUES (68, 'index', 'Reset password', 0, NULL, 'nosi.webapps.igrp.pages', 'Resetpassword', 'Reset password', NULL, 1, 1, '2.3', NULL, NULL, 'igrp/resetpassword/Resetpassword.xsl', 1);
INSERT INTO tbl_action VALUES (69, 'index', 'Oauth2openidwso2', 0, NULL, 'nosi.webapps.igrp.pages', 'Oauth2openidwso2', 'Oauth2openidwso2', NULL, 1, 1, '2.3', NULL, NULL, 'igrp/oauth2openidwso2/Oauth2openidwso2.xsl', 1);
INSERT INTO tbl_action VALUES (70, 'index', 'Pesquisa BI-CNI-passport', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_bi_cni_passport', 'Pesquisa BI-CNI-passport', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/pesquisa_bi_cni_passport/Pesquisa_bi_cni_passport.xsl', 3);
INSERT INTO tbl_action VALUES (71, 'index', 'Pesquisa NIF', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_nif_rest', 'Pesquisa NIF', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/pesquisa_nif_rest/Pesquisa_nif_rest.xsl', 3);
INSERT INTO tbl_action VALUES (72, 'index', 'Pesquisa Geografia', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_geografia', 'Pesquisa Geografia', NULL, 1, 1, '2.3', NULL, NULL, 'igrp_studio/pesquisa_geografia/Pesquisa_geografia.xsl', 3);
INSERT INTO tbl_action VALUES (73, 'index', 'Pesquisa nacionalidade', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_nacionalidade', 'Pesquisa nacionalidade', NULL, 1, 1, '2.3', NULL, NULL, 'igrp_studio/pesquisa_nacionalidade/Pesquisa_nacionalidade.xsl', 3);
INSERT INTO tbl_action VALUES (74, 'index', 'WSDL2java', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Wsdl2java', 'WSDL2java', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/wsdl2java/Wsdl2java.xsl', 3);
INSERT INTO tbl_action VALUES (75, 'index', 'Pesquisa Empresa', 0, NULL, 'nosi.webapps.igrp.pages', 'Pesquisa_empresa', 'Pesquisa Empresa', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisa_empresa/Pesquisa_empresa.xsl', 1);
INSERT INTO tbl_action VALUES (76, 'index', 'DAOGenerator', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Daogenerator', 'DAOGenerator', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/daogenerator/Daogenerator.xsl', 3);
INSERT INTO tbl_action VALUES (77, 'index', 'Detalhes dashboard processo', 0, NULL, 'nosi.webapps.igrp.pages', 'Detalhes_dashboard_processo', 'Detalhes dashboard processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/detalhes_dashboard_processo/Detalhes_dashboard_processo.xsl', 1);
INSERT INTO tbl_action VALUES (78, 'index', 'Historico_page', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Historico_page', 'Historico page', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/historico_page/Historico_page.xsl', 3);
INSERT INTO tbl_action VALUES (79, 'index', 'Icons_list', 0, NULL, 'nosi.webapps.igrp.pages', 'Icons_list', 'Icons_list', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/icons_list/Icons_list.xsl', 1);
INSERT INTO tbl_action VALUES (80, 'index', 'Migration File Generator', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Migration', 'Migration File Generator', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/migration/Migration.xsl', 3);
INSERT INTO tbl_action VALUES (81, 'index', 'Get coordinates', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Get_coordinates', 'Get coordinates', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/get_coordinates/Get_coordinates.xsl', 3);
INSERT INTO tbl_action VALUES (82, 'index', 'Config error msg', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Config_error_msg', 'Config error msg', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/config_error_msg/Config_error_msg.xsl', 3);
--
-- TOC entry 3175 (class 0 OID 551611)
-- Dependencies: 200
-- Data for Name: tbl_activity_execute; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3177 (class 0 OID 551619)
-- Dependencies: 202
-- Data for Name: tbl_clob; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3179 (class 0 OID 551627)
-- Dependencies: 204
-- Data for Name: tbl_config; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tbl_config VALUES (1, 'url_ativiti_connection', 'http://localhost:8080/activiti-rest/service/');
INSERT INTO tbl_config VALUES (2, 'ativiti_user', 'kermit');
INSERT INTO tbl_config VALUES (3, 'ativiti_password', 'kermit');
INSERT INTO tbl_config VALUES (4, 'igrp_images', 'IGRP');
INSERT INTO tbl_config VALUES (5, 'CLIENT_ID_BIZTALK', 'your id');
INSERT INTO tbl_config VALUES (6, 'TRANSACTION_ID_BIZTALK_PESQUISA_NIF', 'your id');
INSERT INTO tbl_config VALUES (7, 'SERVICE_ID_BIZTALK_PESQUISA_NIF', 'your id');
INSERT INTO tbl_config VALUES (8, 'TRANSACTION_ID_BIZTALK_PESQUISA_GEOGRAFIA', 'your id');
INSERT INTO tbl_config VALUES (9, 'SERVICE_ID_BIZTALK_PESQUISA_GEOGRAFIA', 'your id');
INSERT INTO tbl_config VALUES (10, 'TRANSACTION_ID_BIZTALK_PESQUISA_HIERARQUICA_CAE', 'your id');
INSERT INTO tbl_config VALUES (11, 'SERVICE_ID_BIZTALK_PESQUISA_HIERARQUICA_CAE', 'your id');
INSERT INTO tbl_config VALUES (12, 'TRANSACTION_ID_BIZTALK_PESQUISA_NASCIMENTO', 'your id');
INSERT INTO tbl_config VALUES (13, 'SERVICE_ID_BIZTALK_PESQUISA_NASCIMENTO', 'your id');
INSERT INTO tbl_config VALUES (14, 'TRANSACTION_ID_BIZTALK_PESQUISA_SNIAC', 'your id');
INSERT INTO tbl_config VALUES (15, 'SERVICE_ID_BIZTALK_PESQUISA_SNIAC', 'your id');
INSERT INTO tbl_config VALUES (16, 'TRANSACTION_ID_BIZTALK_PESQUISA_BI', 'your id');
INSERT INTO tbl_config VALUES (17, 'SERVICE_ID_BIZTALK_PESQUISA_BI', 'your id');


--
-- TOC entry 3180 (class 0 OID 551633)
-- Dependencies: 205
-- Data for Name: tbl_config_env; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3183 (class 0 OID 551643)
-- Dependencies: 208
-- Data for Name: tbl_domain; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3185 (class 0 OID 551651)
-- Dependencies: 210
-- Data for Name: tbl_env; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tbl_env VALUES (1, 'igrp', 'Integrated Government Resource Planning', 0, 'igrp.svg', 'IGRP', NULL, 1, NULL, NULL, NULL);
INSERT INTO tbl_env VALUES (2, 'tutorial', 'IGRPweb TODO', 0, 'icon_educacao.png', 'Tutorial IGRP', NULL, 1, NULL, NULL, 42);
INSERT INTO tbl_env VALUES (3, 'igrp_studio', '<code/> {Developers}', 0, 'studioSoLogo.svg', 'IGRP Studio', NULL, 1, 'igrp_studio', NULL, 1);


--
-- TOC entry 3187 (class 0 OID 551659)
-- Dependencies: 212
-- Data for Name: tbl_historic; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tbl_historic VALUES (1, NULL, '2021-07-12 14:46:30.576938', 'Criação da página', 1, 'IGRP SysAdmin', 80);
INSERT INTO tbl_historic VALUES (2, NULL, '2021-07-12 14:53:55.870546', 'Alterações no Gerador.', 1, 'IGRP SysAdmin', 80);


--
-- TOC entry 3189 (class 0 OID 551667)
-- Dependencies: 214
-- Data for Name: tbl_importexport; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3191 (class 0 OID 551675)
-- Dependencies: 216
-- Data for Name: tbl_mapping; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3193 (class 0 OID 551683)
-- Dependencies: 218
-- Data for Name: tbl_menu; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tbl_menu VALUES (1, 'Gestão de Aplicação', 0, NULL, NULL, 98, 1, NULL, NULL, 1, NULL);
INSERT INTO tbl_menu VALUES (2, 'Parametros Gerais', 0, NULL, NULL, 98, 1, NULL, NULL, 1, NULL);
INSERT INTO tbl_menu VALUES (3, 'Auditoria', 0, NULL, NULL, 98, 1, NULL, NULL, 1, NULL);
INSERT INTO tbl_menu VALUES (4, 'IGRP Studio', 0, NULL, NULL, 1, 1, NULL, NULL, 3, NULL);
INSERT INTO tbl_menu VALUES (5, 'Application Builder', 1, NULL, NULL, 98, 1, '_self', 3, 3, 4);
INSERT INTO tbl_menu VALUES (6, 'Home - Page Builder', 0, NULL, NULL, 0, 1, '_self', 1, 3, 6);
INSERT INTO tbl_menu VALUES (7, 'Report Designer', 0, NULL, NULL, 4, 1, '_self', 23, 3, 4);
INSERT INTO tbl_menu VALUES (8, 'Gestão de Menu', 0, NULL, NULL, 7, 0, '_self', 9, 1, 1);
INSERT INTO tbl_menu VALUES (9, 'Gestão de Transação', 0, NULL, NULL, 8, 0, '_self', 16, 1, 1);
INSERT INTO tbl_menu VALUES (10, 'Gestão de Acesso', 1, NULL, NULL, 999, 1, '_self', 41, 1, 10);
INSERT INTO tbl_menu VALUES (11, 'Gestão de Utilizador', 0, NULL, NULL, 9, 0, '_self', 12, 1, 1);
INSERT INTO tbl_menu VALUES (12, 'Área Pessoal', 1, NULL, NULL, 1, 1, '_self', 14, 1, 12);
INSERT INTO tbl_menu VALUES (13, 'BPMN Designer', 0, NULL, NULL, 1, 1, '_self', 34, 3, 4);
INSERT INTO tbl_menu VALUES (14, 'CRUD Generator', 0, NULL, NULL, 1, 1, '_self', 44, 3, 4);
INSERT INTO tbl_menu VALUES (15, 'Consultar Processo', 1, NULL, NULL, 90, 1, '_self', 47, 1, 15);
INSERT INTO tbl_menu VALUES (16, 'OAuth Client Id', 0, NULL, NULL, 99, 0, '_self', 27, 1, 16);
INSERT INTO tbl_menu VALUES (17, 'Partilha Inter-Aplicações', 1, NULL, NULL, 98, 1, '_self', 49, 3, 17);
INSERT INTO tbl_menu VALUES (18, 'SQL Tool', 0, NULL, NULL, 99, 1, 'modal', 52, 3, 18);
INSERT INTO tbl_menu VALUES (19, 'Migrate IGRP', 0, NULL, NULL, 99, 1, '_self', 26, 1, 19);
INSERT INTO tbl_menu VALUES (20, 'Gestao tipo documento', 0, NULL, NULL, 99, 1, '_self', 60, 1, 20);
INSERT INTO tbl_menu VALUES (21, 'Gestão de Domínio', 1, NULL, NULL, 99, 1, '_self', 4, 1, 21);
INSERT INTO tbl_menu VALUES (22, 'WSDL2Java', 0, NULL, NULL, 99, 1, 'modal', 74, 3, 22);
INSERT INTO tbl_menu VALUES (23, 'Migration File Generator', 0, NULL, NULL, 10, 1, '_self', 80, 3, 23);


--
-- TOC entry 3195 (class 0 OID 551691)
-- Dependencies: 220
-- Data for Name: tbl_modulo; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3197 (class 0 OID 551699)
-- Dependencies: 222
-- Data for Name: tbl_organization; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tbl_organization VALUES (1, '01.03', 'IGRP', NULL, 1, 1, NULL, 1);
INSERT INTO tbl_organization VALUES (2, 'org.tutorial', 'Tutorial', NULL, 1, 2, NULL, 1);
INSERT INTO tbl_organization VALUES (3, 'org.developer', 'Developers', NULL, 1, 3, NULL, 1);


--
-- TOC entry 3199 (class 0 OID 551707)
-- Dependencies: 224
-- Data for Name: tbl_profile; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tbl_profile VALUES (1, 'ENV', 1, 1, 2, 2);
INSERT INTO tbl_profile VALUES (2, 'PROF', 2, 1, 2, 2);
INSERT INTO tbl_profile VALUES (3, 'ENV', 2, 2, 3, 2);
INSERT INTO tbl_profile VALUES (4, 'PROF', 3, 2, 3, 2);
INSERT INTO tbl_profile VALUES (5, 'ENV', 3, 3, 4, 2);
INSERT INTO tbl_profile VALUES (6, 'PROF', 4, 3, 4, 2);
INSERT INTO tbl_profile VALUES (7, 'ENV', 1, 1, 2, 1);
INSERT INTO tbl_profile VALUES (8, 'PROF', 2, 1, 2, 1);
INSERT INTO tbl_profile VALUES (9, 'ENV', 2, 2, 3, 1);
INSERT INTO tbl_profile VALUES (10, 'PROF', 3, 2, 3, 1);
INSERT INTO tbl_profile VALUES (11, 'ENV', 3, 3, 4, 1);
INSERT INTO tbl_profile VALUES (12, 'PROF', 4, 3, 4, 1);
INSERT INTO tbl_profile VALUES (13, 'MEN', 5, 1, 2, 1);
INSERT INTO tbl_profile VALUES (14, 'MEN', 5, 1, 1, 1);
INSERT INTO tbl_profile VALUES (15, 'MEN', 5, 3, 1, 1);
INSERT INTO tbl_profile VALUES (16, 'MEN', 6, 3, 1, 1);
INSERT INTO tbl_profile VALUES (17, 'MEN', 7, 3, 1, 1);
INSERT INTO tbl_profile VALUES (18, 'MEN', 8, 1, 1, 1);
INSERT INTO tbl_profile VALUES (19, 'MEN', 9, 1, 1, 1);
INSERT INTO tbl_profile VALUES (20, 'MEN', 10, 1, 1, 1);
INSERT INTO tbl_profile VALUES (21, 'MEN', 11, 1, 1, 1);
INSERT INTO tbl_profile VALUES (22, 'MEN', 12, 1, 1, 1);
INSERT INTO tbl_profile VALUES (23, 'MEN', 16, 1, 1, 1);
INSERT INTO tbl_profile VALUES (24, 'MEN', 8, 3, 1, 1);
INSERT INTO tbl_profile VALUES (25, 'MEN', 9, 3, 1, 1);
INSERT INTO tbl_profile VALUES (26, 'MEN', 10, 3, 1, 1);
INSERT INTO tbl_profile VALUES (27, 'MEN', 13, 3, 1, 1);
INSERT INTO tbl_profile VALUES (28, 'MEN', 14, 3, 1, 1);
INSERT INTO tbl_profile VALUES (29, 'MEN', 15, 1, 1, 1);
INSERT INTO tbl_profile VALUES (30, 'MEN', 15, 3, 1, 1);
INSERT INTO tbl_profile VALUES (31, 'MEN', 5, 3, 4, 1);
INSERT INTO tbl_profile VALUES (32, 'MEN', 6, 3, 4, 1);
INSERT INTO tbl_profile VALUES (33, 'MEN', 7, 3, 4, 1);
INSERT INTO tbl_profile VALUES (34, 'MEN', 8, 1, 2, 1);
INSERT INTO tbl_profile VALUES (35, 'MEN', 9, 1, 2, 1);
INSERT INTO tbl_profile VALUES (36, 'MEN', 10, 1, 2, 1);
INSERT INTO tbl_profile VALUES (37, 'MEN', 11, 1, 2, 1);
INSERT INTO tbl_profile VALUES (38, 'MEN', 12, 1, 2, 1);
INSERT INTO tbl_profile VALUES (39, 'MEN', 15, 1, 2, 1);
INSERT INTO tbl_profile VALUES (40, 'MEN', 16, 1, 2, 1);
INSERT INTO tbl_profile VALUES (41, 'MEN', 8, 3, 4, 1);
INSERT INTO tbl_profile VALUES (42, 'MEN', 9, 3, 4, 1);
INSERT INTO tbl_profile VALUES (43, 'MEN', 10, 3, 4, 1);
INSERT INTO tbl_profile VALUES (44, 'MEN', 13, 3, 4, 1);
INSERT INTO tbl_profile VALUES (45, 'MEN', 14, 3, 4, 1);
INSERT INTO tbl_profile VALUES (46, 'MEN', 15, 3, 4, 1);
INSERT INTO tbl_profile VALUES (47, 'MEN', 17, 3, 1, 1);
INSERT INTO tbl_profile VALUES (48, 'MEN', 17, 1, 2, 1);
INSERT INTO tbl_profile VALUES (49, 'MEN', 17, 3, 4, 1);
INSERT INTO tbl_profile VALUES (50, 'MEN', 18, 3, 1, 1);
INSERT INTO tbl_profile VALUES (51, 'MEN', 18, 3, 4, 1);
INSERT INTO tbl_profile VALUES (52, 'MEN', 19, 1, 1, 1);
INSERT INTO tbl_profile VALUES (53, 'MEN', 19, 1, 2, 1);
INSERT INTO tbl_profile VALUES (54, 'MEN', 20, 3, 1, 1);
INSERT INTO tbl_profile VALUES (55, 'MEN', 20, 3, 4, 1);
INSERT INTO tbl_profile VALUES (56, 'MEN', 21, 3, 1, 1);
INSERT INTO tbl_profile VALUES (57, 'MEN', 21, 3, 4, 1);
INSERT INTO tbl_profile VALUES (58, 'MEN', 22, 3, 1, 1);
INSERT INTO tbl_profile VALUES (59, 'MEN', 22, 3, 4, 1);
INSERT INTO tbl_profile VALUES (60, 'MEN', 23, 3, 1, 1);
INSERT INTO tbl_profile VALUES (61, 'MEN', 23, 3, 4, 1);


--
-- TOC entry 3201 (class 0 OID 551712)
-- Dependencies: 226
-- Data for Name: tbl_profile_type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tbl_profile_type VALUES (1, 'ALL', 'ALL PROFILE', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO tbl_profile_type VALUES (2, 'ADMIN', 'Administrador', NULL, 1, 1, NULL, 1, NULL);
INSERT INTO tbl_profile_type VALUES (3, 'perfil.tutorial', 'Tutorial', NULL, 1, 2, NULL, 2, NULL);
INSERT INTO tbl_profile_type VALUES (4, 'perfil.developer', 'Developer', NULL, 1, 3, NULL, 3, NULL);


--
-- TOC entry 3203 (class 0 OID 551720)
-- Dependencies: 228
-- Data for Name: tbl_rep_instance; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3205 (class 0 OID 551728)
-- Dependencies: 230
-- Data for Name: tbl_rep_source; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3207 (class 0 OID 551736)
-- Dependencies: 232
-- Data for Name: tbl_rep_template; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3209 (class 0 OID 551744)
-- Dependencies: 234
-- Data for Name: tbl_rep_template_param; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3211 (class 0 OID 551749)
-- Dependencies: 236
-- Data for Name: tbl_rep_template_source; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3213 (class 0 OID 551754)
-- Dependencies: 238
-- Data for Name: tbl_rep_template_source_param; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3215 (class 0 OID 551759)
-- Dependencies: 240
-- Data for Name: tbl_session; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3217 (class 0 OID 551767)
-- Dependencies: 242
-- Data for Name: tbl_task_access; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3219 (class 0 OID 551775)
-- Dependencies: 244
-- Data for Name: tbl_task_component; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3221 (class 0 OID 551783)
-- Dependencies: 246
-- Data for Name: tbl_task_file; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3223 (class 0 OID 551791)
-- Dependencies: 248
-- Data for Name: tbl_task_unassigned; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3225 (class 0 OID 551796)
-- Dependencies: 250
-- Data for Name: tbl_temp_file; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3226 (class 0 OID 551802)
-- Dependencies: 251
-- Data for Name: tbl_tipo_documento; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3227 (class 0 OID 551808)
-- Dependencies: 252
-- Data for Name: tbl_tipo_documento_etapa; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3230 (class 0 OID 551815)
-- Dependencies: 255
-- Data for Name: tbl_transaction; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 3232 (class 0 OID 551823)
-- Dependencies: 257
-- Data for Name: tbl_user; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO tbl_user VALUES (3, '123456789', '123456', 12345, NULL, NULL, NULL, NULL, NULL, NULL, 'Pa$$w0rd', NULL, NULL, NULL, NULL, NULL, NULL, 1, 133, NULL, 'root', NULL);
INSERT INTO tbl_user VALUES (1, '123456789', '123456789', 2017, 'igrpweb@nosi.cv', 0, NULL, 'IGRP SysAdmin', NULL, NULL, 'dc4659bfb1dbb064106f5685aa87a41550402178b0cc4c43a52f82848bb78b34', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2017, 'ADMIN', 'igrpweb@nosi.cv', NULL);
INSERT INTO tbl_user VALUES (2, '123456789', '123456', 2017, 'demo@nosi.cv', 1, NULL, 'Nositeste', NULL, NULL, '60b1df41fa82696abea1deb198667eb7c4a60521dd471559a8c17efde8528913', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2017, 'ADMIN', 'demo@nosi.cv', NULL);


--
-- TOC entry 3272 (class 0 OID 0)
-- Dependencies: 197
-- Name: glb_t_acl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('glb_t_acl_id_seq', 1, false);


--
-- TOC entry 3273 (class 0 OID 0)
-- Dependencies: 199
-- Name: tbl_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_action_id_seq', 80, true);


--
-- TOC entry 3274 (class 0 OID 0)
-- Dependencies: 201
-- Name: tbl_activity_execute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_activity_execute_id_seq', 1, false);


--
-- TOC entry 3275 (class 0 OID 0)
-- Dependencies: 203
-- Name: tbl_clob_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_clob_id_seq', 1, false);


--
-- TOC entry 3276 (class 0 OID 0)
-- Dependencies: 206
-- Name: tbl_config_env_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_config_env_id_seq', 1, false);


--
-- TOC entry 3277 (class 0 OID 0)
-- Dependencies: 207
-- Name: tbl_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_config_id_seq', 17, true);


--
-- TOC entry 3278 (class 0 OID 0)
-- Dependencies: 209
-- Name: tbl_domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_domain_id_seq', 1, false);


--
-- TOC entry 3279 (class 0 OID 0)
-- Dependencies: 211
-- Name: tbl_env_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_env_id_seq', 3, true);


--
-- TOC entry 3280 (class 0 OID 0)
-- Dependencies: 213
-- Name: tbl_historic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_historic_id_seq', 2, true);


--
-- TOC entry 3281 (class 0 OID 0)
-- Dependencies: 215
-- Name: tbl_importexport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_importexport_id_seq', 1, false);


--
-- TOC entry 3282 (class 0 OID 0)
-- Dependencies: 217
-- Name: tbl_mapping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_mapping_id_seq', 1, false);


--
-- TOC entry 3283 (class 0 OID 0)
-- Dependencies: 219
-- Name: tbl_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_menu_id_seq', 23, true);


--
-- TOC entry 3284 (class 0 OID 0)
-- Dependencies: 221
-- Name: tbl_modulo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_modulo_id_seq', 1, false);


--
-- TOC entry 3285 (class 0 OID 0)
-- Dependencies: 223
-- Name: tbl_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_organization_id_seq', 3, true);


--
-- TOC entry 3286 (class 0 OID 0)
-- Dependencies: 225
-- Name: tbl_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_profile_id_seq', 61, true);


--
-- TOC entry 3287 (class 0 OID 0)
-- Dependencies: 227
-- Name: tbl_profile_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_profile_type_id_seq', 4, true);


--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 229
-- Name: tbl_rep_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_rep_instance_id_seq', 1, false);


--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 231
-- Name: tbl_rep_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_rep_source_id_seq', 1, false);


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 233
-- Name: tbl_rep_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_rep_template_id_seq', 1, false);


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 235
-- Name: tbl_rep_template_param_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_rep_template_param_id_seq', 1, false);


--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 237
-- Name: tbl_rep_template_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_rep_template_source_id_seq', 1, false);


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 239
-- Name: tbl_rep_template_source_param_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_rep_template_source_param_id_seq', 1, false);


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 241
-- Name: tbl_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_session_id_seq', 7, true);


--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 243
-- Name: tbl_task_access_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_task_access_id_seq', 1, false);


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 245
-- Name: tbl_task_component_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_task_component_id_seq', 1, false);


--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 247
-- Name: tbl_task_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_task_file_id_seq', 1, false);


--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 249
-- Name: tbl_task_unassigned_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_task_unassigned_id_seq', 1, false);


--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 253
-- Name: tbl_tipo_documento_etapa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_tipo_documento_etapa_id_seq', 1, false);


--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 254
-- Name: tbl_tipo_documento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_tipo_documento_id_seq', 1, false);


--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 256
-- Name: tbl_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_transaction_id_seq', 1, false);


--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 258
-- Name: tbl_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tbl_user_id_seq', 3, true);


--
-- TOC entry 2912 (class 2606 OID 551863)
-- Name: glb_t_acl glb_t_acl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glb_t_acl
    ADD CONSTRAINT glb_t_acl_pkey PRIMARY KEY (id);


--
-- TOC entry 2946 (class 2606 OID 551865)
-- Name: tbl_profile profile_unique_fk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile
    ADD CONSTRAINT profile_unique_fk UNIQUE (type, type_fk, user_fk, org_fk, prof_type_fk);


--
-- TOC entry 2914 (class 2606 OID 551867)
-- Name: tbl_action tbl_action_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_action
    ADD CONSTRAINT tbl_action_pkey PRIMARY KEY (id);


--
-- TOC entry 2916 (class 2606 OID 551869)
-- Name: tbl_activity_execute tbl_activity_execute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_activity_execute
    ADD CONSTRAINT tbl_activity_execute_pkey PRIMARY KEY (id);


--
-- TOC entry 2918 (class 2606 OID 551871)
-- Name: tbl_clob tbl_clob_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_clob
    ADD CONSTRAINT tbl_clob_pkey PRIMARY KEY (id);


--
-- TOC entry 2924 (class 2606 OID 551873)
-- Name: tbl_config_env tbl_config_env_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_config_env
    ADD CONSTRAINT tbl_config_env_pkey PRIMARY KEY (id);


--
-- TOC entry 2920 (class 2606 OID 551875)
-- Name: tbl_config tbl_config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_config
    ADD CONSTRAINT tbl_config_pkey PRIMARY KEY (id);


--
-- TOC entry 2926 (class 2606 OID 551877)
-- Name: tbl_domain tbl_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_domain
    ADD CONSTRAINT tbl_domain_pkey PRIMARY KEY (id);


--
-- TOC entry 2928 (class 2606 OID 551879)
-- Name: tbl_env tbl_env_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_env
    ADD CONSTRAINT tbl_env_pkey PRIMARY KEY (id);


--
-- TOC entry 2932 (class 2606 OID 551881)
-- Name: tbl_historic tbl_historic_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_historic
    ADD CONSTRAINT tbl_historic_pkey PRIMARY KEY (id);


--
-- TOC entry 2934 (class 2606 OID 551883)
-- Name: tbl_importexport tbl_importexport_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_importexport
    ADD CONSTRAINT tbl_importexport_pkey PRIMARY KEY (id);


--
-- TOC entry 2936 (class 2606 OID 551885)
-- Name: tbl_mapping tbl_mapping_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_mapping
    ADD CONSTRAINT tbl_mapping_pkey PRIMARY KEY (id);


--
-- TOC entry 2938 (class 2606 OID 551887)
-- Name: tbl_menu tbl_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_menu
    ADD CONSTRAINT tbl_menu_pkey PRIMARY KEY (id);


--
-- TOC entry 2940 (class 2606 OID 551889)
-- Name: tbl_modulo tbl_modulo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_modulo
    ADD CONSTRAINT tbl_modulo_pkey PRIMARY KEY (id);


--
-- TOC entry 2942 (class 2606 OID 551891)
-- Name: tbl_organization tbl_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_organization
    ADD CONSTRAINT tbl_organization_pkey PRIMARY KEY (id);


--
-- TOC entry 2948 (class 2606 OID 551893)
-- Name: tbl_profile tbl_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile
    ADD CONSTRAINT tbl_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 2950 (class 2606 OID 551895)
-- Name: tbl_profile_type tbl_profile_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile_type
    ADD CONSTRAINT tbl_profile_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2954 (class 2606 OID 551897)
-- Name: tbl_rep_instance tbl_rep_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_instance
    ADD CONSTRAINT tbl_rep_instance_pkey PRIMARY KEY (id);


--
-- TOC entry 2956 (class 2606 OID 551899)
-- Name: tbl_rep_source tbl_rep_source_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_source
    ADD CONSTRAINT tbl_rep_source_pkey PRIMARY KEY (id);


--
-- TOC entry 2960 (class 2606 OID 551901)
-- Name: tbl_rep_template_param tbl_rep_template_param_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_param
    ADD CONSTRAINT tbl_rep_template_param_pkey PRIMARY KEY (id);


--
-- TOC entry 2958 (class 2606 OID 551903)
-- Name: tbl_rep_template tbl_rep_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template
    ADD CONSTRAINT tbl_rep_template_pkey PRIMARY KEY (id);


--
-- TOC entry 2964 (class 2606 OID 551905)
-- Name: tbl_rep_template_source_param tbl_rep_template_source_param_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_source_param
    ADD CONSTRAINT tbl_rep_template_source_param_pkey PRIMARY KEY (id);


--
-- TOC entry 2962 (class 2606 OID 551907)
-- Name: tbl_rep_template_source tbl_rep_template_source_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_source
    ADD CONSTRAINT tbl_rep_template_source_pkey PRIMARY KEY (id);


--
-- TOC entry 2966 (class 2606 OID 551909)
-- Name: tbl_session tbl_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_session
    ADD CONSTRAINT tbl_session_pkey PRIMARY KEY (id);


--
-- TOC entry 2968 (class 2606 OID 551911)
-- Name: tbl_task_access tbl_task_access_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_access
    ADD CONSTRAINT tbl_task_access_pkey PRIMARY KEY (id);


--
-- TOC entry 2970 (class 2606 OID 551913)
-- Name: tbl_task_component tbl_task_component_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_component
    ADD CONSTRAINT tbl_task_component_pkey PRIMARY KEY (id);


--
-- TOC entry 2972 (class 2606 OID 551915)
-- Name: tbl_task_file tbl_task_file_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_file
    ADD CONSTRAINT tbl_task_file_pkey PRIMARY KEY (id);


--
-- TOC entry 2974 (class 2606 OID 551917)
-- Name: tbl_task_unassigned tbl_task_unassigned_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_unassigned
    ADD CONSTRAINT tbl_task_unassigned_pkey PRIMARY KEY (id);


--
-- TOC entry 2976 (class 2606 OID 551919)
-- Name: tbl_temp_file tbl_temp_file_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_temp_file
    ADD CONSTRAINT tbl_temp_file_pkey PRIMARY KEY (uuid);


--
-- TOC entry 2980 (class 2606 OID 551921)
-- Name: tbl_tipo_documento_etapa tbl_tipo_documento_etapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_tipo_documento_etapa
    ADD CONSTRAINT tbl_tipo_documento_etapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2978 (class 2606 OID 551923)
-- Name: tbl_tipo_documento tbl_tipo_documento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_tipo_documento
    ADD CONSTRAINT tbl_tipo_documento_pkey PRIMARY KEY (id);


--
-- TOC entry 2982 (class 2606 OID 551925)
-- Name: tbl_transaction tbl_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_transaction
    ADD CONSTRAINT tbl_transaction_pkey PRIMARY KEY (id);


--
-- TOC entry 2984 (class 2606 OID 551927)
-- Name: tbl_user tbl_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_user
    ADD CONSTRAINT tbl_user_pkey PRIMARY KEY (id);


--
-- TOC entry 2922 (class 2606 OID 551929)
-- Name: tbl_config uk_12mhj0s9yhg2vyn29mhl8j8uy; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_config
    ADD CONSTRAINT uk_12mhj0s9yhg2vyn29mhl8j8uy UNIQUE (name);


--
-- TOC entry 2944 (class 2606 OID 551931)
-- Name: tbl_organization uk_2nguyayav3wm6yj1j093rgbeu; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_organization
    ADD CONSTRAINT uk_2nguyayav3wm6yj1j093rgbeu UNIQUE (code);


--
-- TOC entry 2986 (class 2606 OID 551933)
-- Name: tbl_user uk_6jr81l5qqpxjp72fgi23ubqc9; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_user
    ADD CONSTRAINT uk_6jr81l5qqpxjp72fgi23ubqc9 UNIQUE (user_name);


--
-- TOC entry 2930 (class 2606 OID 551935)
-- Name: tbl_env uk_6m6wu64xn2k5pu1jt30h6r13y; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_env
    ADD CONSTRAINT uk_6m6wu64xn2k5pu1jt30h6r13y UNIQUE (dad);


--
-- TOC entry 2988 (class 2606 OID 551937)
-- Name: tbl_user uk_npn1wf1yu1g5rjohbek375pp1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_user
    ADD CONSTRAINT uk_npn1wf1yu1g5rjohbek375pp1 UNIQUE (email);


--
-- TOC entry 2952 (class 2606 OID 551939)
-- Name: tbl_profile_type uk_psnluqoofbs9nxjw813kte4d1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile_type
    ADD CONSTRAINT uk_psnluqoofbs9nxjw813kte4d1 UNIQUE (code);


--
-- TOC entry 3042 (class 2606 OID 551940)
-- Name: tbl_task_component action_component_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_component
    ADD CONSTRAINT action_component_fk FOREIGN KEY (action_fk) REFERENCES tbl_action(id);


--
-- TOC entry 2991 (class 2606 OID 551945)
-- Name: tbl_action action_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_action
    ADD CONSTRAINT action_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 2996 (class 2606 OID 551950)
-- Name: tbl_clob clob_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_clob
    ADD CONSTRAINT clob_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 2997 (class 2606 OID 551955)
-- Name: tbl_clob clob_env_updated_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_clob
    ADD CONSTRAINT clob_env_updated_fk FOREIGN KEY (env_updated_fk) REFERENCES tbl_env(id);


--
-- TOC entry 2998 (class 2606 OID 551960)
-- Name: tbl_clob clob_user_created_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_clob
    ADD CONSTRAINT clob_user_created_fk FOREIGN KEY (user_created_fk) REFERENCES tbl_user(id);


--
-- TOC entry 2999 (class 2606 OID 551965)
-- Name: tbl_config_env config_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_config_env
    ADD CONSTRAINT config_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3022 (class 2606 OID 551970)
-- Name: tbl_rep_source crud_rep_source_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_source
    ADD CONSTRAINT crud_rep_source_env_fk FOREIGN KEY (config_env_fk) REFERENCES tbl_config_env(id);


--
-- TOC entry 3000 (class 2606 OID 551975)
-- Name: tbl_domain domain_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_domain
    ADD CONSTRAINT domain_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3001 (class 2606 OID 551980)
-- Name: tbl_env env_action_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_env
    ADD CONSTRAINT env_action_fk FOREIGN KEY (action_fk) REFERENCES tbl_action(id);


--
-- TOC entry 2992 (class 2606 OID 551985)
-- Name: tbl_activity_execute env_activite_execute_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_activity_execute
    ADD CONSTRAINT env_activite_execute_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3006 (class 2606 OID 551990)
-- Name: tbl_modulo env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_modulo
    ADD CONSTRAINT env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 2989 (class 2606 OID 551995)
-- Name: glb_t_acl fk8eveej9ia15d7ra4ihw8wybsb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glb_t_acl
    ADD CONSTRAINT fk8eveej9ia15d7ra4ihw8wybsb FOREIGN KEY (env_owner_fk) REFERENCES tbl_env(id);


--
-- TOC entry 2990 (class 2606 OID 552000)
-- Name: glb_t_acl fkf2u26fjdyk9rr59wpso7y7l5s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY glb_t_acl
    ADD CONSTRAINT fkf2u26fjdyk9rr59wpso7y7l5s FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3003 (class 2606 OID 552005)
-- Name: tbl_menu menu_action_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_menu
    ADD CONSTRAINT menu_action_fk FOREIGN KEY (action_fk) REFERENCES tbl_action(id);


--
-- TOC entry 3004 (class 2606 OID 552010)
-- Name: tbl_menu menu_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_menu
    ADD CONSTRAINT menu_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3005 (class 2606 OID 552015)
-- Name: tbl_menu menu_self_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_menu
    ADD CONSTRAINT menu_self_fk FOREIGN KEY (self_fk) REFERENCES tbl_menu(id);


--
-- TOC entry 2993 (class 2606 OID 552020)
-- Name: tbl_activity_execute org_activite_execute_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_activity_execute
    ADD CONSTRAINT org_activite_execute_fk FOREIGN KEY (org_fk) REFERENCES tbl_organization(id);


--
-- TOC entry 3007 (class 2606 OID 552025)
-- Name: tbl_organization organization_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_organization
    ADD CONSTRAINT organization_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3008 (class 2606 OID 552030)
-- Name: tbl_organization organization_self_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_organization
    ADD CONSTRAINT organization_self_fk FOREIGN KEY (self_fk) REFERENCES tbl_organization(id);


--
-- TOC entry 3009 (class 2606 OID 552035)
-- Name: tbl_organization organization_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_organization
    ADD CONSTRAINT organization_user_fk FOREIGN KEY (user_created_fk) REFERENCES tbl_user(id);


--
-- TOC entry 3002 (class 2606 OID 552040)
-- Name: tbl_historic page_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_historic
    ADD CONSTRAINT page_fk FOREIGN KEY (page_fk) REFERENCES tbl_action(id);


--
-- TOC entry 2994 (class 2606 OID 552045)
-- Name: tbl_activity_execute prof_activite_execute_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_activity_execute
    ADD CONSTRAINT prof_activite_execute_fk FOREIGN KEY (prof_fk) REFERENCES tbl_profile_type(id);


--
-- TOC entry 3010 (class 2606 OID 552050)
-- Name: tbl_profile profile_organization_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile
    ADD CONSTRAINT profile_organization_fk FOREIGN KEY (org_fk) REFERENCES tbl_organization(id);


--
-- TOC entry 3011 (class 2606 OID 552055)
-- Name: tbl_profile profile_prof_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile
    ADD CONSTRAINT profile_prof_type_fk FOREIGN KEY (prof_type_fk) REFERENCES tbl_profile_type(id);


--
-- TOC entry 3013 (class 2606 OID 552060)
-- Name: tbl_profile_type profile_type_action_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile_type
    ADD CONSTRAINT profile_type_action_fk FOREIGN KEY (firstpage) REFERENCES tbl_action(id);


--
-- TOC entry 3014 (class 2606 OID 552065)
-- Name: tbl_profile_type profile_type_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile_type
    ADD CONSTRAINT profile_type_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3015 (class 2606 OID 552070)
-- Name: tbl_profile_type profile_type_org_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile_type
    ADD CONSTRAINT profile_type_org_fk FOREIGN KEY (org_fk) REFERENCES tbl_organization(id);


--
-- TOC entry 3016 (class 2606 OID 552075)
-- Name: tbl_profile_type profile_type_self_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile_type
    ADD CONSTRAINT profile_type_self_fk FOREIGN KEY (self_fk) REFERENCES tbl_profile_type(id);


--
-- TOC entry 3012 (class 2606 OID 552080)
-- Name: tbl_profile profile_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_profile
    ADD CONSTRAINT profile_user_fk FOREIGN KEY (user_fk) REFERENCES tbl_user(id);


--
-- TOC entry 3017 (class 2606 OID 552085)
-- Name: tbl_rep_instance rep_instance_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_instance
    ADD CONSTRAINT rep_instance_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3018 (class 2606 OID 552090)
-- Name: tbl_rep_instance rep_instance_rep_template_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_instance
    ADD CONSTRAINT rep_instance_rep_template_fk FOREIGN KEY (rep_template_fk) REFERENCES tbl_rep_template(id);


--
-- TOC entry 3019 (class 2606 OID 552095)
-- Name: tbl_rep_instance rep_instance_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_instance
    ADD CONSTRAINT rep_instance_user_fk FOREIGN KEY (user_fk) REFERENCES tbl_user(id);


--
-- TOC entry 3020 (class 2606 OID 552100)
-- Name: tbl_rep_instance rep_instance_xml_content_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_instance
    ADD CONSTRAINT rep_instance_xml_content_fk FOREIGN KEY (xml_content_fk) REFERENCES tbl_clob(id);


--
-- TOC entry 3021 (class 2606 OID 552105)
-- Name: tbl_rep_instance rep_instance_xsl_content_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_instance
    ADD CONSTRAINT rep_instance_xsl_content_fk FOREIGN KEY (xsl_content_fk) REFERENCES tbl_clob(id);


--
-- TOC entry 3023 (class 2606 OID 552110)
-- Name: tbl_rep_source rep_source_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_source
    ADD CONSTRAINT rep_source_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3024 (class 2606 OID 552115)
-- Name: tbl_rep_source rep_source_env_source_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_source
    ADD CONSTRAINT rep_source_env_source_fk FOREIGN KEY (env_source_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3025 (class 2606 OID 552120)
-- Name: tbl_rep_source rep_source_user_created_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_source
    ADD CONSTRAINT rep_source_user_created_fk FOREIGN KEY (user_created_fk) REFERENCES tbl_user(id);


--
-- TOC entry 3026 (class 2606 OID 552125)
-- Name: tbl_rep_source rep_source_user_updated_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_source
    ADD CONSTRAINT rep_source_user_updated_fk FOREIGN KEY (user_updated_fk) REFERENCES tbl_user(id);


--
-- TOC entry 3027 (class 2606 OID 552130)
-- Name: tbl_rep_template rep_template_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template
    ADD CONSTRAINT rep_template_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3032 (class 2606 OID 552135)
-- Name: tbl_rep_template_param rep_template_param_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_param
    ADD CONSTRAINT rep_template_param_fk FOREIGN KEY (rep_template_fk) REFERENCES tbl_rep_template(id);


--
-- TOC entry 3035 (class 2606 OID 552140)
-- Name: tbl_rep_template_source_param rep_template_source_param_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_source_param
    ADD CONSTRAINT rep_template_source_param_fk FOREIGN KEY (rep_template_source_fk) REFERENCES tbl_rep_template_source(id);


--
-- TOC entry 3033 (class 2606 OID 552145)
-- Name: tbl_rep_template_source rep_template_source_rep_source_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_source
    ADD CONSTRAINT rep_template_source_rep_source_fk FOREIGN KEY (rep_source_fk) REFERENCES tbl_rep_source(id);


--
-- TOC entry 3034 (class 2606 OID 552150)
-- Name: tbl_rep_template_source rep_template_source_rep_template_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template_source
    ADD CONSTRAINT rep_template_source_rep_template_fk FOREIGN KEY (rep_template_fk) REFERENCES tbl_rep_template(id);


--
-- TOC entry 3028 (class 2606 OID 552155)
-- Name: tbl_rep_template rep_template_user_created_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template
    ADD CONSTRAINT rep_template_user_created_fk FOREIGN KEY (user_created_fk) REFERENCES tbl_user(id);


--
-- TOC entry 3029 (class 2606 OID 552160)
-- Name: tbl_rep_template rep_template_user_updated_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template
    ADD CONSTRAINT rep_template_user_updated_fk FOREIGN KEY (user_updated_fk) REFERENCES tbl_user(id);


--
-- TOC entry 3030 (class 2606 OID 552165)
-- Name: tbl_rep_template rep_template_xml_content_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template
    ADD CONSTRAINT rep_template_xml_content_fk FOREIGN KEY (xml_content_fk) REFERENCES tbl_clob(id);


--
-- TOC entry 3031 (class 2606 OID 552170)
-- Name: tbl_rep_template rep_template_xsl_content_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_rep_template
    ADD CONSTRAINT rep_template_xsl_content_fk FOREIGN KEY (xsl_content_fk) REFERENCES tbl_clob(id);


--
-- TOC entry 3036 (class 2606 OID 552175)
-- Name: tbl_session session_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_session
    ADD CONSTRAINT session_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3037 (class 2606 OID 552180)
-- Name: tbl_session session_organization_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_session
    ADD CONSTRAINT session_organization_fk FOREIGN KEY (org_fk) REFERENCES tbl_organization(id);


--
-- TOC entry 3038 (class 2606 OID 552185)
-- Name: tbl_session session_prof_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_session
    ADD CONSTRAINT session_prof_type_fk FOREIGN KEY (prof_type_fk) REFERENCES tbl_profile_type(id);


--
-- TOC entry 3039 (class 2606 OID 552190)
-- Name: tbl_session session_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_session
    ADD CONSTRAINT session_user_fk FOREIGN KEY (user_fk) REFERENCES tbl_user(id);


--
-- TOC entry 3040 (class 2606 OID 552195)
-- Name: tbl_task_access task_access_organization_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_access
    ADD CONSTRAINT task_access_organization_fk FOREIGN KEY (org_fk) REFERENCES tbl_organization(id);


--
-- TOC entry 3041 (class 2606 OID 552200)
-- Name: tbl_task_access task_access_profile_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_access
    ADD CONSTRAINT task_access_profile_type_fk FOREIGN KEY (prof_fk) REFERENCES tbl_profile_type(id);


--
-- TOC entry 3043 (class 2606 OID 552205)
-- Name: tbl_task_file task_file_clob_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_file
    ADD CONSTRAINT task_file_clob_fk FOREIGN KEY (clob_fk) REFERENCES tbl_clob(id);


--
-- TOC entry 3046 (class 2606 OID 552210)
-- Name: tbl_tipo_documento tipo_docuemnto_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_tipo_documento
    ADD CONSTRAINT tipo_docuemnto_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 3047 (class 2606 OID 552215)
-- Name: tbl_tipo_documento_etapa tipo_docuemnto_etapa_report_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_tipo_documento_etapa
    ADD CONSTRAINT tipo_docuemnto_etapa_report_fk FOREIGN KEY (report_fk) REFERENCES tbl_rep_template(id);


--
-- TOC entry 3048 (class 2606 OID 552220)
-- Name: tbl_tipo_documento_etapa tipo_docuemnto_etapa_tipo_documento_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_tipo_documento_etapa
    ADD CONSTRAINT tipo_docuemnto_etapa_tipo_documento_fk FOREIGN KEY (tipo_documento_fk) REFERENCES tbl_tipo_documento(id);


--
-- TOC entry 3044 (class 2606 OID 552225)
-- Name: tbl_task_file tipo_documento_etapa_clob_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_file
    ADD CONSTRAINT tipo_documento_etapa_clob_fk FOREIGN KEY (tipo_documento_etapa_fk) REFERENCES tbl_tipo_documento_etapa(id);


--
-- TOC entry 3049 (class 2606 OID 552230)
-- Name: tbl_transaction transaction_source_env_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_transaction
    ADD CONSTRAINT transaction_source_env_fk FOREIGN KEY (env_fk) REFERENCES tbl_env(id);


--
-- TOC entry 2995 (class 2606 OID 552235)
-- Name: tbl_activity_execute user_activite_execute_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_activity_execute
    ADD CONSTRAINT user_activite_execute_fk FOREIGN KEY (user_fk) REFERENCES tbl_user(id);


--
-- TOC entry 3045 (class 2606 OID 552240)
-- Name: tbl_task_unassigned user_task_unassigned_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tbl_task_unassigned
    ADD CONSTRAINT user_task_unassigned_fk FOREIGN KEY (user_fk) REFERENCES tbl_user(id);


    
-- Views (Start) 

    CREATE OR REPLACE VIEW GLB_MV_ALL_MENUS(
  ID, DESCR, DESCR_MENU, SELF_FK, ENV_FK, 
  ACTION_FK, ORDERBY
) as 
SELECT 
  a.ID, 
  a.DESCR descr, 
  a.descr descr_menu, 
  a.SELF_FK, 
  a.ENV_FK, 
  a.ACTION_FK, 
  a.ORDERBY 
FROM 
  tbl_menu A, 
  tbl_menu b 
WHERE 
  b.id = a.self_fk 
  AND a.self_fk IS NOT NULL;

CREATE OR REPLACE VIEW GLB_MV_MENU (
  ID, DESCR, SELF_FK, ENV_FK, ACTION_FK, 
  ORDERBY, STATUS, FLG_BASE, TARGET
) AS 
SELECT 
  ID, 
  DESCR, 
  SELF_FK, 
  ENV_FK, 
  ACTION_FK, 
  ORDERBY, 
  STATUS, 
  FLG_BASE, 
  TARGET 
FROM 
  tbl_menu;
  
CREATE OR REPLACE VIEW GLB_V_MENU (
  ID, DESCR, DESCR_MENU, SELF_FK, ENV_FK, 
  ACTION_FK, ORDERBY
) AS 
SELECT 
  a.ID, 
  b.descr || ' - ' || a.DESCR descr, 
  a.descr descr_menu, 
  a.SELF_FK, 
  a.ENV_FK, 
  a.ACTION_FK, 
  a.ORDERBY 
FROM 
  glb_mv_menu a, 
  glb_mv_menu b 
WHERE 
  b.id = a.self_fk 
  AND a.self_fk IS NOT NULL;

CREATE OR REPLACE VIEW GLB_V_ORG_MENU (
  ID, DESCR, ORDERBY, ENV_FK, SELF_FK, 
  PROF_TYPE_FK, USER_FK, PROF_CODE, 
  PROF_NAME, ORG_FK, FLG_BASE
) AS 
SELECT 
  a.id, 
  e.descr || ' - ' || a.descr descr, 
  a.orderby, 
  a.env_fk, 
  a.self_fk, 
  b.prof_type_fk, 
  b.user_fk, 
  'ALL' prof_code, 
  'ALL PROFILE' prof_name, 
  b.org_fk, 
  a.flg_base 
FROM 
  tbl_menu a, 
  tbl_menu e, 
  tbl_profile b 
WHERE 
  e.id = a.self_fk 
  AND a.self_fk IS NOT NULL 
  AND a.id = b.type_fk 
  AND b.TYPE = 'MEN' 
  AND b.prof_type_fk = 0;

CREATE OR REPLACE VIEW GLB_MV_PROFILE (
  PROF_TYPE_FK, USER_FK, TYPE, TYPE_FK, 
  ORG_FK
) AS 
SELECT 
  PROF_TYPE_FK, 
  USER_FK, 
  TYPE, 
  TYPE_FK, 
  ORG_FK 
FROM 
  tbl_profile;
CREATE 
OR REPLACE VIEW GLB_MV_PROFILE_TYPE (
  ID, DESCR, CODE, ENV_FK, SELF_FK, STATUS, 
  ORG_FK
) AS 
SELECT 
  ID, 
  DESCR, 
  CODE, 
  ENV_FK, 
  SELF_FK, 
  STATUS, 
  ORG_FK 
FROM 
  tbl_profile_type;

CREATE OR REPLACE VIEW GLB_V_PROFILE(
  ORG_FK, PROF_TYPE_FK, USER_FK, TYPE, 
  TYPE_FK, PROF_CODE, PROF_NAME, PROF_NAME_DESC, 
  ENV_FK, SELF_FK
) AS 
SELECT 
  b.org_fk, 
  b.prof_type_fk, 
  b.user_fk, 
  b.TYPE, 
  b.type_fk, 
  d.code prof_code, 
  d.descr prof_name, 
  d.code || ' - ' || d.descr prof_name_desc, 
  d.env_fk, 
  d.self_fk 
FROM 
  glb_mv_profile b, 
  glb_mv_profile_type d 
WHERE 
  d.id = b.prof_type_fk;

CREATE OR REPLACE VIEW GLB_V_PROFILE_MENU (
  ID, DESCR, DESCR_MENU, ORDERBY, ENV_FK, 
  SELF_FK, ACTION_FK, PROF_TYPE_FK, 
  USER_FK, PROF_CODE, PROF_NAME, ORG_FK, 
  STATUS, TARGET, ENV_FK_PROF_TYPE, 
  FLG_BASE
) AS 
SELECT 
  a.id, 
  e.descr descr, 
  a.descr descr_menu, 
  a.orderby, 
  a.env_fk, 
  a.self_fk, 
  a.action_fk, 
  b.prof_type_fk, 
  b.user_fk, 
  d.code prof_code, 
  d.descr prof_name, 
  b.org_fk, 
  a.status, 
  a.target, 
  d.env_fk as env_fk_prof_type, 
  e.flg_base 
FROM 
  glb_mv_menu a, 
  glb_mv_menu e, 
  glb_mv_profile b, 
  glb_mv_profile_type d 
WHERE 
  e.id = a.self_fk 
  AND a.self_fk IS NOT NULL 
  AND a.id = b.type_fk 
  AND b.TYPE = 'MEN' 
  AND d.id = b.prof_type_fk;

CREATE OR REPLACE VIEW GLB_V_USER_MENU (
  ID, DESCR, ORDERBY, ENV_FK, SELF_FK, 
  PROF_TYPE_FK, USER_FK, PROF_CODE, 
  PROF_NAME, ORG_FK
) AS 
SELECT 
  ID, 
  DESCR, 
  ORDERBY, 
  ENV_FK, 
  SELF_FK, 
  PROF_TYPE_FK, 
  USER_FK, 
  PROF_CODE, 
  PROF_NAME, 
  ORG_FK 
FROM 
  GLB_V_PROFILE_MENU 
WHERE 
  USER_FK <> 0;

CREATE OR REPLACE VIEW GLB_V_PROF_MENU (
  ID, DESCR, DESCR_MENU, ORDERBY, ENV_FK, 
  SELF_FK, ACTION_FK, PROF_TYPE_FK, 
  USER_FK, PROF_CODE, PROF_NAME, ORG_FK, 
  STATUS, TARGET, ENV_FK_PROF_TYPE, 
  FLG_BASE
) AS 
SELECT 
  ID, 
  DESCR, 
  DESCR_MENU, 
  ORDERBY, 
  ENV_FK, 
  SELF_FK, 
  ACTION_FK, 
  PROF_TYPE_FK, 
  USER_FK, 
  PROF_CODE, 
  PROF_NAME, 
  ORG_FK, 
  STATUS, 
  TARGET, 
  env_fk_prof_type, 
  FLG_BASE 
FROM 
  GLB_V_PROFILE_MENU 
WHERE 
  PROF_TYPE_FK <> 0 
  AND USER_FK = 0;

CREATE OR REPLACE VIEW GLB_MV_TRANSACTION (ID, CODE, DESCR, ENV_FK, STATUS) AS 
select 
  ID, 
  CODE, 
  DESCR, 
  ENV_FK, 
  STATUS 
from 
  tbl_transaction;

CREATE OR REPLACE VIEW GLB_V_PROFILE_TRANS (
  ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, 
  USER_FK, PROF_CODE, PROF_NAME, ORG_FK
) AS 
SELECT 
  a.id, 
  a.code, 
  a.descr, 
  a.env_fk, 
  b.prof_type_fk, 
  b.user_fk, 
  b.prof_code, 
  b.prof_name, 
  b.org_fk 
FROM 
  tbl_transaction a, 
  glb_v_profile b 
WHERE 
  a.id = b.type_fk 
  AND b.TYPE = 'TRANS';

CREATE OR REPLACE VIEW GLB_V_PROF_TRANS(
  ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, 
  USER_FK, PROF_CODE, PROF_NAME, ORG_FK
) AS 
SELECT 
  ID, 
  CODE, 
  DESCR, 
  ENV_FK, 
  PROF_TYPE_FK, 
  USER_FK, 
  PROF_CODE, 
  PROF_NAME, 
  ORG_FK 
FROM 
  GLB_V_PROFILE_TRANS 
WHERE 
  PROF_TYPE_FK <> 0 
  AND USER_FK = 0; 

CREATE OR REPLACE VIEW GLB_V_ORG_TRANS(
  ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, 
  USER_FK, PROF_CODE, PROF_NAME, ORG_FK
) AS 
SELECT 
  ID, 
  CODE, 
  DESCR, 
  ENV_FK, 
  PROF_TYPE_FK, 
  USER_FK, 
  PROF_CODE, 
  PROF_NAME, 
  ORG_FK 
FROM 
  GLB_V_PROFILE_TRANS 
WHERE 
  PROF_TYPE_FK = 0;

CREATE OR REPLACE VIEW GLB_V_USER_TRANS (
  ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, 
  USER_FK, PROF_CODE, PROF_NAME, ORG_FK
) AS 
SELECT 
  ID, 
  CODE, 
  DESCR, 
  ENV_FK, 
  PROF_TYPE_FK, 
  USER_FK, 
  PROF_CODE, 
  PROF_NAME, 
  ORG_FK 
FROM 
  GLB_V_PROFILE_TRANS 
WHERE 
  USER_FK <> 0;
    
-- Views (End)
    
    
-- Completed on 2021-07-12 15:37:14

--
-- PostgreSQL database dump complete
--

