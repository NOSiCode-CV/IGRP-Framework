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

import nosi.webapps.agenda.dao.Entidade;
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
        
        String json = "{'_postentidade':{'nome_entidade':'teste teste com plicas','aplicacao':'aplicacao','estado':'1'}}";
        
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).type(MediaType.APPLICATION_JSON)
                .post(ClientResponse.class, json);
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
        
        String url = RestRequestHelper.baseUrl + "/entidade/";
        
        WebResource resource = client.resource(url);
       
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);

   	 String jsonResult = response.getEntity(String.class);
   	 
        if(response.getStatus() == 200) {
       	Entidade entidade = (Entidade) RestRequestHelper.convertJsonToDao(jsonResult, "Entidades", "Entidade", new TypeToken<List<Entidade>>(){}.getType());
       	System.out.println(entidade.getNome_entidade());
        }
        else {
       	 System.out.println("Error");
       	 System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
        }
        
       client.destroy();
	}
	
}
