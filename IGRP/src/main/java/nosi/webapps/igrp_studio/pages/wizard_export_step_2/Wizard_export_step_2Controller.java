package nosi.webapps.igrp_studio.pages.wizard_export_step_2;

import java.io.IOException;
import java.util.Map;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.helpers.mime_type.MimeType;
import nosi.core.webapp.import_export_v2.exports.ExportHelper;
import nosi.core.webapp.import_export_v2.exports.ExportSqlHelper;
import nosi.webapps.igrp.dao.Modulo;

import java.util.Arrays;
import java.util.List;
/*----#end-code----*/
		
public class Wizard_export_step_2Controller extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Wizard_export_step_2 model = new Wizard_export_step_2();
		model.load();
		Wizard_export_step_2View view = new Wizard_export_step_2View();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_bpmn(Core.query(null,"SELECT '1' as bpmn_ids,'Aliqua unde deserunt labore of' as descricao_bpmn "));
		model.loadTable_pagina(Core.query(null,"SELECT '1' as pagina_ids,'Voluptatem unde natus laudanti' as descricao_pagina "));
		model.loadTable_report(Core.query(null,"SELECT '1' as report_ids,'Labore mollit voluptatem strac' as descricao_report "));
		model.loadTable_service(Core.query(null,"SELECT '1' as services_ids,'Mollit aperiam iste unde totam' as descricao_services "));
		model.loadTable_doc_type(Core.query(null,"SELECT '1' as tipo_doc_ids,'Ipsum totam adipiscing deserun' as descricao_tipo_doc "));
		model.loadTable_others_class(Core.query(null,"SELECT '1' as others_class_ids,'Perspiciatis natus consectetur' as descricao_others_class "));
		model.loadTable_menu(Core.query(null,"SELECT '1' as menu_ids,'Adipiscing sit lorem perspicia' as descricao_menu "));
		model.loadTable_connections(Core.query(null,"SELECT '1' as conexao_ids,'Omnis iste amet ipsum mollit' as descricao_conexao "));
		model.loadTable_modulo(Core.query(null,"SELECT '1' as modulo_ids,'Rem omnis totam voluptatem ame' as descricao_modulo "));
		model.loadTable_dao(Core.query(null,"SELECT '1' as dao_ids,'Ipsum ut voluptatem magna sit' as descricao_dao "));
		model.loadTable_domain(Core.query(null,"SELECT '1' as domain_ids,'Doloremque ut voluptatem omnis' as descricao_domain "));
		model.loadTbl_transation(Core.query(null,"SELECT '1' as transation_ids,'Labore deserunt aperiam aliqua' as descricao_transation "));
		view.modulo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		final String nomeApp = Core.findApplicationById(model.getApplication_id()).getName();
		String[] p_selecionar_opcao = Core.getParamArray("p_selecionar_opcao");
		if (p_selecionar_opcao != null) {
			String aux = Arrays.toString(p_selecionar_opcao);
			aux = aux.replace("[", "").replace("]", "");
			model.setExport_type(aux);
		} else if (model.getExport_type() != null)
			p_selecionar_opcao = model.getExport_type().split(", ");
	
		if (Core.isNotNullMultiple(model.getApplication_id(), p_selecionar_opcao))
			new ExportSqlHelper().loadDataExport(view, model, p_selecionar_opcao);
		
		List<Modulo> moduloByApp = new Modulo().getModuloByApp(model.getApplication_id());
		final Map<Object, Object> map = Core.toMap(moduloByApp, "name", "descricao", "-- Selecionar --");
		
        view.sectionheader_1_text.setValue(String.format("%s: %s - %s 2", Core.gt("Exportação"),nomeApp,Core.gt("Passo")));
 		view.modulo.setValue(map);
	   	view.modulo.setVisible(map.size() > 1);	  
	   	view.btn_voltar.addParameter("app_id", model.getApplication_id()).addParameter("p_selecionar_opcao", p_selecionar_opcao);
	   	
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
		 return this.forward("igrp_studio","wizard_export_step_2","index",this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(voltar)----*/
		this.addQueryString("p_application_id", Core.getParam("app_id"));
		this.addQueryString("p_selecionar_opcao",Core.getParamArray("p_selecionar_opcao"));
		this.addQueryString("p_file_name", model.getFile_name());
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
		  return this.forward("igrp_studio","Wizard_export_step_1","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(finalizar)----*/
		
		byte[] bytes = ExportHelper.export(model);
		if (bytes != null)
			return this.xSend(bytes, model.getFile_name() + ".jar", MimeType.APPLICATION_JAR, true);
		
		this.addQueryString("dad", "igrp_studio");
		this.addQueryString("p_application_id", model.getApplication_id());
		return this.forward("igrp_studio", "Wizard_export_step_2", "index", this.queryString());
		/*----#end-code----*/
			
	}
	
		
		
/*----#start-code(custom_actions)----*/

/*----#end-code----*/
}
