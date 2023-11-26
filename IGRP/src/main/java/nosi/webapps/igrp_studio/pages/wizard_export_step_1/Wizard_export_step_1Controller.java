package nosi.webapps.igrp_studio.pages.wizard_export_step_1;

import java.io.IOException;
import java.lang.String;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
/*----#end-code----*/

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;
import nosi.webapps.igrp.dao.Application;

public class Wizard_export_step_1Controller extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Wizard_export_step_1 model = new Wizard_export_step_1();
		model.load();
		Wizard_export_step_1View view = new Wizard_export_step_1View();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		view.selecionar_opcao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/*----#start-code(index)----*/	
		
		final Application app = Core.findApplicationById(Integer.valueOf(model.getApplication_id()));
		final String nomeApp = app.getName();
		final String fileName = Core.getParam("p_file_name");
		final String sql = this.getSql(app.getDad());
		
		model.setFile_name(Core.isNull(fileName) ? nomeApp + "_igrpweb_v." + Config.VERSION : fileName);
		model.setHelp(this.getConfig().getResolveUrl("tutorial", "Listar_documentos", "index&p_type=import"));
		
		if (Core.isNotNull(sql))
			view.selecionar_opcao.setQuery(Core.query(null, sql));
		
		view.sectionheader_1_text.setValue(String.format("%s: %s - %s 1", Core.gt("Exportação"), nomeApp, Core.gt("Passo")));
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionSeguinte() throws IOException, IllegalArgumentException, IllegalAccessException{
		Wizard_export_step_1 model = new Wizard_export_step_1();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp_studio","wizard_export_step_1","index",this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(seguinte)----*/

		final String[] p_selecionar_opcao = Core.getParamArray("p_selecionar_opcao");
		if (p_selecionar_opcao != null) {
			for (String opc : p_selecionar_opcao) {
				this.addQueryString("p_selecionar_opcao", opc);
			}
			this.addQueryString("p_application_id", model.getApplication_id());
			this.addQueryString("p_file_name", model.getFile_name());
			return this.redirect("igrp_studio", "Wizard_export_step_2", "index", this.queryString());
		} else
			Core.setMessageError(Core.gt("Por favor selecione as opções abaixo"));
		
		/*----#end-code----*/
		return this.redirect("igrp_studio","wizard_export_step_1","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/
	
private String getSql(String dad) {
	StringBuilder sql = new StringBuilder();
	try {
		boolean hasBPMN= new ProcessDefinitionIGRP().hasBPMN(dad);
		List<OptionsImportExport> list = Arrays.stream(OptionsImportExport.values())
				.filter(p -> p != OptionsImportExport.APP && p != OptionsImportExport.MODULO && p != OptionsImportExport.BPMN_DOCUMENT_TYPE)
				.filter(p -> p == OptionsImportExport.BPMN? hasBPMN:true)
				.collect(Collectors.toList());
		int index = 0;
		for (OptionsImportExport type : list) {
			if (type != null) {
				sql.append("SELECT " + type.getValor() + " as ID,'" + type.getDescricao() + "' as NAME");
				if (index++ != list.size() - 1)
					sql.append(" UNION ");
			}
		}
		sql.append(" ORDER BY id");
	} catch (Exception e) {
		e.printStackTrace();
	}
	sql.trimToSize();
	return sql.toString();
}
		
	/*----#end-code----*/
}
