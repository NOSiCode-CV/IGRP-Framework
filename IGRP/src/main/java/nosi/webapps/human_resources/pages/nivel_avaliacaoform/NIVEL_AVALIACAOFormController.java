/*-------------------------*/

/*Create Controller*/

package nosi.webapps.human_resources.pages.nivel_avaliacaoform;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;


/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class NIVEL_AVALIACAOFormController extends Controller {
		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NIVEL_AVALIACAOForm model = new NIVEL_AVALIACAOForm();
		model.load();
		
		NIVEL_AVALIACAOFormView view = new NIVEL_AVALIACAOFormView();
		/*----#start-code(index)----*/
		String isEdit = Core.getParam("isEdit");;
 			
		if(Core.isNotNull(isEdit)) {
		QueryInterface query = Core.query("devnosi","SELECT id as id,codigo as codigo,nivel as nivel,descricao as descricao,cor as cor FROM PAYB.NIVEL_AVALIACAO")
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
		return this.redirect("human_resources","NIVEL_AVALIACAOList","index");
	}

	public Response actionSave() throws IOException, IllegalArgumentException, IllegalAccessException{
		NIVEL_AVALIACAOForm model = new NIVEL_AVALIACAOForm();
		model.load();
		/*----#start-code(save)----*/
		ResultSet r = null;
		
		String isEdit = Core.getParam("isEdit");;
		 	
		if(Core.isNull(isEdit)){
			r = Core.insert("devnosi","PAYB","NIVEL_AVALIACAO")		
				.addString("id",model.getId())
				.addString("codigo",model.getCodigo())
				.addString("nivel",model.getNivel())
				.addString("descricao",model.getDescricao())
				.addString("cor",model.getCor())
				.execute();
		}else{
			r = Core.update("devnosi","PAYB","NIVEL_AVALIACAO")		
				.addString("id",model.getId())
				.addString("codigo",model.getCodigo())
				.addString("nivel",model.getNivel())
				.addString("descricao",model.getDescricao())
				.addString("cor",model.getCor())
				.where("id=:id")
				.addString("id",model.getId())
				.execute();
		}
		if(!r.hasError()){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
			 return this.forward("human_resources","NIVEL_AVALIACAOForm","index");
		}
		/*----#end-code----*/
		return this.redirect("human_resources","NIVEL_AVALIACAOForm","index");
	}
}
