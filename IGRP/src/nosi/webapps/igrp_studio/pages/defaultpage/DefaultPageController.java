package nosi.webapps.igrp_studio.pages.defaultpage;

import nosi.webapps.igrp.pages.home.HomeAppView;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.User;

public class DefaultPageController extends Controller {
	
	public Response actionIndex() throws IOException {
		/*User user = (User)Igrp.getInstance().getUser().getIdentity();
		String username = user.getUser_name();
		String password = user.getPass_hash();
		//String url = "http://" + username + ":" + password + "@" + "10.4.2.93/IGRP/igrpsso" + "?_url=igrp_studio/default-page/index";
		String url = "http://" + username + ":" + password + "@" + "localhost:8080/IGRP/igrpsso" + "?_url=igrp_studio/default-page/index";
		return this.redirectToUrl(url);*/
		Application app = new Application().find().andWhere("dad","=","igrp_studio").one();
		if(app!=null && app.getAction()!=null) {
			return this.redirect(app.getDad().toLowerCase(),app.getAction().getPage(), "index");
		}
		HomeAppView view = new HomeAppView();
		view.title = "IGRP Studio";
		view.home.type_home = "home-app-studio";		
		return this.renderView(view,true);
	}
}
