package nosi.webapps.app_teste.pages.page_utente;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/


/*----#end-code----*/
		
public class Page_utenteController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Page_utente model = new Page_utente();
		model.load();
		Page_utenteView view = new Page_utenteView();
		/*----#start-code(index)----*/
		view.btn_inserir_exame.addParameter("p_id_user", Core.getParam("p_id_user"));
		view.btn_ver_exames.addParameter("p_id_user", Core.getParam("p_id_user"));
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionInserir_exame() throws IOException, IllegalArgumentException, IllegalAccessException{
		Page_utente model = new Page_utente();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(inserir_exame)----*/
		this.addQueryString("p_id_user",Core.getParam("p_id_user"));
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
	public Response actionVer_exames() throws IOException, IllegalArgumentException, IllegalAccessException{
		Page_utente model = new Page_utente();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Listar_exames","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(ver_exames)----*/
		
		this.addQueryString("p_id_user",Core.getParam("p_id_user"));
		
		/*----#end-code----*/
		return this.redirect("app_teste","Listar_exames","index", this.queryString());	
	}
	
	public Response actionFazer_ficha_de_consulta() throws IOException, IllegalArgumentException, IllegalAccessException{
		Page_utente model = new Page_utente();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Ficha_de_consulta","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(fazer_ficha_de_consulta)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Ficha_de_consulta","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
