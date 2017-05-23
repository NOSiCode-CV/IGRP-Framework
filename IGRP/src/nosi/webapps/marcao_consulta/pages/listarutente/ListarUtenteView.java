/*-------------------------*/

/*Create View*/

package nosi.webapps.marcao_consulta.pages.listarutente;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class ListarUtenteView extends View {
	public String title = "Listar Utente";		
	
	public Field nome;
	public Field sexo;
	public Field morada;
	public Field idade;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo_utente;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_marcar_consulta;
	public ListarUtenteView(ListarUtente model){			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		sexo = new ListField(model,"sexo");
		sexo.setLabel("Sexo");
		sexo.propertie().add("name","p_sexo").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		morada = new TextField(model,"morada");
		morada.setLabel("Morada");
		morada.propertie().add("name","p_morada").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		idade = new NumberField(model,"idade");
		idade.setLabel("Idade");
		idade.propertie().add("name","p_idade").add("type","number").add("maxlength","30").add("align","left").add("lookup_parser","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo_utente = new IGRPButton("Novo Utente","marcao_consulta","ListarUtente","novo_utente","_self","default|fa-plus-circle","","");
		btn_novo_utente.propertie.add("type","specific").add("code","").add("rel","novo_utente");
		btn_pesquisar = new IGRPButton("Pesquisar","marcao_consulta","ListarUtente","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_marcar_consulta = new IGRPButton("Marcar Consulta","marcao_consulta","ListarUtente","marcar_consulta","submit","default|fa-medkit","","");
		btn_marcar_consulta.propertie.add("type","specific").add("code","").add("class","default").add("rel","marcar_consulta");
		
	
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		form_1.addField(nome);
		form_1.addField(sexo);


		table_1.addField(nome);
		table_1.addField(morada);
		table_1.addField(sexo);
		table_1.addField(idade);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_novo_utente);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_marcar_consulta);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/