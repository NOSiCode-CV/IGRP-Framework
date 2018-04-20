
package nosi.webapps.tutorial.pages.geralapresentacao;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;

import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;

/*----#END-PRESERVED-AREA----*/

public class GeralApresentacaoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		GeralApresentacao model = new GeralApresentacao();
		model.load();
		GeralApresentacaoView view = new GeralApresentacaoView();
		BaseQueryInterface query = Core.query("SELECT 'Import IGRP IGRP JAVA Framework' documento, 'http://www.nosicode.cv/index.php/pt/documentacao/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/8-import-igrp-java' ver, 'Ir para o Link' as ver_desc "
				+ "UNION SELECT 'Minha Primeira Aplicação IGRP JAVA Framework' documento, 'http://www.nosicode.cv/index.php/pt/documentacao/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/9-minha-primeira-aplicacao' ver, 'Ir para o Link' as ver_desc");
		model.loadTable1(query);
		/*Specify your connection name in first parameter*/
		view.setModel(model);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}

	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
