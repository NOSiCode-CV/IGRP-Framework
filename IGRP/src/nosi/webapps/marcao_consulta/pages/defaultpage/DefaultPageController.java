package nosi.webapps.marcao_consulta.pages.defaultpage;
import java.io.IOException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Response;
public class DefaultPageController extends Controller {	
	public Response actionIndex() throws IOException{
		/*HomeAppView view = new HomeAppView();
		view.title = "Marcação de Consulta";
		this.renderView(view,true);*/
		return this.redirect("marcao_consulta", "DashBoard", "index");
	}
}