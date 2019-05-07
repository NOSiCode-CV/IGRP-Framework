package nosi.webapps.igrp_studio.pages.wsdl2java;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.webservices.wsdl2java.WSDL2Java;
import nosi.webapps.igrp.dao.Application;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/
		
public class Wsdl2javaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Wsdl2java model = new Wsdl2java();
		model.load();
		Wsdl2javaView view = new Wsdl2javaView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.aplicacao.setValue(Core.toMap(new Application().getListMyApp(Core.getCurrentUser().getId()), "dad", "name", gt("-- Selecionar --")));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGenerate() throws IOException, IllegalArgumentException, IllegalAccessException{
		Wsdl2java model = new Wsdl2java();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","Wsdl2java","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(generate)----*/
		
		if(Core.isNotNullMultiple(model.getUrl_wsdl(),model.getAplicacao(),model.getPackage_name())) {
			WSDL2Java.generateWsdl2Java(model.getUrl_wsdl(), model.getAplicacao().toLowerCase(),model.getPackage_name());
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","Wsdl2java","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
