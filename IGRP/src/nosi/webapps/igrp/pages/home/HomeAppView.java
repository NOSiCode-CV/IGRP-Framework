package nosi.webapps.igrp.pages.home;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPHome;
import nosi.core.webapp.View;

public class HomeAppView extends View{
	public String title;
	@Override
	public void render() {
		Config.TITLE = this.title;
		IGRPHome home = new IGRPHome("home-app");
		this.addToPage(home);
	}

}
