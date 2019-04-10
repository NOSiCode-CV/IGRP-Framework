package nosi.webapps.igrp.pages.pesquisa_cae;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import java.io.IOException;
import nosi.core.webapp.Response;

/*----#start-code(packages_import)----*/
import java.util.List;
import java.util.ArrayList;
import nosi.webapps.igrp.pages.pesquisa_cae.Pesquisa_cae.Table_1;
import nosi.webapps.igrp.services.rest.pesquisa_cae.pojo.Cae;
import nosi.webapps.igrp.services.rest.pesquisa_cae.rest.PesquisaCae;


/*----#end-code----*/
		
public class Pesquisa_caeController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_cae model = new Pesquisa_cae();
		model.load();
		Pesquisa_caeView view = new Pesquisa_caeView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Magna consectetur aliqua ipsum' as t_codigo,'Sed unde ut sit mollit' as t_descricao "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		if(Core.isNotNull(model.getCodigo()) || Core.isNotNull(model.getDescricao())) {
			List<Cae> caes = PesquisaCae.pesquisaCae(model.getCodigo(), model.getDescricao());
			List<Pesquisa_cae.Table_1> table_1 = new ArrayList<>();
			for(Cae cae:caes) {
				Table_1 t1 = new Table_1();
				t1.setT_codigo(cae.getCodigo());
				t1.setT_descricao(cae.getDescricao());
				table_1.add(t1 );
			}
			model.setTable_1(table_1);
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_cae model = new Pesquisa_cae();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Dominio","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		 return this.forward("igrp","Pesquisa_cae","index", model, this.queryString());
		
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
