package nosi.webapps.agenda.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ws.rs.core.MediaType;

import org.json.JSONObject;

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
public class Marcacao {
	@Expose(serialize = false, deserialize = true)
	private Integer id;
	private int id_entidade;
	private int id_servico;
	private int id_balcao;
	private String nome;
	private String data_marcacao;
	private String hr_marcacao;
	private String requerente;
	private String tipo_documento;
	private String nr_documento;
	private String telemovel;
	private String telefone;
	private String email;
	private String notificacao;
	private String estado;
	
	private String localizacao;
	private String nome_servico;
	
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
	public int getId_servico() {
		return id_servico;
	}
	public void setId_servico(int id_servico) {
		this.id_servico = id_servico;
	}
	public int getId_balcao() {
		return id_balcao;
	}
	public void setId_balcao(int id_balcao) {
		this.id_balcao = id_balcao;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getData_marcacao() {
		return data_marcacao;
	}
	public void setData_marcacao(String data_marcacao) {
		this.data_marcacao = data_marcacao;
	}
	public String getHr_marcacao() {
		return hr_marcacao;
	}
	public void setHr_marcacao(String hr_marcacao) {
		this.hr_marcacao = hr_marcacao;
	}
	public String getRequerente() {
		return requerente;
	}
	public void setRequerente(String requerente) {
		this.requerente = requerente;
	}
	public String getTipo_documento() {
		return tipo_documento;
	}
	public void setTipo_documento(String tipo_documento) {
		this.tipo_documento = tipo_documento;
	}
	public String getNr_documento() {
		return nr_documento;
	}
	public void setNr_documento(String nr_documento) {
		this.nr_documento = nr_documento;
	}
	public String getTelemovel() {
		return telemovel;
	}
	public void setTelemovel(String telemovel) {
		this.telemovel = telemovel;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNotificacao() {
		return notificacao;
	}
	public void setNotificacao(String notificacao) {
		this.notificacao = notificacao;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	public String getLocalizacao() {
		return localizacao;
	}
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	public String getNome_servico() {
		return nome_servico;
	}
	public void setNome_servico(String nome_servico) {
		this.nome_servico = nome_servico;
	}
	public static String convertDate(String date, String formatIn, String formatOut) {
		String myDateString = null;
		try {
			SimpleDateFormat newDateFormat = new SimpleDateFormat(formatIn);
			Date myDate = newDateFormat.parse(date);
			newDateFormat.applyPattern(formatOut);
			myDateString = newDateFormat.format(myDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myDateString;
	}
	
	public static List<Marcacao> getAllMarcacao(String filter){
		List<Marcacao> aux = null;
		try {
			ClientConfig config = new DefaultClientConfig();			 
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));	        
	        String url = RestRequestHelper.baseUrl + "/marcacoes_filter";	        
	        WebResource resource = client.resource(url);
	        JSONObject jsonObject = new JSONObject();
	        jsonObject.put("_postmarcacoes_filter",new JSONObject().put("filterQuery", filter));
	        ClientResponse response = resource.accept(MediaType.APPLICATION_JSON).type("application/json")
	        		.post(ClientResponse.class, jsonObject.toString());	
	        String jsonResult = response.getEntity(String.class);
	        if(response.getStatus() == 200) {
		        aux = (List<Marcacao>) RestRequestHelper.convertJsonToDaoColl(jsonResult, "Marcacoes", "Marcacao", new TypeToken<List<Marcacao>>(){}.getType());
	        }
	        else {
	       	 System.err.println("Error:"+RestRequestHelper.convertToDefaultFault(jsonResult));
	       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
	        }
	       client.destroy();
		}catch(Exception e){
			e.printStackTrace();
		}
		return aux != null ? aux : new ArrayList<Marcacao>();
	}
	

	public static int update(Marcacao m){
	    ClientConfig config = new DefaultClientConfig();			 
        Client client = Client.create(RestRequestHelper.applySslSecurity(config));	        
        String url = RestRequestHelper.baseUrl + "/marcacao";	        
        WebResource resource = client.resource(url);	        
		String content = RestRequestHelper.createJsonPostData("_putmarcacao_id", m);
		ClientResponse response = resource.path(String.valueOf(m.getId())).accept(MediaType.APPLICATION_JSON).type("application/json")
        		.put(ClientResponse.class, content);			
 	    client.destroy();
	    return response.getStatus();
	}
	
	public static Marcacao getMarcacao(int id){
		Marcacao aux = null;
		try {
			ClientConfig config = new DefaultClientConfig();
			 
	        Client client = Client.create(RestRequestHelper.applySslSecurity(config));
	        
	        String url = RestRequestHelper.baseUrl + "/marcacao";
	        
	        WebResource resource = client.resource(url);
	        
	        ClientResponse response = resource.path(String.valueOf(id)).accept(MediaType.APPLICATION_JSON).get(ClientResponse.class);
	        
	   	 	String jsonResult = response.getEntity(String.class);
	   	 	
	        if(response.getStatus() == 200) {
		        aux = (Marcacao) RestRequestHelper.convertJsonToDao(jsonResult, "Marcacoes", "Marcacao", new TypeToken<List<Marcacao>>(){}.getType());
	        }
	        else {
	       	 System.out.println("Error");
	       	 //System.out.println(RestRequestHelper.convertToDefaultFault(jsonResult));
	        }
	       client.destroy();
		}catch(Exception e){
			e.printStackTrace();
		}
		return aux != null ? aux : new Marcacao();
	}
}
