
package nosi.webapps.tutorial.pages.video_instalar_igrp_web;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;



public class Video_instalar_igrp_webView extends View {

	public Field paragraph_1_text;
	public Field video_1_text;
	public IGRPForm paragraph_1;
	public IGRPVideo video_1;


	public Video_instalar_igrp_webView(){

		this.setPageTitle("video instalar igrp web");
			
		paragraph_1 = new IGRPForm("paragraph_1","Baixar e instalar IGRP WEB");

		video_1 = new IGRPVideo("video_1","Como importar o IGRP WEB (GitHub)");

		paragraph_1_text = new TextField(model,"paragraph_1_text");
		paragraph_1_text.setLabel(gt(""));
		paragraph_1_text.setValue(gt("Nessa sessão mostra como baixar e instalar o IGRP WEB, importar o IGRP WEB do repositório GitHub directamente do Eclipse IDE."));
		paragraph_1_text.propertie().add("type","text").add("name","p_paragraph_1_text").add("maxlength","4000");
		
		video_1_text = new TextField(model,"video_1_text");
		video_1_text.setLabel(gt(""));
		video_1_text.setValue(gt("https://www.youtube.com/embed/_17K4AoM4c4"));
		video_1_text.propertie().add("type","text").add("name","p_video_1_text").add("maxlength","4000");
		


		
	}
		
	@Override
	public void render(){
		
		paragraph_1.addField(paragraph_1_text);

		video_1.addField(video_1_text);

		this.addToPage(paragraph_1);
		this.addToPage(video_1);
	}
		
	@Override
	public void setModel(Model model) {
			

		
	}
}
