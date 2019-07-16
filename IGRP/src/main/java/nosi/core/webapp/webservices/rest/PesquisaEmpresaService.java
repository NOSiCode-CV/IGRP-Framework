package nosi.core.webapp.webservices.rest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.json.JSONArray;
import org.json.JSONObject;

import nosi.core.config.ConfigApp;
import nosi.core.webapp.Core;
import nosi.core.webapp.webservices.rest.pesquisa_geral.PesquisaEmpresa;

/**
 * Isaias.Nunes
 * Jul 3, 2019
 */
public class PesquisaEmpresaService {
	private static final Properties SETTINGS;
	private static final String BASE_URL;
	private static final String AUTHORIZATION;
	
	static {
		SETTINGS = ConfigApp.getInstance().loadConfig("common", "main.xml");
		BASE_URL = SETTINGS.getProperty("link.rest.pesquisa_empresa");
		AUTHORIZATION = SETTINGS.getProperty("authorization.rest.pesquisa_empresa");
	}
	
	
	public static List<PesquisaEmpresa> pesquisaEmpresa(String nif,String nome) throws IOException {
		List<PesquisaEmpresa> empresas = new ArrayList<>();
		ConsumeJson json_obj = new ConsumeJson();
		String url = resolveUrl(nif,nome);
		
			String json = json_obj.getJsonFromUrl(url.replaceAll(" ", "%20"), AUTHORIZATION);
			
			JSONObject obj = new JSONObject(json);
						
			try {
				JSONObject Entries = obj.getJSONObject("Entries");
				 
				try {
					JSONArray Entry = Entries.getJSONArray("Entry");
					for(int i = 0; i < Entry.length(); i++) {
						JSONObject local = Entry.getJSONObject(i);
						PesquisaEmpresa empresa = new PesquisaEmpresa();
						
						try {
							empresa.setNome_firma(local.getString("nome_firma"));
						}catch (org.json.JSONException e) {
							empresa.setNome_firma(null);
						}
						
						try {
							empresa.setNif(""+local.getInt("nif"));
						}catch (org.json.JSONException e) {
							empresa.setNif(null);
						}
						
						try {
							empresa.setMatricula(local.getString("matricula"));
						}catch (org.json.JSONException e) {
							empresa.setMatricula(null);
						}
						
						try {
							empresa.setDt_ini_atividade(local.getString("dt_ini_atividade"));
						}catch (org.json.JSONException e) {
							empresa.setDt_ini_atividade(null);
						}
						
						try {
							empresa.setNatureza_juridica(local.getString("natureza_juridica"));
						}catch (org.json.JSONException e) {
							empresa.setNatureza_juridica(null);
						}
						
						try {
							empresa.setNatureza_juridica_desc(local.getString("natureza_juridica_desc"));
						}catch (org.json.JSONException e) {
							empresa.setNatureza_juridica_desc(null);
						}
						
						try {
							empresa.setTipo_entidade(local.getString("natureza_juridica_desc"));
						}catch (org.json.JSONException e) {
							empresa.setTipo_entidade(null);
						}
						
						try {
							empresa.setTipo_entidade_desc(local.getString("tipo_entidade_desc"));
						}catch (org.json.JSONException e) {
							empresa.setTipo_entidade_desc(null);
						}
						
						try {
							empresa.setEstado(local.getString("estado_desc"));
						}catch (org.json.JSONException e) {
							empresa.setEstado(null);
						}
						
						try {
							empresa.setData_registo(local.getString("data_registo"));
						}catch (org.json.JSONException e) {
							empresa.setData_registo(null);
						}
						
						empresas.add(empresa);
					}	
				}catch(Exception e) {
					JSONObject Entry_ob = Entries.getJSONObject("Entry");
					PesquisaEmpresa empresa = new PesquisaEmpresa();
					
					try {
						empresa.setNome_firma(Entry_ob.getString("nome_firma"));
					}catch (org.json.JSONException ed) {
						empresa.setNome_firma(null);
					}
					
					try {
						empresa.setNif(""+Entry_ob.getInt("nif"));
					}catch (org.json.JSONException es) {
						empresa.setNif(null);
					}
					
					try {
						empresa.setMatricula(Entry_ob.getString("matricula"));
					}catch (org.json.JSONException es) {
						empresa.setMatricula(null);
					}
					
					try {
						empresa.setDt_ini_atividade(Entry_ob.getString("dt_ini_atividade"));
					}catch (org.json.JSONException es) {
						empresa.setDt_ini_atividade(null);
					}
					
					try {
						empresa.setNatureza_juridica(Entry_ob.getString("natureza_juridica"));
					}catch (org.json.JSONException es) {
						empresa.setNatureza_juridica(null);
					}
					
					try {
						empresa.setNatureza_juridica_desc(Entry_ob.getString("natureza_juridica_desc"));
					}catch (org.json.JSONException es) {
						empresa.setNatureza_juridica_desc(null);
					}
					
					try {
						empresa.setTipo_entidade(Entry_ob.getString("natureza_juridica_desc"));
					}catch (org.json.JSONException es) {
						empresa.setTipo_entidade(null);
					}
					
					try {
						empresa.setTipo_entidade_desc(Entry_ob.getString("tipo_entidade_desc"));
					}catch (org.json.JSONException es) {
						empresa.setTipo_entidade_desc(null);
					}
					
					try {
						empresa.setEstado(Entry_ob.getString("estado_desc"));
					}catch (org.json.JSONException es) {
						empresa.setEstado(null);
					}
					
					try {
						empresa.setData_registo(Entry_ob.getString("data_registo"));
					}catch (org.json.JSONException es) {
						empresa.setData_registo(null);
					}
					empresas.add(empresa);
				}
				
				
			}catch (Exception e) {
			
				Core.setMessageInfo("Nenhum registo encontrado");
			}
		return empresas;
	}
	
	
	private static String resolveUrl(String nif,String nome_firma) {
		String url = BASE_URL+"?NIF="+nif+"&NOME_FIRMA="+nome_firma;
		return url;
	}
}
