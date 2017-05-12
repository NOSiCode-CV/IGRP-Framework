package nosi.webapps.igrp.pages.defaultpage;

import java.io.IOException;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.pages.home.HomeAppView;
public class DefaultPageController extends Controller{
	
	public void actionIndex() throws IOException{
		HomeAppView view = new HomeAppView();
		view.title = Igrp.getInstance().getRequest().getParameter("title");
		this.renderView(view,true);
	}
}
