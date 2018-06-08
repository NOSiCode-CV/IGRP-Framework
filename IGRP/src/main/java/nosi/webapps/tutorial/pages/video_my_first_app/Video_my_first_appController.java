
package nosi.webapps.tutorial.pages.video_my_first_app;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

/*----#end-code----*/


public class Video_my_first_appController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Video_my_first_app model = new Video_my_first_app();
		model.load();
		Video_my_first_appView view = new Video_my_first_appView();
		/*----#start-code(index)----*/
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
	}
