package nosi.core.integration.pdex.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import jakarta.ws.rs.client.Client;
import jakarta.ws.rs.client.ClientBuilder;
import jakarta.ws.rs.client.Invocation;
import jakarta.ws.rs.client.WebTarget;
import jakarta.ws.rs.core.CacheControl;
import jakarta.ws.rs.core.HttpHeaders;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

/**
 * Iekiny Marcel
 * May 21, 2020
 */
public class AppConfig extends PdexServiceTemplate{ 
	
	public AppConfig() {
		super();
		 cacheControl.setNoCache(false);
		 cacheControl.setMaxAge(120); // Cache for 60 seconds
	
	}	
	CacheControl cacheControl = new CacheControl();
	
	
	public List<App> userApps(String uid){ 
		List<App> allApps = new ArrayList<>(); 
		String json="";
		try {
			if(url == null || url.isEmpty()|| token == null || token.isEmpty())  //!ping(url, DEFAULT_TIMEOUT) 
				return allApps; 
			
			url += "/user_apps?email=" + URLEncoder.encode(uid, "utf-8"); 
			
			Client client = ClientBuilder.newClient(); 
			WebTarget webTarget = client.target(url); 
			Invocation.Builder invocationBuilder  = webTarget.request().cacheControl(cacheControl).header(HttpHeaders.AUTHORIZATION, token); 
			jakarta.ws.rs.core.Response response  = invocationBuilder.get(); 
			json = response.readEntity(String.class); 
			client.close();
			JSONObject obj = new JSONObject(json); 
			JSONObject apps_t = obj.optJSONObject("Entries"); 
			if(apps_t != null && apps_t.has("Entry")) {
				JSONArray apps_o = apps_t.optJSONArray("Entry"); 
				if(apps_o != null) 
					allApps = new Gson().fromJson(apps_o.toString(), new TypeToken<List<App>>() {}.getType()); 
			}
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return allApps;
	}
	
	public List<ExternalMenu> profAppMenus(String appCode, String orgCode, String profCode){ 
		List<ExternalMenu> menus = new ArrayList<>(); 
		if(url == null || url.isEmpty() ||  token == null || token.isEmpty()) //!ping(url, DEFAULT_TIMEOUT) ||
			return menus; 
		try {
			url += "/prof_app_menus?prof_code=" + profCode + "&org_code=" + orgCode + "&app_code=" + appCode;  
			Client client = ClientBuilder.newClient(); 
			WebTarget webTarget = client.target(url); 
			Invocation.Builder invocationBuilder  = webTarget.request().cacheControl(cacheControl).header(HttpHeaders.AUTHORIZATION, token); 
			jakarta.ws.rs.core.Response response  = invocationBuilder.get(); 
			String json = response.readEntity(String.class); 
			client.close(); 
			
			JSONObject obj = new JSONObject(json); 
			JSONObject userAppMenus_t = obj.optJSONObject("Entries"); 
			if(userAppMenus_t != null && userAppMenus_t.has("Entry")) {
				JSONArray UserAppMenu_o = userAppMenus_t.optJSONArray("Entry"); 
				if(UserAppMenu_o != null) {
					for(int i = 0; i < UserAppMenu_o.length(); i++) 
						menus.add(extractMenuFromJson(UserAppMenu_o.getJSONObject(i))); 
				}else 
					extractMenuFromJson(userAppMenus_t.getJSONObject("Entry")); 
			}
		} catch (Exception e) {
			//e.printStackTrace(); 
		}
		return menus;
	} 
	
	private static ExternalMenu extractMenuFromJson(JSONObject m) {
		ExternalMenu menu = new ExternalMenu(); 
		try {
			menu.setId("" + m.getLong("id"));
			menu.setTitle(m.getString("title"));
			menu.setArea(m.getString("area"));
			try {
				menu.setEstado("" + m.getInt("estado")); 
			} catch (Exception e) {
				menu.setEstado("0");
			}
			
			try {
				menu.setDescription(m.getString("description"));
			} catch (Exception e) {
				menu.setDescription(""); 
			}
			
			try {
				menu.setUrl(m.getString("url"));
			} catch (Exception e) {
				menu.setUrl("#"); 
			}
			try {
				menu.setImgsrc(m.getString("imgsrc"));
			} catch (Exception e) {
				menu.setImgsrc("#");
			}
			try {
				menu.setSelf_id(m.getString("self_id"));
			} catch (Exception e) {
				menu.setSelf_id("");
			}
			
		} catch (Exception e) {
			e.printStackTrace(); 
		}
		return menu; 
	}
	
	public static class App {
		
		private String id;
		private String name;
		private String dad;
		private String description;
		private String img_src;
		private String link;
		private String available;
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getDad() {
			return dad;
		}
		public void setDad(String dad) {
			this.dad = dad;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getImg_src() {
			return img_src;
		}
		public void setImg_src(String img_src) {
			this.img_src = img_src;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		public String getAvailable() {
			return available;
		}
		public void setAvailable(String available) {
			this.available = available;
		}
		
	}
	
	public static class ExternalMenu{ 
		
		private String title;
		private String imgsrc; 
		private String url; 
		private String area;
		private String id;
		private String description;
		private String estado;
		private String self_id;
		
		public ExternalMenu() {}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getImgsrc() {
			return imgsrc;
		}

		public void setImgsrc(String imgsrc) {
			this.imgsrc = imgsrc;
		}

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public String getArea() {
			return area;
		}

		public void setArea(String area) {
			this.area = area;
		}

		public String getId() {
			return id;
		}

		public void setId(String id) {
			this.id = id;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getEstado() {
			return estado;
		}

		public void setEstado(String estado) {
			this.estado = estado;
		}

		public String getSelf_id() {
			return self_id;
		}

		public void setSelf_id(String self_id) {
			this.self_id = self_id;
		}
		
	}
	
}
