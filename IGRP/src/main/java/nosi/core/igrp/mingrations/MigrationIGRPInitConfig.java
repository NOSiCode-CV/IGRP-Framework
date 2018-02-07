package nosi.core.igrp.mingrations;

/**
 * @author: Emanuel Pereira
 * 30 Jun 2017
 */
import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.Igrp;
import nosi.core.webapp.activit.rest.GroupService;
import nosi.core.webapp.activit.rest.UserService;
import nosi.webapps.igrp.dao.*;
import nosi.webapps.igrp.dao.views.CreateViews;
 
public class MigrationIGRPInitConfig {

	
	public static void start(){
		Application igrp = new Application();
		igrp.setDad("igrp");
		igrp.setDescription("IGRP");
		igrp.setName("IGRP");
		igrp.setImg_src("igrp.svg");
		igrp.setStatus(1);
		igrp = igrp.insertOnly();
		
		Application tutorial = new Application("tutorial", "Tutorial IGRP", "icon_educacao.png", "Mostra o que fazer com o IGRP JAVA Framework", 1, null);
		tutorial = tutorial.insertOnly();
		
		Application igrp_studio = new Application("igrp_studio", "IGRP Studio", "studioSoLogo.svg", "IGRP Studio - Software Developer", 1, null,"igrp_studio");
		igrp_studio = igrp_studio.insertOnly();
		
		if(igrp!=null){
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
			
			User user0 = new User("IGRP", "igrp@nosi.cv", " ", "ADMIN", null, 1, null, "123456789", "admin",null, null, null, null, null,"123456789", 2017, 2017);
			user0 = user0.insert();
			user0 = user0.updateTozero();
			User user1 = new User("Nositeste", "demo@nosi.cv", "fe01ce2a7fbac8fafaed7c982a04e229", "ADMIN", null, 1, null, "123456789", "demo",null, null, null, null, null,"123456", 2017, 2017);
			user1 = user1.insert();
			/** For SSO tomcat realm  **/
			UserRole role = new UserRole();
			String role_name = Igrp.getInstance().getServlet().getInitParameter("role_name");
			role.setRole_name(role_name != null && !role_name.trim().isEmpty() ? role_name : "IGRP_ADMIN");
			role.setUser(user1);
			role.insert();
			/** **/
			
			Organization org = new Organization("01.03", "IGRP", 1, igrp, user0, null);
			org = org.insert();	

			ProfileType prof0 = new ProfileType("ALL PROFILE", "ALL", 1, null, igrp, null);
			prof0 = prof0.insert();
			prof0 = prof0.updateToZero();
			
			ProfileType prof1 = new ProfileType("Administrador", "ADMIN", 1, org, igrp, null);
			prof1 = prof1.insert();
			
			//Organizacao do tutorial
			Organization tutorial_org = new Organization("org.tutorial", "Tutorial", 1, tutorial, user0, null);
			tutorial_org = tutorial_org.insert();
			
			//Perfil da aplicacao tutorial
			ProfileType tutorial_prof = new ProfileType("Tutorial", "perfil.tutorial", 1,tutorial_org, tutorial, null);
			tutorial_prof = tutorial_prof.insert();
			
			//Organizacao do IGRP Studio
			Organization igrp_studio_org = new Organization("org.developer", "Developers", 1, igrp_studio, user0, null);
			igrp_studio_org = igrp_studio_org.insert();
			
			//Perfil da aplicacao IGRP Studio
			ProfileType igrp_studio_prof = new ProfileType("Developer", "perfil.developer", 1, igrp_studio_org, igrp_studio, null);
			igrp_studio_prof = igrp_studio_prof.insert();
			
			//Cria grupo e utilizadores no Activiti
			GroupService group = new GroupService();
			group.setId(org.getCode()+"."+prof1.getCode());
			group.setName(org.getName()+" - "+prof1.getDescr());
			group.setType("assignment");
			group.create(group);
			
			UserService userActiviti0 = new UserService();
			userActiviti0.setId(user0.getUser_name());
			userActiviti0.setPassword("password.igrp");
			userActiviti0.setFirstName(user0.getName());
			userActiviti0.setLastName("");
			userActiviti0.setEmail(user0.getEmail());
			userActiviti0.create(userActiviti0);	
			
			UserService userActiviti1 = new UserService();
			userActiviti1.setId(user1.getUser_name());
			userActiviti1.setPassword("password.igrp");
			userActiviti1.setFirstName(user1.getName());
			userActiviti1.setLastName("");
			userActiviti1.setEmail(user1.getEmail());
			userActiviti1.create(userActiviti1);	
			
			group.addUser(userActiviti0.getId());
			group.addUser(userActiviti1.getId());
			
			List<Action> actions = new ArrayList<>();
			actions.add(new Action("ListaPage", "index", "nosi.webapps.igrp_studio.pages.listapage", "igrp_studio/listapage/ListaPage.xsl", "Page builder", "Page builder", "2.3", 1, igrp_studio));
			actions.add(new Action("Env", "index", "nosi.webapps.igrp_studio.pages.env", "igrp_studio/env/Env.xsl", "Registar Aplicacao", "Registar Aplicacao", "2.3", 1, igrp_studio));
			actions.add(new Action("ListaEnv", "index", "nosi.webapps.igrp_studio.pages.listaenv", "igrp_studio/listaenv/ListaEnv.xsl", "Application builder", "Application builder", "2.3", 1, igrp_studio));
			actions.add(new Action("Dominio", "index", "nosi.webapps.igrp.pages.dominio", "igrp/dominio/Dominio.xsl", "Gestão de Dominio", "Gestão de Dominio", "2.3", 1, igrp));
			actions.add(new Action("NovoDominio", "index", "nosi.webapps.igrp.pages.novodominio", "igrp/novodominio/NovoDominio.xsl", "Registar Dominio", "Registar Dominio", "2.3", 1, igrp));
			actions.add(new Action("PesquisarOrganica", "index", "nosi.webapps.igrp.pages.pesquisarorganica", "igrp/pesquisarorganica/PesquisarOrganica.xsl", "Gestão de Organica", "Gestão de Organica", "2.3", 1, igrp));
			actions.add(new Action("NovaOrganica", "index", "nosi.webapps.igrp.pages.novaorganica", "igrp/novaorganica/NovaOrganica.xsl", "Registar Organica", "Registar Organica", "2.3", 1, igrp));
			actions.add(new Action("NovoMenu", "index", "nosi.webapps.igrp.pages.novomenu", "igrp/novomenu/NovoMenu.xsl", "Registar Menu", "Registar Menu", "2.3", 1, igrp));
			actions.add(new Action("PesquisarMenu", "index", "nosi.webapps.igrp.pages.pesquisarmenu", "igrp/pesquisarmenu/PesquisarMenu.xsl", "Gestão de Menu", "Gestão de Menu", "2.3", 1, igrp));
			actions.add(new Action("NovoPerfil", "index", "nosi.webapps.igrp.pages.novoperfil", "igrp/novoperfil/NovoPerfil.xsl", "Registar Perfil", "Registar Perfil", "2.3", 1, igrp));
			actions.add(new Action("PesquisarPerfil", "index", "nosi.webapps.igrp.pages.pesquisarperfil", "igrp/pesquisarperfil/PesquisarPerfil.xsl", "Gestão de Perfil", "Gestão de Perfil", "2.3", 1, igrp));
			actions.add(new Action("PesquisarUtilizador", "index", "nosi.webapps.igrp.pages.pesquisarutilizador", "igrp/pesquisarutilizador/PesquisarUtilizador.xsl", "Gestão de Utilizador", "Gestão de Utilizador", "2.3", 1, igrp));
			actions.add(new Action("NovoUtilizador", "index", "nosi.webapps.igrp.pages.novoutilizador", "igrp/novoutilizador/NovoUtilizador.xsl", "Convidar Utilizador", "Convidar Utilizador", "2.3", 1, igrp));
			actions.add(new Action("Settings", "index", "nosi.webapps.igrp.pages.settings", "igrp/settings/Settings.xsl", "Área pessoal", "Área pessoal", "2.3", 1, igrp));
			actions.add(new Action("RegistarUtilizador", "index", "nosi.webapps.igrp.pages.registarutilizador", "igrp/registarutilizador/RegistarUtilizador.xsl", "Registar Utilizador", "Registar Utilizador", "2.3", 1, igrp));
			actions.add(new Action("Transaccao", "index", "nosi.webapps.igrp.pages.transaccao", "igrp/transaccao/Transaccao.xsl", "Transaccao", "Transaccao", "2.3", 1, igrp));
			actions.add(new Action("Page", "index", "nosi.webapps.igrp.pages.page", "igrp/page/Page.xsl", "Registar Pagina", "Registar Pagina", "2.3", 1, igrp));
			actions.add(new Action("MenuOrganica", "index", "nosi.webapps.igrp.pages.menuorganica", "igrp/menuorganica/MenuOrganica.xsl", "Associar Menu a Organica", "Associar Menu a Organica", "2.3", 1, igrp));
			actions.add(new Action("ErrorPage", "index", "nosi.webapps.igrp.pages.errorpage", "igrp/errorpage/ErrorPage.xsl", "Pagina de Erro", "Pagina de Erro", "2.3", 1, igrp));
			actions.add(new Action("TransacaoOrganica", "index", "nosi.webapps.igrp.pages.transacaoorganica", "igrp/transacaoorganica/TransacaoOrganica.xsl", "Associar Transacao a Organica", "Associar Transacao a Organica", "2.3", 1, igrp));
			actions.add(new Action("EditarTransacao", "index", "nosi.webapps.igrp.pages.editartransacao", "igrp/editartransacao/EditarTransacao.xsl", "Editar Transacao", "Editar Transacao", "2.3", 1, igrp));
			actions.add(new Action("Session", "index", "nosi.webapps.igrp.pages.session", "igrp/session/Session.xsl", "Gestao de Sessao", "Gestao de Sessao", "2.3", 1, igrp));
			actions.add(new Action("WebReport", "index", "nosi.webapps.igrp_studio.pages.webreport", "igrp_studio/webreport/WebReport.xsl", "Report Builder", "Report Builder", "2.3", 1, igrp_studio));
			actions.add(new Action("DataSource", "index", "nosi.webapps.igrp.pages.datasource", "igrp/datasource/DataSource.xsl", "Registar Data Source", "Registar Data Source", "2.3", 1, igrp));
			actions.add(new Action("LookupListPage", "index", "nosi.webapps.igrp.pages.lookuplistpage", "igrp/lookuplistpage/LookupListPage.xsl", "Lista de Pagina Para Lookup", "Lista de Pagina Para Lookup", "2.3", 1, igrp));
			actions.add(new Action("Migrate", "index", "nosi.webapps.igrp.pages.migrate", "igrp/migrate/Migrate.xsl", "Migrate IGRP", "Migrate IGRP", "2.3", 1, igrp));
			actions.add(new Action("OAuthClientList", "index", "nosi.webapps.igrp.pages.oauthclientlist", "igrp/oauthclientlist/OAuthClientList.xsl", "pesquisar Dados dos clientes", "pesquisar Dados dos clientes", "2.3", 1, igrp));
			actions.add(new Action("OAuthClient", "index", "nosi.webapps.igrp.pages.oauthclient", "igrp/oauthclient/OAuthClient.xsl", "Inserir Dados dos clientes", "Inserir Dados dos clientes", "2.3", 1, igrp));
			actions.add(new Action("MapaProcesso", "index", "nosi.webapps.igrp.pages.mapaprocesso", "igrp/mapaprocesso/MapaProcesso.xsl", "Mapa Processo", "Mapa Processo", "2.3", 1, igrp));
			actions.add(new Action("ExecucaoTarefas", "index", "nosi.webapps.igrp.pages.execucaotarefas", "igrp/execucaotarefas/ExecucaoTarefas.xsl", "Execucao Tarefas", "Execucao Tarefas", "2.3", 1, igrp));
			actions.add(new Action("LookupListUser", "index", "nosi.webapps.igrp.pages.lookuplistuser", "igrp/lookuplistuser/LookupListUser.xsl", "Lookup Lista Utilizador", "Lookup Lista Utilizador", "2.3", 1, igrp));
			actions.add(new Action("Alter_prioridade_tarefa", "index", "nosi.webapps.igrp.pages.alter_prioridade_tarefa", "igrp/alter_prioridade_tarefa/Alter_prioridade_tarefa.xsl", "Alter prioridade tarefa", "Alter prioridade tarefa", "2.3", 1, igrp));
			actions.add(new Action("Transferir_tarefas", "index", "nosi.webapps.igrp.pages.transferir_tarefas", "igrp/transferir_tarefas/Transferir_tarefas.xsl", "Transferir tarefas", "Transferir tarefas", "2.3", 1, igrp));
			actions.add(new Action("BPMNDesigner", "index", "nosi.webapps.igrp_studio.pages.bpmndesigner", "igrp_studio/bpmndesigner/BPMNDesigner.xsl", "BPMN Designer", "BPMN Designer", "2.3", 1, igrp_studio));
			actions.add(new Action("Import_export", "index", "nosi.webapps.igrp.pages.import_export", "igrp/import_export/Import_export.xsl", "Import export", "Import export", "2.3", 1, igrp));
			actions.add(new Action("ImportArquivo", "index", "nosi.webapps.igrp_studio.pages.importarquivo", "igrp_studio/importarquivo/ImportArquivo.xsl", "Import Arquivo", "Import Arquivo", "2.3", 1, igrp_studio));
			actions.add(new Action("ConfigDatabase", "index", "nosi.webapps.igrp.pages.configdatabase", "igrp/configdatabase/ConfigDatabase.xsl", "Configurar Base de Dados", "Configurar Base de Dados de uma aplicação", "2.3", 1, igrp));
			actions.add(new Action("PesquisaBI", "index", "nosi.webapps.igrp.pages.pesquisabi", "igrp/pesquisabi/PesquisaBI.xsl", "Pesquisar BI", "Pesquisar BI", "2.3", 1, igrp));
			actions.add(new Action("PesquisaNIF", "index", "nosi.webapps.igrp.pages.pesquisanif", "igrp/pesquisanif/PesquisaNIF.xsl", "Pesquisar NIF", "Pesquisar NIF", "2.3", 1, igrp));
			actions.add(new Action("PesquisaNascimento", "index", "nosi.webapps.igrp.pages.pesquisanascimento", "igrp/pesquisanascimento/PesquisaNascimento.xsl", "Pesquisar Nascimento", "Pesquisar Nascimento", "2.3", 1, igrp));
			actions.add(new Action("Gestaodeacesso", "index", "nosi.webapps.igrp.pages.gestaodeacesso", "igrp/gestaodeacesso/Gestaodeacesso.xsl", "Gestao de Acesso", "Gestao de Acesso", "2.3", 1, igrp));
			actions.add(new Action("GeralApresentacao", "index", "nosi.webapps.tutorial.pages.geralapresentacao", "tutorial/geralapresentacao/GeralApresentacao.xsl", "O que fazer dentro do IGRP JAVA...", "O que fazer dentro do IGRP JAVA...", "2.3", 1, tutorial));
			actions.add(new Action("HomeStudio", "index", "nosi.webapps.igrp_studio.pages.homestudio", "igrp_studio/homestudio/HomeStudio.xsl", "HomeStudio", "HomeStudio", "2.3", 1, igrp_studio));
			actions.add(new Action("CRUDGenerator", "index", "nosi.webapps.igrp_studio.pages.crudgenerator", "igrp_studio/crudgenerator/CRUDGenerator.xsl", "CRUDGenerator", "CRUD Generator", "2.3", 1, igrp_studio));
			
			actions.add(new Action("LdapUser", "index", "nosi.webapps.igrp.pages.ldapuser", "igrp/ldapuser/LdapUser.xsl", "LdapUser", "LdapUser", "2.3", 1, igrp));
			actions.add(new Action("ChangePassword", "index", "nosi.webapps.igrp.pages.changepassword", "igrp/changepassword/ChangePassword.xsl", "ChangePassword", "ChangePassword", "2.3", 1, igrp));
			
			actions.add(new Action("_CONS_PROC", "index", "nosi.webapps.igrp.pages._cons_proc", "igrp/_cons_proc/_CONS_PROC.xsl", "Consulta Processo", "Consulta Processo", "2.3", 1, igrp));
			actions.add(new Action("DetalhesProcesso", "index", "nosi.webapps.igrp.pages.detalhesprocesso", "igrp/detalhesprocesso/DetalhesProcesso.xsl", "Detalhes Processo", "Detalhes Processo", "2.3", 1, igrp));
			
			for(Action ac:actions){
				ac.insert();
			}
			
			List<Menu> menus = new ArrayList<>();			
			menus.add(new Menu("Gestão de Aplicação", 1, 1, 0, null, null, igrp, null));
			menus.add(new Menu("Parametros Gerais", 1, 1, 0, null, null, igrp, null));
			menus.add(new Menu("Auditoria", 1, 1, 0, null, null, igrp, null));
			menus.add(new Menu("IGRP Studio", 1, 1, 0, null, null, igrp_studio, null));
			//menus.add(new Menu("Import/Export", 1, 1, 0, null, null, app, null));
			//menus.add(new Menu("Pesquisas Gerais", 1, 1, 0, null, null, app, null)); 
			
//		Temp menu for making this menu parent less	
			Menu tempMenuAB = new Menu("Application Builder", 2, 1, 1, "_self", actions.get(2), igrp,null);
			tempMenuAB.setMenu(tempMenuAB);
			menus.add(tempMenuAB);
			Menu tempMenuPB = new Menu("Page Builder", 3, 1, 0, "_self", actions.get(0), igrp_studio, null);
			tempMenuPB.setMenu(tempMenuPB);
			menus.add(tempMenuPB);
			Menu tempMenuRD = new Menu("Report Designer", 4, 1, 0, "_self", actions.get(22), igrp_studio, null);
			tempMenuRD.setMenu(tempMenuRD);
			menus.add(tempMenuRD);
			
			menus.add(new Menu("Gestão de Menu", 9, 1, 0, "_self", actions.get(8), igrp, menus.get(0)));
			menus.add(new Menu("Gestão de Transação", 9, 1, 0, "_self", actions.get(15), igrp, menus.get(0)));			
			menus.add(new Menu("Gestão de Acesso", 9, 1, 0, "_self", actions.get(40), igrp, menus.get(0)));
			menus.add(new Menu("Gestão de Utilizador", 9, 1, 0, "_self", actions.get(11), igrp, menus.get(0)));
			
			Menu tempMenuAP = new Menu("Área Pessoal", 1, 0, 1, "_self", actions.get(13), igrp,null);
			tempMenuAP.setMenu(tempMenuAP);
			menus.add(tempMenuAP);
			
			
			
//			menus.add(new Menu("Parametros de Auditoria", 1, 1, 0, "_self", actions.get(21), igrp, menus.get(2)));

			//menus.add(new Menu("Gestão de Orgânica", 1, 1, 0, "_self", actions.get(5), app, menus.get(1)));
			//menus.add(new Menu("Gestão de Perfil", 1, 1, 0, "_self", actions.get(10), app, menus.get(1)));
			//menus.add(new Menu("Migração IGRP", 1, 1, 0, "_self", actions.get(25), app, menus.get(0)));
			
			
			Menu tempMenuBD = new Menu("BPMN Designer", 1, 1, 0, "_self", actions.get(33), igrp_studio, null);
			tempMenuBD.setMenu(tempMenuBD);
			menus.add(tempMenuBD);
			
			Menu tempMenuCG = new Menu("CRUD Generator", 1, 1, 0, "_self", actions.get(43), igrp_studio, null);
			tempMenuCG.setMenu(tempMenuCG);
			menus.add(tempMenuCG);
			
			Menu tempMenuCP = new Menu("Consultar Processo", 1, 0, 1, "_self", actions.get(46), igrp,null);
			tempMenuCP.setMenu(tempMenuCP);
			menus.add(tempMenuCP);
			
			menus.add(new Menu("OAuth Client Id", 1, 1, 0, "_self", actions.get(26), igrp, menus.get(0)));
			
			//menus.add(new Menu("Gestão dos Import/Export", 1, 1, 0, "_self", actions.get(34), app, menus.get(2)));
			//menus.add(new Menu("Importar Aplicação/Página/Jar", 1, 1, 0, "_self", actions.get(35), app, menus.get(4)));
	
			//menus.add(new Menu("Pesquisar BI", 1, 1, 0, "_self", actions.get(37), app, menus.get(5)));
			//menus.add(new Menu("Pesquisar NIF", 1, 1, 0, "_self", actions.get(38), app, menus.get(5)));
			//menus.add(new Menu("Pesquisar Nascimento", 1, 1, 0, "_self", actions.get(39), app, menus.get(5)));
			for(Menu m:menus){
				m.insert();
			}
			
			List<Profile> profiles = new ArrayList<>();
			//permisao de acesso a aplicacao
			profiles.add(new Profile(1, "ENV", prof1, user1, org));
			//permisao de acesso do utilizador a perfil
			profiles.add(new Profile(2, "PROF", prof1, user1, org));
			
			//permisao de acesso a aplicacao tutotrial
			profiles.add(new Profile(2, "ENV", tutorial_prof, user1, tutorial_org));
			//permisao de acesso do utilizador a perfil do tutorial
			profiles.add(new Profile(3, "PROF", tutorial_prof, user1, tutorial_org));
			
			//permisao de acesso a aplicacao tutotrial
			profiles.add(new Profile(3, "ENV", igrp_studio_prof, user1,igrp_studio_org));
			//permisao de acesso do utilizador a perfil do tutorial
			profiles.add(new Profile(4, "PROF", igrp_studio_prof, user1, igrp_studio_org));		
			
			//permisao de acesso ao menu
			profiles.add(new Profile(5, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(6, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(7, "MEN", prof0, user0, igrp_studio_org));
			
			profiles.add(new Profile(8, "MEN", prof0, user0, org));
			profiles.add(new Profile(9, "MEN", prof0, user0, org));
			profiles.add(new Profile(10, "MEN", prof0, user0, org));
			profiles.add(new Profile(11, "MEN", prof0, user0, org));
			profiles.add(new Profile(12, "MEN", prof0, user0, org));
			profiles.add(new Profile(16, "MEN", prof0, user0, org));
			profiles.add(new Profile(8, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(9, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(10, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(13, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(14, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(15, "MEN", prof0, user0, org));
			profiles.add(new Profile(15, "MEN", prof0, user0, igrp_studio_org));
//			profiles.add(new Profile(17, "MEN", prof0, user0, org));		
			
			profiles.add(new Profile(5, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(6, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(7, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			
			profiles.add(new Profile(8, "MEN", prof1, user0, org));
			profiles.add(new Profile(9, "MEN", prof1, user0, org));
			profiles.add(new Profile(10, "MEN", prof1, user0, org));
			profiles.add(new Profile(11, "MEN", prof1, user0, org));
			profiles.add(new Profile(12, "MEN", prof1, user0, org));
			profiles.add(new Profile(15, "MEN", prof1, user0, org));
			profiles.add(new Profile(16, "MEN", prof1, user0, org));
			profiles.add(new Profile(8, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(9, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(10, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(13, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(14, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(15, "MEN", igrp_studio_prof, user0, igrp_studio_org));
//			profiles.add(new Profile(16, "MEN", prof1, user0, org));
//			profiles.add(new Profile(17, "MEN", prof1, user0, org));
			
			for(Profile p:profiles){
				p.insert();
			}
			
			//colocar a aplicacao tutorial uma outra pagina default
			tutorial = tutorial.findOne(2);
			if(tutorial != null) {
				tutorial.setAction(new Action().find().andWhere("page", "=", "GeralApresentacao").andWhere("application", "=", tutorial.getId()).one()); 
				tutorial = tutorial.update();
			}
			
			//colocar a aplicacao IGRP studio uma outra pagina default
			if(igrp_studio != null) {
				Action ac = new Action().find().andWhere("page", "=", "ListaPage").andWhere("application", "=", igrp_studio.getId()).one();
				igrp_studio.setAction(ac); 
				igrp_studio = igrp_studio.update();
			}
			profiles = null;
			menus = null;
			actions = null;
			new CreateViews();
			
			
		}
		
		//inserindo dados by default na tabela Scope
		OAuthScope objScope = new OAuthScope("login", 0);
		objScope.insert();
		
		User aux = new User();
		aux.setAuth_key("123456");
		aux.setCreated_at(12345);
		aux.setPass_hash("Pa$$w0rd");
		aux.setStatus(1);
		aux.setUpdated_at(133);
		aux.setUser_name("root");
		aux.setActivation_key("123456789");
		aux = aux.insert();
		
		if(aux != null)
			for(String r : new String[] {"admin", "admin-script", "manager-gui", "manager-script", "manager-xml", "manager-status", "admin-gui"}) {
				UserRole role = new UserRole();
				role.setRole_name(r);
				role.setUser(aux);
				role.insert();
			}
		
	}
}