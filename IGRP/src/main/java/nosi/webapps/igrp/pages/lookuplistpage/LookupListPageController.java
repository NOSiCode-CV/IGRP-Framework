
package nosi.webapps.igrp.pages.lookuplistpage;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;

/*----#start-code(packages_import)----*/
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.stream.Collectors;
import com.google.gson.Gson;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.TaskComponent;
/*----#end-code----*/



public class LookupListPageController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		LookupListPage model = new LookupListPage();
		LookupListPageView view = new LookupListPageView();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		Change 'null' param with your db connection name added in application builder.
		
		model.loadTable_1(Core.query("SELECT 'nome_pagina' as nome_pagina,'descricao' as descricao,'id' as id "));
		
		view.env_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		----#gen-example */
		
		/*----#start-code(index)----*/

		ArrayList<LookupListPage.Table_1> lista1 = new ArrayList<>();
	
		List<Action> listActions = new Action().find()
											   .andWhere("application", "=",Core.toInt(model.getEnv_fk()))
											   .andWhere("page", "like", model.getPage())
											   .andWhere("page_descr", "like",model.getPage_descr())
											   .andWhere("isComponent", "=",0)
											   .all();
		
		for(Action ac : listActions){
			LookupListPage.Table_1 table1 = new LookupListPage.Table_1();
			table1.setP_id(""+ac.getId());
			table1.setNome_pagina(ac.getPage());
			table1.setDescricao(ac.getPage_descr());
			lista1.add(table1);
		}
	
		view.p_id.setParam(true);
		view.env_fk.setLabel("Aplicação");
		view.env_fk.setValue(new Application().getListApps());
		view.table_1.addData(lista1);
		view.target = "_blank";
		view.btn_pesquisar.setLink("index");
		/*----#end-code----*/
		
		
		view.setModel(model);
		
		return this.renderView(view);
		
	}

	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		LookupListPage model = new LookupListPage();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		Change 'null' param with your db connection name added in application builder.
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","Dominio","index");
		}
		
		----#gen-example */
		
		/*----#start-code(pesquisar)----*/
		
				/*----#end-code----*/
		
		return this.redirect("igrp","Dominio","index", this.queryString());
		
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	
	
	
	
}
