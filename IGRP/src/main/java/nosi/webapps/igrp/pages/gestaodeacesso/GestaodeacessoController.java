
package nosi.webapps.igrp.pages.gestaodeacesso;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

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
		view.estado.setParam(true);
		view.id.setParam(true);
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadOrg_table(Core.query(null,"SELECT 'estado' as estado,'org_nome' as org_nome,'mostrar_perfis' as mostrar_perfis,'id' as id "));
		
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
		----#gen-example */
		/*----#start-code(index)----*/

		List<Gestaodeacesso.Org_table> data = new ArrayList<>();
		String ichange = Core.getParam("ichange");
		String dad = Core.getCurrentDad();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			model.setAplicacao("" + (new Application().find().andWhere("dad", "=", dad).one()).getId());
			setTable(model, data);
		}
		if (Igrp.getMethod().equalsIgnoreCase("post")) {
			if (ichange.equalsIgnoreCase("p_aplicacao") && Core.isNotNull(model.getAplicacao())) {
				setTable(model, data);
			} else
				model.setAdicionar_organica("igrp", "NovaOrganica", "index");
		}	
		model.setGestao_de_menu("igrp","PesquisarMenu","index");
		model.setAdicionar_organica("igrp","NovaOrganica","index");
		model.setGestao_de_utilizadores("igrp","PesquisarUtilizador","index");
		if(Core.isNotNull(model.getAplicacao())) {
			 model.getGestao_de_menu().addParam("id_app",model.getAplicacao());
			 model.getAdicionar_organica().addParam("id_app",model.getAplicacao());
			 model.getGestao_de_utilizadores().addParam("p_aplicacao",model.getAplicacao());
		}
		view.aplicacao.setValue(new Application().getListApps());
		view.org_table.addData(data);	
		
		
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
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","PesquisarMenu","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(editar)----*/
			return this.forward("igrp", "NovaOrganica", "editar",this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionMenu() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","MenuOrganica","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(menu)----*/
  		Organization org = new Organization().findOne(Core.getParamInt("p_id"));	
        this.addQueryString("p_type","org");   
      	if (org != null){
          	this.addQueryString("env_fk",org.getApplication().getId());  
          	return this.forward("igrp", "MenuOrganica","index",this.queryString());
        }
		/*----#end-code----*/
		return this.redirect("igrp","MenuOrganica","index", this.queryString());	
	}
	
	public Response actionTransacti_org() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","TransacaoOrganica","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(transacti_org)----*/
	  //don't need to add p_id because its declared view.id.setParam(true);
      
      this.addQueryString("p_type","org");    	
      return this.forward("igrp","TransacaoOrganica","index", this.queryString()); //if submit, loads the values
		/*----#end-code----*/
			
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","PesquisarMenu","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(eliminar)----*/
		int p_id = Core.getParamInt("p_id");
		if (p_id != 0) {
			if (new Organization().delete(p_id)) {
				Core.setMessageSuccess();
			}else
				Core.setMessageError();
		}else
			Core.setMessageError();
	
		/*----#end-code----*/
		return this.redirect("igrp","PesquisarMenu","index", this.queryString());	
	}
	
	public Response actionAssociar_etapa() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestaodeacesso model = new Gestaodeacesso();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Gestaodeacesso","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(associar_etapa)----*/
		this.loadQueryString().addQueryString("type", "org");
      	return this.redirect("igrp","Etapaaccess","index", this.queryString());
		/*----#end-code----*/
			
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
			table.setMostrar_perfis("igrp", "PesquisarPerfil","index&id_app=" + org.getApplication().getId() + "&id_org=" + org.getId());
			table.setMostrar_perfis_desc("Mostrar Perfil");
			data.add(table);
		}
	}

	/*----#end-code----*/
	}
