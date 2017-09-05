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
	
	@Override
	public String toString() {
		return "Servicos [id=" + id + ", id_entidade=" + id_entidade + ", nome_servico=" + nome_servico
				+ ", codigo_servico=" + codigo_servico + ", estado=" + estado + ", assunto=" + assunto + "]";
	}
	public static Servicos insert(Servicos s){
		 ClientConfig config = new DefaultClientConfig();			 
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));	        
	        String url = RestRequestHelper.baseUrl + "/ag_t_servicos";	        
	        WebResource resource = client.resource(url);	        
			String content = RestRequestHelper.convertDaoToJson(s);
	        ClientResponse response = resource.header("Prefer", "return=representation").accept(MediaType.APPLICATION_JSON).type("application/json")
	        		.post(ClientResponse.class, content);	
	        String jsonResult = response.getEntity(String.class);
	       client.destroy();
	       return (response.getStatus() == 201) ? RestRequestHelper.convertJsonToDao(jsonResult, Servicos.class) : null;
	}	

	public static Servicos update(Servicos s){
	    ClientConfig config = new DefaultClientConfig();			 
       Client client = Client.create(RestRequestHelper.applySslSecurity(config));	        
       String url = RestRequestHelper.baseUrl + "/ag_t_servicos("+s.getId()+")";
       int id = s.getId();
       s.setId(null);
       WebResource resource = client.resource(url);	        
		String content = RestRequestHelper.convertDaoToJson(s);
		ClientResponse response = resource.header("Prefer", "return=representation").accept(MediaType.APPLICATION_JSON).type("application/json")
       		.put(ClientResponse.class, content);
	    client.destroy();
	    System.out.println(response.getStatus());
	    return response.getStatus() == 204 ? getServicoById(id) : null;
	}
	
	public static List<Servicos> getAllServico() {
			
		List<Servicos> aux = null;
		
		try {
			ClientConfig config = new DefaultClientConfig();
			 
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
	        
	        String url = RestRequestHelper.baseUrl + "/ag_t_servicos";
	        
	        WebResource resource = client.resource(url);
	        
	        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
	        
	   	 	String jsonResult = response.getEntity(String.class);
	   	 	
	        if(response.getStatus() == 200) {
		        aux = RestRequestHelper.convertJsonToListDao(jsonResult, new TypeToken<List<Servicos>>(){}.getType());
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
	
	public static Servicos getServicoById(int id) {
		Servicos aux = null;
		try {
			ClientConfig config = new DefaultClientConfig();
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
	        String url = RestRequestHelper.baseUrl + "/ag_t_servicos("+id+")";
	        WebResource resource = client.resource(url);
	        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
	   	 	String jsonResult = response.getEntity(String.class);
	   	 	
	   	 	if(response.getStatus() == 200) {
	   	 		aux = (Servicos) RestRequestHelper.convertJsonToDao(jsonResult, Servicos.class);
	   	 	}else {
	   	 	System.out.println("Error");
	       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
	   	 	}
		}catch(Exception e){
			e.printStackTrace();
		}
		return aux != null ? aux : new  Servicos();
	}
	
	
}
