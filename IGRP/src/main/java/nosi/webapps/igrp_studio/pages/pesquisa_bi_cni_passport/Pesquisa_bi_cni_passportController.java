package nosi.webapps.igrp_studio.pages.pesquisa_bi_cni_passport;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.webservices.rest.ConsumeJson;
import nosi.core.config.Config;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import org.json.JSONArray;
import org.json.JSONObject;

/*----#end-code----*/
		
public class Pesquisa_bi_cni_passportController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_bi_cni_passport model = new Pesquisa_bi_cni_passport();
		model.load();
		Pesquisa_bi_cni_passportView view = new Pesquisa_bi_cni_passportView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Unde deserunt ut labore amet' as tipo_documento_tab,'Sit stract magna doloremque vo' as n_doc_tab,'Rem dolor aliqua rem elit' as nome_tab,'Consectetur rem aliqua anim do' as sexo_tab,'02-07-2011' as data_nascimento_tab,'Amet voluptatem sed lorem iste' as nome_pai_tab,'Elit aliqua omnis natus adipis' as nome_mae_tab,'Anim lorem sed unde anim' as data_emissao_tab,'Deserunt doloremque consectetu' as emissor_tab,'hidden-07ec_174f' as estado_civil,'hidden-feb0_8fe5' as nat_conselho,'hidden-9418_2646' as residencia,'hidden-428f_70c6' as dt_validade,'hidden-d94c_c7df' as bi_tab,'hidden-0c7c_08b3' as nic_cni_tab,'hidden-8ba1_1bda' as passaporte_tab "));
		view.tipo_documento.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.tipo_documento.setValue(getTipoDoc());
   		view.tipo_documento.setVisible(false);
		view.data_nascimento.setVisible(false);
		view.nome.setVisible(false);
		
		ConsumeJson json_obj = new ConsumeJson();
		Properties setting = this.loadConfig("common", "main.xml");
		
		String json="";
		String authorization="";
		String url="";
		boolean tipo_doc = false; 
		try {
			if(Core.isNotNull(model.getNumero_do_documento())) {
				
				if(model.getNumero_do_documento().length() == 13) {
					url = setting.getProperty("link.rest.pesquisa_cni")+"?P_CNI=";
					authorization = setting.getProperty("authorization.link.rest.pesquisa_cni");
					view.emissor_tab.setVisible(false);
				}else {
					url = setting.getProperty("link.rest.pesquisa_bi_cni_pass")+"?p_num_bi=";
					authorization = setting.getProperty("authorization.link.rest.pesquisa_bi_cni_pass");
					tipo_doc=true;
				}
				
				json = json_obj.getJsonFromUrl(url+model.getNumero_do_documento().replaceAll(" ", "%20"), authorization);
				JSONObject obj = new JSONObject(json);
				JSONObject Entries = obj.getJSONObject("Entries");
				JSONArray Entry = Entries.getJSONArray("Entry");
				
				List<Pesquisa_bi_cni_passport.Table_1> lista = new ArrayList<>();
				for(int i=0 ; i<Entries.length() ; i++) {
					Pesquisa_bi_cni_passport.Table_1 tab_geral = new Pesquisa_bi_cni_passport.Table_1();
					JSONObject pessoa = Entry.getJSONObject(i);
					try {
						if(tipo_doc) {
	                    	tab_geral.setTipo_documento_tab("BI");
							tab_geral.setN_doc_tab(pessoa.getString("BI"));
	                    	tab_geral.setBi_tab(pessoa.getString("BI"));
						}else {
	                    	tab_geral.setN_doc_tab(pessoa.getString("NUM_DOCUMENTO"));
	                    	tab_geral.setTipo_documento_tab(pessoa.getString("ID_TP_DOC"));
						}
					}catch (org.json.JSONException e) {
						tab_geral.setN_doc_tab(null);
                     	tab_geral.setBi_tab(null);
                     	tab_geral.setTipo_documento_tab(null);
					}
					try {
						tab_geral.setData_emissao_tab(pessoa.getString("DT_EMISSAO"));
					}catch (org.json.JSONException e) {
						tab_geral.setData_emissao_tab(null);
					}
					try {
						if(tipo_doc)
							tab_geral.setData_nascimento_tab(pessoa.getString("DT_NASC"));
						else
							tab_geral.setData_nascimento_tab(pessoa.getString("DATA_NASC"));
					}catch (org.json.JSONException e) {
						tab_geral.setData_nascimento_tab(null);
					}
					try {
						tab_geral.setEmissor_tab(pessoa.getString("EMISSOR"));
					}catch (org.json.JSONException e) {
						tab_geral.setEmissor_tab(null);
					}
					try {
						if(tipo_doc)
							tab_geral.setNome_mae_tab(pessoa.getString("NOME_MAE"));
						else
							tab_geral.setNome_mae_tab(pessoa.getString("NOME_MAE_PROPRIO")+" "+pessoa.getString("NOME_MAE_APELIDO"));
					}catch (org.json.JSONException e) {
						tab_geral.setNome_mae_tab(null);
					}
					try {
						if(tipo_doc)
							tab_geral.setNome_pai_tab(pessoa.getString("NOME_PAI"));
						else
							tab_geral.setNome_pai_tab(pessoa.getString("NOME_PAI_PROPRIO")+" "+pessoa.getString("NOME_PAI_APELIDO"));
					}catch (org.json.JSONException e) {
						tab_geral.setNome_pai_tab(null);
					}
					try {
						if(tipo_doc)
							tab_geral.setNome_tab(pessoa.getString("NOME"));
						else
							tab_geral.setNome_tab(pessoa.getString("NOME_COMPLETO"));
					}catch (org.json.JSONException e) {
						tab_geral.setNome_tab(null);
					}
					try {
						tab_geral.setSexo_tab(pessoa.getString("SEXO"));
					}catch (org.json.JSONException e) {
						tab_geral.setSexo_tab(null);
					}
					try {
						if(tipo_doc)
							tab_geral.setNat_conselho(pessoa.getString("NAT_CONSELHO"));
						else
							tab_geral.setNat_conselho(pessoa.getString("NATURALIDADE_ID"));
					}catch (org.json.JSONException e) {
						tab_geral.setNat_conselho(null);
					}
					try {
						tab_geral.setDt_validade(pessoa.getString("DT_VALIDADE"));
					}catch (org.json.JSONException e) {
						tab_geral.setDt_validade(null);
					}
					try {
						if(tipo_doc)
							tab_geral.setResidencia(pessoa.getString("RESIDENCIA"));
						else
							tab_geral.setResidencia(pessoa.getString("LOCALIDADE"));
					}catch (org.json.JSONException e) {
						tab_geral.setResidencia(null);
					}
					try {
						tab_geral.setEstado_civil(pessoa.getString("ESTADO_CIVIL"));
					}catch (org.json.JSONException e) {
						tab_geral.setEstado_civil(null);
					}
					lista.add(tab_geral);
				}
				model.setTable_1(lista);
			}
			}catch (Exception e) {
				Core.setMessageInfo("Nenhum registo encontrado!!");
		}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_bi_cni_passport model = new Pesquisa_bi_cni_passport();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","Pesquisa_bi_cni_passport","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/

      return this.forward("igrp_studio","Pesquisa_bi_cni_passport","index", model, this.queryString());
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/
	public HashMap<String, String> getTipoDoc() {
		HashMap<String, String> tipo_doc = new HashMap<>();
		tipo_doc.put(null, "-- Escolhe o tipo do documento --");
		tipo_doc.put("bi", "BI");
		tipo_doc.put("cni", "CNI");
		tipo_doc.put("pass", "Passaporte");
		return tipo_doc;
	}
	
	private Properties loadConfig(String filePath, String fileName) {
		String path = new Config().getBasePathConfig() + File.separator + filePath;
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath().replaceAll("%20", " "));
		
		Properties props = new Properties();
		try (FileInputStream fis = new FileInputStream(file)) {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return props;
	}
/*----#end-code----*/
}
