/*-------------------------*/

/*Create View*/

package nosi.webapps.marcao_consulta.pages.imactest;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class ImacTestView extends View {
	public String title = "Imac Test";		
	
	public Field nome;
	public Field id;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_dash_board;
	public IGRPButton btn_gravar;
	public IGRPButton btn_listar_medicos;
	public ImacTestView(ImacTest model){
		this.setPageTitle(this.title);
			
		form_1 = new IGRPForm("form_1");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		id = new NumberField(model,"id");
		id.setLabel("ID");
		id.propertie().add("name","p_id").add("type","number").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_dash_board = new IGRPButton("Dash Board","marcao_consulta","ImacTest","dash_board","_self","secondary|fa-angle-right","","");
		btn_dash_board.propertie.add("type","specific").add("code","").add("rel","dash_board");
		btn_gravar = new IGRPButton("Gravar","marcao_consulta","ImacTest","gravar","_self","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_listar_medicos = new IGRPButton("Listar Medicos","marcao_consulta","ImacTest","listar_medicos","_self","default|fa-angle-right","","");
		btn_listar_medicos.propertie.add("type","specific").add("code","").add("rel","listar_medicos");
		
	
	}
		
	@Override
	public void render(){
		

		form_1.addField(nome);
		form_1.addField(id);

		toolsbar_1.addButton(btn_dash_board);
		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_listar_medicos);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/