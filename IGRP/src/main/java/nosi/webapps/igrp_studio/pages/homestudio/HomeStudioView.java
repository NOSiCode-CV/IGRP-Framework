
package nosi.webapps.igrp_studio.pages.homestudio;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;

public class HomeStudioView extends View {
	
	

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gestao_de_paginas;
	public IGRPButton btn_crud_gen;
	public IGRPButton btn_importjar;
	public IGRPButton btn_report_design;
	public IGRPForm form_1;
	
	public HomeStudioView(HomeStudio model){
		this.setPageTitle("Home IGRP Studio");
			
		form_1 = new IGRPForm("form_1","Form");
		
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gestao_de_paginas = new IGRPButton("Page Builder","igrp_studio","HomeStudio","gestao_de_paginas","_self","success|fa-gears","","");
		btn_gestao_de_paginas.propertie.add("type","specific").add("code","").add("rel","gestao_de_paginas");
		btn_importjar = new IGRPButton("Import.jar","igrp_studio","HomeStudio","importjar","_self","danger|fa-file-archive-o","","");
		btn_importjar.propertie.add("type","specific").add("code","").add("rel","importjar");
		btn_report_design = new IGRPButton("Report Design","igrp_studio","HomeStudio","report_design","_self","black|fa-file","","");
		btn_report_design.propertie.add("type","specific").add("code","").add("rel","report_design");
		btn_crud_gen = new IGRPButton("CRUD Generator","igrp_studio","HomeStudio","crud_gen","_self","success|fa-gears","","");
		btn_crud_gen.propertie.add("type","specific").add("code","").add("rel","crud_gen");
		
	}
		
	@Override
	public void render(){
		

		toolsbar_1.addButton(btn_gestao_de_paginas);
		toolsbar_1.addButton(btn_importjar);
		toolsbar_1.addButton(btn_report_design);
		toolsbar_1.addButton(btn_crud_gen);
		this.addToPage(toolsbar_1);
		this.addToPage(form_1);
	}
}
