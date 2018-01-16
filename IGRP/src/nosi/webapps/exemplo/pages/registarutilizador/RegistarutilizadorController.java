
package nosi.webapps.exemplo.pages.registarutilizador;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class RegistarutilizadorController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Registarutilizador model = new Registarutilizador();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		RegistarutilizadorView view = new RegistarutilizadorView(model);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(GRAVAR)----*/
		Registarutilizador model = new Registarutilizador();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			if(model.save(model)){
				Core.setMessageSuccess(gt("Mesagem de Sucesso"));
			 }else{
				Core.setMessageError(gt("Mesagem de Erro"));
			 return this.forward("exemplo","Registarutilizador","index");
			}
		}
		return this.redirect("exemplo","Registarutilizador","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
