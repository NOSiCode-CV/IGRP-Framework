/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.lst_serv;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class LST_SERVView extends View {
	
	
	public Field entidade;
	public Field servico;
	public Field checkbox_1;
	public Field checkbox_1_check;
	public Field p_id;
	public Field table_1_filter;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_novo;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_delete;
	public LST_SERVView(LST_SERV model){
		this.setPageTitle("Lista de ServiÃ§os");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		entidade = new ListField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		servico = new TextField(model,"servico");
		servico.setLabel("Serviços");
		servico.propertie().add("name","p_servico").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		checkbox_1 = new CheckBoxField(model,"checkbox_1");
		checkbox_1.setLabel("Checkbox");
		checkbox_1.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		checkbox_1_check = new CheckBoxField(model,"checkbox_1_check");
		checkbox_1_check.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		table_1_filter = new TextField(model,"table_1_filter");
		table_1_filter.setLabel("");
		table_1_filter.propertie().add("name","p_table_1_filter").add("type","text").add("maxlength","100");

		btn_novo = new IGRPButton("Novo","agenda","LST_SERV","novo","submit","success|fa-plus-square","","");
		btn_novo.propertie.add("type","form").add("code","").add("class","success").add("rel","novo");
		btn_pesquisar = new IGRPButton("Pesquisar","agenda","LST_SERV","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_editar = new IGRPButton("Editar","agenda","LST_SERV","editar","_blank","success|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","success").add("rel","editar");
		btn_delete = new IGRPButton("Delete","agenda","LST_SERV","delete","alert_submit","danger|fa-remove","","");
		btn_delete.propertie.add("type","specific").add("code","").add("class","danger").add("rel","delete");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(entidade);

		table_1.addField(servico);
		table_1.addField(checkbox_1);
		table_1.addField(checkbox_1_check);
		table_1.addField(p_id);
		table_1.addField(table_1_filter);

		form_1.addButton(btn_novo);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_delete);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/