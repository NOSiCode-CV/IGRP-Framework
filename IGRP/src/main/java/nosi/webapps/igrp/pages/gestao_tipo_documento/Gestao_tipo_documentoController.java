
package nosi.webapps.igrp.pages.gestao_tipo_documento;

import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.TipoDocumento;

/*----#end-code----*/


public class Gestao_tipo_documentoController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestao_tipo_documento model = new Gestao_tipo_documento();
		model.load();
		Gestao_tipo_documentoView view = new Gestao_tipo_documentoView();
		view.id.setParam(true);
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 't_aplicacao' as t_aplicacao,'t_codigo' as t_codigo,'t_nome' as t_nome,'t_descricao' as t_descricao,'t_estado' as t_estado,'id' as id "));
		
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		
		----#gen-example */
		/*----#start-code(index)----*/
		view.aplicacao.setValue(new Application().getListApps());
		if(Core.isNotNull(model.getAplicacao())) {
			List<Gestao_tipo_documento.Table_1> list = new ArrayList<>();
			new TipoDocumento().find().andWhere("application", "=",Core.toInt(model.getAplicacao())).all().forEach(td->{
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
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Gestao_tipo_documento model = new Gestao_tipo_documento();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Gestao_tipo_documento","index", this.queryString()); //if submit, loads the values
		
		----#gen-example */
		/*----#start-code(gravar)----*/
		TipoDocumento td = new TipoDocumento(model.getNome(), model.getAtivo(), model.getDescricao(), model.getCodigo(),new Application().findOne(Core.toInt(model.getAplicacao())));
		if(td.insert()!=null) {
			Core.setMessageSuccess();
		}else {
			Core.setMessageError();
			return this.forward("igrp","Gestao_tipo_documento","index", this.queryString());
		}
		this.addQueryString("p_aplicacao", model.getAplicacao());
		/*----#end-code----*/
		return this.redirect("igrp","Gestao_tipo_documento","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/
	private String getStatus(int status) {
		return status==1?"Ativo":"Inativo";
	}
	/*----#end-code----*/
	}
