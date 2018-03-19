
package nosi.webapps.igrp.pages.gestaodeacesso;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;

/*----#start-code(packages_import)----*/

import nosi.core.webapp.helpers.Permission;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import java.util.List;
import java.util.ArrayList;
/*----#end-code----*/



public class GestaodeacessoController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		GestaodeacessoView view = new GestaodeacessoView();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		view.org_table.setSqlQuery(null,"SELECT 'estado' estado, 'org_nome' org_nome, 'mostrar_perfis' mostrar_perfis, 'id' id");
		view.aplicacao.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");view.estado.setParam(true);view.p_id.setParam(true);
		
		----#gen-example */
		
		/*----#start-code(index)----*/

		List<Gestaodeacesso.Org_table> data = new ArrayList<>();
		String ichange = Igrp.getInstance().getRequest().getParameter("ichange");
		String dad = new Permission().getCurrentEnv();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			model.setAplicacao("" + (new Application().find().andWhere("dad", "=", dad).one()).getId());
			setTable(model, data);
		}
		if (Igrp.getMethod().equalsIgnoreCase("post")) {
			if (ichange.equalsIgnoreCase("p_aplicacao") && Core.isNotNull(model.getAplicacao())) {
				setTable(model, data);
			} else
				model.setAdicionar_organica1("igrp", "NovaOrganica", "index&target=_blank");
		}
	
		view.p_id.setParam(true);		
		view.aplicacao.setParam(true);
		view.aplicacao.setValue(new Application().getListApps());
		view.org_table.addData(data);
		view.setPageTitle("Gestão de Acesso");	
		if(Core.isNotNull(model.getAplicacao())) {
			// view.adicionar_organica1.setValue("webapps?r=igrp/NovaOrganica/index&id_app="+model.getAplicacao());	
			// view.gestao_de_utilizadores1.setValue("webapps?r=igrp/PesquisarUtilizador/index&id_app="+model.getAplicacao());
			 view.adicionar_organica1.setValue(this.getConfig().getResolveUrl("igrp","NovaOrganica","index") + "&id_app="+model.getAplicacao());	
			 view.gestao_de_utilizadores1.setValue(this.getConfig().getResolveUrl("igrp","PesquisarUtilizador","index") + "&id_app="+model.getAplicacao());
		}
		
		view.btn_eliminar.setVisible(false);
		//return this.renderView(view);
		/*----#end-code----*/
		
		
		view.setModel(model);
		
		return this.renderView(view);
		
	}

	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		
		/*----#start-code(editar)----*/
		String p_id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (p_id != null) {
			Organization org = new Organization().findOne(Integer.parseInt(p_id));
			if (org != null)
				return this.redirect("igrp", "NovaOrganica", "editar&target=_blank&p_id=" + p_id);
		}
		//return this.redirect("igrp", "error-page", "exception");
		/*----#end-code----*/
		
		
		return this.redirect("igrp","gestaodeacesso","index");
		
	}
	public Response actionMenu() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","MenuOrganica","index");
		}
		
		----#gen-example */
		
		/*----#start-code(menu)----*/
		String p_id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (p_id != null) {
			Organization org = new Organization().findOne(Integer.parseInt(p_id));
			org = org.find().andWhere("application.id", "=", Integer.parseInt(p_id));
			if (org != null)
				return this.redirect("igrp", "MenuOrganica", "index&target=_blank",
						"id=" + p_id + "&type=org&env_fk=" + org.getApplication().getId());
		}
		//return this.redirect("igrp", "error-page", "exception");
		/*----#end-code----*/
		
		return this.redirect("igrp","MenuOrganica","index");
		
	}
	public Response actionTransaction() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		
		/*----#start-code(transaction)----*/
		
		
		/*----#end-code----*/
		
		
		return this.redirect("igrp","gestaodeacesso","index");
		
	}
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		
		/*----#start-code(eliminar)----*/
		String p_id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (p_id != null) {
			Organization org = new Organization().findOne(Integer.parseInt(p_id));
			if (org != null && org.delete()) {
				Core.setMessageSuccess();
				return this.redirect("igrp", "gestaodeacesso", "index");
			}
		}
		//return this.redirect("igrp", "error-page", "exception");
		/*----#end-code----*/
		
		
		return this.redirect("igrp","gestaodeacesso","index");
		
	}
	
	/*----#start-code(custom_actions)----*/
	private void setTable(Gestaodeacesso model, List<Gestaodeacesso.Org_table> data) {			
		for (Organization org : new Organization().find()
				.andWhere("application", "=", Integer.parseInt(model.getAplicacao())).all()) {
			Gestaodeacesso.Org_table table = new Gestaodeacesso.Org_table();
			table.setP_id("" + org.getId());
			table.setOrg_nome(org.getName());
			table.setEstado(org.getStatus());
			table.setEstado_check(1);
			table.setMostrar_perfis("igrp", "pesquisar-perfil",
					"index&id_app=" + org.getApplication().getId() + "&id_org=" + org.getId() + "&target=_blank");
			table.setMostrar_perfis_desc("Mostrar Perfil");
			data.add(table);
		}
	}

	/*----#end-code----*/
	
	
	
	
}
