
package nosi.webapps.igrp.pages.tbl_tipo_documentolist;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;
/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class Tbl_tipo_documentoListController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Tbl_tipo_documentoList model = new Tbl_tipo_documentoList();
		model.load();
		Tbl_tipo_documentoListView view = new Tbl_tipo_documentoListView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 'id' as id,'codigo' as codigo,'descricao' as descricao,'nome' as nome,'status' as status,'tipo' as tipo,'env_fk' as env_fk "));
		
		
		----#gen-example */
		/*----#start-code(index)----*/
		QueryHelper query = Core.query("SELECT d.id as id,d.codigo as codigo,d.descricao as descricao,d.nome as nome,d.status as status,d.tipo as tipo,e.name as env_fk FROM public.tbl_tipo_documento as d,public.tbl_env as e")
								.where("d.env_fk=e.id AND e.dad=:dad").addString("dad", Core.getCurrentDad());
		model.loadTable_1(query);		
		view.id.setParam(true);
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionNew() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Tbl_tipo_documentoList model = new Tbl_tipo_documentoList();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 return this.forward("igrp","Tbl_tipo_documentoForm","index");
		}
		
		----#gen-example */
		/*----#start-code(new)----*/
		
		/*----#end-code----*/
		return this.redirect("igrp","Tbl_tipo_documentoForm","index", this.queryString());	
	}
	
	public Response actionUpdate() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Tbl_tipo_documentoList model = new Tbl_tipo_documentoList();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 return this.forward("igrp","Tbl_tipo_documentoList","index");
		}
		
		----#gen-example */
		/*----#start-code(update)----*/
		this.addQueryString("target","_blank");
		this.addQueryString("isEdit","true");
		this.addQueryString("p_id",Core.getParam("p_id"));
		/*----#end-code----*/
		return this.redirect("igrp","Tbl_tipo_documentoForm","index", this.queryString());	
	}
	
	public Response actionDelete() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Tbl_tipo_documentoList model = new Tbl_tipo_documentoList();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 return this.forward("igrp","Tbl_tipo_documentoList","index");
		}
		
		----#gen-example */
		/*----#start-code(delete)----*/
		Object r = Core.delete("tbl_tipo_documento").where("id=:id")
				.addInt("id",Core.getParamInt("p_id"))
				.execute();
		if( r!=null)
			Core.setMessageSuccess();
		else
			Core.setMessageError();
		/*----#end-code----*/
		return this.redirect("igrp","Tbl_tipo_documentoList","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
