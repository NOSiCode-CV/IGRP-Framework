
package nosi.webapps.human_resources.pages.indicadorlist;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class INDICADORListController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		INDICADORList model = new INDICADORList();
		model.load();
		INDICADORListView view = new INDICADORListView();
		view.id.setParam(true);
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 'id_tp_indicador' as id_tp_indicador,'id_atrib' as id_atrib,'codigo' as codigo,'nome' as nome,'descricao' as descricao,'id_area' as id_area,'id' as id "));
		
		
		----#gen-example */
		/*----#start-code(index)----*/
		QueryInterface query = Core.query("devnosi","SELECT A.id as id,C.NOME as id_tp_indicador,D.NOME as id_atrib,A.codigo as codigo,A.nome as nome,A.descricao as descricao,B.NOME as id_area FROM PAYB.INDICADOR A,PAYB.AREA B,PAYB.TIPO_INDICADOR C,PAYB.ATRIBUICAO D WHERE A.ID_AREA=B.ID AND A.ID_TP_INDICADOR=C.ID AND A.ID_ATRIB=D.ID");
		model.loadTable_1(query);
		
		view.id.setParam(true);
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionNew() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		INDICADORList model = new INDICADORList();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","INDICADORForm","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(new)----*/
		
		/*----#end-code----*/
		return this.redirect("human_resources","INDICADORForm","index", this.queryString());	
	}
	
	public Response actionUpdate() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		INDICADORList model = new INDICADORList();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","INDICADORForm","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(update)----*/
		this.addQueryString("target","_blank");
		this.addQueryString("isEdit","true");
		this.addQueryString("p_id",Core.getParam("p_id"));
		/*----#end-code----*/
		return this.redirect("human_resources","INDICADORForm","index", this.queryString());	
	}
	
	public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		INDICADORList model = new INDICADORList();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","INDICADORList","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(delete)----*/
		ResultSet r = Core.delete("devnosi","PAYB","INDICADOR").where("id=:id")
				.addString("id",Core.getParam("p_id"))
				.execute();
		if(!r.hasError())
			Core.setMessageSuccess();
		else
			Core.setMessageError();
		/*----#end-code----*/
		return this.redirect("human_resources","INDICADORList","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
