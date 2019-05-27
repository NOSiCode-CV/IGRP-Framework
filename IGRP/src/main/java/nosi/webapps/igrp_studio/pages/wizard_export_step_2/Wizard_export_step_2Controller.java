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
		model.loadTable_bpmn(Core.query(null,"SELECT '1' as bpmn_ids,'Officia sed consectetur natus' as descricao_bpmn "));
		model.loadTable_pagina(Core.query(null,"SELECT '1' as pagina_ids,'Anim aliqua doloremque mollit' as descricao_pagina "));
		model.loadTable_report(Core.query(null,"SELECT '1' as report_ids,'Stract amet officia natus labo' as descricao_report "));
		model.loadTable_menu(Core.query(null,"SELECT '1' as menu_ids,'Natus labore voluptatem rem ap' as descricao_menu "));
		model.loadTable_domain(Core.query(null,"SELECT '1' as domain_ids,'Elit lorem magna doloremque ma' as descricao_domain "));
		model.loadTable_dao(Core.query(null,"SELECT '1' as dao_ids,'Officia unde officia lorem sit' as descricao_dao "));
		model.loadTable_others_class(Core.query(null,"SELECT '1' as others_class_ids,'Sed iste sed sit labore' as descricao_others_class "));
		model.loadTable_service(Core.query(null,"SELECT '1' as services_ids,'Deserunt anim labore lorem off' as descricao_services "));
		model.loadTable_connections(Core.query(null,"SELECT '1' as conexao_ids,'Totam lorem officia anim labor' as descricao_conexao "));
		model.loadTbl_transation(Core.query(null,"SELECT '1' as transation_ids,'Omnis iste sit adipiscing volu' as descricao_transation "));
		model.loadTable_modulo(Core.query(null,"SELECT '1' as modulo_ids,'Labore iste totam aperiam dolo' as descricao_modulo "));
		model.loadTable_doc_type(Core.query(null,"SELECT '1' as tipo_doc_ids,'Accusantium rem aperiam amet u' as descricao_tipo_doc "));
		view.modulo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
     	String nomeApp = Core.findApplicationById(model.getApplication_id()).getName();
		String[] p_selecionar_opcao = Core.getParamArray("p_selecionar_opcao");
		String aux = Arrays.toString(p_selecionar_opcao);
		if(Core.isNotNull(model.getApplication_id()) && p_selecionar_opcao!=null) {
			aux = aux.replace("[", "").replace("]", "");
			model.setExport_type(aux);
			new ExportSqlHelper().loadDataExport(view,model,p_selecionar_opcao);
		}
		final Map<Object, Object> map = Core.toMap(new Modulo().getModuloByApp(model.getApplication_id()), "name",
				"descricao", "-- Selecionar --");
        view.sectionheader_1_text.setValue(String.format("%s: %s - %s 2", Core.gt("Exportação"),nomeApp,Core.gt("Passo")));
 		view.modulo.setValue(map);
	   	view.modulo.setVisible(map.size() > 1);	  
	   //	Core.setMessageConfirm("Apos o download estiver concluido, feche a janela em branco");
	   	view.btn_voltar.addParameter("app_id", model.getApplication_id())
          				.addParameter("p_selecionar_opcao", p_selecionar_opcao);
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
		 return this.forward("igrp_studio","Wizard_export_step_1","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(voltar)----*/
		this.addQueryString("p_application_id", Core.getParam("app_id"));
		this.addQueryString("p_selecionar_opcao",Core.getParamArray("p_selecionar_opcao"));
		
      return this.redirect("igrp_studio","Wizard_export_step_1","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionFinalizar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Wizard_export_step_2 model = new Wizard_export_step_2();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","Wizard_export_step_1","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(finalizar)----*/
		byte[] bytes = new ExportHelper().export(model);
      	if(bytes!=null) {
			return this.xSend(bytes, model.getFile_name() + ".jar", Core.MimeType.APPLICATION_JAR, true);
      	}
		this.addQueryString("dad", "igrp_studio");
		this.addQueryString("p_application_id", model.getApplication_id());
       return this.forward("igrp_studio","Wizard_export_step_2","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#end-code----*/
			
	}
	
/*----#start-code(custom_actions)----*/

/*----#end-code----*/
}
