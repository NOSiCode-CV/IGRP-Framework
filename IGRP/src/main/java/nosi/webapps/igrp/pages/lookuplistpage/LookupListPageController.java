package nosi.webapps.igrp.pages.lookuplistpage;

import nosi.core.webapp.mvc.Controller;
import nosi.core.webapp.util.Core;
import nosi.core.webapp.util.helpers.database.QueryInterface;
import nosi.core.webapp.util.helpers.database.ResultSet;
import nosi.core.webapp.Response;

import java.io.IOException;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.List;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.RepTemplate;
import nosi.webapps.igrp.dao.TipoDocumento;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

import java.util.ArrayList;
import nosi.core.config.ConfigDBIGRP;

import nosi.core.gui.components.IGRPSeparatorList.Pair;

/*----#end-code----*/
		
public class LookupListPageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		LookupListPage model = new LookupListPage();
		model.load();
		LookupListPageView view = new LookupListPageView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadFormlist_1(Core.query(null,"SELECT '1' as checkbox,'1' as obrigatorio,'2' as tipo,'Magna totam laudantium perspic' as nome,'Aperiam ut unde elit magna' as descricao_documento,'hidden-17ca_43e1' as type_doc "));
		model.loadTable_1(Core.query(null,"SELECT 'Stract sit aliqua stract magna' as descricao,'Omnis stract aperiam omnis ist' as nome_pagina,'hidden-493a_6cc3' as id "));
		view.env_fk.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.tipo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		ArrayList<LookupListPage.Table_1> lista1 = new ArrayList<>();
	
		List<Action> listActions = new Action().find()
											   .andWhere("application", "=",Core.toInt(model.getEnv_fk()))
											   .andWhere("status", "=", 1)
											   .andWhere("page", "like", model.getPage())
											   .andWhere("page_descr", "like",model.getPage_descr())
											   .andWhere("isComponent", "=",(short)0)
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
          view.associar_documentos.setVisible(false);
		}else {
			
			List<LookupListPage.Formlist_1> formList = new ArrayList<LookupListPage.Formlist_1>(); 
			
			List<TipoDocumento> tipoDocumentos = new TipoDocumento().find()
											.andWhere("application.id", "=", Core.toInt(model.getEnv_fk()))
											.andWhere("status", "=", 1)
											.orderByAsc("descricao").all(); 
			
			if(tipoDocumentos != null) {
				for(TipoDocumento tipoDocumento : tipoDocumentos) {
					LookupListPage.Formlist_1 row = new LookupListPage.Formlist_1();
					row.setDescricao_documento(new Pair(tipoDocumento.getDescricao(), tipoDocumento.getDescricao()));
					row.setFormlist_1_id(new Pair(tipoDocumento.getId() + "", tipoDocumento.getId() + "")); 
					row.setNome(new Pair(tipoDocumento.getNome(), tipoDocumento.getNome())); 
					row.setCheckbox(new Pair(tipoDocumento.getId() + "", "-1")); 
					row.setObrigatorio(new Pair("1", "0")); 
					TipoDocumentoEtapa tipoDocumentoEtapas = new TipoDocumentoEtapa().find()
																	.andWhere("processId", "=", model.getProcessid())
																	.andWhere("tipoDocumento", "=", tipoDocumento)
																	.andWhere("taskId", "=", model.getTaskid())
																	.andWhere("status", "=", 1)
																	.one(); 
					if(tipoDocumentoEtapas != null) {
						row.setCheckbox(new Pair(tipoDocumento.getId() + "", tipoDocumento.getId() + "")); 
						row.setCheckbox_check(new Pair(tipoDocumento.getId() + "", tipoDocumento.getId() + "")); 
						if(tipoDocumentoEtapas.getRequired() != 0) {
							row.setObrigatorio(new Pair(tipoDocumentoEtapas.getRequired() + "", tipoDocumentoEtapas.getRequired() + "")); 
							row.setObrigatorio_check(new Pair(tipoDocumentoEtapas.getRequired() + "", tipoDocumentoEtapas.getRequired() + "")); 
						}
						row.setTipo(new Pair(tipoDocumentoEtapas.getTipo(), tipoDocumentoEtapas.getTipo()));
					}
					
					formList.add(row);
				}
			}
					
			List<RepTemplate> repTemplates = new RepTemplate().find()
													.andWhere("application.id", "=", Core.toInt(model.getEnv_fk()))
													.andWhere("status", "=", 1)
													.orderByAsc("name").all(); 
			if(repTemplates != null) {
				for(RepTemplate repTemplate : repTemplates) { 
					LookupListPage.Formlist_1 row = new LookupListPage.Formlist_1();
					row.setDescricao_documento(new Pair(repTemplate.getName(), repTemplate.getName()));
					row.setFormlist_1_id(new Pair(repTemplate.getId() + "", repTemplate.getId() + "")); 
					row.setNome(new Pair(repTemplate.getCode(), repTemplate.getCode())); 
					row.setCheckbox(new Pair(repTemplate.getId() + "", "-1")); 
					row.setObrigatorio(new Pair("1", "0")); 
					
					TipoDocumentoEtapa tipoDocumentoEtapas = new TipoDocumentoEtapa().find() 
							.andWhere("processId", "=", model.getProcessid()) 
							.andWhere("repTemplate", "=", repTemplate) 
							.andWhere("taskId", "=", model.getTaskid()) 
							.andWhere("status", "=", 1) 
							.one(); 
					if(tipoDocumentoEtapas != null) {
						row.setCheckbox(new Pair(repTemplate.getId() + "", repTemplate.getId() + "")); 
						row.setCheckbox_check(new Pair(repTemplate.getId() + "", repTemplate.getId() + "")); 
						if(tipoDocumentoEtapas.getRequired() != 0) {
							row.setObrigatorio(new Pair(tipoDocumentoEtapas.getRequired() + "", tipoDocumentoEtapas.getRequired() + "")); 
							row.setObrigatorio_check(new Pair(tipoDocumentoEtapas.getRequired() + "", tipoDocumentoEtapas.getRequired() + "")); 
						}
						row.setTipo(new Pair(tipoDocumentoEtapas.getTipo(), tipoDocumentoEtapas.getTipo()));
					} 
					
					formList.add(row);
				}
			}
			
			model.setFormlist_1(formList);
			
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
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","LookupListPage","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar)----*/
		try {
			boolean result  = true;
			if(Core.isNotNull(model.getTaskid()) && Core.isNotNull(model.getProcessid()) && Core.isNotNull(model.getEnv_fk())) {
				
				this.addQueryString("p_general_id", model.getTaskid()).addQueryString("p_process_id", model.getProcessid()).addQueryString("p_env_fk", model.getEnv_fk());
				
				if(model.getFormlist_1() != null) {	
					Core.update(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG, "tbl_tipo_documento_etapa")
						.addInt("status", 0)
						.where("processid=:processid AND taskid=:taskid AND status = 1")
						.addString("processid", model.getProcessid())
						.addString("taskid", model.getTaskid())
						.execute();
					
						 int line = 0; 
						 for(LookupListPage.Formlist_1 row : model.getFormlist_1()) { 
							 line++; 
							 if(row.getCheckbox().getKey().equals(row.getCheckbox_check().getKey())) { // If Checked 
								 if(row.getTipo().getKey() == null || row.getTipo().getKey().isEmpty()) { 
									 Core.setMessageWarning("A " + line + "ª linha (Nome Documento: " + row.getNome().getValue() + ") não foi processada. Favor escolher o tipo de documento."); 
									 continue; 
								 }
								 if(row.getTipo().getKey().equalsIgnoreCase("IN")) { 
										result = this.saveOrUpdate(row.getCheckbox().getKey(), this.proccessCheckBoxObrigatorio(row.getObrigatorio_check().getKey()), row.getTipo().getKey(), model, "tipo_documento_fk");
									}else 
										if(row.getTipo().getKey().equalsIgnoreCase("OUT")) { 
											RepTemplate repTemplate = new RepTemplate().find().andWhere("code", "=", "" + row.getNome().getValue()).one(); 
											if(repTemplate != null) 
												result = this.saveOrUpdate(row.getCheckbox().getKey(), this.proccessCheckBoxObrigatorio(row.getObrigatorio_check().getKey()), row.getTipo().getKey(), model, "report_fk");
											else 
												result = this.saveOrUpdate(row.getCheckbox().getKey(), this.proccessCheckBoxObrigatorio(row.getObrigatorio_check().getKey()), row.getTipo().getKey(), model, "tipo_documento_fk");	
											}
									
									if(!result) break; 
							 	}
						 	}
				}
			}
			
			if(result) 
				Core.setMessageSuccess();
			else 
				Core.setMessageError();
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*----#end-code----*/
		return this.redirect("igrp","LookupListPage","index", this.queryString());	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		LookupListPage model = new LookupListPage();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
				/*----#end-code----*/
		return this.redirect("igrp","Dominio","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/
	
	
	private boolean saveOrUpdate(String p_checkbox_fk,int p_obrigatorio_fk,String p_tipo_fk,LookupListPage model,String relation_type_id) {
		boolean success = false;
		try {
			if(p_checkbox_fk != null && Core.toInt(p_checkbox_fk,-1) != -1) { 
				
				TipoDocumentoEtapa doc = null; 
				
				if(relation_type_id.equalsIgnoreCase("report_fk")) {
					doc = new TipoDocumentoEtapa().find()
							.andWhere("processId", "= ",  model.getProcessid())
							.andWhere("tipo", "=", p_tipo_fk)
							.andWhere("required", "=", p_obrigatorio_fk)
							.andWhere("taskId", "=", model.getTaskid())
							.andWhere("status", "=", 0)
							.andWhere("repTemplate.id", "=", Core.toInt(p_checkbox_fk))
							.one(); 
				}
				if(relation_type_id.equalsIgnoreCase("tipo_documento_fk")) {
					doc = new TipoDocumentoEtapa().find()
							.andWhere("processId", "= ",  model.getProcessid())
							.andWhere("tipo", "=", p_tipo_fk)
							.andWhere("required", "=", p_obrigatorio_fk)
							.andWhere("taskId", "=", model.getTaskid())
							.andWhere("status", "=", 0)
							.andWhere("tipoDocumento.id", "=", Core.toInt(p_checkbox_fk))
							.one(); 
				}
						
				if(doc != null) {
					doc.setStatus(1);
					doc = doc.update(); 
					success = doc != null && !doc.hasError(); 
				}else { 
					doc = new TipoDocumentoEtapa(); 
					doc.setStatus(1); 
					if(relation_type_id.equalsIgnoreCase("report_fk")) { 
						RepTemplate repTemplate = new RepTemplate(); 
						repTemplate.setId(Core.toInt(p_checkbox_fk));
						doc.setRepTemplate(repTemplate); 
					}
					if(relation_type_id.equalsIgnoreCase("tipo_documento_fk")) {
						TipoDocumento tipoDocumento = new TipoDocumento(); 
						tipoDocumento.setId(Core.toInt(p_checkbox_fk)); 
						doc.setTipoDocumento(tipoDocumento);
					}
					doc.setTipo(p_tipo_fk); 
					doc.setRequired(p_obrigatorio_fk); 
					doc.setTaskId(model.getTaskid()); 
					doc.setProcessId(model.getProcessid()); 
					doc = doc.insert(); 
					
					success = doc != null && !doc.hasError(); 
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return success; 
	}
	
	
	
	private int proccessCheckBoxObrigatorio(String v) { 
		int required = 0;
		try {
			required = Core.toInt(v);
		}catch(IndexOutOfBoundsException e) {
			required = 0;
		}
		return required;
	}
	
	/*----#end-code----*/
}
