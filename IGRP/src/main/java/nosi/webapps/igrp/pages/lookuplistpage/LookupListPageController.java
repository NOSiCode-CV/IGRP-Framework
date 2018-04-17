
package nosi.webapps.igrp.pages.lookuplistpage;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.webapp.databse.helpers.ResultSet;

/*----#start-code(packages_import)----*/
import java.util.List;
import javax.persistence.Tuple;
import javax.servlet.jsp.jstl.sql.Result;

import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.pages.lookuplistpage.LookupListPage.Formlist_1;
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
			model.loadFormlist_1(Core.query("SELECT id as checkbox, "
					+ "CASE WHEN EXISTS (SELECT id FROM tbl_tipo_documento_etapa te WHERE te.tipo_documento_fk = tp.id AND processid=:processid AND taskid=:taskid) " + 
					"       THEN id " + 
					"       ELSE 0 " + 
					"  END as checkbox_check, 1 as obrigatorio, "
					+ "CASE WHEN EXISTS (SELECT id FROM tbl_tipo_documento_etapa te WHERE te.tipo_documento_fk = tp.id AND required=1 AND processid=:processid AND taskid=:taskid) " + 
					"       THEN 1 " + 
					"       ELSE 0 " + 
					"  END as obrigatorio_check, "
					+ "nome as nome,descricao as descricao_documento FROM public.tbl_tipo_documento tp")
					.where("tp.status=:status AND tp.env_fk=:env_fk")
					.addString("processid", model.getProcessid())
					.addString("taskid", model.getTaskid())
					.addInt("status", 1)
					.addInt("env_fk", Core.toInt(model.getEnv_fk()))
					);
		}
		view.id.setParam(true);
		view.env_fk.setLabel("Aplicação");
        view.tipo.setQuery(Core.query(null,"SELECT 'IN' as ID,'Input' as NAME UNION SELECT 'OUT' as ID,'Output' as NAME "),"--- Selecionar Tipo ---");
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
			if(model.getFormlist_1() !=null) {
				for(Formlist_1 td:model.getFormlist_1()) {
					if(td.getCheckbox()!=null) {
						List<Tuple> r = Core.query("SELECT id FROM tbl_tipo_documento_etapa")
							.where("tipo_documento_fk=:tipo_documento_fk AND processid=:processid AND taskid=:taskid")
							.addInt("tipo_documento_fk", Core.toInt(td.getCheckbox().getKey()))
							.addString("processid", model.getProcessid())
							.addString("taskid", model.getTaskid())
							.getResultList();
						if(r==null || r.isEmpty()) {
							result = Core.insert("tbl_tipo_documento_etapa")
							.addInt("status", 1)
							.addInt("tipo_documento_fk", Core.toInt(td.getCheckbox().getKey()))
							.addString("processid", model.getProcessid())
							.addString("taskid", model.getTaskid())
							.addInt("required", Core.isNotNull(td.getObrigatorio())?Core.toInt(td.getObrigatorio().getKey()):0)
							.execute();
						}else {
							result = Core.update("tbl_tipo_documento_etapa")
							.addInt("status", 1)
							.where("tipo_documento_fk=:tipo_documento_fk AND processid=:processid AND taskid=:taskid")
							.addInt("tipo_documento_fk", Core.toInt(td.getCheckbox().getKey()))
							.addInt("required", Core.isNotNull(td.getObrigatorio())?Core.toInt(td.getObrigatorio().getKey()):0)
							.addString("processid", model.getProcessid())
							.addString("taskid", model.getTaskid())
							.execute();
						}
					}else {
						Core.setMessageError("Lista checkbox vaiza");
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
