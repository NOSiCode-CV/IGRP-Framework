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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/*----#end-code----*/
		
public class Pesquisa_bi_cni_passportController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_bi_cni_passport model = new Pesquisa_bi_cni_passport();
		model.load();
		Pesquisa_bi_cni_passportView view = new Pesquisa_bi_cni_passportView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Adipiscing sed natus sit sed' as bi_tab,'Doloremque perspiciatis laudan' as nome_tab,'Doloremque ut rem consectetur' as sexo_tab,'08-07-2011' as data_nascimento_tab,'Rem consectetur dolor omnis do' as nome_pai_tab,'Voluptatem dolor amet mollit a' as nome_mae_tab,'Adipiscing deserunt lorem cons' as data_emissao_tab,'Labore unde natus ut consectet' as emissor_tab "));
		view.tipo_documento.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.tipo_documento.setValue(getTipoDoc());
		
		String json_data = "{\"Numero_ID\" : \""+ model.getNumero_do_documento() +"\"}";
		ConsumeJson json_obj = new ConsumeJson();
		String json = json_obj.getObjectFromJson("http://stage-pdex.gov.cv:8282/apicheckid", json_data);
		
		PesquisaBI list_bi = new PesquisaBI();
		PesquisaCNI list_cni = new PesquisaCNI();
		PesquisaPassport list_pass = new PesquisaPassport();
		list_bi = list_bi.getListBI(json);
		list_cni = list_cni.getListCNI(json);
		list_pass = list_pass.getListPassport(json);
		
		if(list_bi.getError() == null ) {
			switch(model.getTipo_documento()) {
			case "bi":
				List<Pesquisa_bi_cni_passport.Table_1> lista_bi = new ArrayList<>();
				Pesquisa_bi_cni_passport.Table_1 tab_bi = new Pesquisa_bi_cni_passport.Table_1();
				tab_bi.setBi_tab(""+list_bi.getBI());
				tab_bi.setNome_tab(list_bi.getNOME());
				tab_bi.setSexo_tab(list_bi.getSEXO());
				tab_bi.setData_nascimento_tab(list_bi.getDT_NASC());
				tab_bi.setNome_mae_tab(list_bi.getNOME_MAE());
				tab_bi.setNome_pai_tab(list_bi.getNOME_PAI());
				tab_bi.setData_emissao_tab(list_bi.getDT_EMISSAO());
				tab_bi.setEmissor_tab(list_bi.getEMISSOR()); 
				lista_bi.add(tab_bi);
				model.setTable_1(lista_bi);
				break;
			case "cni":
				List<Pesquisa_bi_cni_passport.Table_1> lista_cni = new ArrayList<>();
				Pesquisa_bi_cni_passport.Table_1 tab_cni = new Pesquisa_bi_cni_passport.Table_1();
				tab_cni.setNome_tab(list_cni.getNOME_COMPLETO());
				tab_cni.setSexo_tab(list_cni.getSEXO());
				tab_cni.setData_nascimento_tab(list_cni.getDATA_NASC());
				tab_cni.setBi_tab(list_cni.getNUM_DOCUMENTO());
				lista_cni.add(tab_cni);
				model.setTable_1(lista_cni);
				break;
			case "pass":
				List<Pesquisa_bi_cni_passport.Table_1> lista_pass = new ArrayList<>();
				Pesquisa_bi_cni_passport.Table_1 tab_pass = new Pesquisa_bi_cni_passport.Table_1();
				tab_pass.setNome_tab(list_pass.getNOME_COMPLETO());
				tab_pass.setSexo_tab(list_pass.getSEXO());
				tab_pass.setData_nascimento_tab(list_pass.getDATA_NASC());
				tab_pass.setBi_tab(list_pass.getNUM_DOCUMENTO());
				lista_pass.add(tab_pass);
				model.setTable_1(lista_pass);
				break;
			default:
				model.setTable_1(null);
				break;
			}
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

/*----#end-code----*/
}
