package cv.nosi.core.igrp.mingrations;

/**
 * @author: Emanuel Pereira
 * 30 Jun 2017
 */
import java.util.ArrayList;
import java.util.List;

import cv.nosi.webapps.igrp.dao.*;
import cv.nosi.webapps.igrp.dao.views.CreateViews;
 
public class MigrationIGRPInitConfig {

	
	public static void start(){
		Application app_igrp = new Application();
		app_igrp.setDad("igrp");		
		app_igrp.setName("IGRP");
		app_igrp.setDescription("Integrated Government Resource Planning");
		app_igrp.setImg_src("igrp.svg");
		app_igrp.setStatus(1);
		app_igrp = app_igrp.insertOnly();
		
			
		Application app_tutorial = new Application("tutorial", "Tutorial IGRP", "icon_educacao.png", "IGRPweb TODO", 1, null);
		app_tutorial = app_tutorial.insertOnly();
		
		Application app_igrp_studio = new Application("igrp_studio", "IGRP Studio", "studioSoLogo.svg", "<code/> {Developers}", 1, null,"igrp_studio");
		app_igrp_studio = app_igrp_studio.insertOnly();
		
		if(app_igrp!=null){
			Config config = new Config("url_ativiti_connection", "http://localhost:8080/activiti-rest/service/");
			config.insert();
			config = new Config("ativiti_user", "kermit");
			config.insert();
			config = new Config("ativiti_password", "kermit");
			config.insert();
//			For local server
			config = new Config("igrp_images", "IGRP");
//			For tomcat server
//			config = new Config("igrp_images", "FrontIGRP");
			config.insert();
			
			//Configuration ClientID, Transaction ID and Service ID for Biztalk
			config = new Config("CLIENT_ID_BIZTALK", "your id");
			config.insert();
			config = new Config("TRANSACTION_ID_BIZTALK_PESQUISA_NIF", "your id");
			config.insert();
			config = new Config("SERVICE_ID_BIZTALK_PESQUISA_NIF", "your id");
			config.insert();
			config = new Config("TRANSACTION_ID_BIZTALK_PESQUISA_GEOGRAFIA", "your id");
			config.insert();
			config = new Config("SERVICE_ID_BIZTALK_PESQUISA_GEOGRAFIA", "your id");
			config.insert();
			config = new Config("TRANSACTION_ID_BIZTALK_PESQUISA_HIERARQUICA_CAE", "your id");
			config.insert();
			config = new Config("SERVICE_ID_BIZTALK_PESQUISA_HIERARQUICA_CAE", "your id");
			config.insert();
			config = new Config("TRANSACTION_ID_BIZTALK_PESQUISA_NASCIMENTO", "your id");
			config.insert();
			config = new Config("SERVICE_ID_BIZTALK_PESQUISA_NASCIMENTO", "your id");
			config.insert();
			config = new Config("TRANSACTION_ID_BIZTALK_PESQUISA_SNIAC", "your id");
			config.insert();
			config = new Config("SERVICE_ID_BIZTALK_PESQUISA_SNIAC", "your id");
			config.insert();
			config = new Config("TRANSACTION_ID_BIZTALK_PESQUISA_BI", "your id");
			config.insert();
			config = new Config("SERVICE_ID_BIZTALK_PESQUISA_BI", "your id");
			config.insert();
			
			User user0_IGRP = new User("IGRP SysAdmin", "igrpweb@nosi.cv", cv.nosi.core.webapp.component.User.encryptToHash("igrpweb@nosi.cvigrp.admin.Pa$$w0rd", "SHA-256"), "ADMIN", null, 1, null, "123456789", "igrpweb@nosi.cv",null, null, null, null, null,"123456789", 2017, 2017);
			user0_IGRP = user0_IGRP.insert();
			User user1demo = new User("Nositeste", "demo@nosi.cv", cv.nosi.core.webapp.component.User.encryptToHash("demo@nosi.cvdemo", "SHA-256"), "ADMIN", null, 1, null, "123456789", "demo@nosi.cv",null, null, null, null, null,"123456", 2017, 2017);
			user1demo = user1demo.insert();
			
			Organization org_IGRP = new Organization("01.03", "IGRP", 1, app_igrp, user0_IGRP, null);
			org_IGRP = org_IGRP.insert();	

			ProfileType prof0_ALL = new ProfileType("ALL PROFILE", "ALL", 1, null, app_igrp, null);
			prof0_ALL = prof0_ALL.insert();
			
			ProfileType prof1_ADMIN = new ProfileType("Administrador", "ADMIN", 1, org_IGRP, app_igrp, null);
			prof1_ADMIN = prof1_ADMIN.insert();
			
			//Organizacao do tutorial
			Organization org_tutorial = new Organization("org.tutorial", "Tutorial", 1, app_tutorial, user0_IGRP, null);
			org_tutorial = org_tutorial.insert();
			
			//Perfil da aplicacao tutorial
			ProfileType prof_tutorial = new ProfileType("Tutorial", "perfil.tutorial", 1,org_tutorial, app_tutorial, null);
			prof_tutorial = prof_tutorial.insert();
			
			//Organizacao do IGRP Studio
			Organization org_igrp_studio = new Organization("org.developer", "Developers", 1, app_igrp_studio, user0_IGRP, null);
			org_igrp_studio = org_igrp_studio.insert();
			
			//Perfil da aplicacao IGRP Studio
			ProfileType prof_dev_igrp_studio = new ProfileType("Developer", "perfil.developer", 1, org_igrp_studio, app_igrp_studio, null);
			prof_dev_igrp_studio = prof_dev_igrp_studio.insert();
		
			
			List<Action> actions = new ArrayList<>();
			actions.add(new Action("ListaPage", "index", "nosi.webapps.igrp_studio.pages.listapage", "igrp_studio/listapage/ListaPage.xsl", "Page builder", "Page builder", "2.3", 1, app_igrp_studio));
			actions.add(new Action("Env", "index", "nosi.webapps.igrp_studio.pages.env", "igrp_studio/env/Env.xsl", "Registar Aplicacao", "Registar Aplicacao", "2.3", 1, app_igrp_studio));
			actions.add(new Action("ListaEnv", "index", "nosi.webapps.igrp_studio.pages.listaenv", "igrp_studio/listaenv/ListaEnv.xsl", "Application builder", "Application builder", "2.3", 1, app_igrp_studio));
			actions.add(new Action("Dominio", "index", "nosi.webapps.igrp.pages.dominio", "igrp/dominio/Dominio.xsl", "Gestão de Domínios", "Gestão de Domínios", "2.3", 1, app_igrp));
			actions.add(new Action("NovoDominio", "index", "nosi.webapps.igrp.pages.novodominio", "igrp/novodominio/NovoDominio.xsl", "Registar Dominio", "Registar Dominio", "2.3", 1, app_igrp));
			actions.add(new Action("PesquisarOrganica", "index", "nosi.webapps.igrp.pages.pesquisarorganica", "igrp/pesquisarorganica/PesquisarOrganica.xsl", "Gestão de Organica", "Gestão de Organica", "2.3", 1, app_igrp));
			actions.add(new Action("NovaOrganica", "index", "nosi.webapps.igrp.pages.novaorganica", "igrp/novaorganica/NovaOrganica.xsl", "Registar Organica", "Registar Organica", "2.3", 1, app_igrp));
			actions.add(new Action("NovoMenu", "index", "nosi.webapps.igrp.pages.novomenu", "igrp/novomenu/NovoMenu.xsl", "Registar Menu", "Registar Menu", "2.3", 1, app_igrp));
			actions.add(new Action("PesquisarMenu", "index", "nosi.webapps.igrp.pages.pesquisarmenu", "igrp/pesquisarmenu/PesquisarMenu.xsl", "Gestão de Menu", "Gestão de Menu", "2.3", 1, app_igrp));
			actions.add(new Action("NovoPerfil", "index", "nosi.webapps.igrp.pages.novoperfil", "igrp/novoperfil/NovoPerfil.xsl", "Registar Perfil", "Registar Perfil", "2.3", 1, app_igrp));
			actions.add(new Action("PesquisarPerfil", "index", "nosi.webapps.igrp.pages.pesquisarperfil", "igrp/pesquisarperfil/PesquisarPerfil.xsl", "Gestão de Perfil", "Gestão de Perfil", "2.3", 1, app_igrp));
			actions.add(new Action("PesquisarUtilizador", "index", "nosi.webapps.igrp.pages.pesquisarutilizador", "igrp/pesquisarutilizador/PesquisarUtilizador.xsl", "Gestão de Utilizador", "Gestão de Utilizador", "2.3", 1, app_igrp));
			actions.add(new Action("NovoUtilizador", "index", "nosi.webapps.igrp.pages.novoutilizador", "igrp/novoutilizador/NovoUtilizador.xsl", "Convidar Utilizador", "Convidar Utilizador", "2.3", 1, app_igrp));
			actions.add(new Action("Settings", "index", "nosi.webapps.igrp.pages.settings", "igrp/settings/Settings.xsl", "Área pessoal", "Área pessoal", "2.3", 1, app_igrp));
			actions.add(new Action("RegistarUtilizador", "index", "nosi.webapps.igrp.pages.registarutilizador", "igrp/registarutilizador/RegistarUtilizador.xsl", "Registar Utilizador", "Registar Utilizador", "2.3", 1, app_igrp));
			actions.add(new Action("Transaccao", "index", "nosi.webapps.igrp.pages.transaccao", "igrp/transaccao/Transaccao.xsl", "Transaccao", "Transaccao", "2.3", 1, app_igrp));
			actions.add(new Action("Page", "index", "nosi.webapps.igrp.pages.page", "igrp/page/Page.xsl", "Registar Pagina", "Registar Pagina", "2.3", 1, app_igrp));
			actions.add(new Action("MenuOrganica", "index", "nosi.webapps.igrp.pages.menuorganica", "igrp/menuorganica/MenuOrganica.xsl", "Associar Menu a Organica", "Associar Menu a Organica", "2.3", 1, app_igrp));
			final Action errorP = new Action("ErrorPage", "index", "nosi.webapps.igrp.pages.errorpage", "igrp/errorpage/ErrorPage.xsl", "Pagina de Erro", "Pagina de Erro", "2.3", 1, app_igrp);
			 errorP.setTipo((short)1);
			actions.add(errorP);
			actions.add(new Action("TransacaoOrganica", "index", "nosi.webapps.igrp.pages.transacaoorganica", "igrp/transacaoorganica/TransacaoOrganica.xsl", "Associar Transacao a Organica", "Associar Transacao a Organica", "2.3", 1, app_igrp));
			actions.add(new Action("EditarTransacao", "index", "nosi.webapps.igrp.pages.editartransacao", "igrp/editartransacao/EditarTransacao.xsl", "Editar Transacao", "Editar Transacao", "2.3", 1, app_igrp));
			actions.add(new Action("Session", "index", "nosi.webapps.igrp.pages.session", "igrp/session/Session.xsl", "Gestao de Sessao", "Gestao de Sessao", "2.3", 1, app_igrp));
			actions.add(new Action("WebReport", "index", "nosi.webapps.igrp_studio.pages.webreport", "igrp_studio/webreport/WebReport.xsl", "Report Builder", "Report Builder", "2.3", 1, app_igrp_studio));
			actions.add(new Action("DataSource", "index", "nosi.webapps.igrp.pages.datasource", "igrp/datasource/DataSource.xsl", "Registar Data Source", "Registar Data Source", "2.3", 1, app_igrp));
			actions.add(new Action("LookupListPage", "index", "nosi.webapps.igrp.pages.lookuplistpage", "igrp/lookuplistpage/LookupListPage.xsl", "Lista de Pagina Para Lookup", "Lista de Pagina Para Lookup", "2.3", 1, app_igrp));
			actions.add(new Action("Migrate", "index", "nosi.webapps.igrp.pages.migrate", "igrp/migrate/Migrate.xsl", "Migrate IGRP", "Migrate IGRP", "2.3", 1, app_igrp));
			actions.add(new Action("OAuthClientList", "index", "nosi.webapps.igrp.pages.oauthclientlist", "igrp/oauthclientlist/OAuthClientList.xsl", "Lista de credenciais OAuth", "Lista de credenciais OAuth", "2.3", 1, app_igrp));
			actions.add(new Action("OAuthClient", "index", "nosi.webapps.igrp.pages.oauthclient", "igrp/oauthclient/OAuthClient.xsl", "Registar cliente OAuth", "Registar cliente OAuth", "2.3", 1, app_igrp));
			actions.add(new Action("MapaProcesso", "index", "nosi.webapps.igrp.pages.mapaprocesso", "igrp/mapaprocesso/MapaProcesso.xsl", "Mapa Processo", "Mapa Processo", "2.3", 1, app_igrp));
			actions.add(new Action("ExecucaoTarefas", "index", "nosi.webapps.igrp.pages.execucaotarefas", "igrp/execucaotarefas/ExecucaoTarefas.xsl", "Execucao Tarefas", "Execucao Tarefas", "2.3", 1, app_igrp));
			actions.add(new Action("LookupListUser", "index", "nosi.webapps.igrp.pages.lookuplistuser", "igrp/lookuplistuser/LookupListUser.xsl", "Lookup Lista Utilizador", "Lookup Lista Utilizador", "2.3", 1, app_igrp));
			actions.add(new Action("Alter_prioridade_tarefa", "index", "nosi.webapps.igrp.pages.alter_prioridade_tarefa", "igrp/alter_prioridade_tarefa/Alter_prioridade_tarefa.xsl", "Alter prioridade tarefa", "Alter prioridade tarefa", "2.3", 1, app_igrp));
			actions.add(new Action("Transferir_tarefas", "index", "nosi.webapps.igrp.pages.transferir_tarefas", "igrp/transferir_tarefas/Transferir_tarefas.xsl", "Transferir tarefas", "Transferir tarefas", "2.3", 1, app_igrp));
			actions.add(new Action("BPMNDesigner", "index", "nosi.webapps.igrp_studio.pages.bpmndesigner", "igrp_studio/bpmndesigner/BPMNDesigner.xsl", "BPMN Designer", "BPMN Designer", "2.3", 1, app_igrp_studio));
			actions.add(new Action("Import_export", "index", "nosi.webapps.igrp.pages.import_export", "igrp/import_export/Import_export.xsl", "Import export", "Import export", "2.3", 1, app_igrp));
			actions.add(new Action("ImportArquivo", "index", "nosi.webapps.igrp_studio.pages.importarquivo", "igrp_studio/importarquivo/ImportArquivo.xsl", "Import Arquivo", "Import Arquivo", "2.3", 1, app_igrp_studio));
			actions.add(new Action("ConfigDatabase", "index", "nosi.webapps.igrp.pages.configdatabase", "igrp/configdatabase/ConfigDatabase.xsl", "Configurar Base de Dados", "Configurar Base de Dados de uma aplicação", "2.3", 1, app_igrp));
			actions.add(new Action("PesquisaBI", "index", "nosi.webapps.igrp.pages.pesquisabi", "igrp/pesquisabi/PesquisaBI.xsl", "Pesquisar BI", "Pesquisar BI", "2.3", 1, app_igrp));
			actions.add(new Action("PesquisaNIF", "index", "nosi.webapps.igrp.pages.pesquisanif", "igrp/pesquisanif/PesquisaNIF.xsl", "Pesquisar NIF", "Pesquisar NIF", "2.3", 1, app_igrp));
			actions.add(new Action("PesquisaNascimento", "index", "nosi.webapps.igrp.pages.pesquisanascimento", "igrp/pesquisanascimento/PesquisaNascimento.xsl", "Pesquisar Nascimento", "Pesquisar Nascimento", "2.3", 1, app_igrp));
			actions.add(new Action("Gestaodeacesso", "index", "nosi.webapps.igrp.pages.gestaodeacesso", "igrp/gestaodeacesso/Gestaodeacesso.xsl", "Gestao de Acesso", "Gestao de Acesso", "2.3", 1, app_igrp));
			actions.add(new Action("GeralApresentacao", "index", "nosi.webapps.tutorial.pages.geralapresentacao", "tutorial/geralapresentacao/GeralApresentacao.xsl", "O que fazer dentro do IGRP JAVA...", "O que fazer dentro do IGRP JAVA...", "2.3", 1, app_tutorial));
			actions.add(new Action("HomeStudio", "index", "nosi.webapps.igrp_studio.pages.homestudio", "igrp_studio/homestudio/HomeStudio.xsl", "HomeStudio", "HomeStudio", "2.3", 0, app_igrp_studio));
			//crud is get(43)
			actions.add(new Action("CRUDGenerator", "index", "nosi.webapps.igrp_studio.pages.crudgenerator", "igrp_studio/crudgenerator/CRUDGenerator.xsl", "CRUDGenerator", "CRUD Generator", "2.3", 1, app_igrp_studio));	
			actions.add(new Action("LdapUser", "index", "nosi.webapps.igrp.pages.ldapuser", "igrp/ldapuser/LdapUser.xsl", "LdapUser", "LdapUser", "2.3", 1, app_igrp));
			actions.add(new Action("ChangePassword", "index", "nosi.webapps.igrp.pages.changepassword", "igrp/changepassword/ChangePassword.xsl", "ChangePassword", "ChangePassword", "2.3", 1, app_igrp));			
			actions.add(new Action("_CONS_PROC", "index", "nosi.webapps.igrp.pages._cons_proc", "igrp/_cons_proc/_CONS_PROC.xsl", "Consulta Processo", "Consulta Processo", "2.3", 1, app_igrp));
			actions.add(new Action("DetalhesProcesso", "index", "nosi.webapps.igrp.pages.detalhesprocesso", "igrp/detalhesprocesso/DetalhesProcesso.xsl", "Detalhes Processo", "Detalhes Processo", "2.3", 1, app_igrp));
			actions.add(new Action("Partilhageral", "index", "nosi.webapps.igrp_studio.pages.partilhageral", "igrp_studio/partilhageral/Partilhageral.xsl", "Partilha Inter-Aplicações", "Partilha Inter-Aplicações", "2.3", 1, app_igrp_studio));
			actions.add(new Action("Modulo", "index", "nosi.webapps.igrp_studio.pages.modulo", "igrp_studio/modulo/Modulo.xsl", "Módulo", "Módulo", "2.3", 1, app_igrp_studio));
			actions.add(new Action("Lookup_list_organica", "index", "nosi.webapps.igrp.pages", "igrp/lookup_list_organica/Lookup_list_organica.xsl", "Lookup list organica", "Lookup list organica", "2.3", 1, app_igrp));
			//sql tool get(51)
			actions.add(new Action("Sql_tools", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/sql_tools/Sql_tools.xsl", "SQL Tool", "SQL Tool", "2.3", 1, app_igrp_studio));
			actions.add(new Action("File", "index", "nosi.webapps.igrp.pages", "igrp/file/File.xsl", "File", "File", "2.3", 1, app_igrp));
			actions.add(new Action("Etapaaccess", "index", "nosi.webapps.igrp.pages", "igrp/etapaaccess/Etapaaccess.xsl", "EtapaAccess", "EtapaAccess", "2.3", 1, app_igrp));
			actions.add(new Action("Addfiletask", "index", "nosi.webapps.igrp.pages", "igrp/addfiletask/Addfiletask.xsl", "AddFileTask", "AddFileTask", "2.3", 1, app_igrp));
			//get(55)
			actions.add(new Action("Video_gestao_de_aplicacao", "index", "nosi.webapps.tutorial.pages.video_gestao_de_aplicacao", "tutorial/video_gestao_de_aplicacao/Video_gestao_de_aplicacao.xsl", "video gestão de aplicação", "video gestão de aplicação", "2.3", 1, app_tutorial));
			actions.add(new Action("Video_instalar_igrp_web", "index", "nosi.webapps.tutorial.pages.video_instalar_igrp_web", "tutorial/video_instalar_igrp_web/Video_instalar_igrp_web.xsl", "video instalar igrp web", "video instalar igrp web", "2.3", 1, app_tutorial));
			actions.add(new Action("Video_my_first_app", "index", "nosi.webapps.tutorial.pages.video_my_first_app", "tutorial/video_my_first_app/Video_my_first_app.xsl", "video my first app", "video my first app", "2.3", 1, app_tutorial));
			actions.add(new Action("File_editor", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/file_editor/File_editor.xsl", "File Editor", "File Editor", "2.3", 1, app_igrp_studio));
			actions.add(new Action("Gestao_tipo_documento", "index", "nosi.webapps.igrp.pages", "igrp/gestao_tipo_documento/Gestao_tipo_documento.xsl", "Gestao Tipo Documento", "Gestao Tipo Documento", "2.3", 1, app_igrp));
			//get(60)
			actions.add(new Action("Startprocess", "index", "nosi.webapps.igrp.pages", "igrp/startprocess/Startprocess.xsl", "Start Process", "Start Process", "2.3", 1, app_igrp));
			actions.add(new Action("DefaultPage", "index", "nosi.webapps.tutorial.pages", "tutorial/defaultpage/DefaultPage.xsl", "Default Page", "Default Page", "2.3", 1, app_tutorial));
			actions.add(new Action("Dash_board_processo", "index", "nosi.webapps.igrp.pages", "igrp/dash_board_processo/Dash_board_processo.xsl", "Dash Board Processo", "Dash Board Processo", "2.3", 1, app_igrp));
			actions.add(new Action("Lista_terfa_de_processo", "index", "nosi.webapps.igrp.pages", "igrp/lista_terfa_de_processo/Lista_terfa_de_processo.xsl", "Lista Tarefa de Processo", "Lista Tarefa de Processo", "2.3", 1, app_igrp));
			actions.add(new Action("Wizard_export_step_1", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/wizard_export_step_1/Wizard_export_step_1.xsl", "Export Wizard Step 1", "Export Wizard Step 1", "2.3", 1, app_igrp_studio));
			//get(65)
			actions.add(new Action("Wizard_export_step_2", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/wizard_export_step_2/Wizard_export_step_2.xsl", "Export Wizard Step 2", "Export Wizard Step 2", "2.3", 1, app_igrp_studio));
			Action r1 = new Action("Resetbyemail", "index", "nosi.webapps.igrp.pages", "igrp/resetbyemail/Resetbyemail.xsl", "Reset by email", "Reset by email", "2.3", 1, app_igrp);
			//4 Public page
			r1.setTipo((short)1);
			Action r2 = new Action("Resetpassword", "index", "nosi.webapps.igrp.pages", "igrp/resetpassword/Resetpassword.xsl", "Reset password", "Reset password", "2.3", 1, app_igrp);
			r2.setTipo((short)1);
			actions.add(r1);
			actions.add(r2);
			Action r3 = new Action("Oauth2openidwso2", "index", "nosi.webapps.igrp.pages", "igrp/oauth2openidwso2/Oauth2openidwso2.xsl", "Oauth2openidwso2", "Oauth2openidwso2", "2.3", 1, app_igrp);
			r3.setTipo((short)1);
			actions.add(r3);
			
			actions.add(new Action("Pesquisa_bi_cni_passport", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/pesquisa_bi_cni_passport/Pesquisa_bi_cni_passport.xsl", "Pesquisa BI-CNI-passport", "Pesquisa BI-CNI-passport", "2.3", 1, app_igrp_studio));
			//get(70)
			actions.add(new Action("Pesquisa_nif_rest", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/pesquisa_nif_rest/Pesquisa_nif_rest.xsl", "Pesquisa NIF", "Pesquisa NIF", "2.3", 1, app_igrp_studio));
			Action geo = new Action("Pesquisa_geografia", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/pesquisa_geografia/Pesquisa_geografia.xsl", "Pesquisa Geografia", "Pesquisa Geografia", "2.3", 1, app_igrp_studio);
			geo.setTipo((short)1);
			actions.add(geo);			
			Action nac = new Action("Pesquisa_nacionalidade", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/pesquisa_nacionalidade/Pesquisa_nacionalidade.xsl", "Pesquisa nacionalidade", "Pesquisa nacionalidade", "2.3", 1, app_igrp_studio);
			nac.setTipo((short)1);
			actions.add(nac);
			actions.add(new Action("Wsdl2java", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/wsdl2java/Wsdl2java.xsl", "WSDL2java", "WSDL2java", "2.3", 1, app_igrp_studio));
			actions.add(new Action("Pesquisa_empresa", "index", "nosi.webapps.igrp.pages", "igrp/pesquisa_empresa/Pesquisa_empresa.xsl", "Pesquisa Empresa", "Pesquisa Empresa", "2.3", 1, app_igrp));
			//get(75)
			actions.add(new Action("Daogenerator", "index", "nosi.webapps.igrp_studio.pages", "igrp_studio/daogenerator/Daogenerator.xsl", "DAOGenerator", "DAOGenerator", "2.3", 1, app_igrp_studio));
			actions.add(new Action("Detalhes_dashboard_processo", "index", "nosi.webapps.igrp.pages", "igrp/detalhes_dashboard_processo/Detalhes_dashboard_processo.xsl", "Detalhes dashboard processo", "Detalhes dashboard processo", "2.3", 1, app_igrp));
			
			
			
			for(Action ac:actions){
				ac.insert();
			}
			
			List<Menu> menus = new ArrayList<>();		
				//Profile() the type_fk is 1
			menus.add(new Menu("Gestão de Aplicação", 98, 1, 0, null, null, app_igrp, null));
				//Profile() the type_fk is 2
			menus.add(new Menu("Parametros Gerais", 98, 1, 0, null, null, app_igrp, null));
				//Profile() the type_fk is 3
			menus.add(new Menu("Auditoria", 98, 1, 0, null, null, app_igrp, null));
				//Profile() the type_fk is 4
			menus.add(new Menu("IGRP Studio", 1, 1, 0, null, null, app_igrp_studio, null));			
//		Temp menu for making this menu parent less	
				//Profile() the type_fk is 5
			Menu tempMenuAB = new Menu("Application Builder", 98, 1, 1, "_self", actions.get(2), app_igrp_studio,menus.get(3));
//			tempMenuAB.setMenu(tempMenuAB);
			menus.add(tempMenuAB);
				//Profile() the type_fk is 6
			Menu tempMenuPB = new Menu("Home - Page Builder", 0, 1, 0, "_self", actions.get(0), app_igrp_studio, null);
			tempMenuPB.setMenu(tempMenuPB);
			menus.add(tempMenuPB);
				//Profile() the type_fk is 7
			Menu tempMenuRD = new Menu("Report Designer", 4, 1, 0, "_self", actions.get(22), app_igrp_studio, menus.get(3));
//			tempMenuRD.setMenu(tempMenuRD);
			menus.add(tempMenuRD);
				//Profile() the type_fk is 8
			menus.add(new Menu("Gestão de Menu", 7, 0, 0, "_self", actions.get(8), app_igrp, menus.get(0)));
				//Profile() the type_fk is 9
			menus.add(new Menu("Gestão de Transação", 8, 0, 0, "_self", actions.get(15), app_igrp, menus.get(0)));		
				//Profile() the type_fk is 10
			Menu tempMenuGA = new Menu("Gestão de Acesso", 999, 1, 1, "_self", actions.get(40), app_igrp, null);
			tempMenuGA.setMenu(tempMenuGA);
			menus.add(tempMenuGA);			
				//Profile() the type_fk is 11
			menus.add(new Menu("Gestão de Utilizador", 9, 0, 0, "_self", actions.get(11), app_igrp, menus.get(0)));
				//Profile() the type_fk is 12			
			Menu tempMenuAP = new Menu("Área Pessoal", 1, 1, 1, "_self", actions.get(13), app_igrp,null);
			tempMenuAP.setMenu(tempMenuAP);
			menus.add(tempMenuAP);	
				//Profile() the type_fk is 13
			Menu tempMenuBD = new Menu("BPMN Designer", 1, 1, 0, "_self", actions.get(33), app_igrp_studio, menus.get(3));
//			tempMenuBD.setMenu(tempMenuBD);
			menus.add(tempMenuBD);
				//Profile() the type_fk is 14
			Menu tempMenuCG = new Menu("CRUD Generator", 1, 1, 0, "_self", actions.get(43), app_igrp_studio, menus.get(3));
//			tempMenuCG.setMenu(tempMenuCG);
			menus.add(tempMenuCG);
				//Profile() the type_fk is 15
			Menu tempMenuCP = new Menu("Consultar Processo", 90, 1, 1, "_self", actions.get(46), app_igrp,null);
			tempMenuCP.setMenu(tempMenuCP);
			menus.add(tempMenuCP);
				//Profile() the type_fk is 16
			Menu tempMenuOA = new Menu("OAuth Client Id", 99, 0, 0, "_self", actions.get(26), app_igrp, null);
			tempMenuOA.setMenu(tempMenuOA);
			menus.add(tempMenuOA);					
			//Profile() the type_fk is 17
			Menu partilha = new Menu("Partilha Inter-Aplicações", 98, 1, 1, "_self", actions.get(48), app_igrp_studio, null);
			partilha.setMenu(partilha);
			menus.add(partilha);
			//Profile() the type_fk is 18
			Menu sql = new Menu("SQL Tool", 99, 1, 0, "modal", actions.get(51), app_igrp_studio, null);
			sql.setMenu(sql);
			menus.add(sql);
			//Profile() the type_fk is 19
			Menu migrate = new Menu("Migrate IGRP", 99, 1, 0, "_self", actions.get(25), app_igrp, null);
			migrate.setMenu(migrate);
			menus.add(migrate);			
			Menu Gestao_tipo_documento = new Menu("Gestao tipo documento", 99, 1, 0, "_self", actions.get(59), app_igrp, null);
			Gestao_tipo_documento.setMenu(Gestao_tipo_documento);
			menus.add(Gestao_tipo_documento);			
			Menu GestDominio = new Menu("Gestão de Domínio", 99, 1, 1, "_self", actions.get(3), app_igrp, null);
			GestDominio.setMenu(GestDominio);
			menus.add(GestDominio);			
			Menu wsdl2java = new Menu("WSDL2Java", 99, 1, 0, "modal", actions.get(73), app_igrp_studio, null);
			wsdl2java.setMenu(wsdl2java);
			menus.add(wsdl2java);
			
			for(Menu m:menus){
				m.insert();
			}
			
			List<Profile> profiles = new ArrayList<>();
			//permisao de acesso a aplicacao
			profiles.add(new Profile(1, "ENV", prof1_ADMIN, user1demo, org_IGRP));
			//permisao de acesso do utilizador a perfil
			profiles.add(new Profile(2, "PROF", prof1_ADMIN, user1demo, org_IGRP));
			
			//permisao de acesso a aplicacao tutotrial
			profiles.add(new Profile(2, "ENV", prof_tutorial, user1demo, org_tutorial));
			//permisao de acesso do utilizador a perfil do tutorial
			profiles.add(new Profile(3, "PROF", prof_tutorial, user1demo, org_tutorial));
			
			//permisao de acesso a aplicacao tutotrial
			profiles.add(new Profile(3, "ENV", prof_dev_igrp_studio, user1demo,org_igrp_studio));
			//permisao de acesso do utilizador a perfil do tutorial
			profiles.add(new Profile(4, "PROF", prof_dev_igrp_studio, user1demo, org_igrp_studio));		
			
			//permisao de acesso a aplicacao
			profiles.add(new Profile(1, "ENV", prof1_ADMIN, user0_IGRP, org_IGRP));
			//permisao de acesso do utilizador a perfil
			profiles.add(new Profile(2, "PROF", prof1_ADMIN, user0_IGRP, org_IGRP));
			
			//permisao de acesso a aplicacao tutotrial
			profiles.add(new Profile(2, "ENV", prof_tutorial, user0_IGRP, org_tutorial));
			//permisao de acesso do utilizador a perfil do tutorial
			profiles.add(new Profile(3, "PROF", prof_tutorial, user0_IGRP, org_tutorial));
			
			//permisao de acesso a aplicacao tutotrial
			profiles.add(new Profile(3, "ENV", prof_dev_igrp_studio, user0_IGRP,org_igrp_studio));
			//permisao de acesso do utilizador a perfil do tutorial
			profiles.add(new Profile(4, "PROF", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));	
			
			//permisao de acesso ao menu
			profiles.add(new Profile(5, "MEN",prof1_ADMIN, user0_IGRP, org_IGRP)); 
			profiles.add(new Profile(5, "MEN",prof0_ALL, user0_IGRP, org_IGRP));
			profiles.add(new Profile(5, "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(6, "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(7, "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			
			profiles.add(new Profile(8, "MEN", prof0_ALL, user0_IGRP, org_IGRP));
			profiles.add(new Profile(9, "MEN", prof0_ALL, user0_IGRP, org_IGRP));
			profiles.add(new Profile(10, "MEN", prof0_ALL, user0_IGRP, org_IGRP));
			profiles.add(new Profile(11, "MEN", prof0_ALL, user0_IGRP, org_IGRP));
			profiles.add(new Profile(12, "MEN", prof0_ALL, user0_IGRP, org_IGRP));
			profiles.add(new Profile(16, "MEN", prof0_ALL, user0_IGRP, org_IGRP));
			profiles.add(new Profile(8, "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(9, "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(10, "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(13, "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(14, "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(15, "MEN", prof0_ALL, user0_IGRP, org_IGRP));
			profiles.add(new Profile(15, "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
	
			
			profiles.add(new Profile(5, "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(6, "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(7, "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			
			profiles.add(new Profile(8, "MEN", prof1_ADMIN, user0_IGRP, org_IGRP));
			profiles.add(new Profile(9, "MEN", prof1_ADMIN, user0_IGRP, org_IGRP));
			profiles.add(new Profile(10, "MEN", prof1_ADMIN, user0_IGRP, org_IGRP));
			profiles.add(new Profile(11, "MEN", prof1_ADMIN, user0_IGRP, org_IGRP));
			profiles.add(new Profile(12, "MEN", prof1_ADMIN, user0_IGRP, org_IGRP));
			profiles.add(new Profile(15, "MEN", prof1_ADMIN, user0_IGRP, org_IGRP));
			profiles.add(new Profile(16, "MEN", prof1_ADMIN, user0_IGRP, org_IGRP));
			profiles.add(new Profile(8, "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(9, "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(10, "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(13, "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(14, "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(15, "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));			
			
			profiles.add(new Profile(partilha.getId(), "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(partilha.getId(), "MEN", prof1_ADMIN, user0_IGRP, org_IGRP));
			profiles.add(new Profile(partilha.getId(), "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(sql.getId(), "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(sql.getId(), "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(migrate.getId(), "MEN", prof0_ALL, user0_IGRP, org_IGRP));
			profiles.add(new Profile(migrate.getId(), "MEN", prof1_ADMIN, user0_IGRP, org_IGRP));
			profiles.add(new Profile(Gestao_tipo_documento.getId(), "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(Gestao_tipo_documento.getId(), "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));			
			profiles.add(new Profile(GestDominio.getId(), "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(GestDominio.getId(), "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));				
			profiles.add(new Profile(wsdl2java.getId(), "MEN", prof0_ALL, user0_IGRP, org_igrp_studio));
			profiles.add(new Profile(wsdl2java.getId(), "MEN", prof_dev_igrp_studio, user0_IGRP, org_igrp_studio));
		
			
			for(Profile p:profiles){
				p.insert();
			}
			
			//colocar a aplicacao tutorial uma outra pagina default 
			app_tutorial = app_tutorial.findOne(2);
			if(app_tutorial != null) {
				app_tutorial.setAction(new Action().find().andWhere("page", "=", "GeralApresentacao").andWhere("application", "=", app_tutorial.getId()).one()); 
				app_tutorial = app_tutorial.update();
			}
			
			//colocar a aplicacao IGRP studio uma outra pagina default
			if(app_igrp_studio != null) {
				Action ac = new Action().find().andWhere("page", "=", "ListaPage").andWhere("application", "=", app_igrp_studio.getId()).one();
				app_igrp_studio.setAction(ac); 
				app_igrp_studio = app_igrp_studio.update();
			}
			profiles = null;
			menus = null;
			actions = null;
			new CreateViews();
		}
		
		User aux = new User();
		aux.setAuth_key("123456");
		aux.setCreated_at(12345);
		aux.setPass_hash("Pa$$w0rd");
		aux.setStatus(1);
		aux.setUpdated_at(133);
		aux.setUser_name("root");
		aux.setActivation_key("123456789");
		aux = aux.insert();
	}
}