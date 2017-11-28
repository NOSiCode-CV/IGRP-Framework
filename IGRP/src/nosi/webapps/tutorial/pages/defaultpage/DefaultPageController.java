package nosi.webapps.tutorial.pages.defaultpage;
import nosi.webapps.igrp.pages.home.HomeAppView;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.Controller;
public class DefaultPageController extends Controller {	
public Response actionIndex() throws IOException{
HomeAppView view = new HomeAppView();
view.title = "Tutorial IGRP";
return this.renderView(view,true);
}
}