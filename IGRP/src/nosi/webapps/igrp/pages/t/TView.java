/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.t;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class TView extends View {
	public String title = "Teste";		
	
	public Field text_1;
	public Field view_img;
	public IGRPView view_1;

	public TView(T model){			
		view_1 = new IGRPView("view_1");
		text_1 = new TextField(model,"text_1");
		text_1.setLabel("Text");
		text_1.propertie().add("name","p_text_1").add("type","text").add("maxlength","30");
		view_img = new TextField(model,"view_img");
		view_img.setLabel("");
		view_img.propertie().add("maxlength","300");

		
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		view_1.addField(text_1);
		view_1.addField(view_img);

		this.addToPage(view_1);
	}
}
/*-------------------------*/