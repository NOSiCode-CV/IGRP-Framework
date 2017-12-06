package nosi.webapps.igrp_studio.pages.defaultpage;

import nosi.webapps.igrp.pages.home.HomeAppView;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.User;

public class DefaultPageController extends Controller {
	
	public Response actionIndex() throws IOException {
//		User user = (User)Igrp.getInstance().getUser().getIdentity();
//		String username = user.getUser_name();
//		String password = user.getPass_hash();
//		String url = "http://" + username + ":" + password + "@" + "10.4.2.93/IGRP/igrpsso";
//		return this.redirectToUrl(url);
		HomeAppView view = new HomeAppView();
		view.title = "IGRP Studio";
		return this.renderView(view,true);
	}
}