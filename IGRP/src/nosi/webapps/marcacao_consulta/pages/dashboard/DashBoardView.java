/*-------------------------*/

/*Create View*/

package nosi.webapps.marcacao_consulta.pages.dashboard;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class DashBoardView extends View {
	
	
	public IGRPChart chart_1;
	public IGRPChart chart_2;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_nova_consulta;
	public DashBoardView(DashBoard model){
		this.setPageTitle("Dashboard");
			
		chart_1 = new IGRPChart("chart_1","Consulta por Sexo");
		chart_2 = new IGRPChart("chart_2","Consulta por Sexo ao Longo do Ano");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_nova_consulta = new IGRPButton("Nova Consulta","marcacao_consulta","DashBoard","nova_consulta","_self","success|fa-plus-circle","","");
		btn_nova_consulta.propertie.add("type","specific").add("code","").add("rel","nova_consulta");
		
		chart_1.setCaption("");
		chart_1.setChart_type("pie");
		chart_1.setXaxys("Eixo de X");
		chart_1.setYaxys("Eixo de Y");
		chart_1.setUrl("#");
		chart_1.addColor("#b40517").addColor("#218665").addColor("#408538").addColor("#ac5f6d");

		chart_2.setCaption("");
		chart_2.setChart_type("line");
		chart_2.setXaxys("Eixo de X");
		chart_2.setYaxys("Eixo de Y");
		chart_2.setUrl("#");
		chart_2.addColor("#456791").addColor("#c8e60d").addColor("#16459d").addColor("#b1ab7b");

	
	}
		
	@Override
	public void render(){
		



		toolsbar_1.addButton(btn_nova_consulta);
		this.addToPage(chart_1);
		this.addToPage(chart_2);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/