/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.editartransacao;
import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Transaction;

import java.io.IOException;


public class EditarTransacaoController extends Controller {		

	public Response actionIndex(@RParam(rParamName = "codigo")String codigo) throws IOException, IllegalArgumentException, IllegalAccessException{
		if(codigo!=null){
			Transaction t = new Transaction();
			t.setCode(codigo);
			t = (Transaction)t.getOne();
			EditarTransacao model = new EditarTransacao();
			if(t.getCode()!=null){
				model.setCodigo(codigo);
				model.setAplicacao(t.getEnv_fk());
				model.setDescricao(t.getDescr());
				model.setStatus(t.getStatus());
				model.setP_id(t.getId());
			}
			if(Igrp.getInstance().getRequest().getMethod().equals("POST")){
				model.load();
				t = new Transaction();
				t.setCode(model.getCodigo());
				t.setDescr(model.getDescricao());
				t.setEnv_fk(model.getAplicacao());
				t.setStatus(model.getStatus());
				t.setId(Integer.parseInt(codigo));
				if(t.update())
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS, "Transacao atualizada com sucesso.");
				else
					Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR, "Error ao atualizar a transacao.");
				return this.redirect("igrp", "EditarTransacao", "index", new String[]{"codigo"}, new String[]{t.getCode() + ""});
			}
			EditarTransacaoView view = new EditarTransacaoView(model);
			view.aplicacao.setValue(new Application().getListApps());
			view.btn_gravar.setLink("index&codigo="+model.getP_id());
			view.id.setValue(t.getId());
			return this.renderView(view);
		}
		else
			return this.redirect("igrp", "error-page", "permission");
	}
	
	public Response actionVoltar() throws IOException{
		return this.redirect("igrp","Transaccao","index");
	}
	
}
