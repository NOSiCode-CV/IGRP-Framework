
package nosi.webapps.teste.pages.teste;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class TesteView extends View {
	
	
	public Field nome;
	public Field email;
	public Field nascimento;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_save;
	public TesteView(Teste model){
		this.setPageTitle("test");
			
		form_1 = new IGRPForm("form_1","");
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","50").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		email = new TextField(model,"email");
		email.setLabel(gt("Email"));
		
		email.propertie().add("name","p_email").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nascimento = new DateField(model,"nascimento");
		nascimento.setLabel(gt("Nascimento"));
		
		nascimento.propertie().add("name","p_nascimento").add("type","date").add("range","false").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_save = new IGRPButton("Save","teste","Teste","save","submit_form","default|fa-angle-right","","");
		btn_save.propertie.add("type","specific").add("code","").add("rel","save");
		
	}
		
	@Override
	public void render(){
		
		form_1.addField(nome);
		form_1.addField(email);
		form_1.addField(nascimento);


		toolsbar_1.addButton(btn_save);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
