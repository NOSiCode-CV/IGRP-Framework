/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.testpagetransaction;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class TestPageTransactionController extends Controller {		

	public void actionIndex() throws IOException{
		TestPageTransaction model = new TestPageTransaction();
		TestPageTransactionView view = new TestPageTransactionView(model);
		this.renderView(view);
	}

	public void actionGravar() throws IOException{
		TestPageTransaction model = new TestPageTransaction();
		TestPageTransactionView view = new TestPageTransactionView(model);
		this.renderView(view);
	}
	
}
