/*-------------------------*/

/*Create Controller*/

package nosi.webapps.human_resources.pages.nivel_avaliacaolist;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;


/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class NIVEL_AVALIACAOListController extends Controller {
		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		NIVEL_AVALIACAOList model = new NIVEL_AVALIACAOList();
		model.load();
		NIVEL_AVALIACAOListView view = new NIVEL_AVALIACAOListView();
		/*----#start-code(index)----*/
		QueryInterface query = Core.query("devnosi","SELECT id as id,codigo as codigo,nivel as nivel,descricao as descricao,cor as cor FROM PAYB.NIVEL_AVALIACAO");
		model.loadTable_1(query);
		
		view.id.setParam(true);
		/*----#end-code----*/
		view.setModel(model);
		
		view.id.setParam(true);
		return this.renderView(view);
	}


	public Response actionNew() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#start-code(new)----*/
		
		/*----#end-code----*/
		return this.redirect("human_resources","NIVEL_AVALIACAOForm","index");
	}

	public Response actionUpdate() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#start-code(update)----*/
		this.addQueryString("target","_blank");
		this.addQueryString("isEdit","true");
		this.addQueryString("p_id",Core.getParam("p_id"));
		/*----#end-code----*/
		return this.redirect("human_resources","NIVEL_AVALIACAOForm","index",this.queryString());
	}

	public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException{
		NIVEL_AVALIACAOList.Table_1 model = new NIVEL_AVALIACAOList.Table_1();
		/*----#start-code(delete)----*/
		ResultSet r = Core.delete("devnosi","PAYB","NIVEL_AVALIACAO").where("id=:id")
				.addString("id",Core.getParam("p_id"))
				.execute();
		if(!r.hasError())
			Core.setMessageSuccess();
		else
			Core.setMessageError();
		/*----#end-code----*/
		return this.redirect("human_resources","NIVEL_AVALIACAOList","index");
	}
}
