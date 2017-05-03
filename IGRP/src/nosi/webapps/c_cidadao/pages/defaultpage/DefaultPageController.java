package nosi.webapps.c_cidadao.pages.defaultpage;
import nosi.webapps.igrp.pages.home.HomeAppView;
import java.io.IOException;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Controller;

public class DefaultPageController extends Controller {	
	public void actionIndex() throws IOException{
		HomeAppView view = new HomeAppView();
		view.title = Igrp.getInstance().getRequest().getParameter("title");
		this.renderView(view,true);
	}
}