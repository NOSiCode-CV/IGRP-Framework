
package nosi.webapps.igrp.pages.lookuplistpage;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.List;
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
		  Query examples COPY/PASTE:
		  Info!: Core.query(null,... change 'null' to your db connection name added in application builder.
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
					+ "nome as nome,descricao as descricao_documento,(SELECT tipo FROM tbl_tipo_documento_etapa te WHERE te.tipo_documento_fk = tp.id AND processid=:processid AND taskid=:taskid AND status=:status) as tipo"
					+ ",'tp' as type_doc FROM public.tbl_tipo_documento tp")
					.union()
					.select("SELECT id as checkbox, "
					+ "CASE WHEN EXISTS (SELECT id FROM tbl_tipo_documento_etapa te WHERE te.report_fk = tp.id AND processid=:processid AND taskid=:taskid AND status=:status) " + 
					"       THEN id " + 
					"       ELSE 0 " + 
					"  END as checkbox_check, 1 as obrigatorio, "
					+ "CASE WHEN EXISTS (SELECT id FROM tbl_tipo_documento_etapa te WHERE te.report_fk = tp.id AND required=1 AND processid=:processid AND taskid=:taskid AND status=:status) " + 
					"       THEN 1 " + 
					"       ELSE 0 " + 
					"  END as obrigatorio_check, "
					+ "code as nome,name as descricao_documento,(SELECT tipo FROM tbl_tipo_documento_etapa te WHERE te.report_fk = tp.id AND processid=:processid AND taskid=:taskid AND status=:status) as tipo"
					+ ",'rep' as type_doc FROM public.tbl_rep_template tp")					
					.where("tp.status=:status AND tp.env_fk=:env_fk")
					.addString("processid", model.getProcessid())
					.addString("taskid", model.getTaskid())
					.addInt("status",1)
					.addInt("env_fk", Core.toInt(model.getEnv_fk()))					
					);
		}
		view.id.setParam(true);
		view.env_fk.setLabel("Aplicação");
        view.tipo.setQuery(Core.query(null,"SELECT 'IN' as ID,'Input' as NAME UNION SELECT 'OUT' as ID,'Output' as NAME "),"--- Selecionar Tipo Documento ---");
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
		  Query examples COPY/PASTE:
		  Info!: Core.query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","LookupListPage","index", this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
		ResultSet result  = new ResultSet();
		if(Core.isNotNull(model.getTaskid()) && Core.isNotNull(model.getProcessid()) && Core.isNotNull(model.getEnv_fk())) {
			this.addQueryString("p_general_id", model.getTaskid()).addQueryString("p_process_id", model.getProcessid()).addQueryString("p_env_fk", model.getEnv_fk());
	
			if(model.getFormlist_1() !=null) {
				 Core.delete(Config.getBaseConnection(), "tbl_tipo_documento_etapa")
					.where("processid=:processid AND taskid=:taskid")
					.addString("processid", model.getProcessid())
					.addString("taskid", model.getTaskid())
					.execute();
				for(LookupListPage.Formlist_1 fm:model.getFormlist_1()) {
					if(fm.getType_doc().getKey().equalsIgnoreCase("tp")) {
						result = this.saveOrUpdate(fm,model,"tipo_documento_fk");
					}else {
						result = this.saveOrUpdate(fm,model,"report_fk");
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
		  Query examples COPY/PASTE:
		  Info!: Core.query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Dominio","index", this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
				/*----#end-code----*/
		return this.redirect("igrp","Dominio","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	private ResultSet saveOrUpdate(Formlist_1 fm,LookupListPage model,String relation_type_id) {
		if(fm.getCheckbox()==null)
			return new ResultSet();

		return  Core.insert("tbl_tipo_documento_etapa")
					.addInt("status", 1)
					.addInt(relation_type_id,Core.toInt(fm.getCheckbox().getKey(),-1))
					.addString("processid", model.getProcessid())
					.addString("taskid", model.getTaskid())
					.addInt("required", fm.getObrigatorio()!=null?Core.toInt(fm.getObrigatorio().getKey()):0)
					.addString("tipo", fm.getTipo().getKey())
					.execute();
	}
	/*----#end-code----*/
	}
