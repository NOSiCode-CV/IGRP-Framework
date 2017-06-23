/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.pagetesttransaction;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Response;

import java.io.IOException;


public class PageTestTransactionController extends Controller {		

	public Response actionIndex() throws IOException{
		PageTestTransaction model = new PageTestTransaction();
		PageTestTransactionView view = new PageTestTransactionView(model);
		return this.renderView(view);
	}

	public Response actionTransaction_1() throws IOException{
		return this.redirect("marcao_consulta","PageTestTransaction","index");
	}
	
}
