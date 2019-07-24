package nosi.webapps.app_teste.pages.teste_blocos;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/


/*----#end-code----*/
		
public class Teste_blocosController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Teste_blocos model = new Teste_blocos();
		model.load();
		Teste_blocosView view = new Teste_blocosView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_2(Core.query(null,"SELECT 'Aperiam natus anim amet unde' as nomeee,'Natus elit anim consectetur na' as moraadaa,'Iste dolor perspiciatis offici' as estadoooo "));
		model.loadTable_1(Core.query(null,"SELECT 'Amet officia aperiam stract am' as nomes,'Doloremque adipiscing natus am' as moradas,'Unde ut omnis doloremque totam' as estados,'Natus sit natus voluptatem con' as datas,'/IGRP-Template/images/IGRP/IGRP2.3/app/app_teste/teste_blocos/Teste_blocos.xml' as anexoss "));
		view.estado_civil.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
	

					/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionSalvar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Teste_blocos model = new Teste_blocos();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(salvar)----*/
		
	
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
	public Response actionTestar_where() throws IOException, IllegalArgumentException, IllegalAccessException{
		Teste_blocos model = new Teste_blocos();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Teste_blocos","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(testar_where)----*/
		
		return this.forward("app_teste","Teste_blocos","index", model, this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Teste_blocos model = new Teste_blocos();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("app_teste","Examform","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(editar)----*/
		
		
		/*----#end-code----*/
		return this.redirect("app_teste","Examform","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
