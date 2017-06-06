	 --
	 --	DDL Igrp for H2 DataBase (Begin) 
	 --
	
	CREATE TABLE IF NOT EXISTS `glb_t_user` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `NAME` varchar(100) NOT NULL,
	  `EMAIL` varchar(80) NOT NULL,
	  `PASS_HASH` varchar(65) NOT NULL,
	  `USERPROFILE` varchar(20) NOT NULL DEFAULT 'USER',
	  `VALID_UNTIL` date DEFAULT NULL,
	  `REMARKS` varchar(400) DEFAULT NULL,
	  `ACTIVATION_KEY` varchar(11) DEFAULT NULL,
	  `USER_NAME` varchar(80) NOT NULL,
	  `PHOTO_ID` int(11) DEFAULT NULL,
	  `SIGNATURE_ID` int(11) DEFAULT NULL,
	  `MOBILE` varchar(20) DEFAULT NULL,
	  `PHONE` varchar(20) DEFAULT NULL,
	  `PASSWORD_RESET_TOKEN` varchar(255) DEFAULT NULL,
	  `AUTH_KEY` varchar(255) NOT NULL,
	  `STATUS` smallint(6) NOT NULL DEFAULT '10',
	  `CREATED_AT` bigint(11) NOT NULL,
	  `UPDATED_AT` bigint(11) NOT NULL,
	  
	  PRIMARY KEY (`ID`),
	  UNIQUE KEY `EMAIL` (`EMAIL`),
	  UNIQUE KEY `USER_NAME` (`USER_NAME`)
          
	    
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	CREATE TABLE IF NOT EXISTS `glb_t_env` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `NAME` varchar(100) NOT NULL,
	  `DAD` varchar(30) NOT NULL,
	  `IMG_SRC` varchar(100) DEFAULT 'app_casacidadao.png',
	  `DESCRIPTION` varchar(500) DEFAULT NULL,
	  `ACTION_FK` int(11) DEFAULT NULL,
	  `FLG_OLD` smallint(1) DEFAULT '0',
	  `LINK_MENU` varchar(2000) DEFAULT NULL,
	  `LINK_CENTER` varchar(2000) DEFAULT NULL,
	  `APACHE_DAD` varchar(30) DEFAULT NULL,
	  `TEMPLATES` varchar(30) DEFAULT NULL,
	  `HOST` varchar(30) DEFAULT NULL,
	  `FLG_EXTERNAL` smallint(1) DEFAULT '0',
	  `STATUS` smallint(6) NOT NULL DEFAULT '1',
		PRIMARY KEY (`ID`),
		UNIQUE KEY `DAD` (`DAD`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	CREATE TABLE IF NOT EXISTS `glb_t_action` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `ENV_FK` int(11) NOT NULL,
	  `PAGE` varchar(100) NOT NULL,
	  `ACTION` varchar(100) NOT NULL,
	  `TABLE_NAME` varchar(80) DEFAULT NULL,
	  `XSL_SRC` varchar(1000) DEFAULT NULL,
	  `IMG_SRC` varchar(100) DEFAULT NULL,
	  `PAGE_TYPE` varchar(10) DEFAULT NULL,
	  `PAGE_DESCR` varchar(100) DEFAULT NULL,
	  `ACTION_DESCR` varchar(100) DEFAULT NULL,
	  `FLG_MENU` smallint(6) DEFAULT '0',
	  `FLG_TRANSACTION` smallint(6) DEFAULT '0',
	  `SELF_ID` int(11) DEFAULT NULL,
	  `SELF_FW_ID` int(11) DEFAULT NULL,
	  `VERSION` varchar(3) DEFAULT '2.3',
	  `DB_CONNECTION` varchar(100) DEFAULT NULL,
	  `FLG_OFFLINE` smallint(6) DEFAULT '0',
	  `FLG_INTERNET` smallint(6) DEFAULT '0',
	  `STATUS` smallint(6) DEFAULT '1',
	  
	   PRIMARY KEY (`ID`),
		UNIQUE KEY `GLB_T_ACTION_UK` (`ENV_FK`,`PAGE`,`ACTION`),
		CONSTRAINT `GLB_T_ACTION_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	  
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	CREATE TABLE IF NOT EXISTS `glb_t_config` (
	  `NAME` varchar(30) DEFAULT NULL,
	  `VALUE` varchar(4000) NOT NULL,
		UNIQUE KEY `NAME` (`NAME`)
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	CREATE TABLE IF NOT EXISTS `glb_t_config_env` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `PORT` int(11) DEFAULT NULL,
	  `TYPE_DB` varchar(8) NOT NULL,
	  `HOST` varchar(100) NOT NULL,
	  `NAME_DB` varchar(100) NOT NULL,
	  `USERNAME` varchar(250) NOT NULL,
	  `PASSWORD` varchar(1000) NOT NULL,
	  `CHARSET` varchar(20) NOT NULL,
	  `NAME` varchar(20) NOT NULL,
	  `ENV_FK` int(11) NOT NULL,
	  PRIMARY KEY (`ID`),
	  CONSTRAINT `CONFIG_ENV_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	CREATE TABLE IF NOT EXISTS `glb_t_organization` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `CODE` varchar(50) NOT NULL,
	  `NAME` varchar(1000) NOT NULL,
	  `SIGOF_FK` int(11) DEFAULT NULL,
	  `ENV_FK` int(11) NOT NULL,
	  `STATUS` smallint(6) NOT NULL DEFAULT '1',
	  `USER_CREATE_FK` int(11) DEFAULT NULL,
	  `SELF_FK` int(11) DEFAULT NULL,
	   PRIMARY KEY (`ID`),
		UNIQUE KEY `CODE` (`CODE`),
		UNIQUE KEY `GLB_T_ORGANIZATION_UK` (`CODE`,`ENV_FK`),
		CONSTRAINT `GLB_T_ORGANIZATION_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT `GLB_T_ORGANIZATION_SELF_FK` FOREIGN KEY (`SELF_FK`) REFERENCES `glb_t_organization` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT `GLB_T_ORG_USER_CREATE_FK` FOREIGN KEY (`USER_CREATE_FK`) REFERENCES `glb_t_user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	CREATE TABLE IF NOT EXISTS `glb_t_menu` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `DESCR` varchar(100) NOT NULL,
	  `LINK` varchar(200) DEFAULT NULL,
	  `SELF_ID` int(11) DEFAULT NULL,
	  `ENV_FK` int(11) NOT NULL,
	  `IMG_SRC` varchar(200) DEFAULT NULL,
	  `AREA` varchar(20) DEFAULT NULL,
	  `ACTION_FK` int(11) DEFAULT NULL,
	  `ORDERBY` int(11) DEFAULT NULL,
	  `STATUS` smallint(6) DEFAULT '1',
	  `CODE` varchar(20) DEFAULT NULL,
	  `FLG_BASE` smallint(6) DEFAULT '0',
	  `TARGET` varchar(20) DEFAULT '_self',
		PRIMARY KEY (`ID`),
		CONSTRAINT `GLB_T_MENU_ACTION_FK` FOREIGN KEY (`ACTION_FK`) REFERENCES `glb_t_action` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT `GLB_T_MENU_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT `GLB_T_MENU_SELF_FK` FOREIGN KEY (`SELF_ID`) REFERENCES `glb_t_menu` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	
	CREATE TABLE IF NOT EXISTS `glb_t_profile_type` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `DESCR` varchar(50) NOT NULL,
	  `CODE` varchar(20) DEFAULT NULL,
	  `ENV_FK` int(11) DEFAULT NULL,
	  `SELF_FK` int(11) DEFAULT NULL,
	  `ORG_FK` int(11) DEFAULT NULL,
	  `STATUS` smallint(6) DEFAULT '1',
	  
	   PRIMARY KEY (`ID`),
	   UNIQUE KEY `GLB_T_PROFILE_TYPE_UK` (`CODE`,`ENV_FK`,`ORG_FK`),
	   CONSTRAINT `GLB_T_PROFILE_TYPE_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT `GLB_T_PROFILE_TYPE_ORG_FK` FOREIGN KEY (`ORG_FK`) REFERENCES `glb_t_organization` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
       CONSTRAINT `GLB_T_PROF_TYPE_SELF_FK` FOREIGN KEY (`SELF_FK`) REFERENCES `glb_t_profile_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	
	CREATE TABLE IF NOT EXISTS `glb_t_transaction` (
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `CODE` varchar(150) NOT NULL,
	  `DESCR` varchar(250) DEFAULT NULL,
	  `ENV_FK` int(11) DEFAULT NULL,
	  `STATUS` smallint(6) NOT NULL DEFAULT '1',

	  PRIMARY KEY (`ID`),
	  UNIQUE KEY `GLB_T_TRANSACTION_UK_CODE` (`CODE`),
	  UNIQUE KEY `GLB_T_TRANSACTION_UK_ENV` (`ENV_FK`,`CODE`),
      CONSTRAINT `GLB_T_TRANSACTION_ENV_FK` FOREIGN KEY (`ENV_FK`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	CREATE TABLE IF NOT EXISTS `glb_t_profile` (
	  `PROF_TYPE_FK` int(11) NOT NULL,
	  `USER_FK` int(11) NOT NULL,
	  `TYPE` varchar(20) NOT NULL,
	  `TYPE_FK` int(11) NOT NULL,
	  `ORG_FK` int(11) NOT NULL,

	 PRIMARY KEY (`PROF_TYPE_FK`,`USER_FK`,`TYPE`,`TYPE_FK`,`ORG_FK`),
	 CONSTRAINT `GLB_T_PROFILE_ORG_FK` FOREIGN KEY (`ORG_FK`) REFERENCES `glb_t_organization` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
	 CONSTRAINT `GLB_T_PROFILE_TYPE_FK` FOREIGN KEY (`PROF_TYPE_FK`) REFERENCES `glb_t_profile_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
	 CONSTRAINT `GLB_T_PROFILE_USER_FK` FOREIGN KEY (`USER_FK`) REFERENCES `glb_t_user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	
	CREATE TABLE  IF NOT EXISTS GLB_T_SESSION 
	(  
	  `ID` int(11) NOT NULL AUTO_INCREMENT,
	  `SESSION_ID` char(50), 
	  `START_TIME` bigint(11), 
	  `END_TIME` bigint(11), 
	  `USER_ID` int(10), 
	  `IP_ADDRESS` char(15), 
	  `USER_NAME` char(50), 
	  `ENV_ID` int(10) DEFAULT 1 NOT NULL, 
	  `TARGET` char(20), 
	  `ORG_ID` int(10), 
	  `PROF_TYPE_ID` int(10), 
	  `HTTPS` smallint(1) DEFAULT '0', 
	  `SESSION_OLD_ID` char(50) , 
	  `HOST` char(30), 
	  `HOST_NAME` char(100), 
	  `MEDIA_TYPE` char(30), 
	  PRIMARY KEY (`ID`),
	  UNIQUE KEY `GLB_T_SESSION_SESSION_ID` (`SESSION_ID`),
	  CONSTRAINT `GLB_T_SESSION_ENV_FK` FOREIGN KEY (`ENV_ID`) REFERENCES `glb_t_env` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
	  CONSTRAINT `GLB_T_SESSION_USER_FK` FOREIGN KEY (`USER_ID`) REFERENCES `glb_t_user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
	  CONSTRAINT `GLB_T_SESSION_ORG_FK` FOREIGN KEY (`ORG_ID`) REFERENCES `glb_t_organization` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
	  CONSTRAINT `GLB_T_SESSION_PROF_TYPE_FK` FOREIGN KEY (`PROF_TYPE_ID`) REFERENCES `glb_t_profile_type` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
	  
	)  ENGINE=InnoDB DEFAULT CHARSET=utf8;

