package nosi.webapps.igrp.pages.generator;

import nosi.core.gui.generator.Generator2_3;
import nosi.core.webapp.View;

public class GeneratorView extends View{

	@Override
	public void render(){
		
		Generator2_3 gen23 = new Generator2_3();
		
		this.addToPage(gen23);
	}
}
