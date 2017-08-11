package nosi.webapps.agenda.dao;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.MediaType;

import com.google.gson.annotations.Expose;
import com.google.gson.reflect.TypeToken;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.config.ClientConfig;
import com.sun.jersey.api.client.config.DefaultClientConfig;

import nosi.webapps.agenda.helper.RestRequestHelper;

/**
 * Yma
 * 10 Aug 2017
 */
public class Aplicacao {

	@Expose (serialize=false, deserialize=true)
	private Integer id;
	private String nome;
	private String descricao;
	private String dad;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad;
	}
	
	public static int insert(Aplicacao a){
		ClientConfig config = new DefaultClientConfig();			 
        Client client = Client.create(RestRequestHelper.applySslSecurity(config));	        
        String url = RestRequestHelper.baseUrl + "/aplicacao";	        
        WebResource resource = client.resource(url);	        
		String content = RestRequestHelper.createJsonPostData("_postaplicacao", a);
        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).type("application/json")
        		.post(ClientResponse.class, content);			
       client.destroy();
       return response.getStatus();
	}	

	public static int update(Aplicacao a){
	    ClientConfig config = new DefaultClientConfig();			 
        Client client = Client.create(RestRequestHelper.applySslSecurity(config));	        
        String url = RestRequestHelper.baseUrl + "/aplicacao";	        
        WebResource resource = client.resource(url);	        
		String content = RestRequestHelper.createJsonPostData("_putaplicacao_id", a);
		ClientResponse response = resource.path(String.valueOf(a.getId())).accept(MediaType.APPLICATION_JSON).type("application/json")
        		.put(ClientResponse.class, content);			
 	    client.destroy();
	    return response.getStatus();
	}
	
	
	public static List<Aplicacao> getAllAplicacao(){
		List<Aplicacao> aux = null;
		try {
			ClientConfig config = new DefaultClientConfig();
			 
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
	        
	        String url = RestRequestHelper.baseUrl + "/aplicacao";
	        
	        WebResource resource = client.resource(url);
	        
	        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
	        
	   	 	String jsonResult = response.getEntity(String.class);
	   	 	
	        if(response.getStatus() == 200) {
		        aux = (List<Aplicacao>) RestRequestHelper.convertJsonToDaoColl(jsonResult, "Aplicacoes", "Aplicacao", new TypeToken<List<Aplicacao>>(){}.getType());
	        }
	        else {
	       	 System.out.println("Error");
	       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
	        }
	       client.destroy();
		}catch(Exception e){
			e.printStackTrace();
		}
		return aux != null ? aux : new ArrayList<Aplicacao>();
	}
	
	
	public static Aplicacao getAplicacao(int id){
		Aplicacao aux = null;
		try {
			ClientConfig config = new DefaultClientConfig();
			 
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
	        
	        String url = RestRequestHelper.baseUrl + "/aplicacao";
	        
	        WebResource resource = client.resource(url);
	        
	        ClientResponse response = resource.path(String.valueOf(id)).accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
	        
	   	 	String jsonResult = response.getEntity(String.class);
	   	 	
	        if(response.getStatus() == 200) {
		        aux = (Aplicacao) RestRequestHelper.convertJsonToDao(jsonResult, "Aplicacoes", "Aplicacao", new TypeToken<List<Aplicacao>>(){}.getType());
	        }
	        else {
	       	 System.out.println("Error");
	       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
	        }
	       client.destroy();
		}catch(Exception e){
			e.printStackTrace();
		}
		return aux != null ? aux : new Aplicacao();
	}
	
}
