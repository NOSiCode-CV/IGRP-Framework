/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.webreport;
import nosi.core.webapp.Controller;
import java.io.IOException;

/*---- Import your packages here... ----*//*---- End ----*/

public class WebReportController extends Controller {		


	public void actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		WebReport model = new WebReport();
		model.setPage_title_text("<![CDATA[Web Report]]>");
		WebReportView view = new WebReportView(model);
		this.renderView(view);
		/*---- End ----*/
	}

	/*---- Insert your actions here... ----*//*---- End ----*/
}
