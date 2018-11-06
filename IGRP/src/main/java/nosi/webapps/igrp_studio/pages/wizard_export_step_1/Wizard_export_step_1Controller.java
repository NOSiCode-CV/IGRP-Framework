package nosi.webapps.igrp_studio.pages.wizard_export_step_1;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.webapp.import_export_v2.common.OptionsImportExport;


/*----#end-code----*/
		
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
		String sql = this.getSql();		
		if(Core.isNotNull(sql)) {
			view.selecionar_opcao.setQuery(Core.query(null,sql));
		}
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
		 return this.forward("igrp_studio","Wizard_export_step_2","index", this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(seguinte)----*/
		String[] p_selecionar_opcao = Core.getParamArray("p_selecionar_opcao");
		if(p_selecionar_opcao!=null) {
			for(String opc:p_selecionar_opcao) {
				this.addQueryString("p_selecionar_opcao",opc);
			}
			this.addQueryString("p_application_id", model.getApplication_id());
			return this.redirect("igrp_studio", "Wizard_export_step_2", "index",this.queryString());
		}else {
			Core.setMessageError(Core.gt("Por favor selecione as opções abaixo"));
		}
		
		/*----#end-code----*/
		return this.redirect("igrp_studio","Wizard_export_step_2","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/
	
		private String getSql() {
			String sql = "";
			int count = 0;
			int size = OptionsImportExport.values().length;
			for(OptionsImportExport type:OptionsImportExport.values()) {
				if(type.getValor()!=0) {
					sql += "SELECT "+type.getValor()+" as ID,'"+type.getDescricao()+"' as NAME ";
				}
				++count;
				if(count!=size && type.getValor()!=0) {
					sql +=" UNION ";
				}
			}
			sql += " ORDER BY id";
			return sql;
		}
	/*----#end-code----*/
}
