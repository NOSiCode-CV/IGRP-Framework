/*-------------------------*/

/*Create View*/

package nosi.webapps.marcacao_consulta.pages.especialidade;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class EspecialidadeView extends View {
	
	
	public Field codigo;
	public Field descricao;
	public Field p_id;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_listar_epecialidade;
	public EspecialidadeView(Especialidade model){
		this.setPageTitle("Registar Especialidade");
			
		form_1 = new IGRPForm("form_1");
		codigo = new TextField(model,"codigo");
		codigo.setLabel("Codigo");
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		descricao = new TextField(model,"descricao");
		descricao.setLabel("Descrição");
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","marcacao_consulta","Especialidade","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_listar_epecialidade = new IGRPButton("Listar Epecialidade","marcacao_consulta","Especialidade","listar_epecialidade","_self","default|fa-list","","");
		btn_listar_epecialidade.propertie.add("type","specific").add("code","").add("rel","listar_epecialidade");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(codigo);
		form_1.addField(descricao);
		form_1.addField(p_id);


		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_listar_epecialidade);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/