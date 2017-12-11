package nosi.core.igrp.mingrations;

/**
 * @author: Emanuel Pereira
 * 30 Jun 2017
 */
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.activit.rest.GroupService;
import nosi.core.webapp.activit.rest.UserService;
import nosi.webapps.igrp.dao.*;
import nosi.webapps.igrp.dao.views.CreateViews;

public class MigrationIGRPInitConfig {

	
	public static void start(){
		Application app = new Application();
		app.setDad("igrp");
		app.setDescription("IGRP");
		app.setName("IGRP");
		app.setImg_src("app_casacidadao.png");
		app.setStatus(1);
		app = app.insertOnly();
		
		Application tutorial = new Application("tutorial", "Tutorial IGRP", "default.png", "Mostra o que fazer com o IGRP JAVA Framework", 1, null);
		tutorial = tutorial.insertOnly();
		
		Application igrp_studio = new Application("igrp_studio", "IGRP Studio", "default.png", "IGRP Studio - Software Developer", 1, null,"igrp_studio");
		igrp_studio = igrp_studio.insertOnly();
		
		if(app!=null){
			Config config = new Config("url_ativiti_connection", "http://10.4.10.37/activiti-rest/service/");
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
			
			
			User user0 = new User("IGRP", "igrp@nosi.cv", " ", "ADMIN", null, 1, null, 123456789, "admin",null, null, null, null, null,"123456789", 2017, 2017);
			user0 = user0.insert();
			user0 = user0.updateTozero();
			User user1 = new User("Nositeste", "nositeste@nosi.cv", "fe01ce2a7fbac8fafaed7c982a04e229", "ADMIN", null, 1, null, 123456789, "demo",null, null, null, null, null,"123456", 2017, 2017);
			user1 = user1.insert();
			
			Organization org = new Organization("01.03", "NOSI", 1, app, user0, null);
			org = org.insert();	

			ProfileType prof0 = new ProfileType("ALL PROFILE", "ALL", 1, null, app, null);
			prof0 = prof0.insert();
			prof0 = prof0.updateToZero();
			
			ProfileType prof1 = new ProfileType("Administrador", "ADMIN", 1, org, app, null);
			prof1 = prof1.insert();
			
			//Organizacao do tutorial
			Organization tutorial_org = new Organization("org.tutorial", "Tutorial", 1, tutorial, user0, null);
			tutorial_org = tutorial_org.insert();
			
			//Perfil da aplicacao tutorial
			ProfileType tutrial_prof = new ProfileType("Tutorial", "perfil.tutorial", 1,tutorial_org, tutorial, null);
			tutrial_prof = tutrial_prof.insert();
			
			//Organizacao do IGRP Studio
			Organization igrp_studio_org = new Organization("org.developer", "Developer", 1, igrp_studio, user0, null);
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
			actions.add(new Action("ListaPage", "index", "nosi.webapps.igrp.pages.listapage", "igrp/listapage/ListaPage.xsl", "Lista de Paginas", "Lista de Paginas", "2.3", 1, app));
			actions.add(new Action("Env", "index", "nosi.webapps.igrp.pages.env", "igrp/env/Env.xsl", "Registar Aplicacao", "Registar Aplicacao", "2.3", 1, app));
			actions.add(new Action("ListaEnv", "index", "nosi.webapps.igrp.pages.listaenv", "igrp/listaenv/ListaEnv.xsl", "Lista de Aplicacao", "Lista de Aplicacao", "2.3", 1, app));
			actions.add(new Action("Dominio", "index", "nosi.webapps.igrp.pages.dominio", "igrp/dominio/Dominio.xsl", "Lista de Dominio", "Lista de Dominio", "2.3", 1, app));
			actions.add(new Action("NovoDominio", "index", "nosi.webapps.igrp.pages.novodominio", "igrp/novodominio/NovoDominio.xsl", "Registar Dominio", "Registar Dominio", "2.3", 1, app));
			actions.add(new Action("PesquisarOrganica", "index", "nosi.webapps.igrp.pages.pesquisarorganica", "igrp/pesquisarorganica/PesquisarOrganica.xsl", "Lista de Organica", "Lista de Organica", "2.3", 1, app));
			actions.add(new Action("NovaOrganica", "index", "nosi.webapps.igrp.pages.novaorganica", "igrp/novaorganica/NovaOrganica.xsl", "Registar Organica", "Registar Organica", "2.3", 1, app));
			actions.add(new Action("NovoMenu", "index", "nosi.webapps.igrp.pages.novomenu", "igrp/novomenu/NovoMenu.xsl", "Registar Menu", "Registar Menu", "2.3", 1, app));
			actions.add(new Action("PesquisarMenu", "index", "nosi.webapps.igrp.pages.pesquisarmenu", "igrp/pesquisarmenu/PesquisarMenu.xsl", "Lista de Menu", "Lista de Menu", "2.3", 1, app));
			actions.add(new Action("NovoPerfil", "index", "nosi.webapps.igrp.pages.novoperfil", "igrp/novoperfil/NovoPerfil.xsl", "Registar Perfil", "Registar Perfil", "2.3", 1, app));
			actions.add(new Action("PesquisarPerfil", "index", "nosi.webapps.igrp.pages.pesquisarperfil", "igrp/pesquisarperfil/PesquisarPerfil.xsl", "Lista de Perfil", "Lista de Perfil", "2.3", 1, app));
			actions.add(new Action("PesquisarUtilizador", "index", "nosi.webapps.igrp.pages.pesquisarutilizador", "igrp/pesquisarutilizador/PesquisarUtilizador.xsl", "Lista de Utilizador", "Lista de Utilizador", "2.3", 1, app));
			actions.add(new Action("NovoUtilizador", "index", "nosi.webapps.igrp.pages.novoutilizador", "igrp/novoutilizador/NovoUtilizador.xsl", "Registar Utilizador", "Registar Utilizador", "2.3", 1, app));
			actions.add(new Action("Settings", "index", "nosi.webapps.igrp.pages.settings", "igrp/settings/Settings.xsl", "Settings", "Settings", "2.3", 1, app));
			actions.add(new Action("RegistarUtilizador", "index", "nosi.webapps.igrp.pages.registarutilizador", "igrp/registarutilizador/RegistarUtilizador.xsl", "Registar Utilizador", "Registar Utilizador", "2.3", 1, app));
			actions.add(new Action("Transaccao", "index", "nosi.webapps.igrp.pages.transaccao", "igrp/transaccao/Transaccao.xsl", "Transaccao", "Transaccao", "2.3", 1, app));
			actions.add(new Action("Page", "index", "nosi.webapps.igrp.pages.page", "igrp/page/Page.xsl", "Registar Pagina", "Registar Pagina", "2.3", 1, app));
			actions.add(new Action("MenuOrganica", "index", "nosi.webapps.igrp.pages.menuorganica", "igrp/menuorganica/MenuOrganica.xsl", "Associar Menu a Organica", "Associar Menu a Organica", "2.3", 1, app));
			actions.add(new Action("ErrorPage", "index", "nosi.webapps.igrp.pages.errorpage", "igrp/errorpage/ErrorPage.xsl", "Pagina de Erro", "Pagina de Erro", "2.3", 1, app));
			actions.add(new Action("TransacaoOrganica", "index", "nosi.webapps.igrp.pages.transacaoorganica", "igrp/transacaoorganica/TransacaoOrganica.xsl", "Associar Transacao a Organica", "Associar Transacao a Organica", "2.3", 1, app));
			actions.add(new Action("EditarTransacao", "index", "nosi.webapps.igrp.pages.editartransacao", "igrp/editartransacao/EditarTransacao.xsl", "Editar Transacao", "Editar Transacao", "2.3", 1, app));
			actions.add(new Action("Session", "index", "nosi.webapps.igrp.pages.session", "igrp/session/Session.xsl", "Gestao de Sessao", "Gestao de Sessao", "2.3", 1, app));
			actions.add(new Action("WebReport", "index", "nosi.webapps.igrp.pages.webreport", "igrp/webreport/WebReport.xsl", "Report Builder", "Report Builder", "2.3", 1, app));
			actions.add(new Action("DataSource", "index", "nosi.webapps.igrp.pages.datasource", "igrp/datasource/DataSource.xsl", "Registar Data Source", "Registar Data Source", "2.3", 1, app));
			actions.add(new Action("LookupListPage", "index", "nosi.webapps.igrp.pages.lookuplistpage", "igrp/lookuplistpage/LookupListPage.xsl", "Lista de Pagina Para Lookup", "Lista de Pagina Para Lookup", "2.3", 1, app));
			actions.add(new Action("Migrate", "index", "nosi.webapps.igrp.pages.migrate", "igrp/migrate/Migrate.xsl", "Migrate IGRP", "Migrate IGRP", "2.3", 1, app));
			actions.add(new Action("OAuthClientList", "index", "nosi.webapps.igrp.pages.oauthclientlist", "igrp/oauthclientlist/OAuthClientList.xsl", "pesquisar Dados dos clientes", "pesquisar Dados dos clientes", "2.3", 1, app));
			actions.add(new Action("OAuthClient", "index", "nosi.webapps.igrp.pages.oauthclient", "igrp/oauthclient/OAuthClient.xsl", "Inserir Dados dos clientes", "Inserir Dados dos clientes", "2.3", 1, app));
			actions.add(new Action("MapaProcesso", "index", "nosi.webapps.igrp.pages.mapaprocesso", "igrp/mapaprocesso/MapaProcesso.xsl", "Mapa Processo", "Mapa Processo", "2.3", 1, app));
			actions.add(new Action("ExecucaoTarefas", "index", "nosi.webapps.igrp.pages.execucaotarefas", "igrp/execucaotarefas/ExecucaoTarefas.xsl", "Execucao Tarefas", "Execucao Tarefas", "2.3", 1, app));
			actions.add(new Action("LookupListUser", "index", "nosi.webapps.igrp.pages.lookuplistuser", "igrp/lookuplistuser/LookupListUser.xsl", "Lookup Lista Utilizador", "Lookup Lista Utilizador", "2.3", 1, app));
			actions.add(new Action("Alter_prioridade_tarefa", "index", "nosi.webapps.igrp.pages.alter_prioridade_tarefa", "igrp/alter_prioridade_tarefa/Alter_prioridade_tarefa.xsl", "Alter prioridade tarefa", "Alter prioridade tarefa", "2.3", 1, app));
			actions.add(new Action("Transferir_tarefas", "index", "nosi.webapps.igrp.pages.transferir_tarefas", "igrp/transferir_tarefas/Transferir_tarefas.xsl", "Transferir tarefas", "Transferir tarefas", "2.3", 1, app));
			actions.add(new Action("BPMNDesigner", "index", "nosi.webapps.igrp.pages.bpmndesigner", "igrp/bpmndesigner/BPMNDesigner.xsl", "BPMN Designer", "BPMN Designer", "2.3", 1, app));
			actions.add(new Action("Import_export", "index", "nosi.webapps.igrp.pages.import_export", "igrp/import_export/Import_export.xsl", "Import export", "Import export", "2.3", 1, app));
			actions.add(new Action("ImportArquivo", "index", "nosi.webapps.igrp.pages.importarquivo", "igrp/importarquivo/ImportArquivo.xsl", "Import Arquivo", "Import Arquivo", "2.3", 1, app));
			actions.add(new Action("ConfigDatabase", "index", "nosi.webapps.igrp.pages.configdatabase", "igrp/configdatabase/ConfigDatabase.xsl", "Configurar Base de Dados", "Configurar Base de Dados de uma aplicação", "2.3", 1, app));
			actions.add(new Action("PesquisaBI", "index", "nosi.webapps.igrp.pages.pesquisabi", "igrp/pesquisabi/PesquisaBI.xsl", "Pesquisar BI", "Pesquisar BI", "2.3", 1, app));
			actions.add(new Action("PesquisaNIF", "index", "nosi.webapps.igrp.pages.pesquisanif", "igrp/pesquisanif/PesquisaNIF.xsl", "Pesquisar NIF", "Pesquisar NIF", "2.3", 1, app));
			actions.add(new Action("PesquisaNascimento", "index", "nosi.webapps.igrp.pages.pesquisanascimento", "igrp/pesquisanascimento/PesquisaNascimento.xsl", "Pesquisar Nascimento", "Pesquisar Nascimento", "2.3", 1, app));
			actions.add(new Action("Gestaodeacesso", "index", "nosi.webapps.igrp.pages.gestaodeacesso", "igrp/gestaodeacesso/Gestaodeacesso.xsl", "Gestao de Acesso", "Gestao de Acesso", "2.3", 1, app));
			actions.add(new Action("GeralApresentacao", "index", "nosi.webapps.tutorial.pages.geralapresentacao", "tutorial/geralapresentacao/GeralApresentacao.xsl", "O que fazer dentro do IGRP JAVA...", "O que fazer dentro do IGRP JAVA...", "2.3", 1, tutorial));
			actions.add(new Action("HomeStudio", "index", "nosi.webapps.igrp_studio.pages.homestudio", "igrp_studio/homestudio/HomeStudio.xsl", "HomeStudio", "HomeStudio", "2.3", 1, igrp_studio));
			actions.add(new Action("CRUDGenerator", "index", "nosi.webapps.igrp_studio.pages.crudgenerator", "igrp_studio/crudgenerator/CRUDGenerator.xsl", "CRUDGenerator", "CRUD Generator", "2.3", 1, igrp_studio));
			
			for(Action ac:actions){
				ac.insert();
			}
			
			
			List<Menu> menus = new ArrayList<>();			
			menus.add(new Menu("Gestão de Aplicação", 1, 1, 0, null, null, app, null));
			menus.add(new Menu("Parâmetros Gerais", 1, 1, 0, null, null, app, null));
			menus.add(new Menu("Auditoria", 1, 1, 0, null, null, app, null));
			menus.add(new Menu("IGRP Studio", 1, 1, 0, null, null, igrp_studio, null));
			menus.add(new Menu("Import/Export", 1, 1, 0, null, null, app, null));
			menus.add(new Menu("Pesquisas Gerais", 1, 1, 0, null, null, app, null)); 
			
			menus.add(new Menu("Detalhes de Aplicação", 1, 1, 1, "_self", actions.get(2), igrp_studio, menus.get(0)));
			menus.add(new Menu("Gestão de Pagina", 1, 1, 0, "_self", actions.get(0), igrp_studio, menus.get(3)));
			menus.add(new Menu("Gestão de Menu", 1, 1, 0, "_self", actions.get(8), app, menus.get(0)));
			menus.add(new Menu("Gestão de Transação", 1, 1, 0, "_self", actions.get(15), app, menus.get(0)));
			menus.add(new Menu("Report Designer", 1, 1, 0, "_self", actions.get(22), igrp_studio, menus.get(3)));
			
			//menus.add(new Menu("Gestão de Organica", 1, 1, 0, "_self", actions.get(5), app, menus.get(1)));
			//menus.add(new Menu("Gestão de Perfil", 1, 1, 0, "_self", actions.get(10), app, menus.get(1)));
			menus.add(new Menu("Gestão de Acesso", 1, 1, 0, "_self", actions.get(40), app, menus.get(1)));
			menus.add(new Menu("Gestão de Utilizador", 1, 1, 0, "_self", actions.get(11), app, menus.get(1)));
			menus.add(new Menu("Área Pessoal", 1, 1, 1, "_self", actions.get(13), app, menus.get(1)));
			menus.add(new Menu("Gestão de Sessão", 1, 1, 0, "_self", actions.get(21), app, menus.get(2)));
			//menus.add(new Menu("Migração IGRP", 1, 1, 0, "_self", actions.get(25), app, menus.get(0)));
			//menus.add(new Menu("OAuth Client Id", 1, 1, 0, "_self", actions.get(26), app, menus.get(0)));
			//menus.add(new Menu("BPMN Designer", 1, 1, 0, "_self", actions.get(33), app, menus.get(3)));
			menus.add(new Menu("Gestão dos Import/Export", 1, 1, 0, "_self", actions.get(34), app, menus.get(2)));
			menus.add(new Menu("Importar Aplicação/Página/Jar", 1, 1, 0, "_self", actions.get(35), app, menus.get(4)));
			
			menus.add(new Menu("Pesquisar BI", 1, 1, 0, "_self", actions.get(37), app, menus.get(5)));
			menus.add(new Menu("Pesquisar NIF", 1, 1, 0, "_self", actions.get(38), app, menus.get(5)));
			menus.add(new Menu("Pesquisar Nascimento", 1, 1, 0, "_self", actions.get(39), app, menus.get(5)));
			for(Menu m:menus){
				m.insert();
			}
			
			List<Profile> profiles = new ArrayList<>();
			//permisao de acesso a aplicacao
			profiles.add(new Profile(1, "ENV", prof1, user1, org));
			//permisao de acesso do utilizador a perfil
			profiles.add(new Profile(2, "PROF", prof1, user1, org));
			
			//permisao de acesso a aplicacao tutotrial
			profiles.add(new Profile(2, "ENV", tutrial_prof, user1, tutorial_org));
			//permisao de acesso do utilizador a perfil do tutorial
			profiles.add(new Profile(3, "PROF", tutrial_prof, user1, tutorial_org));
			
			//permisao de acesso a aplicacao tutotrial
			profiles.add(new Profile(3, "ENV", igrp_studio_prof, user1,igrp_studio_org));
			//permisao de acesso do utilizador a perfil do tutorial
			profiles.add(new Profile(4, "PROF", igrp_studio_prof, user1, igrp_studio_org));
			
			
			//permisao de acesso ao menu
			profiles.add(new Profile(7, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(8, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(9, "MEN", prof0, user0, org));
			profiles.add(new Profile(10, "MEN", prof0, user0, org));
			profiles.add(new Profile(11, "MEN", prof0, user0, igrp_studio_org));
			profiles.add(new Profile(12, "MEN", prof0, user0, org));
			profiles.add(new Profile(13, "MEN", prof0, user0, org));
			profiles.add(new Profile(14, "MEN", prof0, user0, org));
			profiles.add(new Profile(15, "MEN", prof0, user0, org));
			profiles.add(new Profile(16, "MEN", prof0, user0, org));
			profiles.add(new Profile(17, "MEN", prof0, user0, org));
			profiles.add(new Profile(18, "MEN", prof0, user0, org));
			profiles.add(new Profile(19, "MEN", prof0, user0, org));
			profiles.add(new Profile(20, "MEN", prof0, user0, org));
			profiles.add(new Profile(21, "MEN", prof0, user0, org));
			profiles.add(new Profile(22, "MEN", prof0, user0, org));
			profiles.add(new Profile(23, "MEN", prof0, user0, org));
			profiles.add(new Profile(24, "MEN", prof0, user0, org));
			
			profiles.add(new Profile(7, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(8, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(9, "MEN", prof1, user0, org));
			profiles.add(new Profile(10, "MEN", prof1, user0, org));
			profiles.add(new Profile(11, "MEN", igrp_studio_prof, user0, igrp_studio_org));
			profiles.add(new Profile(12, "MEN", prof1, user0, org));
			profiles.add(new Profile(13, "MEN", prof1, user0, org));
			profiles.add(new Profile(14, "MEN", prof1, user0, org));
			profiles.add(new Profile(15, "MEN", prof1, user0, org));
			profiles.add(new Profile(16, "MEN", prof1, user0, org));
			profiles.add(new Profile(17, "MEN", prof1, user0, org));
			profiles.add(new Profile(18, "MEN", prof1, user0, org));
			profiles.add(new Profile(19, "MEN", prof1, user0, org));
			profiles.add(new Profile(20, "MEN", prof1, user0, org));
			profiles.add(new Profile(21, "MEN", prof1, user0, org));
			profiles.add(new Profile(22, "MEN", prof1, user0, org));
			profiles.add(new Profile(23, "MEN", prof1, user0, org));
			profiles.add(new Profile(24, "MEN", prof1, user0, org));
			
			for(Profile p:profiles){
				p.insert();
			}
			
			//colocar a aplicacao tutorial uma outra pagina default
			tutorial = tutorial.findOne(2);
			if(tutorial != null) {
				tutorial.setAction(new Action().find().andWhere("page", "=", "GeralApresentacao").andWhere("application", "=", 2).one()); 
				tutorial = tutorial.update();
			}
			
			//colocar a aplicacao tutorial uma outra pagina default
			if(igrp_studio != null) {
				Action ac = new Action().find().andWhere("page", "=", "HomeStudio").andWhere("application", "=", igrp_studio.getId()).one();
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
	}
}