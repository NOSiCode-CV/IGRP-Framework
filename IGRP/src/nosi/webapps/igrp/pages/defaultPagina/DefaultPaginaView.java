package nosi.webapps.igrp.pages.defaultPagina;

import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.fields.*;
import nosi.core.webapp.View;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public class DefaultPaginaView extends View{

	@Override
	public void render(){
		
		DefaultPaginaModel model1 = (DefaultPaginaModel) this.getModel("model1");
		
		
		IGRPForm form = new IGRPForm("form_1");
		
		this.addToPage(form);
	}

}
