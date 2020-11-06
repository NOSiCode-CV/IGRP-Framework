
package nosi.webapps.tutorial.pages.video_instalar_igrp_web;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class Video_instalar_igrp_webController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Video_instalar_igrp_web model = new Video_instalar_igrp_web();
		model.load();
		Video_instalar_igrp_webView view = new Video_instalar_igrp_webView();
		/*----#start-code(index)----*/
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
