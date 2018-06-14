
package nosi.webapps.human_resources.pages.colaboradorform;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class COLABORADORFormController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		COLABORADORForm model = new COLABORADORForm();
		model.load();
		COLABORADORFormView view = new COLABORADORFormView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		
		view.id_depart.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.id_equipe.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.id_atrib.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
		----#gen-example */
		/*----#start-code(index)----*/
      
      
		view.id_depart.setQuery(Core.query(null,"SELECT id as ID,nome as NAME from payb.departamento"));
		view.id_equipe.setQuery(Core.query(null,"SELECT id as ID,nome as NAME from payb.equipe"));
		view.id_atrib.setQuery(Core.query(null,"SELECT id as ID,nome as NAME from payb.atribuicao"));
      
      String isEdit = Core.getParam("isEdit");;
 			     
		if(Core.isNotNull(isEdit)) {
		QueryInterface query = Core.query("devnosi","SELECT A.id as id,A.codigo as codigo,A.nome as nome,A.dt_nasc as dt_nasc,A.dt_ini_act as dt_ini_act,C.NOME as id_depart,B.NOME as id_equipe,D.NOME as id_atrib FROM PAYB.COLABORADOR A,PAYB.EQUIPE B,PAYB.DEPARTAMENTO C,PAYB.ATRIBUICAO D")
				.where("A.id=:id AND A.ID_EQUIPE=B.ID AND A.ID_DEPART=C.ID AND A.ID_ATRIB=D.ID")
				.addString("id",model.getId());
		model.load(query);
		view.btn_save.setLink("save&isEdit=true");
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionList() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		COLABORADORForm model = new COLABORADORForm();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","COLABORADORList","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(list)----*/
		
		/*----#end-code----*/
		return this.redirect("human_resources","COLABORADORList","index", this.queryString());	
	}
	
	public Response actionSave() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		COLABORADORForm model = new COLABORADORForm();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","COLABORADORForm","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(save)----*/
		ResultSet r = null;
		
		String isEdit = Core.getParam("isEdit");;
		 	
		if(Core.isNull(isEdit)){
			r = Core.insert("devnosi","PAYB","COLABORADOR")		
				.addString("id",model.getId())
				.addString("codigo",model.getCodigo())
				.addString("nome",model.getNome())
				.addString("dt_nasc",model.getDt_nasc())
				.addString("dt_ini_act",model.getDt_ini_act())
				.addString("id_depart",model.getId_depart())
				.addString("id_equipe",model.getId_equipe())
				.addString("id_atrib",model.getId_atrib())
				.execute();
		}else{
			r = Core.update("devnosi","PAYB","COLABORADOR")		
				.addString("id",model.getId())
				.addString("codigo",model.getCodigo())
				.addString("nome",model.getNome())
				.addString("dt_nasc",model.getDt_nasc())
				.addString("dt_ini_act",model.getDt_ini_act())
				.addString("id_depart",model.getId_depart())
				.addString("id_equipe",model.getId_equipe())
				.addString("id_atrib",model.getId_atrib())
				.where("id=:id")
				.addString("id",model.getId())
				.execute();
		}
		if(!r.hasError()){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
			 return this.forward("human_resources","COLABORADORForm","index");
		}
		/*----#end-code----*/
		return this.redirect("human_resources","COLABORADORForm","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
