package nosi.webapps.igrp_studio.pages.pesquisa_bi_cni_passport;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.webservices.rest.ConsumeJson;
import nosi.core.config.ConfigApp;
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
		model.loadTable_1(Core.query(null,"SELECT 'Consectetur totam sit voluptat' as tipo_documento_tab,'Mollit dolor sit consectetur l' as n_doc_tab,'Officia consectetur voluptatem' as nome_tab,'Labore natus amet consectetur' as sexo_tab,'08-02-2013' as data_nascimento_tab,'Sit stract mollit natus volupt' as nome_pai_tab,'Ut lorem omnis dolor sed' as nome_mae_tab,'Dolor sit anim officia accusan' as data_emissao_tab,'Iste adipiscing anim dolor ali' as emissor_tab,'Dolor unde totam aliqua ipsum' as nic_cni_tab,'hidden-728f_1c33' as estado_civil,'hidden-54c0_49d4' as nat_conselho,'hidden-bca2_0197' as residencia,'hidden-f337_bee6' as dt_validade,'hidden-0a51_682a' as bi_tab,'hidden-3c46_a7dd' as passaporte_tab "));
		view.tipo_documento.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.tipo_documento.setValue(getTipoDoc());
   		view.tipo_documento.setVisible(false);
		view.data_nascimento.setVisible(false);
		view.nome.setVisible(false);
		
		ConsumeJson json_obj = new ConsumeJson();
		
		Properties setting = ConfigApp.getInstance().loadCommonConfig();
		
		String json="";
		String authorization="";
		String url="";
		boolean tipo_doc = false; 
		try {
			final String numero_do_documento = model.getNumero_do_documento().trim();
			if(Core.isNotNull(numero_do_documento)) {
				
				if(numero_do_documento.matches("^\\d{8}[MmFf]{1}\\d{3}[a-zA-Z]{1}$") || numero_do_documento.matches("^[PEDUpedu][Aa]\\d{6}$") ) {
					url = setting.getProperty("link.rest.pesquisa_cni")+"?P_CNI=";
					authorization = setting.getProperty("authorization.link.rest.pesquisa_cni");
					view.emissor_tab.setVisible(false);
				}else {
					if(numero_do_documento.matches("^[0-9]+$")) {
						url = setting.getProperty("link.rest.pesquisa_bi_cni_pass")+"?p_num_bi=";
						authorization = setting.getProperty("authorization.link.rest.pesquisa_bi_cni_pass");
						tipo_doc=true;						
					}else {
						Core.setMessageInfo("O número "+numero_do_documento+" não é um BI/NIC/Passporte válido!");
						view.setModel(model);
						return this.renderView(view);	
					}
						
					
				}
				
				json = json_obj.getJsonFromUrl(url+numero_do_documento.replaceAll(" ", "%20"), authorization);
				JSONObject obj = new JSONObject(json);
				JSONObject Entries = obj.optJSONObject("Entries");			
				if(Entries==null) {
					Core.setMessageInfo("Nenhum registo encontrado!!");		
					view.setModel(model);
					return this.renderView(view);
				}
					
				JSONArray Entry = Entries.optJSONArray("Entry");				
			
				List<Pesquisa_bi_cni_passport.Table_1> lista = new ArrayList<>();
				if(Core.isNotNull(Entry)) {			
					for(int i=0 ; i<Entries.length() ; i++) {
						Pesquisa_bi_cni_passport.Table_1 tab_geral = new Pesquisa_bi_cni_passport.Table_1();
						JSONObject pessoa = Entry.optJSONObject(i);
						setList(tipo_doc, lista, tab_geral, pessoa);
					}
				}else {
					Pesquisa_bi_cni_passport.Table_1 tab_geral = new Pesquisa_bi_cni_passport.Table_1();
					JSONObject pessoa = Entries.optJSONObject("Entry");
					if(pessoa!=null)
						setList(tipo_doc, lista, tab_geral, pessoa);
					else
						Core.setMessageInfo("Nenhum registo encontrado!!");					
					
				}				
				
				model.setTable_1(lista);
				Core.setMessageSuccess();

			}
			}catch (Exception e) {
				Core.setMessageError();
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
		 return this.forward("igrp_studio","Pesquisa_bi_cni_passport","index",this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/
//if(1==1)
		return this.redirect("igrp_studio","Pesquisa_bi_cni_passport","index",model,this.queryString());
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
	
	private void setList(boolean tipo_doc, List<Pesquisa_bi_cni_passport.Table_1> lista,
			Pesquisa_bi_cni_passport.Table_1 tab_geral, JSONObject pessoa) {	

		try {
			if(tipo_doc) {
		    	tab_geral.setTipo_documento_tab("BI");		    
				tab_geral.setN_doc_tab(""+pessoa.get("BI"));
		    	tab_geral.setBi_tab(""+pessoa.get("BI"));
		 
			}else {
				tab_geral.setTipo_documento_tab(pessoa.getString("ID_TP_DOC"));
		    	tab_geral.setN_doc_tab(pessoa.getString("NUM_DOCUMENTO"));	                    	
		    	tab_geral.setNic_cni_tab(pessoa.getString("ID_CIVIL"));
			}

		}catch (org.json.JSONException e) {		
			e.printStackTrace();
			tab_geral.setN_doc_tab(null);
		 	tab_geral.setBi_tab(null);
		 	tab_geral.setTipo_documento_tab(null);
		 	tab_geral.setNic_cni_tab(null);
		}
		try {
			tab_geral.setData_emissao_tab(pessoa.getString("DT_EMISSAO"));
		}catch (org.json.JSONException e) {
			e.printStackTrace();
			tab_geral.setData_emissao_tab(null);
		}
		try {
			if(tipo_doc)
				tab_geral.setData_nascimento_tab(pessoa.getString("DT_NASC"));
			else
				tab_geral.setData_nascimento_tab(pessoa.getString("DATA_NASC"));
		}catch (org.json.JSONException e) {
			e.printStackTrace();
			tab_geral.setData_nascimento_tab(null);
		}
		try {
			if(tipo_doc) 
				tab_geral.setEmissor_tab(pessoa.getString("EMISSOR"));
		}catch (org.json.JSONException e) {
			e.printStackTrace();
			tab_geral.setEmissor_tab(null);
		}
		try {
			if(tipo_doc)
				tab_geral.setNome_mae_tab(pessoa.getString("NOME_MAE"));
			else
				tab_geral.setNome_mae_tab(pessoa.getString("NOME_MAE_PROPRIO")+" "+pessoa.getString("NOME_MAE_APELIDO"));
		}catch (org.json.JSONException e) {
			e.printStackTrace();
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
			e.printStackTrace();
			tab_geral.setNome_tab(null);
		}
		try {
			tab_geral.setSexo_tab(pessoa.getString("SEXO"));
		}catch (org.json.JSONException e) {
			e.printStackTrace();
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
/*----#end-code----*/
}
