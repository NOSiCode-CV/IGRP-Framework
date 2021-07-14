;             
CREATE USER IF NOT EXISTS IGRPWEB SALT '63f694036c5f7e93' HASH 'ad8947847cae4672fbd275f24b9aa7abc01791b3393068ede0ca690741829215' ADMIN;      
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_BEF491FC_F255_4727_8EC2_B6936096CFD3 START WITH 80 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E13A3A34_79E9_4C1A_ADE5_0D0B4B798D2A START WITH 18 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_37A71120_D018_425F_A568_1CC4F7CC0D5F START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FAD439BA_043E_406C_BFA3_2A54F12820F8 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_D5C7A0DF_13DB_4285_AFBF_0FA6D8859061 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_2D9F345B_7712_41DA_9490_66EAD1B74026 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_765A1B32_E2AC_4305_BDCF_576AA023E164 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_D7FCEBFE_400C_4C65_BD7B_AB2D0D62A180 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9029D46C_FC62_483C_8032_3B90D976AAC7 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_87499D0F_507F_465C_8B3F_81C08B8A0130 START WITH 4 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_B8C8E85F_26AF_4485_A6E5_24CF7E79F1E1 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_12C60E8B_6FE0_4785_8482_54EA45314A0B START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_A1FEE0AA_F2B2_4BF6_BE3C_D6168ACE2A91 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_AFBBF751_2E26_45BF_8652_51017026F0E8 START WITH 60 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_ABEE2098_6599_4AA9_91A7_8ADF2C70C67E START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_43ED5D5C_3DBD_4077_9981_61D0B0AF5791 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FD5F1EF5_5233_4DD8_BB37_5384C6B9AEA8 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_A1E354C1_EAC0_468C_8886_88039FD8CD86 START WITH 5 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_47AA055E_6D9B_4DFE_A560_A59E3198558E START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_AD909E26_5E13_4ABD_9224_977D358DB9B4 START WITH 4 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_63FAB58B_036A_4D48_8155_2AA48CF0241A START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_89A5E82C_0CA6_4E01_8666_B71CF1FB57EF START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_2EA3032A_642F_4C74_A2D7_AB622DAD4106 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_D4355EA5_C547_4E65_B470_17AAFDF97F81 START WITH 23 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_631F9C4C_1111_47DB_9EE9_01CF526BC947 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_758CBCB5_07E5_4285_B043_288957419668 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_74748A18_E5DF_4DC8_82B7_312702AB4D7E START WITH 4 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_DC11474F_7F1C_4A52_98AD_FF8D69A88B57 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_426C4440_CF42_4ECC_A816_4A59A033FE81 START WITH 1 BELONGS_TO_TABLE;    
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_A0B725DD_3424_4A5F_B422_D023187E617A START WITH 33 BELONGS_TO_TABLE;   
CREATE SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E16C5FEB_6DDB_4D0C_83D0_C803D17FCF93 START WITH 1 BELONGS_TO_TABLE;    
CREATE CACHED TABLE PUBLIC.GLB_T_ACL(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_631F9C4C_1111_47DB_9EE9_01CF526BC947) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_631F9C4C_1111_47DB_9EE9_01CF526BC947,
    PROCESSKEY VARCHAR(255),
    STATUS INTEGER NOT NULL,
    TASKKEY VARCHAR(255),
    TYPE VARCHAR(255),
    TYPE_FK INTEGER NOT NULL,
    ENV_FK INTEGER,
    ENV_OWNER_FK INTEGER
);    
ALTER TABLE PUBLIC.GLB_T_ACL ADD CONSTRAINT PUBLIC.CONSTRAINT_4 PRIMARY KEY(ID);              
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.GLB_T_ACL;               
CREATE CACHED TABLE PUBLIC.TBL_ACTION(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_BEF491FC_F255_4727_8EC2_B6936096CFD3) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_BEF491FC_F255_4727_8EC2_B6936096CFD3,
    ACTION VARCHAR(255) NOT NULL,
    ACTION_DESCR VARCHAR(255),
    ISCOMPONENT SMALLINT NOT NULL,
    NOMEMODULO VARCHAR(255),
    PACKAGE_NAME VARCHAR(255),
    PAGE VARCHAR(255) NOT NULL,
    PAGE_DESCR VARCHAR(255),
    PROCESSKEY VARCHAR(255),
    STATUS INTEGER NOT NULL,
    TIPO SMALLINT NOT NULL,
    VERSAO VARCHAR(255),
    XMLCONTENT VARCHAR(255),
    XSLCONTENT VARCHAR(255),
    XSL_SRC VARCHAR(255),
    ENV_FK INTEGER NOT NULL
);     
ALTER TABLE PUBLIC.TBL_ACTION ADD CONSTRAINT PUBLIC.CONSTRAINT_4C PRIMARY KEY(ID);            
-- 79 +/- SELECT COUNT(*) FROM PUBLIC.TBL_ACTION;             
INSERT INTO PUBLIC.TBL_ACTION(ID, ACTION, ACTION_DESCR, ISCOMPONENT, NOMEMODULO, PACKAGE_NAME, PAGE, PAGE_DESCR, PROCESSKEY, STATUS, TIPO, VERSAO, XMLCONTENT, XSLCONTENT, XSL_SRC, ENV_FK) VALUES
(1, 'index', 'Page builder', 0, NULL, 'nosi.webapps.igrp_studio.pages.listapage', 'ListaPage', 'Page builder', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/listapage/ListaPage.xsl', 3),
(2, 'index', 'Registar Aplicacao', 0, NULL, 'nosi.webapps.igrp_studio.pages.env', 'Env', 'Registar Aplicacao', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/env/Env.xsl', 3),
(3, 'index', 'Application builder', 0, NULL, 'nosi.webapps.igrp_studio.pages.listaenv', 'ListaEnv', 'Application builder', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/listaenv/ListaEnv.xsl', 3),
(4, 'index', STRINGDECODE('Gest\u00e3o de Dom\u00ednios'), 0, NULL, 'nosi.webapps.igrp.pages.dominio', 'Dominio', STRINGDECODE('Gest\u00e3o de Dom\u00ednios'), NULL, 1, 0, '2.3', NULL, NULL, 'igrp/dominio/Dominio.xsl', 1),
(5, 'index', 'Registar Dominio', 0, NULL, 'nosi.webapps.igrp.pages.novodominio', 'NovoDominio', 'Registar Dominio', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novodominio/NovoDominio.xsl', 1),
(6, 'index', STRINGDECODE('Gest\u00e3o de Organica'), 0, NULL, 'nosi.webapps.igrp.pages.pesquisarorganica', 'PesquisarOrganica', STRINGDECODE('Gest\u00e3o de Organica'), NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisarorganica/PesquisarOrganica.xsl', 1),
(7, 'index', 'Registar Organica', 0, NULL, 'nosi.webapps.igrp.pages.novaorganica', 'NovaOrganica', 'Registar Organica', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novaorganica/NovaOrganica.xsl', 1),
(8, 'index', 'Registar Menu', 0, NULL, 'nosi.webapps.igrp.pages.novomenu', 'NovoMenu', 'Registar Menu', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novomenu/NovoMenu.xsl', 1),
(9, 'index', STRINGDECODE('Gest\u00e3o de Menu'), 0, NULL, 'nosi.webapps.igrp.pages.pesquisarmenu', 'PesquisarMenu', STRINGDECODE('Gest\u00e3o de Menu'), NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisarmenu/PesquisarMenu.xsl', 1),
(10, 'index', 'Registar Perfil', 0, NULL, 'nosi.webapps.igrp.pages.novoperfil', 'NovoPerfil', 'Registar Perfil', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novoperfil/NovoPerfil.xsl', 1),
(11, 'index', STRINGDECODE('Gest\u00e3o de Perfil'), 0, NULL, 'nosi.webapps.igrp.pages.pesquisarperfil', 'PesquisarPerfil', STRINGDECODE('Gest\u00e3o de Perfil'), NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisarperfil/PesquisarPerfil.xsl', 1),
(12, 'index', STRINGDECODE('Gest\u00e3o de Utilizador'), 0, NULL, 'nosi.webapps.igrp.pages.pesquisarutilizador', 'PesquisarUtilizador', STRINGDECODE('Gest\u00e3o de Utilizador'), NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisarutilizador/PesquisarUtilizador.xsl', 1),
(13, 'index', 'Convidar Utilizador', 0, NULL, 'nosi.webapps.igrp.pages.novoutilizador', 'NovoUtilizador', 'Convidar Utilizador', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/novoutilizador/NovoUtilizador.xsl', 1),
(14, 'index', STRINGDECODE('\u00c1rea pessoal'), 0, NULL, 'nosi.webapps.igrp.pages.settings', 'Settings', STRINGDECODE('\u00c1rea pessoal'), NULL, 1, 0, '2.3', NULL, NULL, 'igrp/settings/Settings.xsl', 1),
(15, 'index', 'Registar Utilizador', 0, NULL, 'nosi.webapps.igrp.pages.registarutilizador', 'RegistarUtilizador', 'Registar Utilizador', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/registarutilizador/RegistarUtilizador.xsl', 1),
(16, 'index', 'Transaccao', 0, NULL, 'nosi.webapps.igrp.pages.transaccao', 'Transaccao', 'Transaccao', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/transaccao/Transaccao.xsl', 1),
(17, 'index', 'Registar Pagina', 0, NULL, 'nosi.webapps.igrp.pages.page', 'Page', 'Registar Pagina', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/page/Page.xsl', 1),
(18, 'index', 'Associar Menu a Organica', 0, NULL, 'nosi.webapps.igrp.pages.menuorganica', 'MenuOrganica', 'Associar Menu a Organica', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/menuorganica/MenuOrganica.xsl', 1),
(19, 'index', 'Pagina de Erro', 0, NULL, 'nosi.webapps.igrp.pages.errorpage', 'ErrorPage', 'Pagina de Erro', NULL, 1, 1, '2.3', NULL, NULL, 'igrp/errorpage/ErrorPage.xsl', 1),
(20, 'index', 'Associar Transacao a Organica', 0, NULL, 'nosi.webapps.igrp.pages.transacaoorganica', 'TransacaoOrganica', 'Associar Transacao a Organica', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/transacaoorganica/TransacaoOrganica.xsl', 1);     
INSERT INTO PUBLIC.TBL_ACTION(ID, ACTION, ACTION_DESCR, ISCOMPONENT, NOMEMODULO, PACKAGE_NAME, PAGE, PAGE_DESCR, PROCESSKEY, STATUS, TIPO, VERSAO, XMLCONTENT, XSLCONTENT, XSL_SRC, ENV_FK) VALUES
(21, 'index', 'Editar Transacao', 0, NULL, 'nosi.webapps.igrp.pages.editartransacao', 'EditarTransacao', 'Editar Transacao', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/editartransacao/EditarTransacao.xsl', 1),
(22, 'index', 'Gestao de Sessao', 0, NULL, 'nosi.webapps.igrp.pages.session', 'Session', 'Gestao de Sessao', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/session/Session.xsl', 1),
(23, 'index', 'Report Builder', 0, NULL, 'nosi.webapps.igrp_studio.pages.webreport', 'WebReport', 'Report Builder', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/webreport/WebReport.xsl', 3),
(24, 'index', 'Registar Data Source', 0, NULL, 'nosi.webapps.igrp.pages.datasource', 'DataSource', 'Registar Data Source', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/datasource/DataSource.xsl', 1),
(25, 'index', 'Lista de Pagina Para Lookup', 0, NULL, 'nosi.webapps.igrp.pages.lookuplistpage', 'LookupListPage', 'Lista de Pagina Para Lookup', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/lookuplistpage/LookupListPage.xsl', 1),
(26, 'index', 'Migrate IGRP', 0, NULL, 'nosi.webapps.igrp.pages.migrate', 'Migrate', 'Migrate IGRP', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/migrate/Migrate.xsl', 1),
(27, 'index', 'Lista de credenciais OAuth', 0, NULL, 'nosi.webapps.igrp.pages.oauthclientlist', 'OAuthClientList', 'Lista de credenciais OAuth', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/oauthclientlist/OAuthClientList.xsl', 1),
(28, 'index', 'Registar cliente OAuth', 0, NULL, 'nosi.webapps.igrp.pages.oauthclient', 'OAuthClient', 'Registar cliente OAuth', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/oauthclient/OAuthClient.xsl', 1),
(29, 'index', 'Mapa Processo', 0, NULL, 'nosi.webapps.igrp.pages.mapaprocesso', 'MapaProcesso', 'Mapa Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/mapaprocesso/MapaProcesso.xsl', 1),
(30, 'index', 'Execucao Tarefas', 0, NULL, 'nosi.webapps.igrp.pages.execucaotarefas', 'ExecucaoTarefas', 'Execucao Tarefas', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/execucaotarefas/ExecucaoTarefas.xsl', 1),
(31, 'index', 'Lookup Lista Utilizador', 0, NULL, 'nosi.webapps.igrp.pages.lookuplistuser', 'LookupListUser', 'Lookup Lista Utilizador', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/lookuplistuser/LookupListUser.xsl', 1),
(32, 'index', 'Alter prioridade tarefa', 0, NULL, 'nosi.webapps.igrp.pages.alter_prioridade_tarefa', 'Alter_prioridade_tarefa', 'Alter prioridade tarefa', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/alter_prioridade_tarefa/Alter_prioridade_tarefa.xsl', 1),
(33, 'index', 'Transferir tarefas', 0, NULL, 'nosi.webapps.igrp.pages.transferir_tarefas', 'Transferir_tarefas', 'Transferir tarefas', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/transferir_tarefas/Transferir_tarefas.xsl', 1),
(34, 'index', 'BPMN Designer', 0, NULL, 'nosi.webapps.igrp_studio.pages.bpmndesigner', 'BPMNDesigner', 'BPMN Designer', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/bpmndesigner/BPMNDesigner.xsl', 3),
(35, 'index', 'Import export', 0, NULL, 'nosi.webapps.igrp.pages.import_export', 'Import_export', 'Import export', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/import_export/Import_export.xsl', 1),
(36, 'index', 'Import Arquivo', 0, NULL, 'nosi.webapps.igrp_studio.pages.importarquivo', 'ImportArquivo', 'Import Arquivo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/importarquivo/ImportArquivo.xsl', 3),
(37, 'index', STRINGDECODE('Configurar Base de Dados de uma aplica\u00e7\u00e3o'), 0, NULL, 'nosi.webapps.igrp.pages.configdatabase', 'ConfigDatabase', 'Configurar Base de Dados', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/configdatabase/ConfigDatabase.xsl', 1),
(38, 'index', 'Pesquisar BI', 0, NULL, 'nosi.webapps.igrp.pages.pesquisabi', 'PesquisaBI', 'Pesquisar BI', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisabi/PesquisaBI.xsl', 1),
(39, 'index', 'Pesquisar NIF', 0, NULL, 'nosi.webapps.igrp.pages.pesquisanif', 'PesquisaNIF', 'Pesquisar NIF', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisanif/PesquisaNIF.xsl', 1),
(40, 'index', 'Pesquisar Nascimento', 0, NULL, 'nosi.webapps.igrp.pages.pesquisanascimento', 'PesquisaNascimento', 'Pesquisar Nascimento', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisanascimento/PesquisaNascimento.xsl', 1);           
INSERT INTO PUBLIC.TBL_ACTION(ID, ACTION, ACTION_DESCR, ISCOMPONENT, NOMEMODULO, PACKAGE_NAME, PAGE, PAGE_DESCR, PROCESSKEY, STATUS, TIPO, VERSAO, XMLCONTENT, XSLCONTENT, XSL_SRC, ENV_FK) VALUES
(41, 'index', 'Gestao de Acesso', 0, NULL, 'nosi.webapps.igrp.pages.gestaodeacesso', 'Gestaodeacesso', 'Gestao de Acesso', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/gestaodeacesso/Gestaodeacesso.xsl', 1),
(42, 'index', 'O que fazer dentro do IGRP JAVA...', 0, NULL, 'nosi.webapps.tutorial.pages.geralapresentacao', 'GeralApresentacao', 'O que fazer dentro do IGRP JAVA...', NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/geralapresentacao/GeralApresentacao.xsl', 2),
(43, 'index', 'HomeStudio', 0, NULL, 'nosi.webapps.igrp_studio.pages.homestudio', 'HomeStudio', 'HomeStudio', NULL, 0, 0, '2.3', NULL, NULL, 'igrp_studio/homestudio/HomeStudio.xsl', 3),
(44, 'index', 'CRUD Generator', 0, NULL, 'nosi.webapps.igrp_studio.pages.crudgenerator', 'CRUDGenerator', 'CRUDGenerator', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/crudgenerator/CRUDGenerator.xsl', 3),
(45, 'index', 'LdapUser', 0, NULL, 'nosi.webapps.igrp.pages.ldapuser', 'LdapUser', 'LdapUser', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/ldapuser/LdapUser.xsl', 1),
(46, 'index', 'ChangePassword', 0, NULL, 'nosi.webapps.igrp.pages.changepassword', 'ChangePassword', 'ChangePassword', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/changepassword/ChangePassword.xsl', 1),
(47, 'index', 'Consulta Processo', 0, NULL, 'nosi.webapps.igrp.pages._cons_proc', '_CONS_PROC', 'Consulta Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/_cons_proc/_CONS_PROC.xsl', 1),
(48, 'index', 'Detalhes Processo', 0, NULL, 'nosi.webapps.igrp.pages.detalhesprocesso', 'DetalhesProcesso', 'Detalhes Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/detalhesprocesso/DetalhesProcesso.xsl', 1),
(49, 'index', STRINGDECODE('Partilha Inter-Aplica\u00e7\u00f5es'), 0, NULL, 'nosi.webapps.igrp_studio.pages.partilhageral', 'Partilhageral', STRINGDECODE('Partilha Inter-Aplica\u00e7\u00f5es'), NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/partilhageral/Partilhageral.xsl', 3),
(50, 'index', STRINGDECODE('M\u00f3dulo'), 0, NULL, 'nosi.webapps.igrp_studio.pages.modulo', 'Modulo', STRINGDECODE('M\u00f3dulo'), NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/modulo/Modulo.xsl', 3),
(51, 'index', 'Lookup list organica', 0, NULL, 'nosi.webapps.igrp.pages', 'Lookup_list_organica', 'Lookup list organica', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/lookup_list_organica/Lookup_list_organica.xsl', 1),
(52, 'index', 'SQL Tool', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Sql_tools', 'SQL Tool', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/sql_tools/Sql_tools.xsl', 3),
(53, 'index', 'File', 0, NULL, 'nosi.webapps.igrp.pages', 'File', 'File', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/file/File.xsl', 1),
(54, 'index', 'EtapaAccess', 0, NULL, 'nosi.webapps.igrp.pages', 'Etapaaccess', 'EtapaAccess', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/etapaaccess/Etapaaccess.xsl', 1),
(55, 'index', 'AddFileTask', 0, NULL, 'nosi.webapps.igrp.pages', 'Addfiletask', 'AddFileTask', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/addfiletask/Addfiletask.xsl', 1),
(56, 'index', STRINGDECODE('video gest\u00e3o de aplica\u00e7\u00e3o'), 0, NULL, 'nosi.webapps.tutorial.pages.video_gestao_de_aplicacao', 'Video_gestao_de_aplicacao', STRINGDECODE('video gest\u00e3o de aplica\u00e7\u00e3o'), NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/video_gestao_de_aplicacao/Video_gestao_de_aplicacao.xsl', 2),
(57, 'index', 'video instalar igrp web', 0, NULL, 'nosi.webapps.tutorial.pages.video_instalar_igrp_web', 'Video_instalar_igrp_web', 'video instalar igrp web', NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/video_instalar_igrp_web/Video_instalar_igrp_web.xsl', 2),
(58, 'index', 'video my first app', 0, NULL, 'nosi.webapps.tutorial.pages.video_my_first_app', 'Video_my_first_app', 'video my first app', NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/video_my_first_app/Video_my_first_app.xsl', 2),
(59, 'index', 'File Editor', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'File_editor', 'File Editor', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/file_editor/File_editor.xsl', 3);  
INSERT INTO PUBLIC.TBL_ACTION(ID, ACTION, ACTION_DESCR, ISCOMPONENT, NOMEMODULO, PACKAGE_NAME, PAGE, PAGE_DESCR, PROCESSKEY, STATUS, TIPO, VERSAO, XMLCONTENT, XSLCONTENT, XSL_SRC, ENV_FK) VALUES
(60, 'index', 'Gestao Tipo Documento', 0, NULL, 'nosi.webapps.igrp.pages', 'Gestao_tipo_documento', 'Gestao Tipo Documento', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/gestao_tipo_documento/Gestao_tipo_documento.xsl', 1),
(61, 'index', 'Start Process', 0, NULL, 'nosi.webapps.igrp.pages', 'Startprocess', 'Start Process', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/startprocess/Startprocess.xsl', 1),
(62, 'index', 'Default Page', 0, NULL, 'nosi.webapps.tutorial.pages', 'DefaultPage', 'Default Page', NULL, 1, 0, '2.3', NULL, NULL, 'tutorial/defaultpage/DefaultPage.xsl', 2),
(63, 'index', 'Dash Board Processo', 0, NULL, 'nosi.webapps.igrp.pages', 'Dash_board_processo', 'Dash Board Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/dash_board_processo/Dash_board_processo.xsl', 1),
(64, 'index', 'Lista Tarefa de Processo', 0, NULL, 'nosi.webapps.igrp.pages', 'Lista_terfa_de_processo', 'Lista Tarefa de Processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/lista_terfa_de_processo/Lista_terfa_de_processo.xsl', 1),
(65, 'index', 'Export Wizard Step 1', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Wizard_export_step_1', 'Export Wizard Step 1', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/wizard_export_step_1/Wizard_export_step_1.xsl', 3),
(66, 'index', 'Export Wizard Step 2', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Wizard_export_step_2', 'Export Wizard Step 2', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/wizard_export_step_2/Wizard_export_step_2.xsl', 3),
(67, 'index', 'Reset by email', 0, NULL, 'nosi.webapps.igrp.pages', 'Resetbyemail', 'Reset by email', NULL, 1, 1, '2.3', NULL, NULL, 'igrp/resetbyemail/Resetbyemail.xsl', 1),
(68, 'index', 'Reset password', 0, NULL, 'nosi.webapps.igrp.pages', 'Resetpassword', 'Reset password', NULL, 1, 1, '2.3', NULL, NULL, 'igrp/resetpassword/Resetpassword.xsl', 1),
(69, 'index', 'Oauth2openidwso2', 0, NULL, 'nosi.webapps.igrp.pages', 'Oauth2openidwso2', 'Oauth2openidwso2', NULL, 1, 1, '2.3', NULL, NULL, 'igrp/oauth2openidwso2/Oauth2openidwso2.xsl', 1),
(70, 'index', 'Pesquisa BI-CNI-passport', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_bi_cni_passport', 'Pesquisa BI-CNI-passport', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/pesquisa_bi_cni_passport/Pesquisa_bi_cni_passport.xsl', 3),
(71, 'index', 'Pesquisa NIF', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_nif_rest', 'Pesquisa NIF', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/pesquisa_nif_rest/Pesquisa_nif_rest.xsl', 3),
(72, 'index', 'Pesquisa Geografia', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_geografia', 'Pesquisa Geografia', NULL, 1, 1, '2.3', NULL, NULL, 'igrp_studio/pesquisa_geografia/Pesquisa_geografia.xsl', 3),
(73, 'index', 'Pesquisa nacionalidade', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Pesquisa_nacionalidade', 'Pesquisa nacionalidade', NULL, 1, 1, '2.3', NULL, NULL, 'igrp_studio/pesquisa_nacionalidade/Pesquisa_nacionalidade.xsl', 3),
(74, 'index', 'WSDL2java', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Wsdl2java', 'WSDL2java', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/wsdl2java/Wsdl2java.xsl', 3),
(75, 'index', 'Pesquisa Empresa', 0, NULL, 'nosi.webapps.igrp.pages', 'Pesquisa_empresa', 'Pesquisa Empresa', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/pesquisa_empresa/Pesquisa_empresa.xsl', 1),
(76, 'index', 'DAOGenerator', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Daogenerator', 'DAOGenerator', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/daogenerator/Daogenerator.xsl', 3),
(77, 'index', 'Detalhes dashboard processo', 0, NULL, 'nosi.webapps.igrp.pages', 'Detalhes_dashboard_processo', 'Detalhes dashboard processo', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/detalhes_dashboard_processo/Detalhes_dashboard_processo.xsl', 1),
(78, 'index', 'Historico_page', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Historico_page', 'Historico page', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/historico_page/Historico_page.xsl', 3),
(79, 'index', 'Icons_list', 0, NULL, 'nosi.webapps.igrp.pages', 'Icons_list', 'Icons_list', NULL, 1, 0, '2.3', NULL, NULL, 'igrp/icons_list/Icons_list.xsl', 1),
(80, 'index', 'Migration File Generator', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Migration', 'Migration File Generator', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/migration/Migration.xsl', 3),
(81, 'index', 'Get coordinates', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Get_coordinates', 'Get coordinates', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/get_coordinates/Get_coordinates.xsl', 3),
(82, 'index', 'Config error msg', 0, NULL, 'nosi.webapps.igrp_studio.pages', 'Config_error_msg', 'Config error msg', NULL, 1, 0, '2.3', NULL, NULL, 'igrp_studio/config_error_msg/Config_error_msg.xsl', 3);    
CREATE CACHED TABLE PUBLIC.TBL_ACTIVITY_EXECUTE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_47AA055E_6D9B_4DFE_A560_A59E3198558E) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_47AA055E_6D9B_4DFE_A560_A59E3198558E,
    CUSTOM_PERMISSION TEXT,
    EXECUTION_TYPE VARCHAR(400) NOT NULL,
    PROCCESS_KEY VARCHAR(200) NOT NULL,
    PROCESS_NAME VARCHAR(250),
    PROCESSID VARCHAR(255) NOT NULL,
    TASK_KEY VARCHAR(200) NOT NULL,
    TASKID VARCHAR(255) NOT NULL,
    UPDATEDATETIME TIMESTAMP,
    ENV_FK INTEGER NOT NULL,
    ORG_FK INTEGER NOT NULL,
    PROF_FK INTEGER NOT NULL,
    USER_FK INTEGER
);        
ALTER TABLE PUBLIC.TBL_ACTIVITY_EXECUTE ADD CONSTRAINT PUBLIC.CONSTRAINT_6 PRIMARY KEY(ID);   
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_ACTIVITY_EXECUTE;    
CREATE CACHED TABLE PUBLIC.TBL_CLOB(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_DC11474F_7F1C_4A52_98AD_FF8D69A88B57) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_DC11474F_7F1C_4A52_98AD_FF8D69A88B57,
    C_LOB_CONTENT BINARY(255) NOT NULL,
    CREATEDATETIME TIMESTAMP,
    DT_CREATED DATE NOT NULL,
    DT_UPDATED DATE,
    ESTADO VARCHAR(255),
    MIME_TYPE VARCHAR(255),
    NAME VARCHAR(255),
    UPDATEDATETIME TIMESTAMP,
    UUID VARCHAR(255),
    ENV_FK INTEGER,
    ENV_UPDATED_FK INTEGER,
    USER_CREATED_FK INTEGER
);
ALTER TABLE PUBLIC.TBL_CLOB ADD CONSTRAINT PUBLIC.CONSTRAINT_40 PRIMARY KEY(ID);              
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_CLOB;
CREATE CACHED TABLE PUBLIC.TBL_CONFIG(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_E13A3A34_79E9_4C1A_ADE5_0D0B4B798D2A) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E13A3A34_79E9_4C1A_ADE5_0D0B4B798D2A,
    NAME VARCHAR(255) NOT NULL,
    VALUE VARCHAR(255) NOT NULL
);              
ALTER TABLE PUBLIC.TBL_CONFIG ADD CONSTRAINT PUBLIC.CONSTRAINT_5 PRIMARY KEY(ID);             
-- 17 +/- SELECT COUNT(*) FROM PUBLIC.TBL_CONFIG;             
INSERT INTO PUBLIC.TBL_CONFIG(ID, NAME, VALUE) VALUES
(1, 'url_ativiti_connection', 'http://localhost:8080/activiti-rest/service/'),
(2, 'ativiti_user', 'kermit'),
(3, 'ativiti_password', 'kermit'),
(4, 'igrp_images', 'IGRP'),
(5, 'CLIENT_ID_BIZTALK', 'your id'),
(6, 'TRANSACTION_ID_BIZTALK_PESQUISA_NIF', 'your id'),
(7, 'SERVICE_ID_BIZTALK_PESQUISA_NIF', 'your id'),
(8, 'TRANSACTION_ID_BIZTALK_PESQUISA_GEOGRAFIA', 'your id'),
(9, 'SERVICE_ID_BIZTALK_PESQUISA_GEOGRAFIA', 'your id'),
(10, 'TRANSACTION_ID_BIZTALK_PESQUISA_HIERARQUICA_CAE', 'your id'),
(11, 'SERVICE_ID_BIZTALK_PESQUISA_HIERARQUICA_CAE', 'your id'),
(12, 'TRANSACTION_ID_BIZTALK_PESQUISA_NASCIMENTO', 'your id'),
(13, 'SERVICE_ID_BIZTALK_PESQUISA_NASCIMENTO', 'your id'),
(14, 'TRANSACTION_ID_BIZTALK_PESQUISA_SNIAC', 'your id'),
(15, 'SERVICE_ID_BIZTALK_PESQUISA_SNIAC', 'your id'),
(16, 'TRANSACTION_ID_BIZTALK_PESQUISA_BI', 'your id'),
(17, 'SERVICE_ID_BIZTALK_PESQUISA_BI', 'your id');              
CREATE CACHED TABLE PUBLIC.TBL_CONFIG_ENV(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_63FAB58B_036A_4D48_8155_2AA48CF0241A) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_63FAB58B_036A_4D48_8155_2AA48CF0241A,
    CHARSET VARCHAR(255),
    CONNECTION_IDENTIFY VARCHAR(255),
    DRIVER_CONNECTION VARCHAR(255) NOT NULL,
    HOST VARCHAR(255),
    ISDEFAULT SMALLINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    NAME_DB VARCHAR(255),
    PASSWORD VARCHAR(255) NOT NULL,
    PORT VARCHAR(255),
    TYPE_DB VARCHAR(255) NOT NULL,
    URL_CONNECTION VARCHAR(255) NOT NULL,
    USERNAME VARCHAR(255) NOT NULL,
    ENV_FK INTEGER NOT NULL
);        
ALTER TABLE PUBLIC.TBL_CONFIG_ENV ADD CONSTRAINT PUBLIC.CONSTRAINT_7 PRIMARY KEY(ID);         
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_CONFIG_ENV;          
CREATE CACHED TABLE PUBLIC.TBL_DOMAIN(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_2EA3032A_642F_4C74_A2D7_AB622DAD4106) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_2EA3032A_642F_4C74_A2D7_AB622DAD4106,
    DESCRIPTION VARCHAR(250) NOT NULL,
    DOMAIN_TYPE VARCHAR(8),
    DOMINIO VARCHAR(100) NOT NULL,
    ORDEM INTEGER NOT NULL,
    STATUS VARCHAR(8) NOT NULL,
    VALOR VARCHAR(150) NOT NULL,
    ENV_FK INTEGER
);   
ALTER TABLE PUBLIC.TBL_DOMAIN ADD CONSTRAINT PUBLIC.CONSTRAINT_52 PRIMARY KEY(ID);            
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_DOMAIN;              
CREATE CACHED TABLE PUBLIC.TBL_ENV(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_AD909E26_5E13_4ABD_9224_977D358DB9B4) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_AD909E26_5E13_4ABD_9224_977D358DB9B4,
    DAD VARCHAR(255) NOT NULL,
    DESCRIPTION VARCHAR(255),
    EXTERNO INTEGER NOT NULL,
    IMG_SRC VARCHAR(255),
    NAME VARCHAR(255) NOT NULL,
    PLSQL_CODE VARCHAR(255),
    STATUS INTEGER NOT NULL,
    TEMPLATE VARCHAR(255),
    URL VARCHAR(255),
    ACTION_FK INTEGER
);   
ALTER TABLE PUBLIC.TBL_ENV ADD CONSTRAINT PUBLIC.CONSTRAINT_D PRIMARY KEY(ID);
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.TBL_ENV; 
INSERT INTO PUBLIC.TBL_ENV(ID, DAD, DESCRIPTION, EXTERNO, IMG_SRC, NAME, PLSQL_CODE, STATUS, TEMPLATE, URL, ACTION_FK) VALUES
(1, 'igrp', 'Integrated Government Resource Planning', 0, 'igrp.svg', 'IGRP', NULL, 1, NULL, NULL, NULL),
(2, 'tutorial', 'IGRPweb TODO', 0, 'icon_educacao.png', 'Tutorial IGRP', NULL, 1, NULL, NULL, 42),
(3, 'igrp_studio', '<code/> {Developers}', 0, 'studioSoLogo.svg', 'IGRP Studio', NULL, 1, 'igrp_studio', NULL, 1);              
CREATE CACHED TABLE PUBLIC.TBL_HISTORIC(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_ABEE2098_6599_4AA9_91A7_8ADF2C70C67E) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_ABEE2098_6599_4AA9_91A7_8ADF2C70C67E,
    COMENTARIO VARCHAR(255),
    DATA TIMESTAMP,
    DESCRICAO VARCHAR(255) NOT NULL,
    IDUTILIZADOR INTEGER,
    NOME VARCHAR(255) NOT NULL,
    PAGE_FK INTEGER NOT NULL
);           
ALTER TABLE PUBLIC.TBL_HISTORIC ADD CONSTRAINT PUBLIC.CONSTRAINT_53 PRIMARY KEY(ID);          
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_HISTORIC;            
CREATE CACHED TABLE PUBLIC.TBL_IMPORTEXPORT(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_A1FEE0AA_F2B2_4BF6_BE3C_D6168ACE2A91) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_A1FEE0AA_F2B2_4BF6_BE3C_D6168ACE2A91,
    APLICACAO VARCHAR(255),
    DATA VARCHAR(255),
    TIPO VARCHAR(255),
    USUARIO VARCHAR(255)
);   
ALTER TABLE PUBLIC.TBL_IMPORTEXPORT ADD CONSTRAINT PUBLIC.CONSTRAINT_E PRIMARY KEY(ID);       
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_IMPORTEXPORT;        
CREATE CACHED TABLE PUBLIC.TBL_MAPPING(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_2D9F345B_7712_41DA_9490_66EAD1B74026) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_2D9F345B_7712_41DA_9490_66EAD1B74026,
    DAD_DESTINO VARCHAR(255),
    DAD_ORIGEM VARCHAR(255),
    TIPO INTEGER NOT NULL,
    VALOR_DESTINO VARCHAR(255),
    VALOR_ORIGEM VARCHAR(255)
);      
ALTER TABLE PUBLIC.TBL_MAPPING ADD CONSTRAINT PUBLIC.CONSTRAINT_C PRIMARY KEY(ID);            
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_MAPPING;             
CREATE CACHED TABLE PUBLIC.TBL_MENU(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_D4355EA5_C547_4E65_B470_17AAFDF97F81) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_D4355EA5_C547_4E65_B470_17AAFDF97F81,
    DESCR VARCHAR(255) NOT NULL,
    FLG_BASE INTEGER NOT NULL,
    LINK VARCHAR(2000),
    MENU_ICON VARCHAR(255),
    ORDERBY INTEGER NOT NULL,
    STATUS INTEGER NOT NULL,
    TARGET VARCHAR(255),
    ACTION_FK INTEGER,
    ENV_FK INTEGER NOT NULL,
    SELF_FK INTEGER
);        
ALTER TABLE PUBLIC.TBL_MENU ADD CONSTRAINT PUBLIC.CONSTRAINT_404 PRIMARY KEY(ID);             
-- 22 +/- SELECT COUNT(*) FROM PUBLIC.TBL_MENU;               
INSERT INTO PUBLIC.TBL_MENU(ID, DESCR, FLG_BASE, LINK, MENU_ICON, ORDERBY, STATUS, TARGET, ACTION_FK, ENV_FK, SELF_FK) VALUES
(1, STRINGDECODE('Gest\u00e3o de Aplica\u00e7\u00e3o'), 0, NULL, NULL, 98, 1, NULL, NULL, 1, NULL),
(2, 'Parametros Gerais', 0, NULL, NULL, 98, 1, NULL, NULL, 1, NULL),
(3, 'Auditoria', 0, NULL, NULL, 98, 1, NULL, NULL, 1, NULL),
(4, 'IGRP Studio', 0, NULL, NULL, 1, 1, NULL, NULL, 3, NULL),
(5, 'Application Builder', 1, NULL, NULL, 98, 1, '_self', 3, 3, 4),
(6, 'Home - Page Builder', 0, NULL, NULL, 0, 1, '_self', 1, 3, 6),
(7, 'Report Designer', 0, NULL, NULL, 4, 1, '_self', 23, 3, 4),
(8, STRINGDECODE('Gest\u00e3o de Menu'), 0, NULL, NULL, 7, 0, '_self', 9, 1, 1),
(9, STRINGDECODE('Gest\u00e3o de Transa\u00e7\u00e3o'), 0, NULL, NULL, 8, 0, '_self', 16, 1, 1),
(10, STRINGDECODE('Gest\u00e3o de Acesso'), 1, NULL, NULL, 999, 1, '_self', 41, 1, 10),
(11, STRINGDECODE('Gest\u00e3o de Utilizador'), 0, NULL, NULL, 9, 0, '_self', 12, 1, 1),
(12, STRINGDECODE('\u00c1rea Pessoal'), 1, NULL, NULL, 1, 1, '_self', 14, 1, 12),
(13, 'BPMN Designer', 0, NULL, NULL, 1, 1, '_self', 34, 3, 4),
(14, 'CRUD Generator', 0, NULL, NULL, 1, 1, '_self', 44, 3, 4),
(15, 'Consultar Processo', 1, NULL, NULL, 90, 1, '_self', 47, 1, 15),
(16, 'OAuth Client Id', 0, NULL, NULL, 99, 0, '_self', 27, 1, 16),
(17, STRINGDECODE('Partilha Inter-Aplica\u00e7\u00f5es'), 1, NULL, NULL, 98, 1, '_self', 49, 3, 17),
(18, 'SQL Tool', 0, NULL, NULL, 99, 1, 'modal', 52, 3, 18),
(19, 'Migrate IGRP', 0, NULL, NULL, 99, 1, '_self', 26, 1, 19),
(20, 'Gestao tipo documento', 0, NULL, NULL, 99, 1, '_self', 60, 1, 20),
(21, STRINGDECODE('Gest\u00e3o de Dom\u00ednio'), 1, NULL, NULL, 99, 1, '_self', 4, 1, 21),
(22, 'WSDL2Java', 0, NULL, NULL, 99, 1, 'modal', 74, 3, 22),
(23, 'Migration File Generator', 0, NULL, NULL, 10, 1, '_self', 80, 3, 23);
CREATE CACHED TABLE PUBLIC.TBL_MODULO(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_FD5F1EF5_5233_4DD8_BB37_5384C6B9AEA8) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FD5F1EF5_5233_4DD8_BB37_5384C6B9AEA8,
    DESCRICAO VARCHAR(255),
    NAME VARCHAR(255) NOT NULL,
    ENV_FK INTEGER NOT NULL
);     
ALTER TABLE PUBLIC.TBL_MODULO ADD CONSTRAINT PUBLIC.CONSTRAINT_61 PRIMARY KEY(ID);            
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_MODULO;              
CREATE CACHED TABLE PUBLIC.TBL_ORGANIZATION(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_87499D0F_507F_465C_8B3F_81C08B8A0130) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_87499D0F_507F_465C_8B3F_81C08B8A0130,
    CODE VARCHAR(255) NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    PLSQL_CODE VARCHAR(255),
    STATUS INTEGER NOT NULL,
    ENV_FK INTEGER NOT NULL,
    SELF_FK INTEGER,
    USER_CREATED_FK INTEGER
);           
ALTER TABLE PUBLIC.TBL_ORGANIZATION ADD CONSTRAINT PUBLIC.CONSTRAINT_8 PRIMARY KEY(ID);       
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.TBL_ORGANIZATION;        
INSERT INTO PUBLIC.TBL_ORGANIZATION(ID, CODE, NAME, PLSQL_CODE, STATUS, ENV_FK, SELF_FK, USER_CREATED_FK) VALUES
(1, '01.03', 'IGRP', NULL, 1, 1, NULL, 1),
(2, 'org.tutorial', 'Tutorial', NULL, 1, 2, NULL, 1),
(3, 'org.developer', 'Developers', NULL, 1, 3, NULL, 1); 
CREATE CACHED TABLE PUBLIC.TBL_PROFILE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_AFBBF751_2E26_45BF_8652_51017026F0E8) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_AFBBF751_2E26_45BF_8652_51017026F0E8,
    TYPE VARCHAR(255) NOT NULL,
    TYPE_FK INTEGER NOT NULL,
    ORG_FK INTEGER NOT NULL,
    PROF_TYPE_FK INTEGER NOT NULL,
    USER_FK INTEGER
);        
ALTER TABLE PUBLIC.TBL_PROFILE ADD CONSTRAINT PUBLIC.CONSTRAINT_7F PRIMARY KEY(ID);           
-- 59 +/- SELECT COUNT(*) FROM PUBLIC.TBL_PROFILE;            
INSERT INTO PUBLIC.TBL_PROFILE(ID, TYPE, TYPE_FK, ORG_FK, PROF_TYPE_FK, USER_FK) VALUES
(1, 'ENV', 1, 1, 2, 2),
(2, 'PROF', 2, 1, 2, 2),
(3, 'ENV', 2, 2, 3, 2),
(4, 'PROF', 3, 2, 3, 2),
(5, 'ENV', 3, 3, 4, 2),
(6, 'PROF', 4, 3, 4, 2),
(7, 'ENV', 1, 1, 2, 1),
(8, 'PROF', 2, 1, 2, 1),
(9, 'ENV', 2, 2, 3, 1),
(10, 'PROF', 3, 2, 3, 1),
(11, 'ENV', 3, 3, 4, 1),
(12, 'PROF', 4, 3, 4, 1),
(13, 'MEN', 5, 1, 2, 1),
(14, 'MEN', 5, 1, 1, 1),
(15, 'MEN', 5, 3, 1, 1),
(16, 'MEN', 6, 3, 1, 1),
(17, 'MEN', 7, 3, 1, 1),
(18, 'MEN', 8, 1, 1, 1),
(19, 'MEN', 9, 1, 1, 1),
(20, 'MEN', 10, 1, 1, 1),
(21, 'MEN', 11, 1, 1, 1),
(22, 'MEN', 12, 1, 1, 1),
(23, 'MEN', 16, 1, 1, 1),
(24, 'MEN', 8, 3, 1, 1),
(25, 'MEN', 9, 3, 1, 1),
(26, 'MEN', 10, 3, 1, 1),
(27, 'MEN', 13, 3, 1, 1),
(28, 'MEN', 14, 3, 1, 1),
(29, 'MEN', 15, 1, 1, 1),
(30, 'MEN', 15, 3, 1, 1),
(31, 'MEN', 5, 3, 4, 1),
(32, 'MEN', 6, 3, 4, 1),
(33, 'MEN', 7, 3, 4, 1),
(34, 'MEN', 8, 1, 2, 1),
(35, 'MEN', 9, 1, 2, 1),
(36, 'MEN', 10, 1, 2, 1),
(37, 'MEN', 11, 1, 2, 1),
(38, 'MEN', 12, 1, 2, 1),
(39, 'MEN', 15, 1, 2, 1),
(40, 'MEN', 16, 1, 2, 1),
(41, 'MEN', 8, 3, 4, 1),
(42, 'MEN', 9, 3, 4, 1),
(43, 'MEN', 10, 3, 4, 1),
(44, 'MEN', 13, 3, 4, 1),
(45, 'MEN', 14, 3, 4, 1),
(46, 'MEN', 15, 3, 4, 1),
(47, 'MEN', 17, 3, 1, 1),
(48, 'MEN', 17, 1, 2, 1),
(49, 'MEN', 17, 3, 4, 1),
(50, 'MEN', 18, 3, 1, 1),
(51, 'MEN', 18, 3, 4, 1),
(52, 'MEN', 19, 1, 1, 1),
(53, 'MEN', 19, 1, 2, 1),
(54, 'MEN', 20, 3, 1, 1),
(55, 'MEN', 20, 3, 4, 1),
(56, 'MEN', 21, 3, 1, 1),
(57, 'MEN', 21, 3, 4, 1),
(58, 'MEN', 22, 3, 1, 1),
(59, 'MEN', 22, 3, 4, 1);             
CREATE CACHED TABLE PUBLIC.TBL_PROFILE_TYPE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_A1E354C1_EAC0_468C_8886_88039FD8CD86) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_A1E354C1_EAC0_468C_8886_88039FD8CD86,
    CODE VARCHAR(255) NOT NULL,
    DESCR VARCHAR(255) NOT NULL,
    PLSQL_CODE VARCHAR(255),
    STATUS INTEGER NOT NULL,
    ENV_FK INTEGER NOT NULL,
    FIRSTPAGE INTEGER,
    ORG_FK INTEGER,
    SELF_FK INTEGER
);           
ALTER TABLE PUBLIC.TBL_PROFILE_TYPE ADD CONSTRAINT PUBLIC.CONSTRAINT_9 PRIMARY KEY(ID);       
-- 4 +/- SELECT COUNT(*) FROM PUBLIC.TBL_PROFILE_TYPE;        
INSERT INTO PUBLIC.TBL_PROFILE_TYPE(ID, CODE, DESCR, PLSQL_CODE, STATUS, ENV_FK, FIRSTPAGE, ORG_FK, SELF_FK) VALUES
(1, 'ALL', 'ALL PROFILE', NULL, 1, 1, NULL, NULL, NULL),
(2, 'ADMIN', 'Administrador', NULL, 1, 1, NULL, 1, NULL),
(3, 'perfil.tutorial', 'Tutorial', NULL, 1, 2, NULL, 2, NULL),
(4, 'perfil.developer', 'Developer', NULL, 1, 3, NULL, 3, NULL);    
CREATE CACHED TABLE PUBLIC.TBL_REP_INSTANCE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_FAD439BA_043E_406C_BFA3_2A54F12820F8) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_FAD439BA_043E_406C_BFA3_2A54F12820F8,
    CONTRA_PROVA VARCHAR(255) NOT NULL,
    DT_CREATED DATE NOT NULL,
    REF_FK INTEGER NOT NULL,
    REFERENCE VARCHAR(255),
    UPDATEDATETIME TIMESTAMP,
    ENV_FK INTEGER NOT NULL,
    REP_TEMPLATE_FK INTEGER,
    USER_FK INTEGER,
    XML_CONTENT_FK INTEGER NOT NULL,
    XSL_CONTENT_FK INTEGER NOT NULL
);           
ALTER TABLE PUBLIC.TBL_REP_INSTANCE ADD CONSTRAINT PUBLIC.CONSTRAINT_3 PRIMARY KEY(ID);       
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_REP_INSTANCE;        
CREATE CACHED TABLE PUBLIC.TBL_REP_SOURCE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_426C4440_CF42_4ECC_A816_4A59A033FE81) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_426C4440_CF42_4ECC_A816_4A59A033FE81,
    DT_CREATED DATE,
    DT_UPDATED DATE,
    FORMKEY VARCHAR(100),
    NAME VARCHAR(255),
    PROCESSID VARCHAR(100),
    SOURCE_IDENTIFY VARCHAR(255),
    STATUS INTEGER NOT NULL,
    TASKID VARCHAR(100),
    TYPE VARCHAR(255) NOT NULL,
    TYPE_FK INTEGER,
    TYPE_NAME VARCHAR(255),
    TYPE_QUERY VARCHAR(2147483647),
    ENV_FK INTEGER NOT NULL,
    ENV_SOURCE_FK INTEGER,
    CONFIG_ENV_FK INTEGER,
    USER_CREATED_FK INTEGER NOT NULL,
    USER_UPDATED_FK INTEGER NOT NULL
);         
ALTER TABLE PUBLIC.TBL_REP_SOURCE ADD CONSTRAINT PUBLIC.CONSTRAINT_41 PRIMARY KEY(ID);        
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_REP_SOURCE;          
CREATE CACHED TABLE PUBLIC.TBL_REP_TEMPLATE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_9029D46C_FC62_483C_8032_3B90D976AAC7) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_9029D46C_FC62_483C_8032_3B90D976AAC7,
    CODE VARCHAR(255),
    DT_CREATED DATE,
    DT_UPDATED DATE,
    NAME VARCHAR(255) NOT NULL,
    REPORT_IDENTIFY VARCHAR(255),
    STATUS INTEGER NOT NULL,
    ENV_FK INTEGER NOT NULL,
    USER_CREATED_FK INTEGER NOT NULL,
    USER_UPDATED_FK INTEGER NOT NULL,
    XML_CONTENT_FK INTEGER NOT NULL,
    XSL_CONTENT_FK INTEGER NOT NULL
);             
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE ADD CONSTRAINT PUBLIC.CONSTRAINT_93 PRIMARY KEY(ID);      
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_REP_TEMPLATE;        
CREATE CACHED TABLE PUBLIC.TBL_REP_TEMPLATE_PARAM(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_37A71120_D018_425F_A568_1CC4F7CC0D5F) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_37A71120_D018_425F_A568_1CC4F7CC0D5F,
    PARAMETER VARCHAR(255) NOT NULL,
    REP_TEMPLATE_FK INTEGER NOT NULL
);        
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE_PARAM ADD CONSTRAINT PUBLIC.CONSTRAINT_6B PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_REP_TEMPLATE_PARAM;  
CREATE CACHED TABLE PUBLIC.TBL_REP_TEMPLATE_SOURCE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_758CBCB5_07E5_4285_B043_288957419668) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_758CBCB5_07E5_4285_B043_288957419668,
    REP_SOURCE_FK INTEGER NOT NULL,
    REP_TEMPLATE_FK INTEGER NOT NULL
);        
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE_SOURCE ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_REP_TEMPLATE_SOURCE; 
CREATE CACHED TABLE PUBLIC.TBL_REP_TEMPLATE_SOURCE_PARAM(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_D7FCEBFE_400C_4C65_BD7B_AB2D0D62A180) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_D7FCEBFE_400C_4C65_BD7B_AB2D0D62A180,
    PARAMETER VARCHAR(70) NOT NULL,
    PARAMETER_TYPE VARCHAR(50) NOT NULL,
    REP_TEMPLATE_SOURCE_FK INTEGER NOT NULL
); 
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE_SOURCE_PARAM ADD CONSTRAINT PUBLIC.CONSTRAINT_CD PRIMARY KEY(ID);         
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_REP_TEMPLATE_SOURCE_PARAM;           
CREATE CACHED TABLE PUBLIC.TBL_SESSION(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_A0B725DD_3424_4A5F_B422_D023187E617A) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_A0B725DD_3424_4A5F_B422_D023187E617A,
    ENDTIME BIGINT,
    HOST VARCHAR(255),
    HOSTNAME VARCHAR(255),
    HTTPS INTEGER NOT NULL,
    IPADDRESS VARCHAR(255),
    MEDIATYPE VARCHAR(255),
    SESSIONID VARCHAR(255),
    SESSIONOLDID VARCHAR(255),
    STARTTIME BIGINT,
    TARGET VARCHAR(255),
    URL VARCHAR(255),
    USERNAME VARCHAR(255),
    ENV_FK INTEGER NOT NULL,
    ORG_FK INTEGER,
    PROF_TYPE_FK INTEGER NOT NULL,
    USER_FK INTEGER
);  
ALTER TABLE PUBLIC.TBL_SESSION ADD CONSTRAINT PUBLIC.CONSTRAINT_7F6 PRIMARY KEY(ID);          
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.TBL_SESSION;             
INSERT INTO PUBLIC.TBL_SESSION(ID, ENDTIME, HOST, HOSTNAME, HTTPS, IPADDRESS, MEDIATYPE, SESSIONID, SESSIONOLDID, STARTTIME, TARGET, URL, USERNAME, ENV_FK, ORG_FK, PROF_TYPE_FK, USER_FK) VALUES
(1, 1626141481841, '127.0.0.1', '127.0.0.1', 0, '127.0.0.1', 'WEB', 'E588142F5316770773171B6DB5633B89', 'E588142F5316770773171B6DB5633B89', 1626141480041, '_blank', 'http://localhost:8080/IGRP/app/webapps', 'demo@nosi.cv', 2, 1, 2, 2);
CREATE CACHED TABLE PUBLIC.TBL_TASK_ACCESS(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_43ED5D5C_3DBD_4077_9981_61D0B0AF5791) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_43ED5D5C_3DBD_4077_9981_61D0B0AF5791,
    PROCESSNAME VARCHAR(150),
    TASKDESCRIPTION VARCHAR(255),
    TASKNAME VARCHAR(100),
    USER_FK INTEGER,
    ORG_FK INTEGER NOT NULL,
    PROF_FK INTEGER
);    
ALTER TABLE PUBLIC.TBL_TASK_ACCESS ADD CONSTRAINT PUBLIC.CONSTRAINT_D8 PRIMARY KEY(ID);       
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_TASK_ACCESS;         
CREATE CACHED TABLE PUBLIC.TBL_TASK_COMPONENT(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_B8C8E85F_26AF_4485_A6E5_24CF7E79F1E1) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_B8C8E85F_26AF_4485_A6E5_24CF7E79F1E1,
    CODIGO VARCHAR(255) NOT NULL,
    ORDEM SMALLINT NOT NULL,
    PROCESSID VARCHAR(255) NOT NULL,
    TASKID VARCHAR(255) NOT NULL,
    TITLE VARCHAR(255),
    ACTION_FK INTEGER NOT NULL
);     
ALTER TABLE PUBLIC.TBL_TASK_COMPONENT ADD CONSTRAINT PUBLIC.CONSTRAINT_5E PRIMARY KEY(ID);    
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_TASK_COMPONENT;      
CREATE CACHED TABLE PUBLIC.TBL_TASK_FILE(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_E16C5FEB_6DDB_4D0C_83D0_C803D17FCF93) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_E16C5FEB_6DDB_4D0C_83D0_C803D17FCF93,
    ESTADO VARCHAR(255),
    TASK_ID VARCHAR(20) NOT NULL,
    UUID VARCHAR(255),
    CLOB_FK INTEGER NOT NULL,
    TIPO_DOCUMENTO_ETAPA_FK INTEGER NOT NULL
);           
ALTER TABLE PUBLIC.TBL_TASK_FILE ADD CONSTRAINT PUBLIC.CONSTRAINT_CC PRIMARY KEY(ID);         
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_TASK_FILE;           
CREATE CACHED TABLE PUBLIC.TBL_TASK_UNASSIGNED(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_89A5E82C_0CA6_4E01_8666_B71CF1FB57EF) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_89A5E82C_0CA6_4E01_8666_B71CF1FB57EF,
    NOASSUMED BOOLEAN NOT NULL,
    PROCESSKEY VARCHAR(150) NOT NULL,
    TASKID VARCHAR(50) NOT NULL,
    TASKKEY VARCHAR(150) NOT NULL,
    USER_FK INTEGER NOT NULL
);           
ALTER TABLE PUBLIC.TBL_TASK_UNASSIGNED ADD CONSTRAINT PUBLIC.CONSTRAINT_DE PRIMARY KEY(ID);   
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_TASK_UNASSIGNED;     
CREATE CACHED TABLE PUBLIC.TBL_TEMP_FILE(
    UUID VARCHAR(255) NOT NULL,
    CONTENT BINARY(255) NOT NULL,
    DATE_CREATED DATE,
    MIME_TYPE VARCHAR(255),
    NAME VARCHAR(255),
    SIZE BIGINT NOT NULL
);      
ALTER TABLE PUBLIC.TBL_TEMP_FILE ADD CONSTRAINT PUBLIC.CONSTRAINT_37 PRIMARY KEY(UUID);       
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_TEMP_FILE;           
CREATE CACHED TABLE PUBLIC.TBL_TIPO_DOCUMENTO(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_12C60E8B_6FE0_4785_8482_54EA45314A0B) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_12C60E8B_6FE0_4785_8482_54EA45314A0B,
    CODIGO VARCHAR(50),
    DESCRICAO VARCHAR(500),
    NOME VARCHAR(100) NOT NULL,
    STATUS INTEGER NOT NULL,
    ENV_FK INTEGER NOT NULL
);      
ALTER TABLE PUBLIC.TBL_TIPO_DOCUMENTO ADD CONSTRAINT PUBLIC.CONSTRAINT_9B PRIMARY KEY(ID);    
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_TIPO_DOCUMENTO;      
CREATE CACHED TABLE PUBLIC.TBL_TIPO_DOCUMENTO_ETAPA(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_765A1B32_E2AC_4305_BDCF_576AA023E164) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_765A1B32_E2AC_4305_BDCF_576AA023E164,
    PROCESSID VARCHAR(100) NOT NULL,
    REQUIRED INTEGER NOT NULL,
    STATUS INTEGER NOT NULL,
    TASKID VARCHAR(100) NOT NULL,
    TIPO VARCHAR(4) NOT NULL,
    REPORT_FK INTEGER,
    TIPO_DOCUMENTO_FK INTEGER
);     
ALTER TABLE PUBLIC.TBL_TIPO_DOCUMENTO_ETAPA ADD CONSTRAINT PUBLIC.CONSTRAINT_84 PRIMARY KEY(ID);              
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_TIPO_DOCUMENTO_ETAPA;
CREATE CACHED TABLE PUBLIC.TBL_TRANSACTION(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_D5C7A0DF_13DB_4285_AFBF_0FA6D8859061) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_D5C7A0DF_13DB_4285_AFBF_0FA6D8859061,
    CODE VARCHAR(255) NOT NULL,
    DESCR VARCHAR(255) NOT NULL,
    EXTERNAL INTEGER,
    STATUS INTEGER NOT NULL,
    ENV_FK INTEGER NOT NULL
);      
ALTER TABLE PUBLIC.TBL_TRANSACTION ADD CONSTRAINT PUBLIC.CONSTRAINT_60 PRIMARY KEY(ID);       
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TBL_TRANSACTION;         
CREATE CACHED TABLE PUBLIC.TBL_USER(
    ID INTEGER DEFAULT (NEXT VALUE FOR PUBLIC.SYSTEM_SEQUENCE_74748A18_E5DF_4DC8_82B7_312702AB4D7E) NOT NULL NULL_TO_DEFAULT SEQUENCE PUBLIC.SYSTEM_SEQUENCE_74748A18_E5DF_4DC8_82B7_312702AB4D7E,
    ACTIVATION_KEY VARCHAR(255) NOT NULL,
    AUTH_KEY VARCHAR(255),
    CREATED_AT BIGINT NOT NULL,
    EMAIL VARCHAR(255),
    IS_AUTHENTICATED INTEGER,
    MOBILE VARCHAR(255),
    NAME VARCHAR(255),
    OIDC_ID_TOKEN TEXT,
    OIDC_STATE VARCHAR(255),
    PASS_HASH VARCHAR(255),
    PASSWORD_RESET_TOKEN VARCHAR(255),
    PHONE VARCHAR(255),
    PHOTO_ID VARCHAR(255),
    REFRESH_TOKEN VARCHAR(255),
    REMARKS VARCHAR(255),
    SIGNATURE_ID VARCHAR(255),
    STATUS INTEGER NOT NULL,
    UPDATED_AT BIGINT NOT NULL,
    USERPROFILE VARCHAR(255),
    USER_NAME VARCHAR(255),
    VALID_UNTIL VARCHAR(255)
);          
ALTER TABLE PUBLIC.TBL_USER ADD CONSTRAINT PUBLIC.CONSTRAINT_405 PRIMARY KEY(ID);             
-- 3 +/- SELECT COUNT(*) FROM PUBLIC.TBL_USER;
INSERT INTO PUBLIC.TBL_USER(ID, ACTIVATION_KEY, AUTH_KEY, CREATED_AT, EMAIL, IS_AUTHENTICATED, MOBILE, NAME, OIDC_ID_TOKEN, OIDC_STATE, PASS_HASH, PASSWORD_RESET_TOKEN, PHONE, PHOTO_ID, REFRESH_TOKEN, REMARKS, SIGNATURE_ID, STATUS, UPDATED_AT, USERPROFILE, USER_NAME, VALID_UNTIL) VALUES
(1, '123456789', '123456789', 2017, 'igrpweb@nosi.cv', NULL, NULL, 'IGRP SysAdmin', NULL, NULL, 'dc4659bfb1dbb064106f5685aa87a41550402178b0cc4c43a52f82848bb78b34', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2017, 'ADMIN', 'igrpweb@nosi.cv', NULL),
(2, '123456789', '123456', 2017, 'demo@nosi.cv', 1, NULL, 'Nositeste', NULL, NULL, '60b1df41fa82696abea1deb198667eb7c4a60521dd471559a8c17efde8528913', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2017, 'ADMIN', 'demo@nosi.cv', NULL),
(3, '123456789', '123456', 12345, NULL, NULL, NULL, NULL, NULL, NULL, 'Pa$$w0rd', NULL, NULL, NULL, NULL, NULL, NULL, 1, 133, NULL, 'root', NULL); 
CREATE FORCE VIEW PUBLIC.GLB_MV_ALL_MENUS(ID, DESCR, DESCR_MENU, SELF_FK, ENV_FK, ACTION_FK, ORDERBY) AS
SELECT
    A.ID,
    A.DESCR AS DESCR,
    A.DESCR AS DESCR_MENU,
    A.SELF_FK,
    A.ENV_FK,
    A.ACTION_FK,
    A.ORDERBY
FROM PUBLIC.TBL_MENU A
INNER JOIN PUBLIC.TBL_MENU B
    ON 1=1
WHERE (A.SELF_FK IS NOT NULL)
    AND (B.ID = A.SELF_FK);  
CREATE FORCE VIEW PUBLIC.GLB_MV_MENU(ID, DESCR, SELF_FK, ENV_FK, ACTION_FK, ORDERBY, STATUS, FLG_BASE, TARGET) AS
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
FROM PUBLIC.TBL_MENU;        
CREATE FORCE VIEW PUBLIC.GLB_V_MENU(ID, DESCR, DESCR_MENU, SELF_FK, ENV_FK, ACTION_FK, ORDERBY) AS
SELECT
    A.ID,
    ((B.DESCR || ' - ') || A.DESCR) AS DESCR,
    A.DESCR AS DESCR_MENU,
    A.SELF_FK,
    A.ENV_FK,
    A.ACTION_FK,
    A.ORDERBY
FROM PUBLIC.GLB_MV_MENU A
INNER JOIN PUBLIC.GLB_MV_MENU B
    ON 1=1
WHERE (A.SELF_FK IS NOT NULL)
    AND (B.ID = A.SELF_FK);          
CREATE FORCE VIEW PUBLIC.GLB_V_ORG_MENU(ID, DESCR, ORDERBY, ENV_FK, SELF_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK, FLG_BASE) AS
SELECT
    A.ID,
    ((E.DESCR || ' - ') || A.DESCR) AS DESCR,
    A.ORDERBY,
    A.ENV_FK,
    A.SELF_FK,
    B.PROF_TYPE_FK,
    B.USER_FK,
    'ALL' AS PROF_CODE,
    'ALL PROFILE' AS PROF_NAME,
    B.ORG_FK,
    A.FLG_BASE
FROM PUBLIC.TBL_MENU A
INNER JOIN PUBLIC.TBL_MENU E
    ON 1=1
INNER JOIN PUBLIC.TBL_PROFILE B
    ON 1=1
WHERE (B.PROF_TYPE_FK = 0)
    AND ((B.TYPE = 'MEN')
    AND ((A.ID = B.TYPE_FK)
    AND ((A.SELF_FK IS NOT NULL)
    AND (E.ID = A.SELF_FK))));            
CREATE FORCE VIEW PUBLIC.GLB_MV_PROFILE(PROF_TYPE_FK, USER_FK, TYPE, TYPE_FK, ORG_FK) AS
SELECT
    PROF_TYPE_FK,
    USER_FK,
    TYPE,
    TYPE_FK,
    ORG_FK
FROM PUBLIC.TBL_PROFILE;              
CREATE FORCE VIEW PUBLIC.GLB_MV_PROFILE_TYPE(ID, DESCR, CODE, ENV_FK, SELF_FK, STATUS, ORG_FK) AS
SELECT
    ID,
    DESCR,
    CODE,
    ENV_FK,
    SELF_FK,
    STATUS,
    ORG_FK
FROM PUBLIC.TBL_PROFILE_TYPE;  
CREATE FORCE VIEW PUBLIC.GLB_V_PROFILE(ORG_FK, PROF_TYPE_FK, USER_FK, TYPE, TYPE_FK, PROF_CODE, PROF_NAME, PROF_NAME_DESC, ENV_FK, SELF_FK) AS
SELECT
    B.ORG_FK,
    B.PROF_TYPE_FK,
    B.USER_FK,
    B.TYPE,
    B.TYPE_FK,
    D.CODE AS PROF_CODE,
    D.DESCR AS PROF_NAME,
    ((D.CODE || ' - ') || D.DESCR) AS PROF_NAME_DESC,
    D.ENV_FK,
    D.SELF_FK
FROM PUBLIC.GLB_MV_PROFILE B
INNER JOIN PUBLIC.GLB_MV_PROFILE_TYPE D
    ON 1=1
WHERE D.ID = B.PROF_TYPE_FK;            
CREATE FORCE VIEW PUBLIC.GLB_V_PROFILE_MENU(ID, DESCR, DESCR_MENU, ORDERBY, ENV_FK, SELF_FK, ACTION_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK, STATUS, TARGET, ENV_FK_PROF_TYPE, FLG_BASE) AS
SELECT
    A.ID,
    E.DESCR AS DESCR,
    A.DESCR AS DESCR_MENU,
    A.ORDERBY,
    A.ENV_FK,
    A.SELF_FK,
    A.ACTION_FK,
    B.PROF_TYPE_FK,
    B.USER_FK,
    D.CODE AS PROF_CODE,
    D.DESCR AS PROF_NAME,
    B.ORG_FK,
    A.STATUS,
    A.TARGET,
    D.ENV_FK AS ENV_FK_PROF_TYPE,
    E.FLG_BASE
FROM PUBLIC.GLB_MV_MENU A
INNER JOIN PUBLIC.GLB_MV_MENU E
    ON 1=1
INNER JOIN PUBLIC.GLB_MV_PROFILE B
    ON 1=1
INNER JOIN PUBLIC.GLB_MV_PROFILE_TYPE D
    ON 1=1
WHERE (D.ID = B.PROF_TYPE_FK)
    AND ((B.TYPE = 'MEN')
    AND ((A.ID = B.TYPE_FK)
    AND ((A.SELF_FK IS NOT NULL)
    AND (E.ID = A.SELF_FK))));            
CREATE FORCE VIEW PUBLIC.GLB_V_USER_MENU(ID, DESCR, ORDERBY, ENV_FK, SELF_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS
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
FROM PUBLIC.GLB_V_PROFILE_MENU
WHERE USER_FK <> 0; 
CREATE FORCE VIEW PUBLIC.GLB_V_PROF_MENU(ID, DESCR, DESCR_MENU, ORDERBY, ENV_FK, SELF_FK, ACTION_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK, STATUS, TARGET, ENV_FK_PROF_TYPE, FLG_BASE) AS
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
    ENV_FK_PROF_TYPE,
    FLG_BASE
FROM PUBLIC.GLB_V_PROFILE_MENU
WHERE (PROF_TYPE_FK <> 0)
    AND (USER_FK = 0);               
CREATE FORCE VIEW PUBLIC.GLB_MV_TRANSACTION(ID, CODE, DESCR, ENV_FK, STATUS) AS
SELECT
    ID,
    CODE,
    DESCR,
    ENV_FK,
    STATUS
FROM PUBLIC.TBL_TRANSACTION;
CREATE FORCE VIEW PUBLIC.GLB_V_PROFILE_TRANS(ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS
SELECT
    A.ID,
    A.CODE,
    A.DESCR,
    A.ENV_FK,
    B.PROF_TYPE_FK,
    B.USER_FK,
    B.PROF_CODE,
    B.PROF_NAME,
    B.ORG_FK
FROM PUBLIC.TBL_TRANSACTION A
INNER JOIN PUBLIC.GLB_V_PROFILE B
    ON 1=1
WHERE (B.TYPE = 'TRANS')
    AND (A.ID = B.TYPE_FK);        
CREATE FORCE VIEW PUBLIC.GLB_V_PROF_TRANS(ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS
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
FROM PUBLIC.GLB_V_PROFILE_TRANS
WHERE (PROF_TYPE_FK <> 0)
    AND (USER_FK = 0);              
CREATE FORCE VIEW PUBLIC.GLB_V_ORG_TRANS(ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS
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
FROM PUBLIC.GLB_V_PROFILE_TRANS
WHERE PROF_TYPE_FK = 0;         
CREATE FORCE VIEW PUBLIC.GLB_V_USER_TRANS(ID, CODE, DESCR, ENV_FK, PROF_TYPE_FK, USER_FK, PROF_CODE, PROF_NAME, ORG_FK) AS
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
FROM PUBLIC.GLB_V_PROFILE_TRANS
WHERE USER_FK <> 0;            
ALTER TABLE PUBLIC.TBL_ORGANIZATION ADD CONSTRAINT PUBLIC.UK_2NGUYAYAV3WM6YJ1J093RGBEU UNIQUE(CODE);          
ALTER TABLE PUBLIC.TBL_CONFIG ADD CONSTRAINT PUBLIC.UK_12MHJ0S9YHG2VYN29MHL8J8UY UNIQUE(NAME);
ALTER TABLE PUBLIC.TBL_ENV ADD CONSTRAINT PUBLIC.UK_6M6WU64XN2K5PU1JT30H6R13Y UNIQUE(DAD);    
ALTER TABLE PUBLIC.TBL_PROFILE ADD CONSTRAINT PUBLIC.PROFILE_UNIQUE_FK UNIQUE(TYPE, TYPE_FK, USER_FK, ORG_FK, PROF_TYPE_FK);  
ALTER TABLE PUBLIC.TBL_USER ADD CONSTRAINT PUBLIC.UK_6JR81L5QQPXJP72FGI23UBQC9 UNIQUE(USER_NAME);             
ALTER TABLE PUBLIC.TBL_USER ADD CONSTRAINT PUBLIC.UK_NPN1WF1YU1G5RJOHBEK375PP1 UNIQUE(EMAIL); 
ALTER TABLE PUBLIC.TBL_PROFILE_TYPE ADD CONSTRAINT PUBLIC.UK_PSNLUQOOFBS9NXJW813KTE4D1 UNIQUE(CODE);          
ALTER TABLE PUBLIC.TBL_ACTIVITY_EXECUTE ADD CONSTRAINT PUBLIC.USER_ACTIVITE_EXECUTE_FK FOREIGN KEY(USER_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;           
ALTER TABLE PUBLIC.TBL_CLOB ADD CONSTRAINT PUBLIC.CLOB_USER_CREATED_FK FOREIGN KEY(USER_CREATED_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;   
ALTER TABLE PUBLIC.TBL_TIPO_DOCUMENTO_ETAPA ADD CONSTRAINT PUBLIC.TIPO_DOCUEMNTO_ETAPA_TIPO_DOCUMENTO_FK FOREIGN KEY(TIPO_DOCUMENTO_FK) REFERENCES PUBLIC.TBL_TIPO_DOCUMENTO(ID) NOCHECK;     
ALTER TABLE PUBLIC.TBL_ENV ADD CONSTRAINT PUBLIC.ENV_ACTION_FK FOREIGN KEY(ACTION_FK) REFERENCES PUBLIC.TBL_ACTION(ID) NOCHECK;               
ALTER TABLE PUBLIC.TBL_ORGANIZATION ADD CONSTRAINT PUBLIC.ORGANIZATION_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;      
ALTER TABLE PUBLIC.TBL_REP_SOURCE ADD CONSTRAINT PUBLIC.REP_SOURCE_USER_UPDATED_FK FOREIGN KEY(USER_UPDATED_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;       
ALTER TABLE PUBLIC.TBL_TASK_FILE ADD CONSTRAINT PUBLIC.TASK_FILE_CLOB_FK FOREIGN KEY(CLOB_FK) REFERENCES PUBLIC.TBL_CLOB(ID) NOCHECK;         
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE_SOURCE_PARAM ADD CONSTRAINT PUBLIC.REP_TEMPLATE_SOURCE_PARAM_FK FOREIGN KEY(REP_TEMPLATE_SOURCE_FK) REFERENCES PUBLIC.TBL_REP_TEMPLATE_SOURCE(ID) NOCHECK;
ALTER TABLE PUBLIC.TBL_SESSION ADD CONSTRAINT PUBLIC.SESSION_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;
ALTER TABLE PUBLIC.TBL_TIPO_DOCUMENTO_ETAPA ADD CONSTRAINT PUBLIC.TIPO_DOCUEMNTO_ETAPA_REPORT_FK FOREIGN KEY(REPORT_FK) REFERENCES PUBLIC.TBL_REP_TEMPLATE(ID) NOCHECK;       
ALTER TABLE PUBLIC.TBL_ORGANIZATION ADD CONSTRAINT PUBLIC.ORGANIZATION_SELF_FK FOREIGN KEY(SELF_FK) REFERENCES PUBLIC.TBL_ORGANIZATION(ID) NOCHECK;           
ALTER TABLE PUBLIC.TBL_REP_INSTANCE ADD CONSTRAINT PUBLIC.REP_INSTANCE_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;      
ALTER TABLE PUBLIC.GLB_T_ACL ADD CONSTRAINT PUBLIC.FKF2U26FJDYK9RR59WPSO7Y7L5S FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;     
ALTER TABLE PUBLIC.TBL_TRANSACTION ADD CONSTRAINT PUBLIC.TRANSACTION_SOURCE_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK; 
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE ADD CONSTRAINT PUBLIC.REP_TEMPLATE_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;      
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE ADD CONSTRAINT PUBLIC.REP_TEMPLATE_USER_CREATED_FK FOREIGN KEY(USER_CREATED_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;   
ALTER TABLE PUBLIC.TBL_MODULO ADD CONSTRAINT PUBLIC.ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;         
ALTER TABLE PUBLIC.TBL_REP_SOURCE ADD CONSTRAINT PUBLIC.REP_SOURCE_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;          
ALTER TABLE PUBLIC.TBL_PROFILE_TYPE ADD CONSTRAINT PUBLIC.PROFILE_TYPE_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;      
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE ADD CONSTRAINT PUBLIC.REP_TEMPLATE_USER_UPDATED_FK FOREIGN KEY(USER_UPDATED_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;   
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE_SOURCE ADD CONSTRAINT PUBLIC.REP_TEMPLATE_SOURCE_REP_TEMPLATE_FK FOREIGN KEY(REP_TEMPLATE_FK) REFERENCES PUBLIC.TBL_REP_TEMPLATE(ID) NOCHECK;             
ALTER TABLE PUBLIC.TBL_REP_INSTANCE ADD CONSTRAINT PUBLIC.REP_INSTANCE_REP_TEMPLATE_FK FOREIGN KEY(REP_TEMPLATE_FK) REFERENCES PUBLIC.TBL_REP_TEMPLATE(ID) NOCHECK;           
ALTER TABLE PUBLIC.TBL_ACTIVITY_EXECUTE ADD CONSTRAINT PUBLIC.ENV_ACTIVITE_EXECUTE_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;              
ALTER TABLE PUBLIC.TBL_REP_INSTANCE ADD CONSTRAINT PUBLIC.REP_INSTANCE_XSL_CONTENT_FK FOREIGN KEY(XSL_CONTENT_FK) REFERENCES PUBLIC.TBL_CLOB(ID) NOCHECK;     
ALTER TABLE PUBLIC.TBL_REP_INSTANCE ADD CONSTRAINT PUBLIC.REP_INSTANCE_USER_FK FOREIGN KEY(USER_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;   
ALTER TABLE PUBLIC.TBL_ORGANIZATION ADD CONSTRAINT PUBLIC.ORGANIZATION_USER_FK FOREIGN KEY(USER_CREATED_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;           
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE ADD CONSTRAINT PUBLIC.REP_TEMPLATE_XSL_CONTENT_FK FOREIGN KEY(XSL_CONTENT_FK) REFERENCES PUBLIC.TBL_CLOB(ID) NOCHECK;     
ALTER TABLE PUBLIC.TBL_TASK_FILE ADD CONSTRAINT PUBLIC.TIPO_DOCUMENTO_ETAPA_CLOB_FK FOREIGN KEY(TIPO_DOCUMENTO_ETAPA_FK) REFERENCES PUBLIC.TBL_TIPO_DOCUMENTO_ETAPA(ID) NOCHECK;              
ALTER TABLE PUBLIC.TBL_CLOB ADD CONSTRAINT PUBLIC.CLOB_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;      
ALTER TABLE PUBLIC.TBL_CONFIG_ENV ADD CONSTRAINT PUBLIC.CONFIG_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;              
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE ADD CONSTRAINT PUBLIC.REP_TEMPLATE_XML_CONTENT_FK FOREIGN KEY(XML_CONTENT_FK) REFERENCES PUBLIC.TBL_CLOB(ID) NOCHECK;     
ALTER TABLE PUBLIC.TBL_PROFILE_TYPE ADD CONSTRAINT PUBLIC.PROFILE_TYPE_ORG_FK FOREIGN KEY(ORG_FK) REFERENCES PUBLIC.TBL_ORGANIZATION(ID) NOCHECK;             
ALTER TABLE PUBLIC.TBL_TIPO_DOCUMENTO ADD CONSTRAINT PUBLIC.TIPO_DOCUEMNTO_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;  
ALTER TABLE PUBLIC.TBL_REP_INSTANCE ADD CONSTRAINT PUBLIC.REP_INSTANCE_XML_CONTENT_FK FOREIGN KEY(XML_CONTENT_FK) REFERENCES PUBLIC.TBL_CLOB(ID) NOCHECK;     
ALTER TABLE PUBLIC.TBL_DOMAIN ADD CONSTRAINT PUBLIC.DOMAIN_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;  
ALTER TABLE PUBLIC.TBL_MENU ADD CONSTRAINT PUBLIC.MENU_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;      
ALTER TABLE PUBLIC.TBL_REP_SOURCE ADD CONSTRAINT PUBLIC.REP_SOURCE_ENV_SOURCE_FK FOREIGN KEY(ENV_SOURCE_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;            
ALTER TABLE PUBLIC.TBL_REP_SOURCE ADD CONSTRAINT PUBLIC.REP_SOURCE_USER_CREATED_FK FOREIGN KEY(USER_CREATED_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;       
ALTER TABLE PUBLIC.TBL_PROFILE ADD CONSTRAINT PUBLIC.PROFILE_PROF_TYPE_FK FOREIGN KEY(PROF_TYPE_FK) REFERENCES PUBLIC.TBL_PROFILE_TYPE(ID) NOCHECK;           
ALTER TABLE PUBLIC.TBL_HISTORIC ADD CONSTRAINT PUBLIC.PAGE_FK FOREIGN KEY(PAGE_FK) REFERENCES PUBLIC.TBL_ACTION(ID) NOCHECK;  
ALTER TABLE PUBLIC.TBL_ACTIVITY_EXECUTE ADD CONSTRAINT PUBLIC.ORG_ACTIVITE_EXECUTE_FK FOREIGN KEY(ORG_FK) REFERENCES PUBLIC.TBL_ORGANIZATION(ID) NOCHECK;     
ALTER TABLE PUBLIC.TBL_TASK_UNASSIGNED ADD CONSTRAINT PUBLIC.USER_TASK_UNASSIGNED_FK FOREIGN KEY(USER_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;             
ALTER TABLE PUBLIC.TBL_PROFILE_TYPE ADD CONSTRAINT PUBLIC.PROFILE_TYPE_ACTION_FK FOREIGN KEY(FIRSTPAGE) REFERENCES PUBLIC.TBL_ACTION(ID) NOCHECK;             
ALTER TABLE PUBLIC.TBL_PROFILE ADD CONSTRAINT PUBLIC.PROFILE_USER_FK FOREIGN KEY(USER_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;             
ALTER TABLE PUBLIC.TBL_REP_SOURCE ADD CONSTRAINT PUBLIC.CRUD_REP_SOURCE_ENV_FK FOREIGN KEY(CONFIG_ENV_FK) REFERENCES PUBLIC.TBL_CONFIG_ENV(ID) NOCHECK;       
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE_PARAM ADD CONSTRAINT PUBLIC.REP_TEMPLATE_PARAM_FK FOREIGN KEY(REP_TEMPLATE_FK) REFERENCES PUBLIC.TBL_REP_TEMPLATE(ID) NOCHECK;            
ALTER TABLE PUBLIC.TBL_ACTION ADD CONSTRAINT PUBLIC.ACTION_ENV_FK FOREIGN KEY(ENV_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;  
ALTER TABLE PUBLIC.TBL_PROFILE_TYPE ADD CONSTRAINT PUBLIC.PROFILE_TYPE_SELF_FK FOREIGN KEY(SELF_FK) REFERENCES PUBLIC.TBL_PROFILE_TYPE(ID) NOCHECK;           
ALTER TABLE PUBLIC.TBL_SESSION ADD CONSTRAINT PUBLIC.SESSION_USER_FK FOREIGN KEY(USER_FK) REFERENCES PUBLIC.TBL_USER(ID) NOCHECK;             
ALTER TABLE PUBLIC.TBL_SESSION ADD CONSTRAINT PUBLIC.SESSION_PROF_TYPE_FK FOREIGN KEY(PROF_TYPE_FK) REFERENCES PUBLIC.TBL_PROFILE_TYPE(ID) NOCHECK;           
ALTER TABLE PUBLIC.TBL_ACTIVITY_EXECUTE ADD CONSTRAINT PUBLIC.PROF_ACTIVITE_EXECUTE_FK FOREIGN KEY(PROF_FK) REFERENCES PUBLIC.TBL_PROFILE_TYPE(ID) NOCHECK;   
ALTER TABLE PUBLIC.TBL_TASK_ACCESS ADD CONSTRAINT PUBLIC.TASK_ACCESS_ORGANIZATION_FK FOREIGN KEY(ORG_FK) REFERENCES PUBLIC.TBL_ORGANIZATION(ID) NOCHECK;      
ALTER TABLE PUBLIC.TBL_MENU ADD CONSTRAINT PUBLIC.MENU_ACTION_FK FOREIGN KEY(ACTION_FK) REFERENCES PUBLIC.TBL_ACTION(ID) NOCHECK;             
ALTER TABLE PUBLIC.GLB_T_ACL ADD CONSTRAINT PUBLIC.FK8EVEEJ9IA15D7RA4IHW8WYBSB FOREIGN KEY(ENV_OWNER_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;               
ALTER TABLE PUBLIC.TBL_MENU ADD CONSTRAINT PUBLIC.MENU_SELF_FK FOREIGN KEY(SELF_FK) REFERENCES PUBLIC.TBL_MENU(ID) NOCHECK;   
ALTER TABLE PUBLIC.TBL_CLOB ADD CONSTRAINT PUBLIC.CLOB_ENV_UPDATED_FK FOREIGN KEY(ENV_UPDATED_FK) REFERENCES PUBLIC.TBL_ENV(ID) NOCHECK;      
ALTER TABLE PUBLIC.TBL_PROFILE ADD CONSTRAINT PUBLIC.PROFILE_ORGANIZATION_FK FOREIGN KEY(ORG_FK) REFERENCES PUBLIC.TBL_ORGANIZATION(ID) NOCHECK;              
ALTER TABLE PUBLIC.TBL_TASK_COMPONENT ADD CONSTRAINT PUBLIC.ACTION_COMPONENT_FK FOREIGN KEY(ACTION_FK) REFERENCES PUBLIC.TBL_ACTION(ID) NOCHECK;              
ALTER TABLE PUBLIC.TBL_SESSION ADD CONSTRAINT PUBLIC.SESSION_ORGANIZATION_FK FOREIGN KEY(ORG_FK) REFERENCES PUBLIC.TBL_ORGANIZATION(ID) NOCHECK;              
ALTER TABLE PUBLIC.TBL_REP_TEMPLATE_SOURCE ADD CONSTRAINT PUBLIC.REP_TEMPLATE_SOURCE_REP_SOURCE_FK FOREIGN KEY(REP_SOURCE_FK) REFERENCES PUBLIC.TBL_REP_SOURCE(ID) NOCHECK;   
ALTER TABLE PUBLIC.TBL_TASK_ACCESS ADD CONSTRAINT PUBLIC.TASK_ACCESS_PROFILE_TYPE_FK FOREIGN KEY(PROF_FK) REFERENCES PUBLIC.TBL_PROFILE_TYPE(ID) NOCHECK;     


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
  