----------------------------- CREATE VIEWS ------------------------------------
 CREATE OR REPLACE FORCE VIEW GLB_MV_ALL_MENUS (`ID`, `DESCR`, `DESCR_MENU`, `LINK`, `SELF_ID`, `ENV_FK`, `IMG_SRC`, `AREA`, `ACTION_FK`, `ORDERBY`) AS 
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
 
  CREATE OR REPLACE FORCE VIEW GLB_MV_MENU (`ID`, `DESCR`, `LINK`, `SELF_ID`, `ENV_FK`, `IMG_SRC`, `AREA`, `ACTION_FK`, `ORDERBY`, `STATUS`, `CODE`, `FLG_BASE`, `TARGET`) AS 
  	SELECT `ID`,`DESCR`,`LINK`,`SELF_ID`,`ENV_FK`,`IMG_SRC`,`AREA`,`ACTION_FK`,`ORDERBY`,`STATUS`,`CODE`,`FLG_BASE`,`TARGET` 
  	FROM GLB_T_MENU;
  
  CREATE OR REPLACE FORCE VIEW GLB_V_MENU (`ID`, `DESCR`, `DESCR_MENU`, `LINK`, `SELF_ID`, `ENV_FK`, `IMG_SRC`, `AREA`, `ACTION_FK`, `ORDERBY`) AS 
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
  
  CREATE OR REPLACE FORCE VIEW GLB_V_ORG_MENU (`ID`, `DESCR`, `ORDERBY`, `ENV_FK`, `SELF_ID`, `PROF_TYPE_FK`, `USER_FK`, `PROF_CODE`, `PROF_NAME`, `ORG_FK`, `FLG_BASE`) AS 
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
  


 CREATE OR REPLACE FORCE VIEW GLB_MV_PROFILE (`PROF_TYPE_FK`, `USER_FK`, `TYPE`, `TYPE_FK`, `ORG_FK`) AS 
  SELECT `PROF_TYPE_FK`,`USER_FK`,`TYPE`,`TYPE_FK`,`ORG_FK` 
  FROM GLB_T_PROFILE;
 
 CREATE OR REPLACE FORCE VIEW GLB_MV_PROFILE_TYPE (`ID`, `DESCR`, `CODE`, `ENV_FK`, `SELF_FK`, `STATUS`, `ORG_FK`) AS 
   SELECT `ID`,`DESCR`,`CODE`,`ENV_FK`,`SELF_FK`,`STATUS`,`ORG_FK` 
   FROM GLB_T_PROFILE_TYPE;
 
 CREATE OR REPLACE FORCE VIEW GLB_V_PROFILE(`ORG_FK`, `PROF_TYPE_FK`, `USER_FK`, `TYPE`, `TYPE_FK`, `PROF_CODE`, `PROF_NAME`, `PROF_NAME_DESC`, `ENV_FK`, `SELF_FK`) AS 
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
 
 CREATE OR REPLACE FORCE VIEW GLB_V_PROFILE_MENU (`ID`, `DESCR`, `DESCR_MENU`, `ORDERBY`, `ENV_FK`, `SELF_ID`, `ACTION_FK`, `PROF_TYPE_FK`, `USER_FK`, `PROF_CODE`, `PROF_NAME`, `ORG_FK`) AS 
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
  
 CREATE OR REPLACE FORCE VIEW GLB_V_USER_MENU (`ID`, `DESCR`, `ORDERBY`, `ENV_FK`, `SELF_ID`, `PROF_TYPE_FK`, `USER_FK`, `PROF_CODE`, `PROF_NAME`, `ORG_FK`) AS 
  SELECT `ID`,`DESCR`,`ORDERBY`,`ENV_FK`,`SELF_ID`,`PROF_TYPE_FK`,`USER_FK`,`PROF_CODE`,`PROF_NAME`,`ORG_FK` 
  FROM GLB_V_PROFILE_MENU 
  WHERE USER_FK<>0;
 
  CREATE OR REPLACE FORCE VIEW GLB_V_PROF_MENU (`ID`, `DESCR`, `DESCR_MENU`, `ORDERBY`, `ENV_FK`, `SELF_ID`, `ACTION_FK`, `PROF_TYPE_FK`, `USER_FK`, `PROF_CODE`, `PROF_NAME`, `ORG_FK`) AS 
 	SELECT  `ID`,
            `DESCR`,
            `DESCR_MENU`,
            `ORDERBY`,
            `ENV_FK`,
            `SELF_ID`,
            `ACTION_FK`,
            `PROF_TYPE_FK`,
            `USER_FK`,
            `PROF_CODE`,
            `PROF_NAME`,
            `ORG_FK`,
            `STATUS`,
            `TARGET`,
            `env_fk_prof_type`
 	FROM  GLB_V_PROFILE_MENU
 	WHERE  PROF_TYPE_FK <> 0 AND USER_FK = 0;
 	
 	
 CREATE OR REPLACE FORCE VIEW GLB_MV_TRANSACTION (`ID`, `CODE`, `DESCR`, `ENV_FK`, `STATUS`) AS 
  select `ID`,`CODE`,`DESCR`,`ENV_FK`,`STATUS` from GLB_T_TRANSACTION;
  

  CREATE OR REPLACE FORCE VIEW GLB_V_PROFILE_TRANS (`ID`, `CODE`, `DESCR`, `ENV_FK`, `PROF_TYPE_FK`, `USER_FK`, `PROF_CODE`, `PROF_NAME`, `ORG_FK`) AS 
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
  
  CREATE OR REPLACE FORCE VIEW GLB_V_PROF_TRANS(`ID`, `CODE`, `DESCR`, `ENV_FK`, `PROF_TYPE_FK`, `USER_FK`, `PROF_CODE`, `PROF_NAME`, `ORG_FK`) AS 
  SELECT `ID`,`CODE`,`DESCR`,`ENV_FK`,`PROF_TYPE_FK`,`USER_FK`,`PROF_CODE`,`PROF_NAME`,`ORG_FK` FROM GLB_V_PROFILE_TRANS WHERE PROF_TYPE_FK<>0 AND USER_FK=0;

  CREATE OR REPLACE FORCE VIEW GLB_V_ORG_TRANS(`ID`, `CODE`, `DESCR`, `ENV_FK`, `PROF_TYPE_FK`, `USER_FK`, `PROF_CODE`, `PROF_NAME`, `ORG_FK`) AS 
  SELECT `ID`,`CODE`,`DESCR`,`ENV_FK`,`PROF_TYPE_FK`,`USER_FK`,`PROF_CODE`,`PROF_NAME`,`ORG_FK` FROM GLB_V_PROFILE_TRANS WHERE PROF_TYPE_FK=0;
  
  CREATE OR REPLACE FORCE VIEW GLB_V_USER_TRANS (`ID`, `CODE`, `DESCR`, `ENV_FK`, `PROF_TYPE_FK`, `USER_FK`, `PROF_CODE`, `PROF_NAME`, `ORG_FK`) AS 
  SELECT `ID`,`CODE`,`DESCR`,`ENV_FK`,`PROF_TYPE_FK`,`USER_FK`,`PROF_CODE`,`PROF_NAME`,`ORG_FK` FROM GLB_V_PROFILE_TRANS WHERE USER_FK<>0;
 
  ----------------------------- END CREATE VIEWS --------------------------------
	
	--
	--	DDL Igrp for H2 DataBase (End)
	--
	
	
