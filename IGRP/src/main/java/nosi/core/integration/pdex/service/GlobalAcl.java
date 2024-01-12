package nosi.core.integration.pdex.service;

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

/**
 * Iekiny Marcel
 * May 19, 2020
 */
public class GlobalAcl extends PdexServiceTemplate{
	
	private String instanceName; 
	private String type; 
	
	public enum TYPE{
		PAGE, ACTI, TRANS,
	}
	
	public GlobalAcl() {
		super();
		 cacheControl.setNoCache(false);
		 cacheControl.setMaxAge(120); // Cache for 60 seconds
	
	}	
	CacheControl cacheControl = new CacheControl();
	
	
	public List<PermissionAcl> permissionAcl(){
		List<PermissionAcl> acls = new ArrayList<>(); 
		if(instanceName == null || instanceName.isEmpty() || appCode == null || appCode.isEmpty() || url == null || url.isEmpty() || token == null || token.isEmpty()) 
			return acls; 
		url += "/permissionAcl?instance_id=" + this.instanceName + "&code=" + this.appCode  + "&type=" + type; 
		Client client = ClientBuilder.newClient(); 
		WebTarget webTarget = client.target(this.url); 
		Invocation.Builder invocationBuilder  = webTarget.request().cacheControl(cacheControl).header(HttpHeaders.AUTHORIZATION, token); 
		jakarta.ws.rs.core.Response response  = invocationBuilder.get(); 
		String json = response.readEntity(String.class); 
		client.close(); 
		JSONObject obj = new JSONObject(json);
		if(obj.has("Entries")) {
			JSONObject Entries = obj.optJSONObject("Entries"); 
			if(Entries != null && Entries.has("Entry")) { 
				JSONArray Entry = Entries.optJSONArray("Entry");
				if(Entry != null) { 
					for(int i=0 ; i< Entry.length() ; i++) {
						JSONObject r = Entry.getJSONObject(i); 
						PermissionAcl acl = new PermissionAcl(); 
						try { acl.setEnv_fk(r.getString("env_fk"));  } catch (Exception ignored) {}
						try { acl.setEnv_owner_fk(r.getString("env_owner_fk"));  } catch (Exception ignored) {}
						try { acl.setStatus(r.getString("STATUS"));  } catch (Exception ignored) {}
						try { acl.setType(r.getString("TYPE"));  } catch (Exception ignored) {}
						try { acl.setType_fk(r.getInt("type_fk"));  } catch (Exception ignored) {}
						try { acl.setDescription(r.getString("description"));  } catch (Exception ignored) {}
						try { acl.setLink(r.getString("link"));  } catch (Exception ignored) {}
						try { acl.setOrg_fk(r.getInt("org_fk"));  } catch (Exception ignored) {}
						try { acl.setProf_fk(r.getInt("prof_fk"));  } catch (Exception ignored) {}
						acls.add(acl); 
					}
				}else {
					JSONObject r = Entries.getJSONObject("Entry");
					PermissionAcl acl = new PermissionAcl(); 
					try { acl.setEnv_fk(r.getString("env_fk"));  } catch (Exception ignored) {}
					try { acl.setEnv_owner_fk(r.getString("env_owner_fk"));  } catch (Exception ignored) {}
					try { acl.setStatus(r.getString("STATUS"));  } catch (Exception ignored) {}
					try { acl.setType(r.getString("TYPE"));  } catch (Exception ignored) {}
					try { acl.setType_fk(r.getInt("type_fk"));  } catch (Exception ignored) {}
					try { acl.setDescription(r.getString("description"));  } catch (Exception ignored) {}
					try { acl.setLink(r.getString("link"));  } catch (Exception ignored) {}
					try { acl.setOrg_fk(r.getInt("org_fk"));  } catch (Exception ignored) {}
					try { acl.setProf_fk(r.getInt("prof_fk"));  } catch (Exception ignored) {}
					acls.add(acl); 
				}
			}
		}
		
		return acls;
	}
	
	public List<AppTransaction> appTransaction(){
		List<AppTransaction> appTransactions = new ArrayList<>(); 
		
		if(appCode == null || appCode.isEmpty() || url == null || url.isEmpty() || token == null || token.isEmpty()) //!ping(url, DEFAULT_TIMEOUT) || 
			return appTransactions; 
		
		Client client = ClientBuilder.newClient(); 
		WebTarget webTarget = client.target(this.url); 
		Invocation.Builder invocationBuilder  = webTarget.request().cacheControl(cacheControl).header(HttpHeaders.AUTHORIZATION, token); 
		jakarta.ws.rs.core.Response response  = invocationBuilder.get(); 
		String json = response.readEntity(String.class); 
		client.close(); 
		
		JSONObject obj = new JSONObject(json);
		JSONObject Entries = obj.optJSONObject("Entries"); 
		if(Entries != null) {
			JSONArray Entry = Entries.optJSONArray("Entry");
			if(Entry != null) { 
				for(int i=0 ; i< Entry.length() ; i++) {
					JSONObject r = Entry.optJSONObject(i); 
					AppTransaction appTransaction = new AppTransaction(); 
					try { appTransaction.setCode(r.getString("code"));  } catch (Exception ignored) {}
					try { appTransaction.setId(r.getInt("id"));   } catch (Exception ignored) {}
					try { appTransaction.setDescription(r.getString("description"));  } catch (Exception ignored) {}
					appTransactions.add(appTransaction); 
				}
			}
		}
		
		return appTransactions;
	}
	
	public static class PermissionAcl{
		
		private String env_fk; 
		private String env_owner_fk; 
		private String status; 
		private String type; 
		private int type_fk; 
		private String description; 
		private String link;
		private int org_fk; 
		private int prof_fk; 
		
		public int getOrg_fk() {
			return org_fk;
		}
		public void setOrg_fk(int org_fk) {
			this.org_fk = org_fk;
		}
		public int getProf_fk() {
			return prof_fk;
		}
		public void setProf_fk(int prof_fk) {
			this.prof_fk = prof_fk;
		}
		public String getEnv_fk() {
			return env_fk;
		}
		public void setEnv_fk(String env_fk) {
			this.env_fk = env_fk;
		}
		public String getEnv_owner_fk() {
			return env_owner_fk;
		}
		public void setEnv_owner_fk(String env_owner_fk) {
			this.env_owner_fk = env_owner_fk;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getType() {
			return type;
		}
		public void setType(String type) {
			this.type = type;
		}
		public int getType_fk() {
			return type_fk;
		}
		public void setType_fk(int type_fk) {
			this.type_fk = type_fk;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		@Override
		public String toString() {
			return "PermissionAcl [env_fk=" + env_fk + ", env_owner_fk=" + env_owner_fk + ", status=" + status
					+ ", type=" + type + ", type_fk=" + type_fk + ", description=" + description + ", link=" + link
					+ "]";
		} 
		
	}
	
	public static class AppTransaction{
		
		private int id;
		private String description; 
		private String status; 
		private String code;
		
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getCode() {
			return code;
		}
		public void setCode(String code) {
			this.code = code;
		} 
	}

	public String getInstanceName() {
		return instanceName;
	}

	public void setInstanceName(String instanceName) {
		this.instanceName = instanceName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
