
package nosi.webapps.igrp.pages.editartransacao;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Transaction;
import java.io.IOException;
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class EditarTransacaoController extends Controller {

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {
		/*----#START-PRESERVED-AREA(INDEX)----*/
		String codigo = Igrp.getInstance().getRequest().getParameter("codigo");
		if (codigo != null) {
			Transaction t = new Transaction().find().andWhere("code", "=", codigo).one();
			EditarTransacao model = new EditarTransacao();
			if (t != null) {
				model.setCodigo(codigo);
				model.setAplicacao("" + t.getApplication().getId());
				model.setDescricao(t.getDescr());
				model.setStatus(t.getStatus());
				model.setP_id(t.getId());
			}

			EditarTransacaoView view = new EditarTransacaoView(model);
			if (t != null) {
				view.aplicacao.setValue(new Application().findOne(t.getApplication().getId()).getName());
				view.p_id.setValue("" + t.getId());
			}
			// view.btn_gravar.setLink("index&id="+model.getP_id());

			return this.renderView(view);
		} else
			return this.redirect("igrp", "error-page", "permission");
		/*----#END-PRESERVED-AREA----*/
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException {
		/*----#START-PRESERVED-AREA(GRAVAR)----*/

		if (Igrp.getInstance().getRequest().getMethod().equals("POST")) {
			EditarTransacao model = new EditarTransacao();
			model.load();
			Transaction t = new Transaction().find().andWhere("id", "=", model.getP_id()).one();

			// t.setCode(model.getCodigo());
			t.setDescr(model.getDescricao());
			// t.setApplication(new
			// Application().findOne(Core.isNotNull(model.getAplicacao())?Integer.parseInt(model.getAplicacao()):0));
			t.setStatus(model.getStatus());
			String codigo = t.getCode();
			t = t.update();
			if (t != null)
				Core.setMessageSuccess(gt("Transação atualizada com sucesso."));
			else
				Core.setMessageError(gt("Error ao atualizar a transação."));
			return this.redirect("igrp", "EditarTransacao", "index&codigo="+codigo);

		}
		return this.redirect("igrp", "EditarTransacao", "index");
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/

	/*----#END-PRESERVED-AREA----*/
}
