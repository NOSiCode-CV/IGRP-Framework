package tests;

import java.util.List;

import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import nosi.webapps.agenda.helper.RestRequestHelper;
/**
 * @author Marcel Iekiny
 * Aug 3, 2017
 */
public final class App {
	
	//private static final String url = "http://imf:8280/services/MyFirstDS/user/2";//"https://localhost:9092/services/DSN_Agenda/agenda/1";
	
	private App() {}
	
	public static void main(String []args) {
		makePostRequest();
	}
	
	public static void makePostRequest() {
		ClientConfig config = new DefaultClientConfig();
		 
        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
        
        String url = RestRequestHelper.baseUrl + "/entidade";
        
        WebResource resource = client.resource(url);
       
        MultivaluedMap formData = new MultivaluedMapImpl();
        formData.add("nome_entidade", "val1");
        formData.add("aplicacao", "val2");
        formData.add("estado", "1");
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON)
        		.post(ClientResponse.class, formData);

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
		//ClientConfig config = new DefaultClientConfig();
		 
        Client client = Client.create(/*RestRequestHelper.applySslSecurity(config)*/);
        
        String url = RestRequestHelper.baseUrl + "";
        
        WebResource resource = client.resource(url);
       
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);

   	 String jsonResult = response.getEntity(String.class);
   	 
        if(response.getStatus() == 200) {
       	User user = (User) RestRequestHelper.convertJsonToDao(jsonResult, "tbl_userCollection", "tbl_user", new TypeToken<List<User>>(){}.getType());
       	System.out.println("Ok");
        }
        else {
       	 System.out.println("Error");
       	 System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
        }
        
       client.destroy();
	}
	
}
