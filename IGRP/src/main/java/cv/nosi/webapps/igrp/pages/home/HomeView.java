package cv.nosi.webapps.igrp.pages.home;

import cv.nosi.core.gui.components.IGRPHome;
import cv.nosi.core.webapp.mvc.View;

public class HomeView extends View{
	public String title;
	private IGRPHome home;
	public HomeView(){
		this.home = new IGRPHome("home");
	}
	@Override
	public void render() {
		this.addToPage(home);
	}

}
