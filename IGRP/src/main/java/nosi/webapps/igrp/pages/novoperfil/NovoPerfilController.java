
package nosi.webapps.igrp.pages.novoperfil;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.GroupService;
import java.io.IOException;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;

import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class NovoPerfilController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		NovoPerfil model = new NovoPerfil();

		model.load();
		String id_app = Igrp.getInstance().getRequest().getParameter("id_app");
		String id_org = Igrp.getInstance().getRequest().getParameter("id_org");
		if (id_org != null) {
			model.setOrganica(id_org);
		}

		if (id_app != null) {
			model.setAplicacao(id_app);
		}
		model.setActivo(1);
		NovoPerfilView view = new NovoPerfilView(model);
		view.aplicacao.setValue(new Application().getListApps());
		/*
		 * view.perfil.setValue((model.getAplicacao() != null && model.getOrganica() != null && !model.getAplicacao().equals("0") && !model.getOrganica().equals("0")) ? new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica()) :
		 * null);
		 */
		view.organica.setValue((id_app != null && !id_app.equals("") && !model.getAplicacao().equals("0"))
				? new Organization().getListOrganizations(Integer.parseInt(model.getAplicacao()))
				: null);
		// Perfil pai/Parent profile ocult (not in use)
		view.perfil.setVisible(false);
			return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		NovoPerfil model = new NovoPerfil();
		if (Igrp.getInstance().getRequest().getMethod().equals("POST")) {
			model.load();
			ProfileType pt = new ProfileType();
			pt.setCode(model.getCodigo());
			pt.setDescr(model.getNome());
			pt.setOrganization(new Organization().findOne(model.getOrganica()));
			/*
			 * if(model.getPerfil()!=0){ pt.setProfiletype(new
			 * ProfileType().findOne(model.getPerfil())); }
			 */
			pt.setStatus(model.getActivo());
			pt.setApplication(new Application().findOne(model.getAplicacao()));
			pt = pt.insert();
			if (pt != null) {

				// Cria grupo e utilizadores no Activiti
				GroupService group = new GroupService();
				group.setId(pt.getOrganization().getCode() + "." + pt.getCode());
				group.setName(pt.getOrganization().getName() + " - " + pt.getDescr());
				group.setType("assignment");
				group.create();
				Core.setMessageSuccess(gt("Operação efetuada com sucesso"));
				Core.setMessageInfoLink(gt("Click aqui para atribuir menu para o perfil " + pt.getDescr()), "igrp",
						"MenuOrganica", "index&target=_blank&id=" + pt.getId() + "&type=perfil");
				return this.redirect("igrp", "novo-perfil", "index");
			} else {
				Core.setMessageError(gt("Falha ao tentar efetuar esta operação"));
			}
			return this.redirect("igrp", "novo-perfil", "index");
		}
		Core.setMessageError(gt("Invalid Request ..."));
		return this.redirect("igrp", "novo-perfil", "index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	public Response actionEditar(@RParam(rParamName = "p_id") String id)
			throws IOException, IllegalArgumentException, IllegalAccessException {
		NovoPerfil model = new NovoPerfil();
		model.load();
		ProfileType p = new ProfileType();
		p = p.findOne(Integer.parseInt(id));
		model.setCodigo(p.getCode());
		model.setNome(p.getDescr());
		model.setAplicacao("" + p.getApplication().getId());
		if (p.getOrganization() != null) {
			model.setOrganica("" + p.getOrganization().getId());
		}
		model.setActivo(p.getStatus());
		if (p.getProfiletype() != null) {
			// model.setPerfil(p.getProfiletype().getId());
		}

		NovoPerfilView view = new NovoPerfilView(model);
		view.sectionheader_1_text.setValue("Gestão de Perfil - Atualizar");
		view.btn_gravar.setLink("editar_&p_id=" + id);
		view.aplicacao.setValue(new Application().getListApps());
		/*
		 * view.perfil.setValue( model.getAplicacao() != 0 && model.getOrganica() != 0 ?
		 * new ProfileType().getListProfiles(model.getAplicacao(), model.getOrganica())
		 * : null);
		 */
		view.perfil.setVisible(false);
		view.organica.setValue((model.getAplicacao() != null && !model.getAplicacao().equals("0"))
				? new Organization().getListOrganizations(Integer.parseInt(model.getAplicacao()))
				: null);

		return this.renderView(view);
	}

	public Response actionEditar_(@RParam(rParamName = "p_id") String id)
			throws IllegalArgumentException, IllegalAccessException, IOException {
		if (Igrp.getInstance().getRequest().getMethod().equals("POST")) {
			NovoPerfil model = new NovoPerfil();
			ProfileType p = new ProfileType();
			p = p.findOne(Integer.parseInt(id));
			model.setCodigo(p.getCode());
			model.setNome(p.getDescr());
			model.setAplicacao("" + p.getApplication().getId());
			if (p.getOrganization() != null) {
				model.setOrganica("" + p.getOrganization().getId());
			}
			model.setActivo(p.getStatus());
			if (p.getProfiletype() != null) {
				// model.setPerfil(p.getProfiletype().getId());
			}
			model.load();
			p.setCode(model.getCodigo());
			p.setDescr(model.getNome());
			p.setOrganization(new Organization().findOne(model.getOrganica()));
			/*
			 * if(model.getPerfil()!=0){ p.setProfiletype(new
			 * ProfileType().findOne(model.getPerfil())); }
			 */
			p.setStatus(model.getActivo());
			p.setApplication(new Application().findOne(model.getAplicacao()));
			p = p.update();
			if (p != null) {
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,
						gt("Perfil atualizado com sucesso."));
			} else
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Erro ao atualizar o perfil."));
			return this.redirect("igrp", "novo-perfil", "editar", new String[] { "p_id" },
					new String[] { p.getId() + "" });
		}

		Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, gt("Invalid operation ..."));
		return this.redirect("igrp", "novo-perfil", "editar", new String[] { "p_id" }, new String[] { id + "" });
	}

	/*----#END-PRESERVED-AREA----*/
}
