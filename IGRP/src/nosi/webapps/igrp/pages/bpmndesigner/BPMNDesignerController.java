/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.bpmndesigner;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*----#END-PRESERVED-AREA----*/

public class BPMNDesignerController extends Controller {		


	public Response actionIndex() throws IOException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		BPMNDesigner model = new BPMNDesigner();
		BPMNDesignerView view = new BPMNDesignerView(model);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		return this.redirect("igrp","BPMNDesigner","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionPublicar() throws IOException{
		/*----#START-PRESERVED-AREA(PUBLICAR)----*/
		return this.redirect("igrp","BPMNDesigner","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionExporar_imagem() throws IOException{
		/*----#START-PRESERVED-AREA(EXPORTAR_IMAGEM)----*/
		return this.redirect("igrp","BPMNDesigner","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
