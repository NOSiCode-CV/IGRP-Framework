/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.testepage;
import nosi.core.webapp.Controller;
import java.io.IOException;

public class TestePageController extends Controller {		

	public void actionIndex() throws IOException{
		TestePage model = new TestePage();
		TestePageView view = new TestePageView(model);
		this.renderView(view);
	}

}
