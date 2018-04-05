
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
		
		
		/*----#start-code(index)----*/

		model.setP_task_id(Core.getParam("p_general_id"));
		ArrayList<LookupListPage.Table_1> lista1 = new ArrayList<>();
		List<LookupListPage.Formlist_1> list = new ArrayList<>();
		if(Core.isNull(model.getAplicacao())) {
			model.setAplicacao(model.getEnv_fk());
		}
		String idApp = Core.getSwitchNotNullValue(model.getEnv_fk(),model.getAplicacao());
		String page = Core.getSwitchNotNullValue(model.getPage(),model.getComponentes());
		String page_descr = Core.getSwitchNotNullValue(model.getPage_descr(),model.getDescricao_componente());
		model.setAplicacao(model.getEnv_fk());
		
		List<Action> listActions = new Action().find()
											   .andWhere("application", "=",Core.toInt(idApp))
											   .andWhere("page", "like", page)
											   .andWhere("page_descr", "like",page_descr)
											   .all();
		List<Action> listComponentes = listActions.stream().filter(a->a.getIsComponent()==1).collect(Collectors.toList());
		listActions = listActions.stream().filter(a->a.getIsComponent()==0).collect(Collectors.toList());
		
		for(Action ac : listActions){
			LookupListPage.Table_1 table1 = new LookupListPage.Table_1();
			table1.setP_id(""+ac.getId());
			table1.setNome_pagina(ac.getPage());
			table1.setDescricao(ac.getPage_descr());
			lista1.add(table1);
		}
		for(Action ac : listComponentes){
			LookupListPage.Formlist_1 t = new LookupListPage.Formlist_1();
			String codigo = (ac.getApplication().getDad()+"_"+model.getP_process_id()+"_"+model.getP_task_id()).toUpperCase();	
			TaskComponent taskC = new TaskComponent().find().andWhere("codigo", "=",codigo).andWhere("action", "=",ac.getId()).one();
			if(taskC!=null) {
				t.setSelecionar_check(new Pair(ac.getId().toString(),ac.getId().toString()));
			}
			t.setSelecionar(new Pair(ac.getId().toString(),ac.getId().toString()));
			t.setT_nome_componente(new Pair(ac.getPage(),ac.getPage()));
			t.setT_descricao_componente(new Pair(ac.getPage_descr(),ac.getPage_descr()));
			t.setTitulo(new Pair(ac.getPage_descr(),ac.getPage_descr()));
			list.add(t);
		}

		model.setFormlist_1(list);
		view.formlist_1.addData(model.getFormlist_1());
		view.p_id.setParam(true);
		view.env_fk.setLabel("Aplicação");
		view.env_fk.setValue(new Application().getListApps());
		view.aplicacao.setValue(new Application().getListApps());
		view.table_1.addData(lista1);
		view.target = "_blank";
		view.btn_pesquisar1.setLink("index");
		view.btn_pesquisar2.setLink("index");
		/*----#end-code----*/
		
		
		view.setModel(model);
		
		return this.renderView(view);
		
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		
		/*----#start-code(gravar)----*/
		String[] actions = Core.getParamArray("p_selecionar_fk_desc");
		String[] actionsIsChecked = Core.getParamArray("p_selecionar_fk");
		String[] titulos = Core.getParamArray("p_titulo_fk_desc");
		for(int j=0;j<actions.length;j++) {
			if(Arrays.binarySearch(actionsIsChecked,actions[j]) == -1) {
				actions[j] = "-1";
			}
		}
		short i=0;
		String taskId = Core.getParam("p_task_id");
		String idApp = Core.getParam("p_aplicacao");
		String processId = Core.getParamArray("p_process_id")[0];
		
		Map<Object, Object> values = Core.mapArray(actions,titulos);		
		Application app = new Application().findOne(Core.toInt(idApp));
		String codigo = (app.getDad()+"_"+processId+"_"+taskId).toUpperCase();	
		Properties p = new Properties();	
		if(values != null) {
			//Delete all old components
			Core.delete(null, "tbl_task_component").where("codigo=:codigo").addString("codigo", codigo).execute();
			for(Entry<Object, Object> obj:values.entrySet()) {
				Action ac = new Action().findOne(Core.toInt(obj.getKey().toString()));
				if(ac !=null) {
					TaskComponent taskC = new TaskComponent(taskId, processId, codigo, i, ac, obj.getValue().toString());
					taskC.insert();
				}
				i++;
			}
			p.put("message", "ok");
			p.put("type", "success");
			p.put("codigo",codigo);
			return this.renderView(new Gson().toJson(p));
		}
	   /*----#end-code----*/
		
		return this.redirect("igrp","LookupListPage","index", this.queryString());
		
	}
	public Response actionPesquisar2() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		LookupListPage model = new LookupListPage();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","Dominio","index");
		}
		
		----#gen-example */
		
		/*----#start-code(pesquisar2)----*/
		
				/*----#end-code----*/
		
		return this.redirect("igrp","Dominio","index", this.queryString());
		
	}
	public Response actionPesquisar1() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		LookupListPage model = new LookupListPage();
		model.load();
		
		/*----#gen-example
		This is an example of how you can implement your code:
		
		if(model.save(model)){
			Core.setMessageSuccess();
		 }else{
			Core.setMessageError();
		 return this.forward("igrp","LookupListPage","index");
		}
		
		----#gen-example */
		
		/*----#start-code(pesquisar1)----*/
		
				/*----#end-code----*/
		
		return this.redirect("igrp","LookupListPage","index", this.queryString());
		
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	
	
	
	
}
