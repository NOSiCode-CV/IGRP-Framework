package nosi.webapps.igrp.pages.gestao_tipo_documento;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.TipoDocumento;
import java.util.ArrayList;
import java.util.List;
/*----#end-code----*/
		
public class Gestao_tipo_documentoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Gestao_tipo_documento model = new Gestao_tipo_documento();
		model.load();
		Gestao_tipo_documentoView view = new Gestao_tipo_documentoView();
		view.id.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '2' as t_estado,'Aperiam adipiscing totam elit' as t_aplicacao,'Laudantium amet unde doloremqu' as t_codigo,'Totam voluptatem anim rem sit' as t_nome,'Amet natus officia deserunt vo' as t_descricao,'hidden-b25b_981b' as id "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		model.setAtivo(1);
		model.setAtivo_check(1);
      	view.aplicacao.setValue(new Application().getListApps());
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
		int id = Core.getParamInt("p_id");
		if(id!=0) {
			view.btn_gravar.addParameter("p_id", id);
			view.table_1.setVisible(false);
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
		 return this.forward("igrp","Gestao_tipo_documento","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
		int id = Core.getParamInt("p_id");
		if(id!=0) {
			TipoDocumento td = new TipoDocumento().findOne(id);
			td.setApplication(new Application().findOne(Core.toInt(model.getAplicacao())));
			td.setCodigo(model.getCodigo());
			td.setDescricao(model.getDescricao());
			td.setNome(model.getNome());
			td.setStatus(model.getAtivo());
			td = td.update();
			if(td!=null && !td.hasError()) {
				Core.setMessageSuccess();
			}else {
				Core.setMessageError();
				this.addQueryString("p_id", id);
				return this.forward("igrp","Gestao_tipo_documento","index", this.queryString());
			}
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
		 return this.forward("igrp","Gestao_tipo_documento","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
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
			return this.forward("igrp","Gestao_tipo_documento","index",model,this.queryString());
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
		 return this.forward("igrp","Gestao_tipo_documento","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
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
