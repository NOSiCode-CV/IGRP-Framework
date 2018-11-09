package nosi.webapps.igrp_studio.pages.wizard_export_step_2;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.import_export_v2.exports.ExportHelper;
import nosi.core.webapp.import_export_v2.exports.ExportSqlHelper;
import nosi.webapps.igrp.dao.Modulo;
import java.util.Map;
import static nosi.core.i18n.Translator.gt;
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
		model.loadTable_bpmn(Core.query(null,"SELECT '1' as bpmn_ids,'Lorem officia stract totam sit' as descricao_bpmn "));
		model.loadTable_pagina(Core.query(null,"SELECT '1' as pagina_ids,'Stract officia natus sit conse' as descricao_pagina "));
		model.loadTable_domain(Core.query(null,"SELECT '1' as domain_ids,'Sit ipsum sit elit mollit' as descricao_domain "));
		model.loadTable_report(Core.query(null,"SELECT '1' as report_ids,'Perspiciatis mollit deserunt n' as descricao_report "));
		model.loadTable_dao(Core.query(null,"SELECT '1' as dao_ids,'Amet ipsum officia lorem molli' as descricao_dao "));
		model.loadTable_connections(Core.query(null,"SELECT '1' as conexao_ids,'Aperiam dolor perspiciatis lau' as descricao_conexao "));
		model.loadTable_menu(Core.query(null,"SELECT '1' as menu_ids,'Elit rem elit totam sed' as descricao_menu "));
		model.loadTable_modulo(Core.query(null,"SELECT '1' as modulo_ids,'Sit elit lorem sit elit' as descricao_modulo "));
		view.modulo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		String[] p_selecionar_opcao = Core.getParamArray("p_selecionar_opcao");
     	String nomeApp = Core.findApplicationById(model.getApplication_id()).getName();
		if(Core.isNotNull(model.getApplication_id()) && p_selecionar_opcao!=null) {
			String aux = Arrays.toString(p_selecionar_opcao);
			aux = aux.replace("[", "").replace("]", "");
			model.setExport_type(aux);
			new ExportSqlHelper().loadDataExport(view,model,p_selecionar_opcao);
		}
		final Map<Object, Object> map = Core.toMap(new Modulo().getModuloByApp(model.getApplication_id()), "name",
				"descricao", "-- Selecionar --");
        view.sectionheader_1_text.setValue(String.format("%s: %s - %s 2", gt("Exportação"),nomeApp,gt("Passo")));
 		view.modulo.setValue(map);
	   	view.modulo.setVisible(map.size() > 1);
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
		 return this.forward("igrp_studio","Env","index", this.queryString()); //if submit, loads the values  ----#gen-example */
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
		return this.redirect("igrp_studio","Env","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
