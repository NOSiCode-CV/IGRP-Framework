package nosi.webapps.agenda.dao;

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
public class Entidade {
	
	@Expose(serialize = false, deserialize = true)
	private Integer id;
	
	private String aplicacao;
	
	private String estado;
	
	private String nome_entidade;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAplicacao() {
		return aplicacao;
	}
	public void setAplicacao(String aplicacao) {
		this.aplicacao = aplicacao;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getNome_entidade() {
		return nome_entidade;
	}
	public void setNome_entidade(String nome_entidade) {
		this.nome_entidade = nome_entidade;
	}
	@Override
	public String toString() {
		return "Entidade [id=" + id + ", aplicacao=" + aplicacao + ", estado=" + estado + ", nome_entidade="
				+ nome_entidade + "]";
	}
	
	public static List<Entidade> getAllEntidade() {
		
		List<Entidade> aux = null;
		
		try {
			ClientConfig config = new DefaultClientConfig();
			 
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
	        
	        String url = RestRequestHelper.baseUrl + "/entidade";
	        
	        WebResource resource = client.resource(url);
	        
	        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
	        
	   	 	String jsonResult = response.getEntity(String.class);
	   	 	
	        if(response.getStatus() == 200) {
		        aux = (List<Entidade>) RestRequestHelper.convertJsonToDaoColl(jsonResult, "Entidades", "Entidade", new TypeToken<List<Entidade>>(){}.getType());
	        }
	        else {
	       	 System.out.println("Error");
	       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
	        }
	       client.destroy();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return aux;
	}
	
}
