/*-------------------------*/

/*Create View*/

package nosi.webapps.marcao_consulta.pages.testepagina;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class TestePaginaView extends View {
	public String title = "";		
	
	public Field sectionheader_1_text;
	public Field nome;
	public Field email_1;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_button_1;
	public TestePaginaView(TestePagina model){			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Novo Aluno");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		email_1 = new EmailField(model,"email_1");
		email_1.setLabel("Email");
		email_1.propertie().add("name","p_email_1").add("type","email").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_button_1 = new IGRPButton("Button","marcao_consulta","TestePagina","button_1","_blank","default|fa-angle-right","","");
		btn_button_1.propertie.add("type","specific").add("code","").add("rel","button_1");
		
	
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(nome);
		form_1.addField(email_1);

		toolsbar_1.addButton(btn_button_1);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/