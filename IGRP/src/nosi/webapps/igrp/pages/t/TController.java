/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.t;
import nosi.core.webapp.Controller;
import java.io.IOException;

public class TController extends Controller {		

	public void actionIndex() throws IOException{
		T model = new T();
		TView view = new TView(model);
		this.renderView(view);
	}

}
