/*-------------------------*/

/*Create View*/

package nosi.webapps.marcao_consulta.pages.dashboard;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.config.Config; 

public class DashBoardView extends View {
	public String title = "Dash Board";		
	
	public IGRPChart chart_1;
	public IGRPChart chart_2;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_nova_consulta;
	public DashBoardView(DashBoard model){			
		chart_1 = new IGRPChart("chart_1","Consulta por Sexo num Ano");
		chart_2 = new IGRPChart("chart_2","Consulta por Sexo e por Ano");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_nova_consulta = new IGRPButton("Nova Consulta","marcao_consulta","DashBoard","nova_consulta","_self","default|fa-plus-circle","","");
		btn_nova_consulta.propertie.add("type","specific").add("code","").add("rel","nova_consulta");
		
		chart_1.setCaption("");
		chart_1.setChart_type("pie");
		chart_1.setXaxys("Eixo de X");
		chart_1.setYaxys("Eixo de Y");
		chart_1.setUrl("#");
		chart_1.addColor("#91b357").addColor("#b66034").addColor("#e3335b").addColor("#bcbc3b");

		chart_2.setCaption("");
		chart_2.setChart_type("line");
		chart_2.setXaxys("Eixo de X");
		chart_2.setYaxys("Eixo de Y");
		chart_2.setUrl("#");
		chart_2.addColor("#5101d7").addColor("#44a10f").addColor("#ada2fe").addColor("#231d0a");

	
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;




		toolsbar_1.addButton(btn_nova_consulta);
		this.addToPage(chart_1);
		this.addToPage(chart_2);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/