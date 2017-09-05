/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcacao_consulta.pages.dashboard;

/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.ArrayList;
import nosi.core.webapp.Response;
import nosi.webapps.marcacao_consulta.dao.Consulta;

/*---- End ----*/

public class DashBoardController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/
		DashBoard model = new DashBoard();
		DashBoardView view = new DashBoardView(model);		
		ArrayList<DashBoard.Chart_1> data = new ArrayList<>();
		for(Object obj:new Consulta().getChart1()){			
			DashBoard.Chart_1 chart1 = (DashBoard.Chart_1) obj;
			data.add(chart1);
		}
		view.chart_1.addData(data );
		view.chart_2.addData(data);
		return this.renderView(view);
		/*---- End ----*/
	}


	public Response actionNova_consulta() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("marcacao_consulta","MarcarConsulta","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
