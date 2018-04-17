
package nosi.webapps.igrp.pages.tbl_tipo_documentoform;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Application;

/*----#end-code----*/


public class Tbl_tipo_documentoFormController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Tbl_tipo_documentoForm model = new Tbl_tipo_documentoForm();
		model.load();
		Tbl_tipo_documentoFormView view = new Tbl_tipo_documentoFormView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		
		view.env_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
		----#gen-example */
		/*----#start-code(index)----*/
		String isEdit = Core.getParam("isEdit");;
 			
		if(Core.isNotNull(isEdit)) {
		QueryHelper query = Core.query("SELECT id as id,codigo as codigo,descricao as descricao,nome as nome,status as status,env_fk as env_fk FROM public.tbl_tipo_documento")
				.where("id=:id")
				.addInt("id",model.getId());
		model.load(query);
		view.btn_save.setLink("save&isEdit=true");
		}
		view.env_fk.setValue(new Application().getListApps());
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionList() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Tbl_tipo_documentoForm model = new Tbl_tipo_documentoForm();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL

		 return this.forward("igrp","Tbl_tipo_documentoList","index", this.queryString()); //if submit, loads the values
		}
		
		----#gen-example */
		/*----#start-code(list)----*/
		
		/*----#end-code----*/
		return this.redirect("igrp","Tbl_tipo_documentoList","index", this.queryString());	
	}
	
	public Response actionSave() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Tbl_tipo_documentoForm model = new Tbl_tipo_documentoForm();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL

		 return this.forward("igrp","Tbl_tipo_documentoForm","index", this.queryString()); //if submit, loads the values
		}
		
		----#gen-example */
		/*----#start-code(save)----*/
		Object r = null;
		
		String isEdit = Core.getParam("isEdit");;
		 			
		if(Core.isNull(isEdit)){
			r = Core.insert("tbl_tipo_documento")		
				.addString("codigo",model.getCodigo())
				.addString("descricao",model.getDescricao())
				.addString("nome",model.getNome())
				.addInt("status",model.getStatus())
				.addInt("env_fk",model.getEnv_fk())
				.execute();
		}else{
			r = Core.update("tbl_tipo_documento")		
				.addString("codigo",model.getCodigo())
				.addString("descricao",model.getDescricao())
				.addString("nome",model.getNome())
				.addInt("status",model.getStatus())
				.addInt("env_fk",model.getEnv_fk())
				.where("id=:id")
				.addInt("id",model.getId())
				.execute();
		}
		if(r != null){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
			 return this.forward("igrp","Tbl_tipo_documentoForm","index");
		}
		/*----#end-code----*/
		return this.redirect("igrp","Tbl_tipo_documentoForm","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
