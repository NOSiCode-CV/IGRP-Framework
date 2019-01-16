package nosi.webapps.igrp_studio.pages.pesquisa_nif_rest;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.webservices.rest.ConsumeJson;
import nosi.core.webapp.webservices.rest.pesquisa_geral.Entries;
import nosi.core.webapp.webservices.rest.pesquisa_geral.Entry;
import nosi.core.webapp.webservices.rest.pesquisa_geral.PesquisaNif;
import java.util.HashMap;
/*----#end-code----*/
		
public class Pesquisa_nif_restController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_nif_rest model = new Pesquisa_nif_rest();
		model.load();
		Pesquisa_nif_restView view = new Pesquisa_nif_restView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '24' as nif_tab,'Doloremque omnis perspiciatis' as nome_tab,'Sit anim labore voluptatem ut' as dt_nascimento,'Perspiciatis sed mollit dolore' as nome_pai,'Lorem mollit natus sit ut' as nome_mae,'Accusantium sit aliqua officia' as documento_tab "));
		view.tipo_contribuinte.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.btn_pesquisar.setLink("index"); 
		view.tipo_contribuinte.setValue(getMyContribuinte());
		ConsumeJson json_obj = new ConsumeJson();
		Entries nif = new Entries();
		
		//if() {
			System.out.println(model.getNif());
			System.out.println(model.getNome_form());
			String url = "https://stage-pdex.gov.cv:8243/nifigrp/1.0.0/nif?NU_NIF=" + model.getNif()+ "&NM_CONTRIBUINTE="+model.getNome_form();
			String json = json_obj.getJsonFromUrl(url);
			System.out.println(json);
		//}
		nif = nif.getListNif(json); 
		Core.setMessageInfo(nif.toString());
		
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_nif_rest model = new Pesquisa_nif_rest();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","Pesquisa_nif_rest","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
		//return this.forward("igrp_studio","Pesquisa_nif_rest","index", model, this.queryString());
		/*----#end-code----*/
		return this.redirect("igrp_studio","Pesquisa_nif_rest","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/

	public HashMap<String, String> getMyContribuinte(){
		HashMap<String, String> contri = new HashMap<>();
		contri.put(null, "-- Tipo Contribuinte --");
		contri.put("colet", "Colectiva(empresa)");
		contri.put("ente_est", "Entidade estrangeira");
		contri.put("ente_nac", "Entidade Nacional");
		contri.put("her", "HeranÃ§a");
		contri.put("out_ent", "Outras Entidades");
		contri.put("sing", "Singular");
		return contri;
	}

/*----#end-code----*/
}
