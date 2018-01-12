package nosi.webapps.tutorial.pages.defaultpage;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.pages.home.HomeAppView;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Controller;
public class DefaultPageController extends Controller {	
	public Response actionIndex() throws IOException{
		Application app = new Application().find().andWhere("dad","=","tutorial").one();
		if(app!=null && app.getAction()!=null) {
			return this.redirect(app.getDad().toLowerCase(),app.getAction().getPage(), "index");
		}
		HomeAppView view = new HomeAppView();
		view.title = "Tutorial IGRP";
		return this.renderView(view,true);
	}
}