/*	-------------------------------- Base dados do demo Marcacao de consultas --------------------------------------	 
*/
-- --------------------------------------------------------
--
-- Estrutura da tabela `tbl_medico`
--

CREATE TABLE  IF NOT EXISTS `tbl_medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(100) NOT NULL,
  `num_consulta_dia` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_utente`
--

CREATE TABLE  IF NOT EXISTS `tbl_utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `morada` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estrutura da tabela `tbl_marcao_consulta`
--

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `tbl_marcao_consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_medico` int(11) NOT NULL,
  `id_utente` int(11) NOT NULL,
  `data_consulta` datetime NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  CONSTRAINT `tbl_medico_fk` FOREIGN KEY (`id_medico`) REFERENCES `tbl_medico` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_utente_fk` FOREIGN KEY (`id_utente`) REFERENCES `tbl_utente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	
[SPLIT]
	INSERT INTO tbl_medico(id,nome,morada,num_consulta_dia) values (1,'Agostinho','Palmarejo',2), (2,'Eliza Barbosa','Fazenda',3);
	INSERT INTO tbl_utente(id,nome,morada,data_nascimento,sexo) values (1,'Zequinha','Achadinha','2000-01-30',2), (2,'Maria','Safende','1995-01-25',1), (3,'Jidea','Castelao','1949-03-20',1), (4,'Ana','Achada Mato','1969-03-20',1), (5,'Paulinho','Achada Grande Frente','1989-03-20',2);
	INSERT INTO tbl_marcao_consulta(id,id_medico,id_utente,data_consulta,estado) values (1,1,1,'2017-01-30 00:00:00.0',1), (2,2,2,'2017-01-30 00:00:00.0',1), (3,1,2,'2016-12-30 00:00:00.0',1), (4,1,3,'2016-12-30 00:00:00.0',1), (5,2,4,'2016-12-30 00:00:00.0',1), (6,2,5,'2017-05-30 00:00:00.0',1);

	--
	--	DML (insert) Igrp for H2 DataBase (Begin)
	--
	
	INSERT INTO `glb_t_env` (`ID`, `NAME`, `DAD`, `IMG_SRC`, `DESCRIPTION`, `ACTION_FK`, `FLG_OLD`, `LINK_MENU`, `LINK_CENTER`, `APACHE_DAD`, `TEMPLATES`, `HOST`, `FLG_EXTERNAL`, `STATUS`) 
	VALUES (1, 'igrp', 'igrp', 'app_casacidadao.png', 'IGRP Open Source', 1, 0, NULL, NULL, NULL, NULL, '', NULL, 1);
	
	INSERT INTO `glb_t_action` (`ID`,`ENV_FK`, `PAGE`, `ACTION`,  `XSL_SRC`) 
	VALUES
		(1,1, 'ListaPage', 'index', 'images/IGRP/IGRP2.3/app/igrp/listapage/ListaPage.xsl'),
		(2,1, 'Env', 'index', 'images/IGRP/IGRP2.3/app/igrp/env/Env.xsl'),
		(3,1, 'ListaEnv', 'index', 'images/IGRP/IGRP2.3/app/igrp/listaenv/ListaEnv.xsl'),
		(4,1, 'Dominio', 'index', 'images/IGRP/IGRP2.3/app/igrp/dominio/Dominio.xsl'),
		(5,1, 'NovoDominio', 'index', 'images/IGRP/IGRP2.3/app/igrp/novodominio/NovoDominio.xsl'),
		(6,1, 'PesquisarOrganica', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarorganica/PesquisarOrganica.xsl'),
		(7,1, 'NovaOrganica', 'index', 'images/IGRP/IGRP2.3/app/igrp/novaorganica/NovaOrganica.xsl'),
		(8,1, 'NovoMenu', 'index', 'images/IGRP/IGRP2.3/app/igrp/novomenu/NovoMenu.xsl'),
		(9,1, 'PesquisarMenu', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarmenu/PesquisarMenu.xsl'),
		(10,1, 'NovoPerfil', 'index', 'images/IGRP/IGRP2.3/app/igrp/novoperfil/NovoPerfil.xsl'),
		(11,1, 'PesquisarPerfil', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarperfil/PesquisarPerfil.xsl'),
		(12,1, 'PesquisarUtilizador', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarutilizador/PesquisarUtilizador.xsl'),
		(13,1, 'NovoUtilizador', 'index', 'images/IGRP/IGRP2.3/app/igrp/novoutilizador/NovoUtilizador.xsl'),
		(14,1, 'Settings', 'index', 'images/IGRP/IGRP2.3/app/igrp/settings/Settings.xsl'),
		(15,1, 'RegistarUtilizador', 'index', 'images/IGRP/IGRP2.3/app/igrp/registarutilizador/RegistarUtilizador.xsl'),
		(16,1, 'Transaccao', 'index', 'images/IGRP/IGRP2.3/app/igrp/transaccao/Transaccao.xsl'),
		(17,1, 'Page', 'index', 'images/IGRP/IGRP2.3/app/igrp/page/Page.xsl'),
		(18,1, 'MenuOrganica','index','images/IGRP/IGRP2.3/app/igrp/menuorganica/MenuOrganica.xsl'),
		(19,1, 'ErrorPage','index','images/IGRP/IGRP2.3/app/igrp/errorpage/ErrorPage.xsl'),
		(20,1, 'TransacaoOrganica','index','images/IGRP/IGRP2.3/app/igrp/transacaoorganica/TransacaoOrganica.xsl'),
		(21,1, 'EditarTransacao','index','images/IGRP/IGRP2.3/app/igrp/editartransacao/EditarTransacao.xsl'),
		(22,1, 'Session','index','images/IGRP/IGRP2.3/app/igrp/session/Session.xsl');;
	
	INSERT INTO `glb_t_user` (`ID`, `NAME`, `EMAIL`, `PASS_HASH`, `USERPROFILE`, `VALID_UNTIL`, `REMARKS`, `ACTIVATION_KEY`, `USER_NAME`, `PHOTO_ID`, `SIGNATURE_ID`, `MOBILE`, `PHONE`, `PASSWORD_RESET_TOKEN`, `AUTH_KEY`, `STATUS`, `CREATED_AT`, `UPDATED_AT`) 
	VALUES (0, 'IGRP', 'igrp@nosi.cv', 'admin', 'ADMIN', NULL, NULL, '123456789', 'admin', NULL, NULL, NULL, NULL, NULL, 'SRRKZ1a2n77nDcdLmXBJCt3HQWoRKozc', 1, 2017, 2017),
		   (1, 'Nositeste', 'nositeste@nosi.cv', 'fe01ce2a7fbac8fafaed7c982a04e229', 'ADMIN', NULL, NULL, '123456789', 'demo', NULL, NULL, NULL, NULL, NULL, 'SRRKZ1a2n77nDcdLmXBJCt3HQWoRKozc', 1, 2017, 2017);

	INSERT INTO `glb_t_organization` (`ID`, `CODE`, `NAME`, `SIGOF_FK`, `ENV_FK`, `STATUS`, `USER_CREATE_FK`, `SELF_FK`) 
	VALUES (1, '01.03', 'NOSI', NULL, 1, 1, 1, NULL);

	INSERT INTO `glb_t_profile_type` (`ID`, `DESCR`, `CODE`, `ENV_FK`, `SELF_FK`, `ORG_FK`, `STATUS`) 
	VALUES (0, 'ALL PROFILE', 'ALL', NULL, NULL, NULL, 1),
		   (1, 'Administrador', 'Admin', 1, NULL, 1, 1);
	
	INSERT INTO `glb_t_menu` (`ID`, `DESCR`,`ACTION_FK`, `SELF_ID`, `LINK`, `ENV_FK`, `IMG_SRC`, `AREA`, `ORDERBY`, `STATUS`, `CODE`, `FLG_BASE`, `TARGET`) VALUES
	(1, 'Gestão de Aplicação', NULL, NULL,NULL, 1, NULL, NULL, NULL, 1, NULL, 1, '_self'),
	(2, 'Detalhes de Aplicação', 3, 1,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(3, 'Gestão de Pagina', 1, 1,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(4, 'Gestão de Menu', 9, 1,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(5, 'Parâmetros Gerais', NULL, NULL,NULL, 1, NULL, NULL, NULL, 1, NULL, 1, '_self'),
	(6, 'Gestão de Organica', 6, 5,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(7, 'Gestão de Perfil', 11, 5,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(8, 'Gestão de Utilizador', 12, 5,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(9, 'Settings', 14, 5,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),	
	(10, 'Gestão de Transação', 16, 1,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self'),
	(11, 'Auditoria', NULL, NULL,NULL, 1, NULL, NULL, NULL, 1, NULL, 1, '_self'),
	(12, 'Gestão de Sessão', 22, 11,NULL, 1, NULL, NULL, NULL, 1, NULL, 0, '_self');
	
	INSERT INTO `glb_t_profile` (`PROF_TYPE_FK`, `USER_FK`, `TYPE`, `TYPE_FK`, `ORG_FK`) 
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
		   


-- ------------------------------------------ Config demo app (App marcacao consulta) --------------------------------
INSERT INTO `glb_t_env` (`ID`, `NAME`, `DAD`, `IMG_SRC`, `DESCRIPTION`, `ACTION_FK`, `FLG_OLD`, `LINK_MENU`, `LINK_CENTER`, `APACHE_DAD`, `TEMPLATES`, `HOST`, `FLG_EXTERNAL`, `STATUS`)
	VALUES (2, 'Marcacao de Consulta', 'marcao_consulta', 'icon_saude.png', 'App para marcacao de consulta', 0, 0, '', '', '', '', '', 0, 1);

INSERT INTO `glb_t_organization` (`ID`, `CODE`, `NAME`, `SIGOF_FK`, `ENV_FK`, `STATUS`, `USER_CREATE_FK`, `SELF_FK`) 
	VALUES(2, 'org-m.consulta', 'Tec. Marcacao Consulta',NULL, 2, 1,1, NULL);


INSERT INTO `glb_t_profile_type` (`ID`, `DESCR`, `CODE`, `ENV_FK`, `SELF_FK`, `ORG_FK`, `STATUS`) 
	VALUES (2, 'Tec. Marcacao Consulta', 'Perf-m.consulta', 2,NULL, 2, 1);

INSERT INTO `glb_t_action` (`ID`,`ENV_FK`, `PAGE`, `ACTION`,  `XSL_SRC`,`PAGE_DESCR`,`ACTION_DESCR`) 
	VALUES
	(23, 2, 'ListaMedico', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/listamedico/ListaMedico.xsl','Lista de Medicos', 'Lista de Medicos'),
	(24, 2, 'RegistarMedico', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/registarmedico/RegistarMedico.xsl', 'Registar Medico', 'Registar Medico'),
	(25, 2, 'MarcarConsulta', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/marcarconsulta/MarcarConsulta.xsl','Marcar Consulta', 'Marcar Consulta'),
	(26, 2, 'RegistarUtente', 'index',  'images/IGRP/IGRP2.3/app/marcao_consulta/registarutente/RegistarUtente.xsl','Registar Utente', 'Registar Utente'),
	(27, 2, 'ListarUtente', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/listarutente/ListarUtente.xsl', 'Listar Utente', 'Listar Utente'),
	(28, 2, 'ConsultaPendente', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/consultapendente/ConsultaPendente.xsl', 'Consultas Pendentes', 'Consultas Pendentes'),
	(29, 2, 'DashBoard', 'index', 'images/IGRP/IGRP2.3/app/marcao_consulta/dashboard/DashBoard.xsl', 'Dash Board', 'Dash Board');

INSERT INTO `glb_t_menu` (`ID`, `DESCR`,`ACTION_FK`, `SELF_ID`, `LINK`, `ENV_FK`, `IMG_SRC`, `AREA`, `ORDERBY`, `STATUS`, `CODE`, `FLG_BASE`, `TARGET`) 
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
/**/
INSERT INTO `glb_t_profile` (`PROF_TYPE_FK`, `USER_FK`, `TYPE`, `TYPE_FK`, `ORG_FK`) 
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

