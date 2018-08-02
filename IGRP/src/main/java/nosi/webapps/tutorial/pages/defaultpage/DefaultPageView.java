
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
	public Field infopanel_1_title;
	public Field infopanel_1_val;
	public Field infopanel_1_url;
	public Field infopanel_1_bg;
	public Field infopanel_1_icn;
	public IGRPForm sectionheader_1;
	public IGRPForm infopanel_1;


	public DefaultPageView(){

		this.setPageTitle("DefaultPage");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		infopanel_1 = new IGRPForm("infopanel_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Sectionheader"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		infopanel_1_title = new TextField(model,"infopanel_1_title");
		infopanel_1_title.setLabel(gt("Title"));
		infopanel_1_title.setValue(gt("Infopanel"));
		infopanel_1_title.propertie().add("name","p_infopanel_1_title").add("type","text").add("maxlength","4000");
		
		infopanel_1_val = new TextField(model,"infopanel_1_val");
		infopanel_1_val.setLabel(gt("Value"));
		infopanel_1_val.setValue(gt("65"));
		infopanel_1_val.propertie().add("name","p_infopanel_1_val").add("type","text").add("maxlength","4000");
		
		infopanel_1_url = new TextField(model,"infopanel_1_url");
		infopanel_1_url.setLabel(gt(""));
		infopanel_1_url.setValue(new Config().getResolveUrl("tutorial","DefaultPage","index"));
		infopanel_1_url.propertie().add("name","p_infopanel_1_url").add("type","text").add("maxlength","4000");
		
		infopanel_1_bg = new TextField(model,"infopanel_1_bg");
		infopanel_1_bg.setLabel(gt("Background"));
		infopanel_1_bg.setValue(gt("cp-cyan"));
		infopanel_1_bg.propertie().add("name","p_infopanel_1_bg").add("type","text").add("maxlength","4000");
		
		infopanel_1_icn = new TextField(model,"infopanel_1_icn");
		infopanel_1_icn.setLabel(gt("Icon"));
		infopanel_1_icn.setValue(gt("fa-info"));
		infopanel_1_icn.propertie().add("name","p_infopanel_1_icn").add("type","text").add("maxlength","4000");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		infopanel_1.addField(infopanel_1_title);
		infopanel_1.addField(infopanel_1_val);
		infopanel_1.addField(infopanel_1_url);
		infopanel_1.addField(infopanel_1_bg);
		infopanel_1.addField(infopanel_1_icn);

		this.addToPage(sectionheader_1);
		this.addToPage(infopanel_1);
	}
		
	@Override
	public void setModel(Model model) {
			

		
	}
}
