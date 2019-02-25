package nosi.webapps.igrp_studio.pages.pesquisa_bi_cni_passport;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.webservices.rest.ConsumeJson;
import nosi.core.webapp.webservices.rest.pesquisa_geral.PesquisaBI;
import nosi.core.webapp.webservices.rest.pesquisa_geral.PesquisaCNI;
import nosi.core.webapp.webservices.rest.pesquisa_geral.PesquisaPassport;
import nosi.core.config.Config;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
		model.loadTable_1(Core.query(null,"SELECT 'Anim laudantium elit magna rem' as tipo_documento_tab,'Doloremque magna elit lorem ac' as n_doc_tab,'Totam lorem natus dolor anim' as nome_tab,'Ut natus perspiciatis anim mag' as sexo_tab,'06-03-2015' as data_nascimento_tab,'Sit adipiscing aperiam elit na' as nome_pai_tab,'Sed magna sit lorem deserunt' as nome_mae_tab,'Totam iste amet aperiam magna' as data_emissao_tab,'Sit doloremque iste totam laud' as emissor_tab,'1' as estado_civil,'1' as nat_conselho,'1' as residencia,'1' as dt_validade,'1' as bi_tab,'1' as nic_cni_tab,'1' as passaporte_tab "));
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
		String url = setting.getProperty("link.rest.pesquisa_bi_cni_pass")+"?p_num_bi=";
		String authorization = setting.getProperty("authorization.link.rest.pesquisa_bi_cni_pass");
		
		try {
			if(Core.isNotNull(model.getNumero_do_documento())) {
				json = json_obj.getJsonFromUrl(url+model.getNumero_do_documento().replaceAll(" ", "%20"), authorization);
				JSONObject obj = new JSONObject(json);
				JSONObject Entries = obj.getJSONObject("Entries");
				JSONArray Entry = Entries.getJSONArray("Entry");
				
				List<Pesquisa_bi_cni_passport.Table_1> lista = new ArrayList<>();
				for(int i=0 ; i<Entries.length() ; i++) {
					Pesquisa_bi_cni_passport.Table_1 tab_geral = new Pesquisa_bi_cni_passport.Table_1();
					JSONObject pessoa = Entry.getJSONObject(i);
					try {
                    	tab_geral.setTipo_documento_tab("BI");
						tab_geral.setN_doc_tab(pessoa.getString("BI"));
                    	tab_geral.setBi_tab(pessoa.getString("BI"));
					}catch (org.json.JSONException e) {
						tab_geral.setN_doc_tab(null);
                     	tab_geral.setBi_tab(null);
					}
					try {
						tab_geral.setData_emissao_tab(pessoa.getString("DT_EMISSAO"));
					}catch (org.json.JSONException e) {
						tab_geral.setData_emissao_tab(null);
					}
					try {
						tab_geral.setData_nascimento_tab(pessoa.getString("DT_NASC"));
					}catch (org.json.JSONException e) {
						tab_geral.setData_nascimento_tab(null);
					}
					try {
						tab_geral.setEmissor_tab(pessoa.getString("EMISSOR"));
					}catch (org.json.JSONException e) {
						tab_geral.setEmissor_tab(null);
					}
					try {
						tab_geral.setNome_mae_tab(pessoa.getString("NOME_MAE"));
					}catch (org.json.JSONException e) {
						tab_geral.setNome_mae_tab(null);
					}
					try {
						tab_geral.setNome_pai_tab(pessoa.getString("NOME_PAI"));
					}catch (org.json.JSONException e) {
						tab_geral.setNome_pai_tab(null);
					}
					try {
						tab_geral.setNome_tab(pessoa.getString("NOME"));
					}catch (org.json.JSONException e) {
						tab_geral.setNome_tab(null);
					}
					try {
						tab_geral.setSexo_tab(pessoa.getString("SEXO"));
					}catch (org.json.JSONException e) {
						tab_geral.setSexo_tab(null);
					}
					try {
						tab_geral.setNat_conselho(pessoa.getString("NAT_CONSELHO"));
					}catch (org.json.JSONException e) {
						tab_geral.setNat_conselho(null);
					}
					try {
						tab_geral.setDt_validade(pessoa.getString("DT_VALIDADE"));
					}catch (org.json.JSONException e) {
						tab_geral.setDt_validade(null);
					}
					try {
						tab_geral.setResidencia(pessoa.getString("RESIDENCIA"));
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
		FileInputStream fis = null;
		Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
		}
		try {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return props;
	}
/*----#end-code----*/
}
