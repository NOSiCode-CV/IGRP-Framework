
package nosi.webapps.human_resources.pages.equipelist;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class EQUIPEListController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		EQUIPEList model = new EQUIPEList();
		model.load();
		EQUIPEListView view = new EQUIPEListView();
		view.id.setParam(true);
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 'id' as id,'codigo' as codigo,'nome' as nome "));
		
		
		----#gen-example */
		/*----#start-code(index)----*/
		QueryInterface query = Core.query("devnosi","SELECT id as id,codigo as codigo,nome as nome FROM PAYB.EQUIPE");
		model.loadTable_1(query);
		
		view.id.setParam(true);
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionNew() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		EQUIPEList model = new EQUIPEList();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","EQUIPEForm","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(new)----*/
		
		/*----#end-code----*/
		return this.redirect("human_resources","EQUIPEForm","index", this.queryString());	
	}
	
	public Response actionUpdate() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		EQUIPEList model = new EQUIPEList();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","EQUIPEForm","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(update)----*/
		this.addQueryString("target","_blank");
		this.addQueryString("isEdit","true");
		this.addQueryString("p_id",Core.getParam("p_id"));
		/*----#end-code----*/
		return this.redirect("human_resources","EQUIPEForm","index", this.queryString());	
	}
	
	public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		EQUIPEList model = new EQUIPEList();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("human_resources","EQUIPEList","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(delete)----*/
		ResultSet r = Core.delete("devnosi","PAYB","EQUIPE").where("id=:id")
				.addString("id",Core.getParam("p_id"))
				.execute();
		if(!r.hasError())
			Core.setMessageSuccess();
		else
			Core.setMessageError();
		/*----#end-code----*/
		return this.redirect("human_resources","EQUIPEList","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
