/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.pagetesttransaction;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class PageTestTransactionController extends Controller {		

	public void actionIndex() throws IOException{
		PageTestTransaction model = new PageTestTransaction();
		PageTestTransactionView view = new PageTestTransactionView(model);
		this.renderView(view);
	}

	public void actionTransaction_1() throws IOException{
			this.redirect("marcao_consulta","PageTestTransaction","index");
	}
	
}
