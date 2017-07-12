package nosi.core.igrp.mingrations;
/**
 * @author: Emanuel Pereira
 * 30 Jun 2017
 */
import java.util.ArrayList;
import java.util.List;
import nosi.webapps.igrp.dao.*;
import nosi.webapps.igrp.dao.views.CreateViews;

public class Migration0 {

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
			
			List<Action> actions = new ArrayList<>();
			actions.add(new Action("ListaPage", "index", "nosi.core.webapp.pages.listapage", "igrp/listapage/ListaPage.xsl", "Lista de Paginas", "Lista de Paginas", "2.3", 1, app));
			actions.add(new Action("Env", "index", "nosi.core.webapp.pages.env", "igrp/env/Env.xsl", "Registar Aplicacao", "Registar Aplicacao", "2.3", 1, app));
			actions.add(new Action("ListaEnv", "index", "nosi.core.webapp.pages.listaenv", "igrp/listaenv/ListaEnv.xsl", "Lista de Aplicacao", "Lista de Aplicacao", "2.3", 1, app));
			actions.add(new Action("Dominio", "index", "nosi.core.webapp.pages.dominio", "igrp/dominio/Dominio.xsl", "Lista de Dominio", "Lista de Dominio", "2.3", 1, app));
			actions.add(new Action("NovoDominio", "index", "nosi.core.webapp.pages.novodominio", "igrp/novodominio/NovoDominio.xsl", "Registar Dominio", "Registar Dominio", "2.3", 1, app));
			actions.add(new Action("PesquisarOrganica", "index", "nosi.core.webapp.pages.pesquisarorganica", "igrp/pesquisarorganica/PesquisarOrganica.xsl", "Lista de Organica", "Lista de Organica", "2.3", 1, app));
			actions.add(new Action("NovaOrganica", "index", "nosi.core.webapp.pages.novaorganica", "igrp/novaorganica/NovaOrganica.xsl", "Registar Organica", "Registar Organica", "2.3", 1, app));
			actions.add(new Action("NovoMenu", "index", "nosi.core.webapp.pages.novomenu", "igrp/novomenu/NovoMenu.xsl", "Registar Menu", "Registar Menu", "2.3", 1, app));
			actions.add(new Action("PesquisarMenu", "index", "nosi.core.webapp.pages.pesquisarmenu", "igrp/pesquisarmenu/PesquisarMenu.xsl", "Lista de Menu", "Lista de Menu", "2.3", 1, app));
			actions.add(new Action("NovoPerfil", "index", "nosi.core.webapp.pages.novoperfil", "igrp/novoperfil/NovoPerfil.xsl", "Registar Perfil", "Registar Perfil", "2.3", 1, app));
			actions.add(new Action("PesquisarPerfil", "index", "nosi.core.webapp.pages.pesquisarperfil", "igrp/pesquisarperfil/PesquisarPerfil.xsl", "Lista de Perfil", "Lista de Perfil", "2.3", 1, app));
			actions.add(new Action("PesquisarUtilizador", "index", "nosi.core.webapp.pages.pesquisarutilizador", "igrp/pesquisarutilizador/PesquisarUtilizador.xsl", "Lista de Utilizador", "Lista de Utilizador", "2.3", 1, app));
			actions.add(new Action("NovoUtilizador", "index", "nosi.core.webapp.pages.novoutilizador", "igrp/novoutilizador/NovoUtilizador.xsl", "Registar Utilizador", "Registar Utilizador", "2.3", 1, app));
			actions.add(new Action("Settings", "index", "nosi.core.webapp.pages.settings", "igrp/settings/Settings.xsl", "Settings", "Settings", "2.3", 1, app));
			actions.add(new Action("RegistarUtilizador", "index", "nosi.core.webapp.pages.registarutilizador", "igrp/registarutilizador/RegistarUtilizador.xsl", "Registar Utilizador", "Registar Utilizador", "2.3", 1, app));
			actions.add(new Action("Transaccao", "index", "nosi.core.webapp.pages.transaccao", "igrp/transaccao/Transaccao.xsl", "Transaccao", "Transaccao", "2.3", 1, app));
			actions.add(new Action("Page", "index", "nosi.core.webapp.pages.page", "igrp/page/Page.xsl", "Registar Pagina", "Registar Pagina", "2.3", 1, app));
			actions.add(new Action("MenuOrganica", "index", "nosi.core.webapp.pages.menuorganica", "igrp/menuorganica/MenuOrganica.xsl", "Associar Menu a Organica", "Associar Menu a Organica", "2.3", 1, app));
			actions.add(new Action("ErrorPage", "index", "nosi.core.webapp.pages.errorpage", "igrp/errorpage/ErrorPage.xsl", "Pagina de Erro", "Pagina de Erro", "2.3", 1, app));
			actions.add(new Action("TransacaoOrganica", "index", "nosi.core.webapp.pages.transacaoorganica", "igrp/transacaoorganica/TransacaoOrganica.xsl", "Associar Transacao a Organica", "Associar Transacao a Organica", "2.3", 1, app));
			actions.add(new Action("EditarTransacao", "index", "nosi.core.webapp.pages.editartransacao", "igrp/editartransacao/EditarTransacao.xsl", "Editar Transacao", "Editar Transacao", "2.3", 1, app));
			actions.add(new Action("Session", "index", "nosi.core.webapp.pages.session", "igrp/session/Session.xsl", "Gestao de Sessao", "Gestao de Sessao", "2.3", 1, app));
			actions.add(new Action("WebReport", "index", "nosi.core.webapp.pages.webreport", "igrp/webreport/WebReport.xsl", "Report Builder", "Report Builder", "2.2", 1, app));
			actions.add(new Action("DataSource", "index", "nosi.core.webapp.pages.datasource", "igrp/datasource/DataSource.xsl", "Registar Data Source", "Registar Data Source", "2.3", 1, app));
			actions.add(new Action("LookupListPage", "index", "nosi.core.webapp.pages.lookuplistpage", "igrp/lookuplistpage/LookupListPage.xsl", "Lista de Pagina Para Lookup", "Lista de Pagina Para Lookup", "2.3", 1, app));

