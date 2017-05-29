/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.testepagina;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class TestePaginaController extends Controller {		

	public void actionIndex() throws IOException{
		TestePagina model = new TestePagina();
		TestePaginaView view = new TestePaginaView(model);
		this.renderView(view);
	}

	public void actionButton_1() throws IOException{
		
	}
	
}
