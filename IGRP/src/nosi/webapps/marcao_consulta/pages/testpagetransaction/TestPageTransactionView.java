/*-------------------------*/

/*Create View*/

package nosi.webapps.marcao_consulta.pages.testpagetransaction;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class TestPageTransactionView extends View {
	public String title = "Test Page Transaction";		
	
	public Field number_1;
	public Field text_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public TestPageTransactionView(TestPageTransaction model){			
		form_1 = new IGRPForm("form_1");
		number_1 = new NumberField(model,"number_1");
		number_1.setLabel("Number");
		number_1.propertie().add("name","p_number_1").add("type","number").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		text_1 = new TextField(model,"text_1");
		text_1.setLabel("Text");
		text_1.propertie().add("name","p_text_1").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","marcao_consulta","TestPageTransaction","gravar","submit","default|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar").add("flg_transaction","true");
		
	
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;


		form_1.addField(number_1);
		form_1.addField(text_1);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/