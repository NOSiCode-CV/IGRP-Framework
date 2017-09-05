/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.teste;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class TesteView extends View {
	
	
	public Field text_1;
	public Field number_1;
	public IGRPSeparatorList separatorlist_1;
	public IGRPFormList formlist_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_save;
	public TesteView(Teste model){
		this.setPageTitle("Teste");
			
		separatorlist_1 = new IGRPSeparatorList("separatorlist_1");
		formlist_1 = new IGRPFormList("formlist_1");
		text_1 = new TextField(model,"text_1");
		text_1.setLabel("Text");
		text_1.propertie().add("name","p_text_1").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("desc","true");
		number_1 = new NumberField(model,"number_1");
		number_1.setLabel("Number");
		number_1.propertie().add("name","p_number_1").add("type","number").add("min","").add("max","").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("desc","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_save = new IGRPButton("Save","agenda","Teste","save","submit","success|fa-save","","");
		btn_save.propertie.add("type","specific").add("code","").add("rel","save");
		
	
	}
		
	@Override
	public void render(){
		
		separatorlist_1.addField(text_1);
		separatorlist_1.addField(number_1);

		formlist_1.addField(text_1);
		formlist_1.addField(number_1);


		toolsbar_1.addButton(btn_save);
		this.addToPage(separatorlist_1);
		this.addToPage(formlist_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/