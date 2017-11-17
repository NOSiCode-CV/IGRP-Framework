/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.novodominio;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Response;
import java.io.IOException;
/*----#END-PRESERVED-AREA----*/

public class NovoDominioController extends Controller {		

	public Response actionIndex() throws IOException{
		NovoDominio model = new NovoDominio();
		NovoDominioView view = new NovoDominioView(model);
		return this.renderView(view);
	}

	public Response actionGravar() throws IOException{
	
		return this.redirect("RED","Teste","Action");
	}
	
	public Response actionVoltar() throws IOException{
	
		return this.redirect("RED","Teste","Action");
	}
	
}
