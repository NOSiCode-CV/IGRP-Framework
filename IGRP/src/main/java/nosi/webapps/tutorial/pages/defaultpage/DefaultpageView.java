
package nosi.webapps.tutorial.pages.defaultpage;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class DefaultpageView extends View {

	public Field sectionheader_1_text;
	public Field paragraph_1_text;
	public Field statbox_1_title;
	public Field statbox_1_val;
	public Field statbox_1_txt;
	public Field statbox_1_url;
	public Field statbox_1_bg;
	public Field statbox_1_icn;
	public IGRPForm sectionheader_1;
	public IGRPForm paragraph_1;
	public IGRPForm statbox_1;


	public DefaultpageView(){

		this.setPageTitle("DefaultPage");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		paragraph_1 = new IGRPForm("paragraph_1","");

		statbox_1 = new IGRPStatBox("statbox_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("How to change first page of the application?"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		paragraph_1_text = new TextField(model,"paragraph_1_text");
		paragraph_1_text.setLabel(gt(""));
		paragraph_1_text.setValue(gt("( data inside XSL tab) by Jobs, Steve Jobs"));
		paragraph_1_text.propertie().add("type","text").add("name","p_paragraph_1_text").add("maxlength","40");
		
		statbox_1_title = new TextField(model,"statbox_1_title");
		statbox_1_title.setLabel(gt("Box Title"));
		statbox_1_title.setValue(gt("FAQ"));
		statbox_1_title.propertie().add("name","p_statbox_1_title").add("type","text").add("maxlength","4000");
		
		statbox_1_val = new TextField(model,"statbox_1_val");
		statbox_1_val.setLabel(gt("Value"));
		statbox_1_val.setValue(gt(""));
		statbox_1_val.propertie().add("name","p_statbox_1_val").add("type","text").add("maxlength","4000");
		
		statbox_1_txt = new TextField(model,"statbox_1_txt");
		statbox_1_txt.setLabel(gt("Url Text"));
		statbox_1_txt.setValue(gt("Go to..."));
		statbox_1_txt.propertie().add("name","p_statbox_1_txt").add("type","text").add("maxlength","4000");
		
		statbox_1_url = new TextField(model,"statbox_1_url");
		statbox_1_url.setLabel(gt("Url"));
		statbox_1_url.setValue(gt("https://nosicode.gitbook.io/faq/beginner/how-to-change-the-first-page-home-of-an-application"));
		statbox_1_url.propertie().add("name","p_statbox_1_url").add("type","text").add("maxlength","4000");
		
		statbox_1_bg = new TextField(model,"statbox_1_bg");
		statbox_1_bg.setLabel(gt("Background"));
		statbox_1_bg.setValue(gt("cp-cyan"));
		statbox_1_bg.propertie().add("name","p_statbox_1_bg").add("type","text").add("maxlength","4000");
		
		statbox_1_icn = new TextField(model,"statbox_1_icn");
		statbox_1_icn.setLabel(gt("Icon"));
		statbox_1_icn.setValue(gt("fa-info"));
		statbox_1_icn.propertie().add("name","p_statbox_1_icn").add("type","text").add("maxlength","4000");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		paragraph_1.addField(paragraph_1_text);

		statbox_1.addField(statbox_1_title);
		statbox_1.addField(statbox_1_val);
		statbox_1.addField(statbox_1_txt);
		statbox_1.addField(statbox_1_url);
		statbox_1.addField(statbox_1_bg);
		statbox_1.addField(statbox_1_icn);

		this.addToPage(sectionheader_1);
		this.addToPage(paragraph_1);
		this.addToPage(statbox_1);
	}
		
	@Override
	public void setModel(Model model) {
			

		
	}
}
