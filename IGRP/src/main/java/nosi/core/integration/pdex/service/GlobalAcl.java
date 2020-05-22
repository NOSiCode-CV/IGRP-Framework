package nosi.core.integration.pdex.service;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.HttpHeaders;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Iekiny Marcel
 * May 19, 2020
 */
public class GlobalAcl extends PdexServiceTemplate{
	
	private String instanceName;
	
	public GlobalAcl() {
		super();
	}
	
	public List<PermissionAcl> permissionAcl(){
		List<PermissionAcl> acls = new ArrayList<PermissionAcl>(); 
		
		if(instanceName == null || instanceName.isEmpty() || appCode == null || appCode.isEmpty() || url == null || url.isEmpty() || token == null || token.isEmpty()) 
			return acls; 
		
		Client client = ClientBuilder.newClient(); 
		WebTarget webTarget = client.target(this.url); 
		Invocation.Builder invocationBuilder  = webTarget.request().header(HttpHeaders.AUTHORIZATION, token); 
		javax.ws.rs.core.Response response  = invocationBuilder.get(); 
		String json = response.readEntity(String.class); 
		client.close(); 
		
		JSONObject obj = new JSONObject(json);
		JSONObject Entries = obj.optJSONObject("Entries"); 
		if(Entries != null) {
			JSONArray Entry = Entries.optJSONArray("Entry");
			if(Entry != null) { 
				for(int i=0 ; i< Entry.length() ; i++) {
					JSONObject r = Entry.optJSONObject(i); 
					PermissionAcl acl = new PermissionAcl(); 
					try { acl.setEnv_fk(r.getString("ENV_FK"));  } catch (Exception e) {}
					try { acl.setEnv_owner_fk(r.getString("ENV_OWNER_FK"));  } catch (Exception e) {}
					try { acl.setStatus(r.getString("STATUS"));  } catch (Exception e) {}
					try { acl.setType(r.getString("TYPE"));  } catch (Exception e) {}
					try { acl.setType_fk(r.getInt("TYPE_FK"));  } catch (Exception e) {}
					try { acl.setDescription(r.getString("description"));  } catch (Exception e) {}
					try { acl.setLink(r.getString("link"));  } catch (Exception e) {}
					acls.add(acl); 
				}
			}
		}
		
		return acls;
	}
	
	public List<AppTransaction> appTransaction(){
		List<AppTransaction> appTransactions = new ArrayList<AppTransaction>(); 
		
		if(appCode == null || appCode.isEmpty() || url == null || url.isEmpty() || token == null || token.isEmpty()) 
			return appTransactions; 
		
		Client client = ClientBuilder.newClient(); 
		WebTarget webTarget = client.target(this.url); 
		Invocation.Builder invocationBuilder  = webTarget.request().header(HttpHeaders.AUTHORIZATION, token); 
		javax.ws.rs.core.Response response  = invocationBuilder.get(); 
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
					try { appTransaction.setCode(r.getString("code"));  } catch (Exception e) {}
					try { appTransaction.setId(r.getInt("id"));   } catch (Exception e) {}
					try { appTransaction.setDescription(r.getString("description"));  } catch (Exception e) {}
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

}
