/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.detalhesprocesso;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class DetalhesProcessoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		DetalhesProcesso model = new DetalhesProcesso();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		DetalhesProcessoView view = new DetalhesProcessoView(model);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	/*----#END-PRESERVED-AREA----*/
}
