/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.example;
import nosi.core.webapp.Controller;
import java.io.IOException;


public class ExampleController extends Controller {		

	public void actionIndex() throws IOException{
		Example model = new Example();
		ExampleView view = new ExampleView(model);
		this.renderView(view);
	}

	public void actionButton() throws IOException{
		
	}
	
}
