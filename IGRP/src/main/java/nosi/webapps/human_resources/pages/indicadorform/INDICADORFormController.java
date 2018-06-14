
package nosi.webapps.human_resources.pages.indicadorform;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class INDICADORFormController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		INDICADORForm model = new INDICADORForm();
		model.load();
		INDICADORFormView view = new INDICADORFormView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		
		view.id_tp_indicador.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.id_atrib.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.id_area.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
		----#gen-example */
		/*----#start-code(index)----*/
      	
      view.id_tp_indicador.setQuery(Core.query("devnosi","SELECT id as ID,nome as NAME from payb.tipo_indicador"));
	  view.id_atrib.setQuery(Core.query("devnosi","SELECT id as ID,nome as NAME from payb.atribuicao"));
	  view.id_area.setQuery(Core.query("devnosi","SELECT id as ID,nome as NAME from payb.area "));
      
      String isEdit = Core.getParam("isEdit");;
 			
		if(Core.isNotNull(isEdit)) {
		QueryInterface query = Core.query("devnosi","SELECT A.id as id,D.NOME as id_tp_indicador,C.NOME as id_atrib,A.codigo as codigo,A.nome as nome,A.descricao as descricao,B.NOME as id_area FROM PAYB.INDICADOR A, PAYB.AREA B, PAYB.ATRIBUICAO C,PAYB.TIPO_INDICADOR D")
				.where("A.id=:id AND A.ID_AREA =B.ID AND A.ID_ATRIB = C.ID AND A.ID_TP_INDICADOR = D.ID")
				.addString("A.id",model.getId());
		model.load(query);
		view.btn_save.setLink("save&isEdit=true");
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionList() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		INDICADORForm model = new INDICADORForm();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","INDICADORList","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(list)----*/
		
		/*----#end-code----*/
		return this.redirect("human_resources","INDICADORList","index", this.queryString());	
	}
	
	public Response actionSave() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		INDICADORForm model = new INDICADORForm();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","INDICADORForm","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(save)----*/
		ResultSet r = null;
		
		String isEdit = Core.getParam("isEdit");;
		 	
		if(Core.isNull(isEdit)){
			r = Core.insert("devnosi","PAYB","INDICADOR")		
				.addString("id",model.getId())
				.addString("id_tp_indicador",model.getId_tp_indicador())
				.addString("id_atrib",model.getId_atrib())
				.addString("codigo",model.getCodigo())
				.addString("nome",model.getNome())
				.addString("descricao",model.getDescricao())
				.addString("id_area",model.getId_area())
				.execute();
		}else{
			r = Core.update("devnosi","PAYB","INDICADOR")		
				.addString("id",model.getId())
				.addString("id_tp_indicador",model.getId_tp_indicador())
				.addString("id_atrib",model.getId_atrib())
				.addString("codigo",model.getCodigo())
				.addString("nome",model.getNome())
				.addString("descricao",model.getDescricao())
				.addString("id_area",model.getId_area())
				.where("id=:id")
				.addString("id",model.getId())
				.execute();
		}
		if(!r.hasError()){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
			 return this.forward("human_resources","INDICADORForm","index");
		}
		/*----#end-code----*/
		return this.redirect("human_resources","INDICADORForm","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
