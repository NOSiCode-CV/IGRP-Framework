package nosi.webapps.igrp.pages.pesquisarperfil;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.ProfileType;
import java.util.ArrayList;
/*----#end-code----*/
		
public class PesquisarPerfilController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		PesquisarPerfilView view = new PesquisarPerfilView();
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Ut doloremque laudantium iste' as organica,'1' as estado,'Laudantium adipiscing totam ma' as descricao,'Labore perspiciatis mollit sed' as codigo,'1' as id "));
		  ----#gen-example */
		/*----#start-code(index)----*/
	
		ArrayList<PesquisarPerfil.Table_1> lista = new ArrayList<>();
		ProfileType profile_db = new ProfileType();			
		int idOrg = Core.getParamInt("id_org");
		int idApp = Core.getParamInt("id_app");
		
		//Preenchendo a tabela
		for(ProfileType p:profile_db.find().andWhere("application", "=",idApp!=0?idApp:-1).andWhere("organization", "=",idOrg!=0?idOrg:-1).all()){
			PesquisarPerfil.Table_1 table1 = new PesquisarPerfil.Table_1();
			table1.setCodigo(p.getCode());
			table1.setDescricao(p.getDescr());
			table1.setEstado(p.getStatus());
          	table1.setEstado_check(1);
			if(p.getOrganization()!=null){
				table1.setOrganica(p.getOrganization().getName());
			}
			table1.setId(""+p.getId());
			lista.add(table1);
		}
	     
		view.table_1.addData(lista);
        view.btn_eliminar.setVisible(false);
       view.btn_novo.setLink("igrp","NovoPerfil","index&p_aplicacao="+idApp+"&p_organica="+idOrg);
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionNovo() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","NovoPerfil","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(novo)----*/
      
      //NOT IN USE. setlink() in actionIndex set because getParam dosent work for a variable and param of other page
      //this.addQueryString("p_aplicacao",Core.getParam("id_app"));
      //this.addQueryString("p_organica",Core.getParam("id_org"));
		/*----#end-code----*/
		return this.redirect("igrp","NovoPerfil","index", this.queryString());	
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","NovoPerfil","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(editar)----*/
 			return this.forward("igrp","NovoPerfil","editar", this.queryString());

		/*----#end-code----*/
			
	}
	
	public Response actionMenu() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","MenuOrganica","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(menu)----*/
     //p_id is a param (iskey=true) that will be send automatically
     this.addQueryString("p_type","perfil");
		int id = Core.getParamInt("p_id");
        if(id!=0){
			ProfileType p = new ProfileType().findOne(id);
		     this.addQueryString("env_fk",p.getApplication().getId());  
        }
      return this.forward("igrp","MenuOrganica","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionTransacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","TransacaoOrganica","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(transacao)----*/
		//don't need to add p_id because its declared view.id.setParam(true);
        this.addQueryString("p_type","perfil");        
		return this.forward("igrp", "TransacaoOrganica", "index",this.queryString());		
		/*----#end-code----*/
			
	}
	
	public Response actionAssociar_etapa() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","PesquisarPerfil","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(associar_etapa)----*/
		
		this.loadQueryString().addQueryString("type", "prof");
      	return this.redirect("igrp","Etapaaccess","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionConvidar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","NovoUtilizador","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(convidar)----*/
	 return this.forward("igrp","NovoUtilizador","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		PesquisarPerfil model = new PesquisarPerfil();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 this.addQueryString("p_id",Core.getParam("p_id"));
		 return this.forward("igrp","PesquisarPerfil","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(eliminar)----*/
		int id = Core.getParamInt("p_id");
        if(id!=0){
			ProfileType p = new ProfileType().findOne(id);
            if(p!=null && p.delete(id)){
              Core.setMessageSuccess();
              return this.forward("igrp","PesquisarPerfil","index");
            }
        }
		//return this.redirectError();
		/*----#end-code----*/
		return this.redirect("igrp","PesquisarPerfil","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
