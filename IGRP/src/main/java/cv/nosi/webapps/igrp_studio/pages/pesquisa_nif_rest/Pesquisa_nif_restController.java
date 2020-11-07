package cv.nosi.webapps.igrp_studio.pages.pesquisa_nif_rest;

import java.io.IOException;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.json.JSONArray;
import org.json.JSONObject;

import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.util.helpers.database.QueryInterface;
import cv.nosi.core.webapp.util.helpers.database.ResultSet;
import cv.nosi.core.webapp.webservices.rest.ConsumeJson;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

/*----#end-code----*/
		
public class Pesquisa_nif_restController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_nif_rest model = new Pesquisa_nif_rest();
		model.load();
		Pesquisa_nif_restView view = new Pesquisa_nif_restView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Ut unde natus mollit lorem' as nif_tab,'Ut accusantium omnis anim rem' as nome_tab,'3' as documento_tab,'Lorem voluptatem magna accusan' as dt_nascimento,'Mollit ut dolor ut rem' as nome_pai,'Omnis voluptatem laudantium de' as nome_mae "));
		view.tipo_contribuinte.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		if(Core.isNullOrZero(model.getNif())){         
          model.setNif(null);
        }
    	  	
		view.btn_pesquisar.setLink("index"); 
		view.n_documento_form.setVisible(false);
      view.tipo_contribuinte.setVisible(false);
		view.tipo_contribuinte.setValue(getMyContribuinte());
		if(Core.isNull(model.getTipo_contribuinte()))
			model.setTipo_contribuinte("sing");	
		ConsumeJson json_obj = new ConsumeJson();
		String url = "";
		Properties setting = this.configApp.loadConfig("common", "main.xml");
		String authorization = setting.getProperty("authorization.rest.pesquisa_nif");
		if(Core.isNotNullOrZero(model.getNif())) {
			url = setting.getProperty("link.rest.pesquisa_nif")+"?NUM_NIF=" + model.getNif();
		}else if(Core.isNotNull(model.getNome_form()) && (Core.isNullOrZero(model.getNif()))) {
			url = setting.getProperty("link.rest.pesquisa_nif")+"?NM_CONTRIBUINTE=" + 
		URLEncoder.encode(model.getNome_form().toUpperCase(Locale.ROOT).trim(), StandardCharsets.UTF_8.toString());
			
		}
      //else if(Core.isNotNull(model.getNome_form()) && (Core.isNotNull(model.getNif()) && model.getNif() != 0)){
		//	url = setting.getProperty("link.rest.pesquisa_nif")+"?NM_CONTRIBUINTE=" + model.getNome_form().toUpperCase() + "&NUM_NIF=" +  model.getNif();
		//}
		
			if(Core.isNotNullOrZero(model.getNif()) || Core.isNotNull(model.getNome_form())) {
				String json = json_obj.getJsonFromUrl(url, authorization);
				
				try {
					JSONObject obj = new JSONObject(json);
					JSONObject Entries = obj.getJSONObject("Entries");
					JSONArray Entry = Entries.optJSONArray("Entry");
					List<Pesquisa_nif_rest.Table_1> list_nif = new ArrayList<>();
					if(Entry!=null)
						for(int i = 0; i < Entry.length(); i++) {
							JSONObject pessoa = Entry.getJSONObject(i);
							listNif(list_nif, pessoa);						
						}
					else {
						JSONObject pessoa = Entries.optJSONObject("Entry");
						if(pessoa!=null)
							listNif(list_nif, pessoa);				
						else
							Core.setMessageInfo("Nenhum registo encontrado");
					}
						model.setTable_1(list_nif);
						Core.setMessageSuccess();
				}catch (Exception e) {
					Core.setMessageError();
					
				}
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
		  return this.forward("igrp_studio","Pesquisa_nif_rest","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
		return this.forward("igrp_studio","Pesquisa_nif_rest","index");
		/*----#end-code----*/
			
	}
	
		
		
/*----#start-code(custom_actions)----*/

	public HashMap<String, String> getMyContribuinte(){
		HashMap<String, String> contri = new HashMap<>();
		contri.put(null, "-- Tipo Contribuinte --");
		contri.put("colet", "Colectiva(empresa)");
		contri.put("ente_est", "Entidade estrangeira");
		contri.put("ente_nac", "Entidade Nacional");
		contri.put("her", "Herança");
		contri.put("out_ent", "Outras Entidades");
		contri.put("sing", "Singular");
		return contri;
	}
	private void listNif(List<Pesquisa_nif_rest.Table_1> list_nif, JSONObject pessoa) {
		Pesquisa_nif_rest.Table_1 tab_nif = new Pesquisa_nif_rest.Table_1();
		try {
			tab_nif.setDocumento_tab(pessoa.get("NU_BI")+"");
		}catch (org.json.JSONException e) {
			tab_nif.setDocumento_tab(null);
		}
		try {
			tab_nif.setDt_nascimento(pessoa.getString("DT_NASC"));
		}catch (org.json.JSONException e) {
			tab_nif.setDt_nascimento(null);
		}
		try {
			tab_nif.setNif_tab(pessoa.get("NU_NIF")+"");
		}catch (org.json.JSONException e) {
			tab_nif.setNif_tab(null);
		}
		try {
			tab_nif.setNome_mae(pessoa.getString("NM_MAE"));
		}catch (org.json.JSONException e) {
			tab_nif.setNome_mae(null);
		}
		try {
			tab_nif.setNome_pai(pessoa.getString("NM_PAI"));
		}catch (org.json.JSONException e) {
			tab_nif.setNome_pai(null);
		}
		try {
			tab_nif.setNome_tab(pessoa.getString("NM_CONTRIBUINTE"));
		}catch (org.json.JSONException e) {
			tab_nif.setNome_tab(null);
		}						
		list_nif.add(tab_nif);
	}
	
/*----#end-code----*/
}
