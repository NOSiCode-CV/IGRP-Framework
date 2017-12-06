/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.detalhesprocesso;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

import static nosi.core.i18n.Translator.gt;

public class DetalhesProcessoView extends View {
	
	
	public Field sectionheader_1_text;
	public IGRPSectionHeader sectionheader_1;

	public DetalhesProcessoView(DetalhesProcesso model){
		this.setPageTitle(gt("Detalhes Processo"));
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		
		sectionheader_1_text.setValue(gt("Detalhes de Processo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		this.addToPage(sectionheader_1);
	}
}
/*-------------------------*/