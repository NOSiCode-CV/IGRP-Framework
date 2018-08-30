
package nosi.webapps.igrp.pages.novodominio;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Domain;
import nosi.webapps.igrp.pages.novodominio.NovoDominio.Formlist_1;
import java.util.ArrayList;
import java.util.List;
/*----#end-code----*/


public class NovoDominioController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		NovoDominio model = new NovoDominio();
		model.load();
		NovoDominioView view = new NovoDominioView();
		
		view.estado.loadDomain("SIN_NAO","-- Selecionar --");
		
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		  ----#gen-example */
		/*----#start-code(index)----*/

		view.estado.setQuery(Core.query(
				"SELECT 'ATIVE' as ID,'Ativo' as NAME UNION SELECT 'INATIVE' as ID,'Inativo' as NAME "));
		String isEdit = Core.getParam("isEdit");
		if (Core.isNotNull(isEdit)) {
			model.loadFormlist_1(Core.query(this.configApp.getBaseConnection(),
					"SELECT id,description,valor as key,status as estado,ordem FROM tbl_domain").where("dominio=:dominio").addString("dominio", model.getDominio()));
		} 
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		NovoDominio model = new NovoDominio();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","NovoDominio","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(gravar)----*/
		// ModelMapper modelMapper = new ModelMapper();
		List<Formlist_1> formlistTud = new ArrayList<>();
		boolean error=false;		 
		if(Core.isNotNull(Core.getParam("isEdit")))
				addQueryString("isEdit", "true").addQueryString("p_dominio",model.getDominio());
		formlistTud = model.getFormlist_1();
		for (int i = 0; i < formlistTud.size(); i++) {		
			Formlist_1 formlist = formlistTud.get(i);
			Domain d = new Domain(model.getDominio(), formlist.getKey().getKey(),
					formlist.getDescription().getKey(), formlist.getEstado().getKey(),
					Core.toInt(formlist.getOrdem().getKey()));
			
			if (Core.isNull(formlist.getId().getKey())) {
				if (d.insert() == null) {
					Core.setMessageError();
					error=true;		
					break;
				}	
			}else {				
				d = d.findOne(formlist.getId().getKey());		
				
				if(d.update() == null)
					Core.setMessageError();
					error=true;		
					break;
				}			
			
		}
		if(!error)
			Core.setMessageSuccess();

		/*----#end-code----*/
		return this.redirect("igrp","NovoDominio","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/

	/*----#end-code----*/
	}
