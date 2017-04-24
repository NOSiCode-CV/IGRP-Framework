package nosi.webapps.igrp.pages.defaultpagina;

import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.fields.*;
import nosi.core.webapp.View;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public class DefaultpaginaView extends View{

	@Override
	public void render(){
		
		IGRPForm form = new IGRPForm("form_1");
		
		System.out.println("Ok View");
		
		this.addToPage(form);
	}

}
