package nosi.webapps.igrp_studio.pages.wsdl2java;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class Wsdl2javaView extends View {

	public Field aplicacao;
	public Field url_wsdl;
	public IGRPForm form_1;

	public IGRPButton btn_generate;

	public Wsdl2javaView(){

		this.setPageTitle("WSDL2Java");
			
		form_1 = new IGRPForm("form_1","");

		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","String");
		
		url_wsdl = new TextField(model,"url_wsdl");
		url_wsdl.setLabel(gt("URL WSDL"));
		url_wsdl.propertie().add("name","p_url_wsdl").add("type","text").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false");
		


		btn_generate = new IGRPButton("Generate","igrp_studio","Wsdl2java","generate","alert_submit","primary|fa-gear","","");
		btn_generate.propertie.add("type","form").add("rel","generate");

		
	}
		
	@Override
	public void render(){
		
		form_1.addField(aplicacao);
		form_1.addField(url_wsdl);

		form_1.addButton(btn_generate);
		this.addToPage(form_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		aplicacao.setValue(model);
		url_wsdl.setValue(model);	

		}
}
