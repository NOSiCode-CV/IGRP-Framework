package nosi.webapps.igrp.pages.editartransacao;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Transaction;
import static nosi.core.i18n.Translator.gt;
/*----#end-code----*/
		
public class EditarTransacaoController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		EditarTransacao model = new EditarTransacao();
		model.load();
		EditarTransacaoView view = new EditarTransacaoView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		view.aplicacao.setValue(new Application().getListApps());
		
		
		String codigo = Core.getParam("codigo");
		if (Core.isNotNull(codigo)) {
			Transaction t = new Transaction().find().andWhere("code", "=", codigo).one();
			
			if (t != null) {
				model.setCodigo(codigo);
				model.setAplicacao(t.getApplication().getId()+"");
				model.setDescricao(t.getDescr());
				model.setStatus(t.getStatus());
				model.setId(t.getId());
				view.aplicacao.propertie().add("disabled","true");
				view.codigo.setVisible(false);
				view.btn_gravar.addParameter("editar", "true");
			}		
			
				//view.aplicacao.setValue(new Application().findOne(t.getApplication().getId()).getName());77
				//view.p_id.setValue("" + t.getId());
		
			// view.btn_gravar.setLink("index&id="+model.getP_id());

		
		} else {
			String dad = Core.getCurrentDad();
			model.setAplicacao("" + (Core.findApplicationByDad(dad)).getId());
			model.setStatus(1);
	        
	        view.sectionheader_1_text.setValue("Nova Transação");
	        
		}
          
			
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		EditarTransacao model = new EditarTransacao();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","EditarTransacao","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar)----*/
			
		
		
		if(Core.isNotNull(model.getId()) && Core.isNotNull(Core.getParam("editar"))) {

			Transaction t = new Transaction().find().andWhere("id", "=", model.getId()).one();
				
				t.setDescr(model.getDescricao());			
				t.setStatus(model.getStatus());
				String codigo = t.getCode();
	  		    this.addQueryString("codigo",codigo);	
				t = t.update();
				if (t != null)
					Core.setMessageSuccess(gt("Transação atualizada com sucesso."));
				else
					Core.setMessageError(gt("Error ao atualizar a transação."));			
			
				
		}else {
			Transaction t = new Transaction();
			t.setDescr(model.getDescricao());			
			t.setStatus(model.getStatus());
			t.setCode(model.getCodigo());
			t.setApplication(new Application().findOne(Core.toInt(model.getAplicacao())));
			t.insert();
			
			if (t != null) {
				Core.setMessageSuccess(gt("Transação inserida com sucesso."));
			}else Core.setMessageError();
				
		}
		
			
			
		/*----#end-code----*/
		return this.redirect("igrp","EditarTransacao","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/

	/*----#end-code----*/
}
