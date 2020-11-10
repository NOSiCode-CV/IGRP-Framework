package cv.nosi.webapps.igrp.services.rest.pesquisa_cae.rest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import org.json.JSONArray;
import org.json.JSONObject;

import cv.nosi.core.config.ConfigApp;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.webservices.rest.ConsumeJson;
import cv.nosi.webapps.igrp.services.rest.pesquisa_cae.pojo.Cae;

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
				JSONArray Entry = Entries.optJSONArray("Entry");
				if(Entry!=null) {
					for(int i = 0; i < Entry.length(); i++) {					
						JSONObject local = Entry.getJSONObject(i);
						listCae(caes, local);
					}	
				}else {
					JSONObject local = Entries.optJSONObject("Entry");
					if(local!=null)
						listCae(caes, local);
					else
						Core.setMessageInfo("Nenhum resultado encontrado");					
					
				}					
				
			}catch (Exception e) {
				Core.setMessageError();
				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return caes;
	}

	private static void listCae(List<Cae> caes, JSONObject local) {
		Cae cae = new Cae();				
		cae.setCodigo(local.getString("codigo".toUpperCase()));
		cae.setDescricao(local.getString("descricao".toUpperCase()));
		cae.setId(local.getInt("id".toUpperCase()));
		caes.add(cae );
	}

	private static String resolveUrl(String id) {
		String url = BASE_URL+"?p_cprcae="+id;
		return url;
	}
	
}
