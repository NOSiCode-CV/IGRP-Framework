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
 * @author: Emanuel Pereira
 * 4 Aug 2017
 */
public class Servicos {
	
	@Expose(serialize = false, deserialize = true)
	private Integer id;
	
	private int id_entidade;
	
	private String nome_servico;
	private String codigo_servico;
	private String estado;
	private String assunto;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getId_entidade() {
		return id_entidade;
	}
	public void setId_entidade(int id_entidade) {
		this.id_entidade = id_entidade;
	}
	public String getNome_servico() {
		return nome_servico;
	}
	public void setNome_servico(String nome_servico) {
		this.nome_servico = nome_servico;
	}
	public String getCodigo_servico() {
		return codigo_servico;
	}
	public void setCodigo_servico(String codigo_servico) {
		this.codigo_servico = codigo_servico;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getAssunto() {
		return assunto;
	}
	public void setAssunto(String assunto) {
		this.assunto = assunto;
	}
	
	public static int insert(Servicos s){
		 ClientConfig config = new DefaultClientConfig();			 
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));	        
	        String url = RestRequestHelper.baseUrl + "/";	        
	        WebResource resource = client.resource(url);	        
			String content = RestRequestHelper.createJsonPostData("_postbalcoes", s);
	        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).type("application/json")
	        		.post(ClientResponse.class, content);			
	       client.destroy();
	       return response.getStatus();
	}	

	public static int update(Servicos s){
	    ClientConfig config = new DefaultClientConfig();			 
       Client client = Client.create(RestRequestHelper.applySslSecurity(config));	        
       String url = RestRequestHelper.baseUrl + "/";	        
       WebResource resource = client.resource(url);	        
		String content = RestRequestHelper.createJsonPostData("_putbalcao_id", s);
		ClientResponse response = resource.path(String.valueOf(s.getId())).accept(MediaType.APPLICATION_JSON).type("application/json")
       		.put(ClientResponse.class, content);			
	    client.destroy();
	    return response.getStatus();
	}
	
	public static List<Servicos> getAllServico() {
			
		List<Servicos> aux = null;
		
		try {
			ClientConfig config = new DefaultClientConfig();
			 
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
	        
	        String url = RestRequestHelper.baseUrl + "/servicos";
	        
	        WebResource resource = client.resource(url);
	        
	        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
	        
	   	 	String jsonResult = response.getEntity(String.class);
	   	 	
	        if(response.getStatus() == 200) {
		        aux = (List<Servicos>) RestRequestHelper.convertJsonToDaoColl(jsonResult, "Servicos", "Servico", new TypeToken<List<Servicos>>(){}.getType());
	        }
	        else {
	       	 System.out.println("Error");
	       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
	        }
	       client.destroy();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return aux != null ? aux : new ArrayList<Servicos>();
	}
	
}
