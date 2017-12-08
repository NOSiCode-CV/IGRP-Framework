
package nosi.webapps.teste.pages.teste;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class TesteController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		Teste model = new Teste();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		TesteView view = new TesteView(model);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionSave() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(SAVE)----*/
		Teste model = new Teste();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			/*if(/* Your code condition *//*){
				Core.setMessageSuccess(gt("Mesagem de Sucesso"));
			 }else{
				Core.setMessageError(gt("Mesagem de Erro"));
			 return this.forward("teste","Teste","index");
			}*/
		}
		return this.redirect("teste","Teste","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
