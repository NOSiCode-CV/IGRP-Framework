package cv.nosi.core.webapp.webservices.rest;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

import org.json.JSONObject;

import cv.nosi.core.config.ConfigApp;

/**
 * Iekiny Marcel
 * Oct 14, 2019
 */
public class Geografia {
	
	private String url;
	private String authorization = "Bearer c50a872a-fb44-34c4-8075-820feffe7de7";
	
	public static final class Nivel{
		
		private Nivel() {}
		
		public static int ZONA = 6;
		public static int CIDADE = 5;
		public static int FREGUESIA = 4;
		public static int CONCELHO = 3;
		public static int ILHA = 2;
		public static int PAIS = 1;
	}
	
	public Geografia() { 
		Properties properties =  ConfigApp.getInstance().getMainSettings(); 
		this.url = properties.getProperty("link.rest.pesquisa_geografia");
		if(this.url != null) 
			this.url = this.url.replace("GeoINGT", "t/igrp.cv/geografia").replace("select_geo_by_id", "select_parents_by_id");
		// this.authorization = properties.getProperty("authorization.rest.pesquisa_geografia");
	}
	
	public Map<String, Object> geoGetParentsById(String id, String level){
		Map<String, Object> r = new LinkedHashMap<String, Object>(); 
		r.put("zona_id", null);r.put("zona", null);
		r.put("cidade_id", null);r.put("cidade", null);
		r.put("freguesia_id", null);r.put("freguesia", null);
		r.put("concelho_id", null);r.put("concelho", null);
		r.put("ilha_id", null);r.put("ilha", null);
		r.put("pais_id", null);r.put("pais", null);
		try {
			String params = "?id=" + id + "&nivel=" + level; 
			String json = new ConsumeJson().getJsonFromUrl(this.url + params, this.authorization); 
			JSONObject jsonObject = new JSONObject(json);
			jsonObject = jsonObject.getJSONObject("Entries");
			jsonObject = jsonObject.getJSONObject("Entry");
			r.put("zona_id", jsonObject.optNumber("zona_id"));r.put("zona", jsonObject.optString("zona"));
			r.put("cidade_id", jsonObject.optNumber("cidade_id"));r.put("cidade", jsonObject.optString("cidade"));
			r.put("freguesia_id", jsonObject.optNumber("freguesia_id"));r.put("freguesia", jsonObject.optString("freguesia"));
			r.put("concelho_id", jsonObject.optNumber("concelho_id"));r.put("concelho", jsonObject.optString("concelho"));
			r.put("ilha_id", jsonObject.optNumber("ilha_id"));r.put("ilha", jsonObject.optString("ilha"));
			r.put("pais_id", jsonObject.optNumber("pais_id"));r.put("pais", jsonObject.optString("pais"));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return r; 
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getAuthorization() {
		return authorization;
	}

	public void setAuthorization(String authorization) {
		this.authorization = authorization;
	}
	
}
