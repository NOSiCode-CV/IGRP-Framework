package nosi.webapps.app_teste.pages.teste_blockly;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/


/*----#end-code----*/
		
public class Teste_blocklyController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Teste_blockly model = new Teste_blockly();
		model.load();
		Teste_blocklyView view = new Teste_blocklyView();
		/*----#start-code(index)----*/
		
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Teste_blockly model = new Teste_blockly();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(salvar)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Teste_blockly model = new Teste_blockly();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Listar_exames","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(eliminar)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Listar_exames","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
