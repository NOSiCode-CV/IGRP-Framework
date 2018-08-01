
package nosi.webapps.tutorial.pages.defaultpage;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import nosi.core.config.Config;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/


/*----#end-code----*/
public class DefaultpageController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		Defaultpage model = new Defaultpage();
		model.load();
		DefaultpageView view = new DefaultpageView();
		/*----#start-code(index)----*/
		
		
/*----#end-code----*/		view.setModel(model);
		return this.renderView(view);	
	}
	
	/*----#start-code(custom_actions)----*/
	
	
/*----#end-code----*/	}