			for(Action ac:actions){
				ac.insert();
			}
			
			List<Menu> menus = new ArrayList<>();			
			menus.add(new Menu("Gestão de Aplicação", 1, 1, 0, null, null, app, null));
			menus.add(new Menu("Parâmetros Gerais", 1, 1, 0, null, null, app, null));
			menus.add(new Menu("Auditoria", 1, 1, 0, null, null, app, null));
			
			menus.add(new Menu("Detalhes de Aplicação", 1, 1, 0, "_self", actions.get(2), app, menus.get(0)));
			menus.add(new Menu("Gestão de Pagina", 1, 1, 0, "_self", actions.get(0), app, menus.get(0)));
			menus.add(new Menu("Gestão de Menu", 1, 1, 0, "_self", actions.get(8), app, menus.get(0)));
			menus.add(new Menu("Gestão de Transação", 1, 1, 0, "_self", actions.get(15), app, menus.get(0)));
			menus.add(new Menu("Report Design", 1, 1, 0, "_self", actions.get(22), app, menus.get(0)));
			
			menus.add(new Menu("Gestão de Organica", 1, 1, 0, "_self", actions.get(5), app, menus.get(1)));
			menus.add(new Menu("Gestão de Perfil", 1, 1, 0, "_self", actions.get(10), app, menus.get(1)));
			menus.add(new Menu("Gestão de Utilizador", 1, 1, 0, "_self", actions.get(11), app, menus.get(1)));
			menus.add(new Menu("Settings", 1, 1, 0, "_self", actions.get(13), app, menus.get(1)));
			menus.add(new Menu("Gestão de Sessão", 1, 1, 0, "_self", actions.get(21), app, menus.get(2)));
			
			for(Menu m:menus){
				m.insert();
			}
			
			List<Profile> profiles = new ArrayList<>();
			profiles.add(new Profile(1, "ENV", prof1, user1, org));
			profiles.add(new Profile(1, "PROF", prof1, user1, org));
			profiles.add(new Profile(4, "MEN", prof0, user0, org));
			profiles.add(new Profile(5, "MEN", prof0, user0, org));
			profiles.add(new Profile(6, "MEN", prof0, user0, org));
			profiles.add(new Profile(7, "MEN", prof0, user0, org));
			profiles.add(new Profile(8, "MEN", prof0, user0, org));
			profiles.add(new Profile(9, "MEN", prof0, user0, org));
			profiles.add(new Profile(10, "MEN", prof0, user0, org));
			profiles.add(new Profile(11, "MEN", prof0, user0, org));
			profiles.add(new Profile(12, "MEN", prof0, user0, org));
			profiles.add(new Profile(13, "MEN", prof0, user0, org));
			profiles.add(new Profile(4, "MEN", prof1, user0, org));
			profiles.add(new Profile(5, "MEN", prof1, user0, org));
			profiles.add(new Profile(6, "MEN", prof1, user0, org));
			profiles.add(new Profile(7, "MEN", prof1, user0, org));
			profiles.add(new Profile(8, "MEN", prof1, user0, org));
			profiles.add(new Profile(9, "MEN", prof1, user0, org));
			profiles.add(new Profile(10, "MEN", prof1, user0, org));
			profiles.add(new Profile(11, "MEN", prof1, user0, org));
			profiles.add(new Profile(12, "MEN", prof1, user0, org));
			profiles.add(new Profile(13, "MEN", prof1, user0, org));
			
			for(Profile p:profiles){
				p.insert();
			}
			profiles = null;
			menus = null;
			actions = null;
			new CreateViews();
		}
	}
	
}

	
