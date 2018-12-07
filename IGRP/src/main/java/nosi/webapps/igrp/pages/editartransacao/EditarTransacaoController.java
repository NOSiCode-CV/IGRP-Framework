package nosi.webapps.igrp.pages.editartransacao;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
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
		/*----#start-code(index)----*/
		String codigo = Core.getParam("codigo");
		if (Core.isNotNull(codigo)) {
			Transaction t = new Transaction().find().andWhere("code", "=", codigo).one();
			
			if (t != null) {
				model.setCodigo(codigo);
				model.setAplicacao(new Application().findOne(t.getApplication().getId()).getName());
				model.setDescricao(t.getDescr());
				model.setStatus(t.getStatus());
				model.setId(t.getId());
			}		
			
				//view.aplicacao.setValue(new Application().findOne(t.getApplication().getId()).getName());77
				//view.p_id.setValue("" + t.getId());
		
			// view.btn_gravar.setLink("index&id="+model.getP_id());

		
		} else
          Core.setMessageError();
			
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
		 return this.forward("igrp","EditarTransacao","index", this.queryString()); //if submit, loads the values
		  ----#gen-example */
		/*----#start-code(gravar)----*/
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
		
		/*----#end-code----*/
		return this.redirect("igrp","EditarTransacao","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	/*----#end-code----*/
}
