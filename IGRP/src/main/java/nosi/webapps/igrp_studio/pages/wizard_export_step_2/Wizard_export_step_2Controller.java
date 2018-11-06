package nosi.webapps.igrp_studio.pages.wizard_export_step_2;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.import_export_v2.exports.ExportHelper;
import nosi.core.webapp.import_export_v2.exports.ExportSqlHelper;
import java.util.Arrays;
/*----#end-code----*/
		
public class Wizard_export_step_2Controller extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Wizard_export_step_2 model = new Wizard_export_step_2();
		model.load();
		Wizard_export_step_2View view = new Wizard_export_step_2View();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_report(Core.query(null,"SELECT '1' as report_ids,'Officia consectetur sit anim d' as descricao_report "));
		model.loadTable_bpmn(Core.query(null,"SELECT '1' as bpmn_ids,'Deserunt totam lorem ut adipis' as descricao_bpmn "));
		model.loadTable_menu(Core.query(null,"SELECT '1' as menu_ids,'Mollit elit laudantium sit lau' as descricao_menu "));
		model.loadTable_pagina(Core.query(null,"SELECT '1' as pagina_ids,'Consectetur sit sit voluptatem' as descricao_pagina "));
		model.loadTable_connections(Core.query(null,"SELECT '1' as conexao_ids,'Mollit ipsum omnis accusantium' as descricao_conexao "));
		model.loadTable_dao(Core.query(null,"SELECT '1' as dao_ids,'Adipiscing stract ut mollit de' as descricao_dao "));
		model.loadTable_domain(Core.query(null,"SELECT '1' as domain_ids,'Doloremque amet voluptatem omn' as descricao_domain "));
		model.loadTable_modulo(Core.query(null,"SELECT '1' as modulo_ids,'Aperiam perspiciatis ipsum adi' as descricao_modulo "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		String[] p_selecionar_opcao = Core.getParamArray("p_selecionar_opcao");
		if(Core.isNotNull(model.getApplication_id()) && p_selecionar_opcao!=null) {
			String aux = Arrays.toString(p_selecionar_opcao);
			aux = aux.replace("[", "").replace("]", "");
			model.setExport_type(aux);
			new ExportSqlHelper().loadDataExport(view,model,p_selecionar_opcao);
		}
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionVoltar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Wizard_export_step_2 model = new Wizard_export_step_2();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","Wizard_export_step_1","index", this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(voltar)----*/
		
		
		/*----#end-code----*/
		return this.redirect("igrp_studio","Wizard_export_step_1","index", this.queryString());	
	}
	
	public Response actionFinalizar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Wizard_export_step_2 model = new Wizard_export_step_2();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","Wizard_export_step_2","index", this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(finalizar)----*/
		byte[] bytes = new ExportHelper().export(model);
		if(bytes!=null) {
			return this.xSend(bytes,model.getFile_name() + ".jar", Core.MimeType.APPLICATION_JAR, true);
		}
		this.loadQueryString();
		String[] opcoes = model.getExport_type().split(",");
		for(String opc:opcoes) {
			this.addQueryString("p_selecionar_opcao",opc);
		}
		/*----#end-code----*/
		return this.redirect("igrp_studio","Wizard_export_step_2","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
