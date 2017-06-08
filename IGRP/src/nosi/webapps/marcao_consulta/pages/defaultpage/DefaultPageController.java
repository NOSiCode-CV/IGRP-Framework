package nosi.webapps.marcao_consulta.pages.defaultpage;
import java.io.IOException;
import nosi.core.webapp.Controller;
public class DefaultPageController extends Controller {	
	public void actionIndex() throws IOException{
		/*HomeAppView view = new HomeAppView();
		view.title = "Marcação de Consulta";
		this.renderView(view,true);*/
		this.redirect("marcao_consulta", "DashBoard", "index");
	}
}