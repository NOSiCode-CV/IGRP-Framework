
package nosi.webapps.tutorial.pages.geralapresentacao;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/


/*----#end-code----*/
public class GeralApresentacaoController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		GeralApresentacao model = new GeralApresentacao();
		model.load();
		GeralApresentacaoView view = new GeralApresentacaoView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name added in application builder.
		model.loadTable_1(Core.query(null,"SELECT 'documento' as documento,'ver' as ver "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		model.loadTable_1(Core.query("hibernate-igrp-core", "SELECT 'Import IGRP IGRP JAVA Framework' as documento, 'http://www.nosicode.cv/index.php/pt/documentacao/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/8-import-igrp-java' as ver "
				+ " UNION SELECT 'Minha Primeira Aplicação IGRP JAVA Framework' as documento, "
				+ " 'http://www.nosicode.cv/index.php/pt/documentacao/igrp-framework/documentacao-do-utilizador/send/2-documentacao-do-utilizador/9-minha-primeira-aplicacao' as ver "));
		
		view.quickbuttonbox_gestao_url.setValue(new Config().getResolveUrl("tutorial","Video_gestao_de_aplicacao","index"));
		view.quickbuttonbox_instalar_url.setValue(new Config().getResolveUrl("tutorial","Video_instalar_igrp_web","index"));
		view.quickbuttonbox__url.setValue(new Config().getResolveUrl("tutorial","Video_my_first_app","index")); 
		/*Specify your connection name in first parameter*/
		/*----#end-code----*/		view.setModel(model);
		return this.renderView(view);	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/	}
