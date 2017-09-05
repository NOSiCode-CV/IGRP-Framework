/*-------------------------*/

/*Create View*/

package nosi.webapps.marcacao_consulta.pages.listaespecialidade;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class ListaEspecialidadeView extends View {
	
	
	public Field descricao;
	public Field codigo;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_button_1;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public ListaEspecialidadeView(ListaEspecialidade model){
		this.setPageTitle("Lista de Entidade");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		descricao = new TextField(model,"descricao");
		descricao.setLabel("Descricao");
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		codigo = new TextField(model,"codigo");
		codigo.setLabel("Codigo");
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_button_1 = new IGRPButton("Button","marcacao_consulta","ListaEntidade","button_1","_blank","default|fa-angle-right","","");
		btn_button_1.propertie.add("type","specific").add("code","").add("rel","button_1");
		btn_pesquisar = new IGRPButton("Pesquisar","marcacao_consulta","ListaEntidade","pesquisar","submit_form","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_editar = new IGRPButton("Editar","marcacao_consulta","ListaEntidade","editar","confirm","warning|fa-pencil-square","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_eliminar = new IGRPButton("Eliminar","marcacao_consulta","ListaEntidade","eliminar","confirm","danger|fa-remove","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(descricao);


		table_1.addField(codigo);
		table_1.addField(descricao);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_button_1);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/