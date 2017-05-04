	
	 -------------------------------------------------------------
	 --	DDL Igrp for H2 DataBase (Begin) 
	 -------------------------------------------------------------
	
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
	  `CREATED_AT` int(11) NOT NULL,
	  `UPDATED_AT` int(11) NOT NULL,
	  
	  PRIMARY KEY (`ID`),
	  UNIQUE KEY `EMAIL` (`EMAIL`),
	  UNIQUE KEY `USER_NAME` (`USER_NAME`),
          
	    
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
		UNIQUE KEY `DAD` (`DAD`),
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
	  `VERSION` varchar(3) DEFAULT '2_2',
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
	
	-------------------------------------------------------------
	--	DDL Igrp for H2 DataBase (End)
	-------------------------------------------------------------
	 
[SPLIT]
	
	-------------------------------------------------------------
	--	DML (nsert) Igrp for H2 DataBase (Begin)
	-------------------------------------------------------------
	
	INSERT INTO `glb_t_env` ( `NAME`, `DAD`, `IMG_SRC`, `DESCRIPTION`, `ACTION_FK`, `FLG_OLD`, `LINK_MENU`, `LINK_CENTER`, `APACHE_DAD`, `TEMPLATES`, `HOST`, `FLG_EXTERNAL`, `STATUS`) 
	VALUES ('igrp', 'igrp', 'app_casacidadao.png', 'IGRP Open Source', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 1)

	INSERT INTO `glb_t_action` (`ENV_FK`, `PAGE`, `ACTION`,  `XSL_SRC`) 
	VALUES
		(3, 'ListaPage', 'index', 'images/IGRP/IGRP2.3/app/igrp/listapage/ListaPage.xsl'),
		(3, 'Env', 'index', 'images/IGRP/IGRP2.3/app/igrp/env/Env.xsl'),
		(3, 'ListaEnv', 'index', 'images/IGRP/IGRP2.3/app/igrp/env/Env.xsl'),
		(3, 'Dominio', 'index', 'images/IGRP/IGRP2.3/app/igrp/dominio/Dominio.xsl'),
		(3, 'NovoDominio', 'index', 'images/IGRP/IGRP2.3/app/igrp/novodominio/NovoDominio.xsl'),
		(3, 'PesquisarOrganica', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarorganica/PesquisarOrganica.xsl'),
		(3, 'NovaOrganica', 'index', 'images/IGRP/IGRP2.3/app/igrp/novaorganica/NovaOrganica.xsl'),
		(3, 'NovoMenu', 'index', 'images/IGRP/IGRP2.3/app/igrp/novomenu/NovoMenu.xsl'),
		(3, 'PesquisarMenu', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarmenu/PesquisarMenu.xsl'),
		(3, 'NovoPerfil', 'index', 'images/IGRP/IGRP2.3/app/igrp/novoperfil/NovoPerfil.xsl'),
		(3, 'PesquisarPerfil', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarperfil/PesquisarPerfil.xsl'),
		(3, 'PesquisarUtilizador', 'index', 'images/IGRP/IGRP2.3/app/igrp/pesquisarutilizador/PesquisarUtilizador.xsl'),
		(3, 'NovoUtilizador', 'index', 'images/IGRP/IGRP2.3/app/igrp/novoutilizador/NovoUtilizador.xsl'),
		(3, 'Settings', 'index', 'images/IGRP/IGRP2.3/app/igrp/settings/Settings.xsl'),
		(3, 'RegistarUtilizador', 'index', 'images/IGRP/IGRP2.3/app/igrp/registarutilizador/RegistarUtilizador.xsl'),
		(3, 'transaccao', 'index', 'images/IGRP/IGRP2.3/app/igrp/transaccao/Transaccao.xsl');
	