/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.bpmndesigner;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class BPMNDesignerController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		BPMNDesigner model = new BPMNDesigner();
		BPMNDesignerView view = new BPMNDesignerView(model);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionGravar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","BPMNDesigner","index");
		/*---- End ----*/
	}
	

	public Response actionPublicar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","BPMNDesigner","index");
		/*---- End ----*/
	}
	

	public Response actionExporar_imagem() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("igrp","BPMNDesigner","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
