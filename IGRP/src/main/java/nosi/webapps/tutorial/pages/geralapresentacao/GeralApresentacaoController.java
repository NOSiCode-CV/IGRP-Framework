
package nosi.webapps.tutorial.pages.geralapresentacao;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class GeralApresentacaoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		GeralApresentacao model = new GeralApresentacao();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		GeralApresentacaoView view = new GeralApresentacaoView(model);
		
		/*Specify your connection name in first parameter*/
//		view.table_1.setSqlQuery("SELECT 'Import IGRP IGRP JAVA Framework' documento, 'http://www.nosicode.cv/index.php/pt/documentacao/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/8-import-igrp-java' ver "
//				+ "UNION SELECT 'Minha Primeira Aplicação IGRP JAVA Framework' documento, 'http://www.nosicode.cv/index.php/pt/documentacao/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/9-minha-primeira-aplicacao' ver");
//		
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
