package nosi.webapps.igrp.services.rest.pesquisa_cae.rest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import org.json.JSONArray;
import org.json.JSONObject;
import nosi.core.config.ConfigApp;
import nosi.core.webapp.webservices.rest.ConsumeJson;
import nosi.webapps.igrp.services.rest.pesquisa_cae.pojo.Cae;

/**
 * Emanuel
 * 10 Apr 2019
 */
public class PesquisaCae {

	private static final Properties SETTINGS;
	private static final String BASE_URL;
	private static final String AUTHORIZATION;
	
	static {
		SETTINGS = ConfigApp.getInstance().loadConfig("common", "main.xml");
		BASE_URL = SETTINGS.getProperty("link.rest.pesquisa_cae");
		AUTHORIZATION = SETTINGS.getProperty("authorization.rest.pesquisa_cae");
	}
	
	public static List<Cae> pesquisaCae(String id) {
		List<Cae> caes = new ArrayList<>();
		ConsumeJson json_obj = new ConsumeJson();
		String url = resolveUrl(id);
		try {
			String json = json_obj.getJsonFromUrl(url, AUTHORIZATION);
			JSONObject obj = new JSONObject(json);
			JSONObject Entries = obj.getJSONObject("Entries");
			try {
				JSONArray Entry = Entries.getJSONArray("Entry");
				for(int i = 0; i < Entry.length(); i++) {
					JSONObject local = Entry.getJSONObject(i);
					Cae cae = new Cae();
					cae.setCodigo(local.getString("codigo".toUpperCase()));
					cae.setDescricao(local.getString("descricao".toUpperCase()));
					cae.setId(local.getInt("id".toUpperCase()));
					caes.add(cae );
				}	
			}catch (Exception e) {
				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return caes;
	}

	private static String resolveUrl(String id) {
		String url = BASE_URL+"?p_cprcae="+id;
		return url;
	}
	
}
