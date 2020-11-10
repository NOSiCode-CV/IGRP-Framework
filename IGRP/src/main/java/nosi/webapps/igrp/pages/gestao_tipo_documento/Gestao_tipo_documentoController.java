package nosi.webapps.igrp.pages.gestao_tipo_documento;

import java.io.IOException;//
import java.util.ArrayList;
import java.util.List;
/*----#end-code----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.TipoDocumento;
		
public class Gestao_tipo_documentoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Gestao_tipo_documento model = new Gestao_tipo_documento();
		model.load();
		Gestao_tipo_documentoView view = new Gestao_tipo_documentoView();
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as t_estado,'Magna perspiciatis aperiam tot' as t_aplicacao,'Omnis labore sit perspiciatis' as t_nome,'Magna stract adipiscing amet o' as t_codigo,'Consectetur ipsum lorem anim a' as t_descricao,'hidden-7e36_dd25' as id "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		int id = Core.getParamInt("p_id"); 
		
		model.setAtivo(1);
		model.setAtivo_check(1);
		String dad = Core.getCurrentDad();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			model.setAplicacao("" + (Core.findApplicationByDad(dad)).getId());
			view.aplicacao.propertie().add("disabled","true");			
		}
	 	view.aplicacao.setValue(new Application().getListApps());
	 	
		if(id != 0) {
			view.btn_gravar.addParameter("p_id", id);
			view.table_1.setVisible(false);
			TipoDocumento tipoDocumento = new TipoDocumento().findOne(id); 
			if(tipoDocumento != null) {
				model.setNome(tipoDocumento.getNome());
				model.setCodigo(tipoDocumento.getCodigo());
				model.setDescricao(tipoDocumento.getDescricao());
				model.setAplicacao(tipoDocumento.getApplication() != null ? tipoDocumento.getApplication().getId() + "" : "");
				view.aplicacao.propertie().add("disabled", "disabled");
				if(tipoDocumento.getStatus() != 1) {
					model.setAtivo(0);
					model.setAtivo_check(-1);
				}
				view.btn_gravar.setTitle("Atualizar");
			}
			
		}else {
			if(Core.isNotNull(model.getAplicacao())) {
				List<Gestao_tipo_documento.Table_1> list = new ArrayList<>();
				new TipoDocumento().find().andWhere("status", "<>",2).andWhere("application", "=",Core.toInt(model.getAplicacao())).all().forEach(td->{
					Gestao_tipo_documento.Table_1 t = new Gestao_tipo_documento.Table_1();
					t.setId(""+td.getId());
					t.setT_aplicacao(td.getApplication().getName());
					t.setT_codigo(td.getCodigo());
					t.setT_descricao(td.getDescricao());
					t.setT_nome(td.getNome());
					t.setT_estado(this.getStatus(td.getStatus()));
					list.add(t);
				});
				model.setTable_1(list);
			}
		}
		if(Core.isNotNullOrZero(model.getAplicacao())) {
			view.btn_gravar.addParameter("p_aplicacao", model.getAplicacao());
		}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Gestao_tipo_documento model = new Gestao_tipo_documento();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","Gestao_tipo_documento","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar)----*/
		int id = Core.getParamInt("p_id");
		if(id!=0) {
			TipoDocumento td = new TipoDocumento().findOne(id);
			//td.setApplication(new Application().findOne(Core.toInt(model.getAplicacao())));
			td.setCodigo(model.getCodigo());
			td.setDescricao(model.getDescricao()); 
			td.setNome(model.getNome());
			td.setStatus(model.getAtivo() != null ? model.getAtivo() : 0); 
			td = td.update();
			if(td!=null && !td.hasError()) {
				Core.setMessageSuccess();
			}else {
				Core.setMessageError();
			}
			this.addQueryString("p_id", id);
			return this.forward("igrp","Gestao_tipo_documento","index", this.queryString());
		}else {
			TipoDocumento td = new TipoDocumento(model.getNome(), model.getAtivo(), model.getDescricao(), model.getCodigo(),new Application().findOne(Core.toInt(model.getAplicacao())));
			td = td.insert();
			if(td!=null && !td.hasError()) {
				Core.setMessageSuccess();
			}else {
				Core.setMessageError();
				return this.forward("igrp","Gestao_tipo_documento","index", this.queryString());
			}
		}
		this.addQueryString("p_aplicacao", model.getAplicacao());
		/*----#end-code----*/
		return this.redirect("igrp","Gestao_tipo_documento","index", this.queryString());	
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Gestao_tipo_documento model = new Gestao_tipo_documento();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","Gestao_tipo_documento","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(editar)----*/
		int id = Core.getParamInt("p_id");
		TipoDocumento td = new TipoDocumento().findOne(id);
		this.addQueryString("p_id", id);
		if(td!=null) {
			model.setAplicacao(""+td.getApplication().getId());
			model.setAtivo(td.getStatus());
			model.setAtivo_check(td.getStatus());
			model.setCodigo(td.getCodigo());
			model.setDescricao(td.getDescricao());
			model.setNome(td.getNome());
			return this.forward("igrp","Gestao_tipo_documento","index",this.queryString());
		}
		
		/*----#end-code----*/
		return this.redirect("igrp","Gestao_tipo_documento","index", this.queryString());	
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Gestao_tipo_documento model = new Gestao_tipo_documento();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  return this.forward("igrp","Gestao_tipo_documento","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(eliminar)----*/
		
		int id = Core.getParamInt("p_id");
		TipoDocumento td = new TipoDocumento().findOne(id);
		if(td!=null) {
			td.setStatus(2);
			td = td.update();
			if(td!=null && !td.hasError()) {
				Core.setMessageSuccess();
			}else {
				Core.setMessageError();
			}
		}
		/*----#end-code----*/
		return this.redirect("igrp","Gestao_tipo_documento","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/
	private String getStatus(int status) {
		return status==1?"1":"2";
	}
	/*----#end-code----*/
}
