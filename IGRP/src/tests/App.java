package tests;

import java.util.List;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.agenda.helper.RestRequestHelper;
/**
 * @author Marcel Iekiny
 * Aug 3, 2017
 */
public final class App {
	
	private App() {}
	
	public static void main(String []args) {
		makePostRequest2();
	}
	
	public static void makePostRequest2() {
		ClientConfig config = new DefaultClientConfig();
		 
        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
        
        String url = RestRequestHelper.baseUrl + "/entidade";
        
        WebResource resource = client.resource(url);
       
        Entidade entidade = new Entidade();
        entidade.setNome_entidade("Entidade2");
        entidade.setAplicacao("Aplicacao1");
        entidade.setEstado("Fechado");
		
		String content = RestRequestHelper.createJsonPostData("_postentidade", entidade);
		
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).type("application/json")
        		.post(ClientResponse.class, content);

   	 	String jsonResult = response.getEntity(String.class);
   	 	
   	 	//System.out.println(jsonResult);
   	 	
        if(response.getStatus() == 200) {
        	System.out.println("Ok");
        	System.out.println(RestRequestHelper.extractGeneratedKeyEntryId(jsonResult) + "");
        }
        else {
       	 System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult).getFaultstring());
       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
        }
        
       client.destroy();
	}
	
	public static void makePostRequest() {
		ClientConfig config = new DefaultClientConfig();
		 
        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
        
        String url = RestRequestHelper.baseUrl + "/entidade/18";
        
        WebResource resource = client.resource(url);
       
        String json = "";
        
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON)
        		.put(ClientResponse.class, json);

   	 	String jsonResult = response.getEntity(String.class);
   	 	
   	 	System.out.println(jsonResult);
   	 
        if(response.getStatus() == 200) {
        	System.out.println("Ok");
        }
        else {
       	 System.out.println("Error");
       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
        }
        
       client.destroy();
	}
	
	public static void makeGetRequest() {
		
		ClientConfig config = new DefaultClientConfig();
		 
        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
        
        String url = RestRequestHelper.baseUrl + "/user";
        
        WebResource resource = client.resource(url);
       
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);

   	 	String jsonResult = response.getEntity(String.class);
   	 
   	 	//System.out.println(jsonResult);
   	 	
        if(response.getStatus() == 200) {
	        User entidade = (User) RestRequestHelper.convertJsonToDao(jsonResult, "tbl_userCollection", "tbl_user", new TypeToken<List<User>>(){}.getType());
	       	System.out.println(entidade);
        }
        else {
       	 System.out.println("Error");
       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
        }
       client.destroy();
	}	
}
