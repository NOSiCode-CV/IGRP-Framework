package nosi.webapps.opendata.pages.defaultpage;
import nosi.webapps.igrp.pages.home.HomeAppView;
import java.io.IOException;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Response;
public class DefaultPageController extends Controller {	
public Response actionIndex() throws IOException{
HomeAppView view = new HomeAppView();
view.title = "OpenData";
return this.renderView(view,true);
}
}