/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.teste;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class TesteView extends View {
	
	
	public Field sectionheader_1_text;
	public Field nome;
	public Field email_1;
	public Field file_1;
	public Field file_2;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPButton btn_enviar;
	public TesteView(Teste model){
		this.setPageTitle("Simple Test ...");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue("Simple Test");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","60").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel("Email");
		
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		file_1 = new FileField(model,"file_1");
		file_1.setLabel("File");
		
		file_1.propertie().add("name","p_file_1").add("type","file").add("maxlength","70").add("required","false").add("disabled","false").add("right","false").add("class","default");
		file_2 = new FileField(model,"file_2");
		file_2.setLabel("File");
		
		file_2.propertie().add("name","p_file_2").add("type","file").add("accept","").add("targetrend","").add("multiple","true").add("rendvalue","false").add("maxlength","50").add("required","false").add("disabled","false").add("right","false").add("class","default");

		btn_enviar = new IGRPButton("Enviar","igrp","Teste","enviar","submit_form","default|fa-angle-right","","");
		btn_enviar.propertie.add("type","form").add("code","").add("class","default").add("rel","enviar");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(nome);
		form_1.addField(email_1);
		form_1.addField(file_1);
		form_1.addField(file_2);

		form_1.addButton(btn_enviar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
	}
}
/*-------------------------*/