package nosi.webapps.igrp.pages.home;

import nosi.core.gui.components.IGRPHome;
import nosi.core.webapp.View;

public class HomeView extends View{

	@Override
	public void render() {
		IGRPHome home = new IGRPHome("Home");
		this.addToPage(home);
	}

}
