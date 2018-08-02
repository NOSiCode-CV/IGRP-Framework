
package nosi.webapps.tutorial.pages.defaultpage;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class DefaultPageView extends View {

	public Field sectionheader_1_text;
	public IGRPForm sectionheader_1;


	public DefaultPageView(){

		this.setPageTitle("DefaultPage");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Sectionheader"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		this.addToPage(sectionheader_1);
	}
		
	@Override
	public void setModel(Model model) {
			

		
	}
}
