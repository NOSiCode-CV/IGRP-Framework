package nosi.webapps.app_teste.pages.split_image;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/


/*----#end-code----*/
		
public class Split_imageController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Split_image model = new Split_image();
		model.load();
		Split_imageView view = new Split_imageView();
		/*----#start-code(index)----*/
		
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
