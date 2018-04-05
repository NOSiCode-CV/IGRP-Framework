
package nosi.webapps.igrp.pages.lookuplistpage;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.xml.XMLExtractComponent;
/*----#start-code(packages_import)----*/
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Predicate;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

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
		
		model.loadTable_1(Core.query("SELECT 'nome_pagina' as nome_pagina,'descricao' as descricao,'id' as id "));
		
		view.env_fk.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		view.aplicacao.setSqlQuery(null,"SELECT 'id' as ID,'name' as NAME ");
		
		----#gen-example */
		
		/*----#start-code(index)----*/
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
			t.setSelecionar(new Pair(ac.getId().toString(),ac.getId().toString()));
			t.setT_nome_componente(new Pair(ac.getPage(),ac.getPage()));
			t.setT_descricao_componente(new Pair(ac.getPage_descr(),ac.getPage_descr()));
			t.setTitulo(new Pair(ac.getPage_descr(),ac.getPage_descr()));
			list.add(t);
		}

		model.setFormlist_1(list);
		model.setP_task_id(Core.getParam("p_general_id"));
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
		String[] actions = Core.getParamArray("p_selecionar_fk");
		String[] titulos = Core.getParamArray("p_titulo_fk");
		System.out.println(actions.length+":"+titulos.length);
		short i=0;
		String taskId = Core.getParam("p_task_id");
		String idApp = Core.getParam("p_aplicacao");
		Predicate<? super Integer> filter = new Predicate<Object>() {
			@Override
			public boolean test(Object t) {
				return Core.toInt(t.toString()) >0;
			}
			
		};
		Map<Object, Object> values = Core.mapArray(actions,titulos,filter );		
		Application app = new Application().findOne(Core.toInt(idApp));
		if(values != null) {
			for(Entry<Object, Object> obj:values.entrySet()) {
				System.out.println(obj.getKey()+":"+obj.getValue());
//				Action ac = new Action().findOne(Core.toInt(obj.getKey().toString()));
//				String codigo = app.getDad()+"_"+ac.getPage()+"_"+taskId;						
//				TaskComponent taskC = new TaskComponent().find().andWhere("codigo", "=",codigo).one();
//				if(taskC==null) {
//					taskC = new TaskComponent(i, taskId, codigo,obj.getValue().toString(), ac);
//					taskC.insert();
//				}
//	//			System.out.println(XMLExtractComponent.extract(ac.getXmlContent()));
//				System.out.println(taskC);
//				i++;
			}
		}
	   /*----#end-code----*/
		
		return this.redirect("igrp","LookupListPage","index", this.queryString());
		
	}
	
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/

}
