package nosi.webapps.igrp_studio.pages.pesquisa_nif_rest;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.config.Config;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import nosi.core.webapp.webservices.rest.ConsumeJson;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
		model.loadTable_1(Core.query(null,"SELECT 'Totam doloremque stract accusa' as nif_tab,'Ut omnis natus consectetur off' as nome_tab,'8' as documento_tab,'Stract aliqua amet consectetur' as dt_nascimento,'Omnis dolor consectetur ipsum' as nome_pai,'Natus consectetur magna elit u' as nome_mae "));
		view.tipo_contribuinte.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		if(Core.isNullOrZero(model.getNif())){         
          model.setNif(null);
        }
    	  	
		view.btn_pesquisar.setLink("index"); 
		view.n_documento_form.setVisible(false);
		view.tipo_contribuinte.setValue(getMyContribuinte());
		if(Core.isNull(model.getTipo_contribuinte()))
			model.setTipo_contribuinte("sing");	
		ConsumeJson json_obj = new ConsumeJson();
		String url = "";
		Properties setting = this.loadConfig("common", "main.xml");
		String authorization = setting.getProperty("authorization.rest.pesquisa_nif");
		if(Core.isNotNullOrZero(model.getNif())) {
			url = setting.getProperty("link.rest.pesquisa_nif")+"?NUM_NIF=" + model.getNif();
		}else if(Core.isNotNull(model.getNome_form()) && (Core.isNullOrZero(model.getNif()))) {
			url = setting.getProperty("link.rest.pesquisa_nif")+"?NM_CONTRIBUINTE=" + model.getNome_form().toUpperCase();
		}
      //else if(Core.isNotNull(model.getNome_form()) && (Core.isNotNull(model.getNif()) && model.getNif() != 0)){
		//	url = setting.getProperty("link.rest.pesquisa_nif")+"?NM_CONTRIBUINTE=" + model.getNome_form().toUpperCase() + "&NUM_NIF=" +  model.getNif();
		//}
		
			if(Core.isNotNullOrZero(model.getNif()) || Core.isNotNull(model.getNome_form())) {
				String json = json_obj.getJsonFromUrl(url.replaceAll(" ", "%20"), authorization);
				JSONObject obj = new JSONObject(json);
				JSONObject Entries = obj.getJSONObject("Entries");
				try {

					JSONArray Entry = Entries.getJSONArray("Entry");
					List<Pesquisa_nif_rest.Table_1> list_nif = new ArrayList<>();
						for(int i = 0; i < Entry.length(); i++) {
							JSONObject pessoa = Entry.getJSONObject(i);
							Pesquisa_nif_rest.Table_1 tab_nif = new Pesquisa_nif_rest.Table_1();
							try {
								tab_nif.setDocumento_tab(pessoa.getInt("NU_BI")+"");
							}catch (org.json.JSONException e) {
								tab_nif.setDocumento_tab(null);
							}
							try {
								tab_nif.setDt_nascimento(pessoa.getString("DT_NASC"));
							}catch (org.json.JSONException e) {
								tab_nif.setDt_nascimento(null);
							}
							try {
								tab_nif.setNif_tab(pessoa.getInt("NU_NIF")+"");
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
						model.setTable_1(list_nif);
					}
				}catch (Exception e) {
					Core.setMessageInfo("Nenhum registo encontrado");
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
		contri.put("her", "Herança");
		contri.put("out_ent", "Outras Entidades");
		contri.put("sing", "Singular");
		return contri;
	}

	private Properties loadConfig(String filePath, String fileName) {
		String path = new Config().getBasePathConfig() + File.separator + filePath;
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath().replaceAll("%20", " "));
		FileInputStream fis = null;
		Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
		}
		try {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return props;
	}

	
/*----#end-code----*/
}
