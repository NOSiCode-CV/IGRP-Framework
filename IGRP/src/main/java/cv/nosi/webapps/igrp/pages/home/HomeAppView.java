package cv.nosi.webapps.igrp.pages.home;

import cv.nosi.core.gui.components.IGRPButton;
import cv.nosi.core.gui.components.IGRPHome;
import cv.nosi.core.gui.components.IGRPToolsBar;
import cv.nosi.core.webapp.mvc.View;

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
		this.addToPage(home);
	}

}
