/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.detalhesprocesso;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*---- End ----*/

public class DetalhesProcessoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		DetalhesProcesso model = new DetalhesProcesso();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		DetalhesProcessoView view = new DetalhesProcessoView(model);
		return this.renderView(view);
		/*---- End ----*/
	}

	/*---- Insert your actions here... ----*//*---- End ----*/
}
