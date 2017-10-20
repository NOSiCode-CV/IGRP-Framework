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
		app.setDescription("IGRP Open Source");
		app.setName("IGRP Open Source");
		app.setImg_src("app_casacidadao.png");
		app.setStatus(1);
		app = app.insert();
		
		if(app!=null){
			User user0 = new User("IGRP", "igrp@nosi.cv", "fe01ce2a7fbac8fafaed7c982a04e229", "ADMIN", null, 1, null, 123456789, "admin",null, null, null, null, null,null, 2017, 2017);
			user0 = user0.insert();
			user0 = user0.updateTozero();
			User user1 = new User("Nositeste", "nositeste@nosi.cv", "fe01ce2a7fbac8fafaed7c982a04e229", "ADMIN", null, 1, null, 123456789, "demo",null, null, null, null, null,null, 2017, 2017);
			user1 = user1.insert();
			
			
			
			Organization org = new Organization("01.03", "NOSI", 1, app, user0, null);
			org = org.insert();
			
			
			
			ProfileType prof0 = new ProfileType("ALL PROFILE", "ALL", 1, null, app, null);
			prof0 = prof0.insert();
			prof0 = prof0.updateToZero();
			
			ProfileType prof1 = new ProfileType("Administrador", "ADMIN", 1, org, app, null);
			prof1 = prof1.insert();
			
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
			
			for(Action ac:actions){
				ac.insert();
			}
			
			List<Menu> menus = new ArrayList<>();			
			menus.add(new Menu("Gestão de Aplicação", 1, 1, 0, null, null, app, null));
			menus.add(new Menu("Parâmetros Gerais", 1, 1, 0, null, null, app, null));
			menus.add(new Menu("Auditoria", 1, 1, 0, null, null, app, null));
			menus.add(new Menu("IGRP Studio", 1, 1, 0, null, null, app, null));
			
			menus.add(new Menu("Gestão de Aplicação", 1, 1, 0, "_self", actions.get(2), app, menus.get(0)));
			menus.add(new Menu("Gestão de Pagina", 1, 1, 0, "_self", actions.get(0), app, menus.get(0)));
			menus.add(new Menu("Gestão de Menu", 1, 1, 0, "_self", actions.get(8), app, menus.get(0)));
			menus.add(new Menu("Gestão de Transação", 1, 1, 0, "_self", actions.get(15), app, menus.get(0)));
			menus.add(new Menu("Report Designer", 1, 1, 0, "_self", actions.get(22), app, menus.get(3)));
			
			menus.add(new Menu("Gestão de Organica", 1, 1, 0, "_self", actions.get(5), app, menus.get(1)));
			menus.add(new Menu("Gestão de Perfil", 1, 1, 0, "_self", actions.get(10), app, menus.get(1)));
			menus.add(new Menu("Gestão de Utilizador", 1, 1, 0, "_self", actions.get(11), app, menus.get(1)));
			menus.add(new Menu("Settings", 1, 1, 1, "_self", actions.get(13), app, menus.get(1)));
			menus.add(new Menu("Gestão de Sessão", 1, 1, 0, "_self", actions.get(21), app, menus.get(2)));
			menus.add(new Menu("Migração IGRP", 1, 1, 0, "_self", actions.get(25), app, menus.get(0)));
			menus.add(new Menu("OAuth Client Id", 1, 1, 0, "_self", actions.get(26), app, menus.get(0)));
			menus.add(new Menu("BPMN Designer", 1, 1, 0, "_self", actions.get(33), app, menus.get(3)));
			menus.add(new Menu("Gestão dos Import/Export", 1, 1, 0, "_self", actions.get(34), app, menus.get(2)));
			menus.add(new Menu("Import Aplicação/Página", 1, 1, 0, "_self", actions.get(35), app, menus.get(0)));
			for(Menu m:menus){
				m.insert();
			}
			
			List<Profile> profiles = new ArrayList<>();
			//permisao de acesso a aplicacao
			profiles.add(new Profile(1, "ENV", prof1, user1, org));
			
			//permisao de acesso do utilizador a perfil
			profiles.add(new Profile(2, "PROF", prof1, user1, org));
			
			//permisao de acesso ao menu
			profiles.add(new Profile(5, "MEN", prof0, user0, org));
			profiles.add(new Profile(6, "MEN", prof0, user0, org));
			profiles.add(new Profile(7, "MEN", prof0, user0, org));
			profiles.add(new Profile(8, "MEN", prof0, user0, org));
			profiles.add(new Profile(9, "MEN", prof0, user0, org));
			profiles.add(new Profile(10, "MEN", prof0, user0, org));
			profiles.add(new Profile(11, "MEN", prof0, user0, org));
			profiles.add(new Profile(12, "MEN", prof0, user0, org));
			profiles.add(new Profile(13, "MEN", prof0, user0, org));
			profiles.add(new Profile(14, "MEN", prof0, user0, org));
			profiles.add(new Profile(15, "MEN", prof0, user0, org));
			profiles.add(new Profile(16, "MEN", prof0, user0, org));
			profiles.add(new Profile(17, "MEN", prof0, user0, org));
			profiles.add(new Profile(18, "MEN", prof0, user0, org));
			profiles.add(new Profile(19, "MEN", prof0, user0, org));
			
			profiles.add(new Profile(5, "MEN", prof1, user0, org));
			profiles.add(new Profile(6, "MEN", prof1, user0, org));
			profiles.add(new Profile(7, "MEN", prof1, user0, org));
			profiles.add(new Profile(8, "MEN", prof1, user0, org));
			profiles.add(new Profile(9, "MEN", prof1, user0, org));
			profiles.add(new Profile(10, "MEN", prof1, user0, org));
			profiles.add(new Profile(11, "MEN", prof1, user0, org));
			profiles.add(new Profile(12, "MEN", prof1, user0, org));
			profiles.add(new Profile(13, "MEN", prof1, user0, org));
			profiles.add(new Profile(14, "MEN", prof1, user0, org));
			profiles.add(new Profile(15, "MEN", prof1, user0, org));
			profiles.add(new Profile(16, "MEN", prof1, user0, org));
			profiles.add(new Profile(17, "MEN", prof1, user0, org));
			profiles.add(new Profile(18, "MEN", prof1, user0, org));
			profiles.add(new Profile(19, "MEN", prof1, user0, org));
			
			for(Profile p:profiles){
				p.insert();
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

	
