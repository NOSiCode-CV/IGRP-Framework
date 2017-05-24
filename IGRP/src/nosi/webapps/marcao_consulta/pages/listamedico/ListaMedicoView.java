/*-------------------------*/

/*Create View*/

package nosi.webapps.marcao_consulta.pages.listamedico;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class ListaMedicoView extends View {
	public String title = "Lista de Medicos";		
	
	public Field nome;
	public Field n_consulta_por_dia;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo_medico;
	public IGRPButton btn_pesquisar;
	public ListaMedicoView(ListaMedico model){			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		n_consulta_por_dia = new NumberField(model,"n_consulta_por_dia");
		n_consulta_por_dia.setLabel("Nº Consulta por dia");
		n_consulta_por_dia.propertie().add("name","p_n_consulta_por_dia").add("type","number").add("maxlength","30").add("align","left").add("lookup_parser","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo_medico = new IGRPButton("Novo Medico","marcao_consulta","ListaMedico","novo_medico","_self","default|fa-plus-circle","","");
		btn_novo_medico.propertie.add("type","specific").add("code","").add("rel","novo_medico");
		btn_pesquisar = new IGRPButton("Pesquisar","marcao_consulta","ListaMedico","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		form_1.addField(nome);


		table_1.addField(nome);
		table_1.addField(n_consulta_por_dia);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_novo_medico);
		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/