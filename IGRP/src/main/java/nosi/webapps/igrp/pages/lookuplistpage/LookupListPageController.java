
package nosi.webapps.igrp.pages.lookuplistpage;

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.ResultSet;

/*----#start-code(packages_import)----*/
import java.util.List;
import javax.persistence.Tuple;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import java.util.ArrayList;
/*----#end-code----*/


public class LookupListPageController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		LookupListPage model = new LookupListPage();
		model.load();
		LookupListPageView view = new LookupListPageView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 'nome_pagina' as nome_pagina,'descricao' as descricao,'id' as id "));
		
		view.env_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
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
			table1.setId(""+ac.getId());
			table1.setNome_pagina(ac.getPage());
			table1.setDescricao(ac.getPage_descr());
			lista1.add(table1);
		}
		model.setTaskid(Core.getParam("p_general_id"));
		model.setProcessid(Core.getParam("p_process_id"));
		if(Core.isNull(model.getProcessid()) && Core.isNull(model.getTaskid())) {
			view.form_2.setVisible(false);
			view.formlist_1.setVisible(false);
			view.toolsbar_1.setVisible(false);
		}else {
			model.loadFormlist_1(Core.query(Config.getBaseConnection(),"SELECT id as checkbox, "
					+ "CASE WHEN EXISTS (SELECT id FROM tbl_tipo_documento_etapa te WHERE te.tipo_documento_fk = tp.id AND processid=:processid AND taskid=:taskid AND status=:status) " + 
					"       THEN id " + 
					"       ELSE 0 " + 
					"  END as checkbox_check, 1 as obrigatorio, "
					+ "CASE WHEN EXISTS (SELECT id FROM tbl_tipo_documento_etapa te WHERE te.tipo_documento_fk = tp.id AND required=1 AND processid=:processid AND taskid=:taskid AND status=:status) " + 
					"       THEN 1 " + 
					"       ELSE 0 " + 
					"  END as obrigatorio_check, "
					+ "nome as nome,descricao as descricao_documento FROM public.tbl_tipo_documento tp")
					.where("tp.status=:status AND tp.env_fk=:env_fk")
					.addString("processid", model.getProcessid())
					.addString("taskid", model.getTaskid())
					.addInt("status",1)
					.addInt("status",1)
					.addInt("env_fk", Core.toInt(model.getEnv_fk()))					
					);
		}
		view.id.setParam(true);
		view.env_fk.setLabel("Aplicação");
        view.tipo.setQuery(Core.query(null,"SELECT 'IN' as ID,'Input' as NAME UNION SELECT 'OUT' as ID,'Output' as NAME "));
		view.env_fk.setValue(new Application().getListApps());
		view.table_1.addData(lista1);
		view.btn_pesquisar.setLink("index");
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		LookupListPage model = new LookupListPage();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL

		 return this.forward("igrp","LookupListPage","index", this.queryString()); //if submit, loads the values
		}
		
		----#gen-example */
		/*----#start-code(gravar)----*/
		ResultSet result  = new ResultSet();
		if(Core.isNotNull(model.getTaskid()) && Core.isNotNull(model.getProcessid()) && Core.isNotNull(model.getEnv_fk())) {
			this.addQueryString("p_general_id", model.getTaskid()).addQueryString("p_process_id", model.getProcessid()).addQueryString("p_env_fk", model.getEnv_fk());
			result = Core.update("tbl_tipo_documento_etapa")
				.addInt("status", 0)
				.where("processid=:processid AND taskid=:taskid")
				.addString("processid", model.getProcessid())
				.addString("taskid", model.getTaskid())
				.execute();
			
			String[]p_formlist_1_idx = Core.getParamArray("p_formlist_1_idx");
			String[]p_checkbox_fk = Core.getParamArray("p_checkbox_fk");
			String[]p_obrigatorio_fk = Core.getParamArray("p_obrigatorio_fk");
			String[]p_tipo_fk = Core.getParamArray("p_tipo_fk");
			
			if(model.getFormlist_1() !=null) {
				for(int i=0;i<p_formlist_1_idx.length;i++) {
					int obrigatorio = 0;
					int id = -1;	
					String tipo = "";
					try {
						obrigatorio = Core.toInt(p_obrigatorio_fk[i]);
						id = Core.toInt(p_checkbox_fk[i]);
						tipo = p_tipo_fk[i];
					}catch(java.lang.IndexOutOfBoundsException e) {
					}
					tipo = Core.isNotNull(tipo)?tipo:"IN";
					if(id != -1) {
						List<Tuple> r = Core.query(Config.getBaseConnection(),"SELECT id FROM tbl_tipo_documento_etapa")
							.where("tipo_documento_fk=:tipo_documento_fk AND processid=:processid AND taskid=:taskid")
							.addInt("tipo_documento_fk", id)
							.addString("processid", model.getProcessid())
							.addString("taskid", model.getTaskid())
							.getResultList();
						if(r==null || r.isEmpty()) {
							result = Core.insert("tbl_tipo_documento_etapa")
							.addInt("status", 1)
							.addInt("tipo_documento_fk",id)
							.addString("processid", model.getProcessid())
							.addString("taskid", model.getTaskid())
							.addInt("required", obrigatorio)
							.addString("tipo", tipo)
							.execute();
						}else {
							result = Core.update("tbl_tipo_documento_etapa")
							.addInt("status", 1)
							.where("tipo_documento_fk=:tipo_documento_fk AND processid=:processid AND taskid=:taskid")
							.addInt("tipo_documento_fk",id)
							.addInt("required", obrigatorio)
							.addString("processid", model.getProcessid())
							.addString("taskid", model.getTaskid())
							.addString("tipo", tipo)
							.execute();
						}
					}
				}
			}
		}else {
			result.setError("Error...");
		}
		if(!result.hasError()) {
			Core.setMessageSuccess();
		}
		else {
			Core.setMessageError(result.getError()+":"+result.getSql());
		}
		/*----#end-code----*/
		return this.redirect("igrp","LookupListPage","index", this.queryString());	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		LookupListPage model = new LookupListPage();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL

		 return this.forward("igrp","Dominio","index", this.queryString()); //if submit, loads the values
		}
		
		----#gen-example */
		/*----#start-code(pesquisar)----*/
		
				/*----#end-code----*/
		return this.redirect("igrp","Dominio","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
