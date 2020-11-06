package nosi.webapps.igrp.pages.errorpage;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;

public class ErrorPageView extends View {


	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_voltar;

	public ErrorPageView(){

		this.setPageTitle("Pagina de Erro");
			

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_voltar = new IGRPButton("Voltar","igrp","ErrorPage","voltar","_back","info|fa-chevron-left","","");
		btn_voltar.propertie.add("type","specific").add("rel","voltar");

		
	}
		
	@Override
	public void render(){
		

		toolsbar_1.addButton(btn_voltar);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
			

		}
}
