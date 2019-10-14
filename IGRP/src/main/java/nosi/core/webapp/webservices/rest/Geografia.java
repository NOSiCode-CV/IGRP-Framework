package nosi.core.webapp.webservices.rest;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

import org.json.JSONObject;

import nosi.core.config.ConfigApp;

/**
 * Iekiny Marcel
 * Oct 14, 2019
 */
public class Geografia {
	
	private String url;
	private String authorization = "Bearer 5ff22806-3531-3945-a7d9-2405903f5d67";
	
	public Geografia() { 
		Properties properties =  ConfigApp.getInstance().loadCommonConfig();
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

}
