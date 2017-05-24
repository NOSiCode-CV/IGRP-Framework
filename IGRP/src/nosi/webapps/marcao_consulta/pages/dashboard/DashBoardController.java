/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.dashboard;
import nosi.core.webapp.Controller;
import nosi.webapps.marcao_consulta.dao.Consulta;

import java.io.IOException;
import java.util.ArrayList;


public class DashBoardController extends Controller {		

	public void actionIndex() throws IOException{
		DashBoard model = new DashBoard();
		DashBoardView view = new DashBoardView(model);		
		ArrayList<DashBoard.Chart_1> data = new ArrayList<>();
		for(Object obj:new Consulta().getChart1()){			
			DashBoard.Chart_1 chart1 = (DashBoard.Chart_1) obj;
			data.add(chart1);
		}
		view.chart_1.addData(data );
		view.chart_2.addData(data);
		this.renderView(view);
	}

	public void actionNova_consulta() throws IOException{
			this.redirect("marcao_consulta","MarcarConsulta","index");
	}
	
}
