package tests;

import java.util.List;
import javax.ws.rs.core.MediaType;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

import nosi.webapps.agenda.dao.Balcao;
import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.agenda.dao.Requisitos;
import nosi.webapps.agenda.dao.Servicos;
import nosi.webapps.agenda.helper.RestRequestHelper;
/**
 * @author Marcel Iekiny
 * Aug 3, 2017
 */
public final class App {
	
	private App() {}
	
	public static void main(String []args) {
		//makeGetRequest();
		System.out.println(Requisitos.getAllRequisitosByServico(1).size());
		//System.out.println(Requisitos.getAllRequisitosByServico(1).size());
	}
	
	
	public static void makePostRequest2() {
		ClientConfig config = new DefaultClientConfig();
		 
        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
        
        String url = RestRequestHelper.baseUrl + "/servicos";
        
        WebResource resource = client.resource(url);
        /*
        User user = new User();
		user.setUsername("IMF");
		user.setPassword_hash("djfhjdhfjd");
		user.setAuth_key("deeuriwui");
		user.setStatus(10);
		user.setPassword_reset_token("NULL");
		user.setEmail("iekinyfernandes3@gmail.com");
		user.setUpdated_at(12345);
		user.setCreated_at(45344);
		user.setFuncionario(1);
		*/
        
        Servicos servicos = new Servicos();
        
        servicos.setId_entidade(37);
        servicos.setNome_servico("Teste post");
        servicos.setCodigo_servico("codi");
        servicos.setEstado("1");
        servicos.setAssunto("assuntos");
        
		String content = RestRequestHelper.createJsonPostData("_postservicos", servicos);
		System.out.println(content);
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).type("application/json")
        		.post(ClientResponse.class, content);
		
   	 	String jsonResult = response.getEntity(String.class);
   	 	
        if(response.getStatus() == 200) {
        	System.out.println("Ok");
        }
        else {
       	 System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult).getFaultstring());
       	 System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
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
        
        String url = RestRequestHelper.baseUrl + "/balcoes";
        
        WebResource resource = client.resource(url);
        
        System.out.println("Recource " + resource);
        
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
        
       // System.out.println("Response " + response);
        
   	 	String jsonResult = response.getEntity(String.class);
   	    
   	 	//System.out.println(jsonResult);
   	 	
        if(response.getStatus() == 200) {
	        List<Balcao> entidade = (List<Balcao>) RestRequestHelper.convertJsonToDaoColl(jsonResult, "Balcoes", "Balcao", new TypeToken<List<Balcao>>(){}.getType());
	       	for(Balcao balcao : entidade) {
	       		System.out.println(balcao);
	       	}
	        System.out.println(entidade);
        }
        else {
       	 System.out.println("Error");
       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
        }
       client.destroy();
	}
	
}