package nosi.webapps.igrp_studio.pages.pesquisa_nif_rest;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.webservices.rest.ConsumeJson;
import nosi.core.webapp.webservices.rest.pesquisa_geral.Entry;

import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
/*----#end-code----*/
		
public class Pesquisa_nif_restController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_nif_rest model = new Pesquisa_nif_rest();
		model.load();
		Pesquisa_nif_restView view = new Pesquisa_nif_restView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '20' as nif_tab,'Iste voluptatem ut laudantium' as nome_tab,'Stract sed labore sed accusant' as dt_nascimento,'Sit laudantium mollit adipisci' as nome_pai,'Aliqua amet aperiam doloremque' as nome_mae,'22' as documento_tab "));
		view.tipo_contribuinte.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.btn_pesquisar.setLink("index"); 
		view.tipo_contribuinte.setValue(getMyContribuinte());
		
		ConsumeJson json_obj = new ConsumeJson();
		String url = "https://stage-pdex.gov.cv:8243/nifigrp/1.0.0/nif?NU_NIF=" + model.getNif() + "&NM_CONTRIBUINTE=" + model.getNome_form();
		String json = json_obj.getJsonFromUrl(url);
		JSONObject obj = new JSONObject(json);
		JSONObject Entries = obj.getJSONObject("Entries");
		
		Core.setMessageError(json);
		Core.setMessageError(Entries+""); 
		Core.setMessageError();
			if((Core.isNotNull(model.getNif()) && model.getNif() != 0) || Core.isNotNull(model.getNome_form())) {
			JSONObject Entry = Entries.getJSONObject("Entry");
			List<Pesquisa_nif_rest.Table_1> list_nif = new ArrayList<>();
			Pesquisa_nif_rest.Table_1 tab_nif = new Pesquisa_nif_rest.Table_1();
			tab_nif.setDocumento_tab(Entry.getInt("NU_BI"));
			tab_nif.setDt_nascimento(Entry.getString("DT_NASC"));
			tab_nif.setNif_tab(Entry.getInt("NU_NIF"));
			tab_nif.setNome_mae(Entry.getString("NM_MAE"));
			tab_nif.setNome_pai(Entry.getString("NM_PAI"));
			tab_nif.setNome_tab(Entry.getString("NM_CONTRIBUINTE"));
			list_nif.add(tab_nif);
			model.setTable_1(list_nif);
			
			}
		
		
		
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
		
		return this.forward("igrp_studio","Pesquisa_nif_rest","index", model, this.queryString());
		/*----#end-code----*/
			
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
