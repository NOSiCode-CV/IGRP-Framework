/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.teste;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import nosi.core.webapp.Response;
import nosi.core.webapp.UploadedFile;
import nosi.core.webapp.Igrp;

/*---- End ----*/

public class TesteController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		Teste model = new Teste();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
		}
		TesteView view = new TesteView(model);
		return this.renderView(view);
		/*---- End ----*/
	}

	public Response actionEnviar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		Teste model = new Teste();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			
		}
		return this.redirect("igrp","Teste","index");
		/*---- End ----*/
	}
	
	public Response actionTeste() {
		Teste model = new Teste();
		Response response = new Response();
		String result = Igrp.getInstance().getServlet().getServletContext().getRealPath("images/java.mp4");
		File file = new File(result);
			
		return this.sendFile(file, "JohnWick", "video/mp4", true);
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
