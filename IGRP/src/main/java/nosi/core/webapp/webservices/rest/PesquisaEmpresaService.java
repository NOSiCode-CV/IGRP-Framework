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
		SETTINGS = ConfigApp.getInstance().getMainSettings();
		BASE_URL = SETTINGS.getProperty("link.rest.pesquisa_empresa");
		AUTHORIZATION = SETTINGS.getProperty("authorization.rest.pesquisa_empresa");
	}
	
	
	public static List<PesquisaEmpresa> pesquisaEmpresa(String nif,String nome) throws IOException {
		List<PesquisaEmpresa> empresas = new ArrayList<>();
		ConsumeJson json_obj = new ConsumeJson();
		String url = resolveUrl(nif,nome);
		
			
						
			try {
				String json = json_obj.getJsonFromUrl(url.replace(" ", "%20"), AUTHORIZATION);
				if(Core.isNull(json)) {
					Core.setMessageError();
					return empresas;
					}
					
				JSONObject obj = new JSONObject(json);
				JSONObject Entries = obj.optJSONObject("Entries");
				 
				if(Core.isNull(Entries)) {
					Core.setMessageInfo("Nenhum registo encontrado");
					return empresas;
					}
				
				try {
					JSONArray Entry = Entries.getJSONArray("Entry");
					for(int i = 0; i < Entry.length(); i++) {
						JSONObject local = Entry.getJSONObject(i);
						extracted(empresas, local);
					}	
					Core.setMessageSuccess();
				}catch(Exception e) {
					JSONObject Entry_ob = Entries.optJSONObject("Entry");
					if(Entry_ob!=null) {
						extracted(empresas, Entry_ob);
						Core.setMessageSuccess();
					}else
						Core.setMessageInfo("Nenhum registo encontrado");
				}
				
				
			}catch (Exception e) {			
				Core.setMessageError();
			}
			
			
		return empresas;
	}


	private static void extracted(List<PesquisaEmpresa> empresas, JSONObject local) {
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
			empresa.setTipo_entidade(local.getString("tipo_entidade"));
		}catch (org.json.JSONException e) {
			empresa.setTipo_entidade(null);
		}
		
		try {
			empresa.setTipo_entidade_desc(local.getString("tipo_entidade_desc"));
		}catch (org.json.JSONException e) {
			empresa.setTipo_entidade_desc(null);
		}
		
		try {
			empresa.setEstado(local.getString("estado"));
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
	
	
	private static String resolveUrl(String nif,String nome_firma) {
		String url = BASE_URL+"?NIF="+nif+"&NOME_FIRMA="+nome_firma;
		return url;
	}
}
