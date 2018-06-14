
package nosi.webapps.human_resources.pages.tipo_indicadorform;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class TIPO_INDICADORFormController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		TIPO_INDICADORForm model = new TIPO_INDICADORForm();
		model.load();
		TIPO_INDICADORFormView view = new TIPO_INDICADORFormView();
		/*----#start-code(index)----*/
		String isEdit = Core.getParam("isEdit");;
 			
		if(Core.isNotNull(isEdit)) {
		QueryInterface query = Core.query("devnosi","SELECT id as id,codigo as codigo,nome as nome FROM PAYB.TIPO_INDICADOR")
				.where("id=:id")
				.addString("id",model.getId());
		model.load(query);
		view.btn_save.setLink("save&isEdit=true");
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionList() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		TIPO_INDICADORForm model = new TIPO_INDICADORForm();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","TIPO_INDICADORList","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(list)----*/
		
		/*----#end-code----*/
		return this.redirect("human_resources","TIPO_INDICADORList","index", this.queryString());	
	}
	
	public Response actionSave() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		TIPO_INDICADORForm model = new TIPO_INDICADORForm();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","TIPO_INDICADORForm","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(save)----*/
		ResultSet r = null;
		
		String isEdit = Core.getParam("isEdit");;
		 	
		if(Core.isNull(isEdit)){
			r = Core.insert("devnosi","PAYB","TIPO_INDICADOR")		
				.addString("id",model.getId())
				.addString("codigo",model.getCodigo())
				.addString("nome",model.getNome())
				.execute();
		}else{
			r = Core.update("devnosi","PAYB","TIPO_INDICADOR")		
				.addString("id",model.getId())
				.addString("codigo",model.getCodigo())
				.addString("nome",model.getNome())
				.where("id=:id")
				.addString("id",model.getId())
				.execute();
		}
		if(!r.hasError()){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
			 return this.forward("human_resources","TIPO_INDICADORForm","index");
		}
		/*----#end-code----*/
		return this.redirect("human_resources","TIPO_INDICADORForm","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
