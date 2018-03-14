
package nosi.webapps.igrp.pages.pesquisarutilizador;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.core.webapp.helpers.Permission;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.User;
import static nosi.core.i18n.Translator.gt;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/*----#END-PRESERVED-AREA----*/

public class PesquisarUtilizadorController extends Controller {

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {
		/*----#START-PRESERVED-AREA(INDEX)----*/
		PesquisarUtilizador model = new PesquisarUtilizador();

		ArrayList<PesquisarUtilizador.Table_1> lista = new ArrayList<>();
		// condiccao para pesquisar com filtros
		
			model.load();
			String ichange = Igrp.getInstance().getRequest().getParameter("ichange");
		
		if (!Core.isNotNull(ichange) && Core.getParam("id_app") != null)
			model.setAplicacao(Core.getParam("id_app"));

		int idApp = (Core.isNotNull(model.getAplicacao()))? Integer.parseInt(model.getAplicacao()): 0;
		int idOrg = (Core.isNotNull(model.getOrganica()))? Integer.parseInt(model.getOrganica()): 0;
		int idProf = (Core.isNotNull(model.getPerfil()))? Integer.parseInt(model.getPerfil()): 0;

		Profile prof = new Profile();
		List<Profile> profiles = null;

		int idProfC = new Permission().getCurrentPerfilId();
		ProfileType pp = new ProfileType().findOne(idProfC);
		if (pp != null && pp.getCode().equalsIgnoreCase("ADMIN")) {
			profiles = prof.find().andWhere("type", "=", "PROF").andWhere("user.user_name", "=", model.getUsername())
					.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
					.andWhere("profileType", "=", idProf != 0 ? idProf : null)
					.andWhere("profileType.application", "=", idApp != 0 ? idApp : null)
					.andWhere("user.email", "=", model.getEmail()).all();
		} else {
			Application app = new Application().find().andWhere("dad", "=", new Permission().getCurrentEnv()).one();
			profiles = prof.find().andWhere("type", "=", "PROF").andWhere("user.user_name", "=", model.getUsername())
					.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
					.andWhere("profileType", "=", idProf != 0 ? idProf : null)
					.andWhere("profileType.application", "=", idApp != 0 ? idApp : app.getId())
					.andWhere("user.email", "=", model.getEmail()).all();
		}
		// Preenchendo a tabela
		for (Profile p : profiles) {
			PesquisarUtilizador.Table_1 table1 = new PesquisarUtilizador.Table_1();
			table1.setTb_email(p.getUser().getEmail());
			table1.setNome(p.getUser().getUser_name());
			table1.setNominho(p.getUser().getName());
			table1.setPerfile(p.getProfileType().getApplication().getName() + "/"
					+ p.getProfileType().getOrganization().getName() + "/" + p.getProfileType().getDescr());
			table1.setP_id("" + p.getId());
			lista.add(table1);
		}

		PesquisarUtilizadorView view = new PesquisarUtilizadorView(model);

		switch (this.getConfig().getAutenticationType()) {
		case "ldap":
			view.btn_adicionar_utilizador.setLink("igrp", "LdapUser", "index&target=_blank");
			break;
		case "db":
		default:
			view.btn_adicionar_utilizador.setLink("igrp", "PesquisarUtilizador", "adicionar_utilizador");
		}

		view.setPageTitle(gt("Gestão de Utilizador"));

		view.aplicacao.setValue(new Application().getListApps());
		view.organica.setValue(new Organization().getListOrganizations(idApp));
		view.perfil.setValue(new ProfileType().getListProfiles(idApp, idOrg));

		view.nome.setLabel("Username");
		view.nominho.setLabel("Nome");
		// Para pegar os parametros que queremos enviar para poder editar o menu no view
		view.p_id.setParam(true);
		view.email.setParam(true);
		view.table_1.addData(lista);

		// view.username.

		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionConvidar() throws IOException {
		/*----#START-PRESERVED-AREA(CONVIDAR)----*/
		String email = Igrp.getInstance().getRequest().getParameter("p_email");
		if (email != null) {
			User u = new User().find().andWhere("email", "=", email).one();
			if (u != null) {
				return this.redirect("igrp", "NovoUtilizador", "index&target=_blank&id=" + u.getId());
			}
		}
		return this.redirect("igrp", "NovoUtilizador", "index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionAdicionar_utilizador() throws IOException, IllegalArgumentException, IllegalAccessException {
		/*----#START-PRESERVED-AREA(ADICIONAR_UTILIZADOR)----*/
		return this.redirect("igrp", "RegistarUtilizador", "index&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException {
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/
		PesquisarUtilizador model = new PesquisarUtilizador();
		if (Igrp.getMethod().equalsIgnoreCase("post")) {
			model.load();
			return this.forward("igrp", "PesquisarUtilizador", "index");
		}
		return this.redirect("igrp", "PesquisarUtilizador", "index");
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionEditar() throws IOException {
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (id != null) {
			Profile p = new Profile().findOne(Integer.parseInt(id));
			if (p != null) {
				return this.redirect("igrp", "NovoUtilizador", "editar&target=_blank&p_id=" + p.getId());
			}
		}
		return this.redirectError();
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionEliminar() throws IOException {
		/*----#START-PRESERVED-AREA(ELIMINAR)----*/
		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (id != null) {
			Profile p = new Profile().findOne(Integer.parseInt(id));
			p.setType("INATIVE_" + p.getType());
			p = p.update();
			if (p != null) {
				Core.setMessageSuccess();
				return this.redirect("igrp", "PesquisarUtilizador", "index");
			}
		}
		return this.redirectError();
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionConvidar_user() throws IOException, IllegalArgumentException, IllegalAccessException {
		/*----#START-PRESERVED-AREA(CONVIDAR_USER)----*/
		String email = Igrp.getInstance().getRequest().getParameter("tb_email");
		if (email != null) {
			User u = new User().find().andWhere("email", "=", email).one();
			if (u != null) {
				return this.forward("igrp", "PesquisarUtilizador", "convidar&target=_blank&p_email=" + email);
			}
		}
		return this.redirect("igrp", "PesquisarUtilizador", "convidar&target=_blank");
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	public Response actionListaGeral() throws IOException, IllegalArgumentException, IllegalAccessException {
		PesquisarUtilizador model = new PesquisarUtilizador();
		if (Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")) {
			model.load();
		}
		ArrayList<PesquisarUtilizador.Table_1> lista = new ArrayList<>();
		// condicao para pesquisar com filtros
		List<User> users = new ArrayList<>();

		int idProfC = new Permission().getCurrentPerfilId();
		ProfileType pp = new ProfileType().findOne(idProfC);
		if (pp != null && pp.getCode().equalsIgnoreCase("ADMIN")) {
			users = new User().find().andWhere("email", "=", model.getEmail())
					.andWhere("user_name", "=", model.getUsername()).all();
		}
		// Preenchendo a tabela
		for (User p : users) {
			PesquisarUtilizador.Table_1 table1 = new PesquisarUtilizador.Table_1();
			table1.setTb_email(p.getEmail());
			table1.setNome(p.getUser_name());
			table1.setNominho(p.getName());
			table1.setPerfile(p.getStatus() == 1 ? "ATIVO" : "INATIVO");
			table1.setP_id("" + p.getId());
			lista.add(table1);
		}
		// Alimentando o selectorOption (Aplicacao, organica, e menuPrincipal)
		PesquisarUtilizadorView view = new PesquisarUtilizadorView(model);
		view.aplicacao.setVisible(false);
		view.perfil.setVisible(false);
		view.organica.setVisible(false);
		view.p_id.setParam(true);
		view.email.setParam(true);
		view.btn_adicionar_utilizador.setVisible(false);
		view.btn_convidar.setVisible(false);

		view.btn_eliminar.setLink("eliminarUser");
		view.btn_eliminar.setTitle("Alterar Estado");
		view.btn_eliminar.setImg("");

		switch (this.getConfig().getAutenticationType()) {
		case "ldap":
			view.btn_editar.setLink("igrp", "ldap-user", "index_");
			view.btn_editar.setTarget("_self");
			break;
		case "db":
		default: {
			view.btn_editar.setLink("editarUser");
			view.btn_editar.setTarget("submit");
		}
		}

		view.btn_convidar_user.setTarget("submit");
		view.perfil.setLabel("Estado");
		view.nome.setLabel("Username");
		view.nominho.setLabel("Nome");
		view.btn_pesquisar.setLink("listaGeral");
		view.table_1.addData(lista);
		view.table_1.setTitle("Lista Geral de Utilizadores");
		return this.renderView(view);
	}

	public Response actionEditarUser() throws IOException {

		if (Igrp.getMethod().equalsIgnoreCase("post")) {
			String id = Igrp.getInstance().getRequest().getParameter("p_id");
			if (id != null) {
				User p = new User().findOne(Integer.parseInt(id));
				if (p != null) {
					return this.redirect("igrp", "RegistarUtilizador", "editar", "p_id=" + p.getId());
				}
			}
		}
		return this.redirectError();

	}

	public Response actionEliminarUser() throws IOException {

		String id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (id != null) {
			User p = new User().findOne(Integer.parseInt(id));
			if (p.getStatus() == 1)
				p.setStatus(0);
			else
				p.setStatus(1);
			p = p.update();
			if (p != null) {
				Core.setMessageSuccess();
				return this.redirect("igrp", "PesquisarUtilizador", "lista_geral");
			}
		}
		return this.redirectError();

	}
	/*----#END-PRESERVED-AREA----*/
}
