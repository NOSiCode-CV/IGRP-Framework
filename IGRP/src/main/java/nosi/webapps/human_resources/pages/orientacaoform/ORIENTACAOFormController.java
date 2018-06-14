/*-------------------------*/

/*Create Controller*/

package nosi.webapps.human_resources.pages.orientacaoform;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;


/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class ORIENTACAOFormController extends Controller {
		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		ORIENTACAOForm model = new ORIENTACAOForm();
		model.load();
		
		ORIENTACAOFormView view = new ORIENTACAOFormView();
		/*----#start-code(index)----*/
		String isEdit = Core.getParam("isEdit");;
 			
		if(Core.isNotNull(isEdit)) {
		QueryInterface query = Core.query("devnosi","SELECT id as id,codigo as codigo,nome as nome FROM PAYB.ORIENTACAO")
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
		/*----#start-code(list)----*/
		
		/*----#end-code----*/
		return this.redirect("human_resources","ORIENTACAOList","index");
	}

	public Response actionSave() throws IOException, IllegalArgumentException, IllegalAccessException{
		ORIENTACAOForm model = new ORIENTACAOForm();
		model.load();
		/*----#start-code(save)----*/
		ResultSet r = null;
		
		String isEdit = Core.getParam("isEdit");;
		 	
		if(Core.isNull(isEdit)){
			r = Core.insert("devnosi","PAYB","ORIENTACAO")		
				.addString("id",model.getId())
				.addString("codigo",model.getCodigo())
				.addString("nome",model.getNome())
				.execute();
		}else{
			r = Core.update("devnosi","PAYB","ORIENTACAO")		
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
			 return this.forward("human_resources","ORIENTACAOForm","index");
		}
		/*----#end-code----*/
		return this.redirect("human_resources","ORIENTACAOForm","index");
	}
}
