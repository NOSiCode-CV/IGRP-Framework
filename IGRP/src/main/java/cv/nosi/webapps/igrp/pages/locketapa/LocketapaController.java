package cv.nosi.webapps.igrp.pages.locketapa;

import java.io.IOException;//

import cv.nosi.core.webapp.Response;
import cv.nosi.core.webapp.mvc.Controller;
import cv.nosi.core.webapp.util.Core;
import cv.nosi.core.webapp.util.helpers.database.QueryInterface;
import cv.nosi.core.webapp.util.helpers.database.ResultSet;


/*----#end-code----*/
		
public class LocketapaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Locketapa model = new Locketapa();
		model.load();
		LocketapaView view = new LocketapaView();
		view.processid.setParam(true);
		view.taskid.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as codigo,'Perspiciatis labore officia anim rem deserunt omnis deserunt sed omnis labore iste lorem laudantium' as organica,'Sit totam doloremque amet ut anim rem anim amet perspiciatis aliqua officia omnis consectetur ipsum' as perfil,'hidden-cdf1_d5ba' as processid,'' as taskid "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionDesbloquear() throws IOException, IllegalArgumentException, IllegalAccessException{
		Locketapa model = new Locketapa();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_processid",Core.getParam("p_processid"));
		  this.addQueryString("p_taskid",Core.getParam("p_taskid"));
		  return this.forward("igrp","Locketapa","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(desbloquear)----*/
		
		
		/*----#end-code----*/
		return this.redirect("igrp","Locketapa","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
