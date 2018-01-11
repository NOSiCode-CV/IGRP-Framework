package nosi.webapps.igrp.pages.home;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPHome;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.webapp.View;

public class HomeAppView extends View{
	public String title;
	public IGRPHome home;
	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gestao_de_paginas;
	public IGRPButton btn_import_jar;
	public IGRPButton btn_report_designer;
	
	public HomeAppView() {
		home = new IGRPHome("home-app");
	}
	@Override
	public void render() {
		Config.TITLE = this.title;
		this.addToPage(home);
	}

}
