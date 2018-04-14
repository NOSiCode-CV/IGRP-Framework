
package nosi.webapps.igrp.pages.gestaodeacesso;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;
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
		model.load();
		GestaodeacessoView view = new GestaodeacessoView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadOrg_table(Core.query(null,"SELECT 'estado' as estado,'org_nome' as org_nome,'mostrar_perfis' as mostrar_perfis,'id' as id "));
		
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.estado.setParam(true);
		view.id.setParam(true);
		
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
				model.setAdicionar_organica1("igrp", "NovaOrganica", "index");
		}
	
		view.id.setParam(true);		
		view.aplicacao.setParam(true);
		view.aplicacao.setValue(new Application().getListApps());
		view.org_table.addData(data);
		view.setPageTitle("Gestão de Acesso");	
		if(Core.isNotNull(model.getAplicacao())) {
			// view.adicionar_organica1.setValue("webapps?r=igrp/NovaOrganica/index&id_app="+model.getAplicacao());	
			 view.gestao_de_menu.setValue(this.getConfig().getResolveUrl("igrp","PesquisarMenu","index&id_app="+model.getAplicacao())) ;
			 view.adicionar_organica1.setValue(this.getConfig().getResolveUrl("igrp","NovaOrganica","index&id_app="+model.getAplicacao()));	
			 view.gestao_de_utilizadores1.setValue(this.getConfig().getResolveUrl("igrp","PesquisarUtilizador","index&id_app="+model.getAplicacao()));
		}
		
		view.btn_eliminar.setVisible(false);
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 return this.forward("igrp","PesquisarMenu","index");
		}
		
		----#gen-example */
		/*----#start-code(editar)----*/
		String p_id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (p_id != null) {
			Organization org = new Organization().findOne(Integer.parseInt(p_id));
			if (org != null)
				return this.redirect("igrp", "NovaOrganica", "editar&p_id=" + p_id);
		}else 
			Core.setMessageError();

		/*----#end-code----*/
		return this.redirect("igrp","PesquisarMenu","index", this.queryString());	
	}
	
	public Response actionMenu() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 return this.forward("igrp","MenuOrganica","index");
		}
		
		----#gen-example */
		/*----#start-code(menu)----*/
   
      	String p_id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (Core.isInt(p_id)) {
			Organization org = new Organization().findOne(Integer.parseInt(p_id));
			org = org.find().andWhere("application.id", "=", Integer.parseInt(p_id));
			if (org != null)
				return this.redirect("igrp", "MenuOrganica", "index",
						"id=" + p_id + "&type=org&env_fk=" + org.getApplication().getId());
		}else Core.setMessageError();

		/*----#end-code----*/
		return this.redirect("igrp","MenuOrganica","index", this.queryString());	
	}
	
	public Response actionTransaction() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 return this.forward("igrp","TransacaoOrganica","index");
		}
		
		----#gen-example */
		/*----#start-code(transaction)----*/
		
		/*----#end-code----*/
		return this.redirect("igrp","TransacaoOrganica","index", this.queryString());	
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 return this.forward("igrp","PesquisarMenu","index");
		}
		
		----#gen-example */
		/*----#start-code(eliminar)----*/
		String p_id = Igrp.getInstance().getRequest().getParameter("p_id");
		if (p_id != null) {
			Organization org = new Organization().findOne(Integer.parseInt(p_id));
			if (org != null && org.delete()) {
				Core.setMessageSuccess();
			}else
				Core.setMessageError();
		}else
			Core.setMessageError();
	
		/*----#end-code----*/
		return this.redirect("igrp","PesquisarMenu","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	private void setTable(Gestaodeacesso model, List<Gestaodeacesso.Org_table> data) {			
		for (Organization org : new Organization().find()
				.andWhere("application", "=", Integer.parseInt(model.getAplicacao())).all()) {
			Gestaodeacesso.Org_table table = new Gestaodeacesso.Org_table();
			table.setId("" + org.getId());
			table.setOrg_nome(org.getName());
			table.setEstado(org.getStatus());
			table.setEstado_check(1);
			table.setMostrar_perfis("igrp", "pesquisar-perfil",
					"index&id_app=" + org.getApplication().getId() + "&id_org=" + org.getId());
			table.setMostrar_perfis_desc("Mostrar Perfil");
			data.add(table);
		}
	}

	/*----#end-code----*/
	}
