
package nosi.webapps.app_test.pages.pagetest;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class PageTestView extends View {
	
	
	public Field nome;
	public Field data_nascimento;
	public Field morada;
	public Field p_id;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public PageTestView(PageTest model){
		this.setPageTitle("Page Test");
			
		form_1 = new IGRPForm("form_1","");
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		data_nascimento = new DateField(model,"data_nascimento");
		data_nascimento.setLabel(gt("Data Nascimento"));
		
		data_nascimento.propertie().add("name","p_data_nascimento").add("type","date").add("range","false").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		morada = new TextField(model,"morada");
		morada.setLabel(gt("Morada"));
		
		morada.propertie().add("name","p_morada").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","app_test","PageTest","gravar","submit_form","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		

		form_1.addField(nome);
		form_1.addField(data_nascimento);
		form_1.addField(morada);
		form_1.addField(p_id);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
