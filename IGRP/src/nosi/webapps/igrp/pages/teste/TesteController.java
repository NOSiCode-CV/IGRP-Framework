/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.teste;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;

/*---- End ----*/

public class TesteController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		Teste model = new Teste();
		TesteView view = new TesteView(model);
		return this.renderView(view);
		/*---- End ----*/
	}

	public Response actionEditEventsCalendar_1() throws IOException{
		/*---- Insert your code here... ----*/
		Teste model = new Teste();
		//programming your save edit calendar
		Response response = new Response();
		response.setContentType(Response.FORMAT_XML);
		response.setContent("your message");
		return response;
		/*---- End ----*/
	}

	/*---- Insert your actions here... ----*//*---- End ----*/
}
