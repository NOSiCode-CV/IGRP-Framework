package nosi.webapps.tutorial.pages.defaultpage;

import java.io.IOException;

import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.webapp.databse.helpers.ResultSet;

/*----#end-code----*/
		
public class DefaultPageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		DefaultPage model = new DefaultPage();
		model.load();
		model.setInfopanel_1_title("Guide - How to change this home page?");
		model.setInfopanel_1_val("");
		model.setInfopanel_1_url(Core.getIGRPLink("tutorial","Video_gestao_de_aplicacao","index"));
		model.setInfopanel_1_bg("cp-irises");
		model.setInfopanel_1_icn("fa-github-square");
		model.loadCarousel_1(
				Core.query(null,"SELECT 'Img' as carousel_1_label,'../images/IGRP/IGRP2.3/assets/img/tutorial/home_dashboard.png' as carousel_1_img"+
								" UNION SELECT 'Img' as carousel_1_label,'../images/IGRP/IGRP2.3/assets/img/tutorial/home_igrp_studio.png' as carousel_1_img"+
								" UNION SELECT 'Img' as carousel_1_label,'../images/IGRP/IGRP2.3/assets/img/tutorial/home_tutorial2.png' as carousel_1_img")
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
