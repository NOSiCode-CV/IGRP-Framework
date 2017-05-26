/*-------------------------*/

/*Create View*/

package nosi.webapps.marcao_consulta.pages.pagetesttransaction;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class PageTestTransactionView extends View {
	public String title = "Page Test Transaction";		
	
	public Field text_1;
	public Field number_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_transaction_1;
	public PageTestTransactionView(PageTestTransaction model){			
		form_1 = new IGRPForm("form_1");
		text_1 = new TextField(model,"text_1");
		text_1.setLabel("Text");
		text_1.propertie().add("name","p_text_1").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		number_1 = new NumberField(model,"number_1");
		number_1.setLabel("Number");
		number_1.propertie().add("name","p_number_1").add("type","number").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_transaction_1 = new IGRPButton("Transaction 1","marcao_consulta","PageTestTransaction","transaction_1","_self","default|fa-angle-right","","");
		btn_transaction_1.propertie.add("type","specific").add("code","").add("rel","transaction_1").add("flg_transaction","true");
		
	
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;


		form_1.addField(text_1);
		form_1.addField(number_1);

		toolsbar_1.addButton(btn_transaction_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/