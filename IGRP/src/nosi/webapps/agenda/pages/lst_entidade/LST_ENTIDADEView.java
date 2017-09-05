/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.lst_entidade;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class LST_ENTIDADEView extends View {
	
	
	public Field entidade;
	public Field estado;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_nova_entidade;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_servicos;
	public IGRPButton btn_agenda;
	public LST_ENTIDADEView(LST_ENTIDADE model){
		this.setPageTitle("Lista de Entidades");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		entidade = new TextField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		estado = new TextField(model,"estado");
		estado.setLabel("Estado");
		estado.propertie().add("name","p_estado").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_nova_entidade = new IGRPButton("Nova Entidade","agenda","LST_ENTIDADE","nova_entidade","modal","success|fa-plus-square","","");
		btn_nova_entidade.propertie.add("type","specific").add("code","").add("rel","nova_entidade");
		btn_pesquisar = new IGRPButton("Pesquisar","agenda","LST_ENTIDADE","pesquisar","submit_form","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_editar = new IGRPButton("Editar","agenda","LST_ENTIDADE","editar","modal","warning|fa-pencil-square","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_servicos = new IGRPButton("Servicos","agenda","LST_ENTIDADE","servicos","modal","info|fa-server","","");
		btn_servicos.propertie.add("type","specific").add("code","").add("class","info").add("rel","servicos");
		btn_agenda = new IGRPButton("Agenda","agenda","LST_ENTIDADE","agenda","modal","warning|fa-calendar","","");
		btn_agenda.propertie.add("type","specific").add("code","").add("class","warning").add("rel","agenda");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(entidade);


		table_1.addField(entidade);
		table_1.addField(estado);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_nova_entidade);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_servicos);
		table_1.addButton(btn_agenda);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/