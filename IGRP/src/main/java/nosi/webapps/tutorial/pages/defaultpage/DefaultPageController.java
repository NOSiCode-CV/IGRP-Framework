package nosi.webapps.tutorial.pages.defaultpage;


import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.config.Config;

/*----#end-code----*/
		
public class DefaultPageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		DefaultPage model = new DefaultPage();
		model.load();
		model.loadCarousel_1(
				Core.query(null,"SELECT 'Img' as carousel_1_label,'"+new Config().getLinkImg()+"/assets/img/tutorial/home_dashboard.png' as carousel_1_img"+
								" UNION SELECT 'Img' as carousel_1_label,'"+new Config().getLinkImg()+"/assets/img/tutorial/home_igrp_studio.png' as carousel_1_img"+
								" UNION SELECT 'Img' as carousel_1_label,'"+new Config().getLinkImg()+"/assets/img/tutorial/home_tutorial2.png' as carousel_1_img")
		 );
		DefaultPageView view = new DefaultPageView();
		/*----#start-code(index)----*/
		
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
