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
	public Field filter;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_novo;
	public IGRPButton btn_editar;
	public IGRPButton btn_remover;
	public LST_SERVView(LST_SERV model){
		this.setPageTitle("Lista de Serviços");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		entidade = new TextField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","true").add("disabled","false").add("placeholder","").add("right","false");
		servico = new TextField(model,"servico");
		servico.setLabel("Serviço");
		servico.propertie().add("name","p_servico").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		checkbox_1 = new CheckBoxField(model,"checkbox_1");
		checkbox_1.setLabel("Checkbox");
		checkbox_1.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");
		checkbox_1_check = new CheckBoxField(model,"checkbox_1_check");
		checkbox_1_check.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");
		filter = new TextField(model,"filter");
		filter.setLabel("");
		filter.propertie().add("name","p_table_1_filter").add("type","filter_az");

		btn_novo = new IGRPButton("Novo","agenda","LST_SERV","novo","modal","success|fa-plus-square","","");
		btn_novo.propertie.add("type","form").add("code","").add("class","success").add("rel","novo");
		btn_editar = new IGRPButton("Editar","agenda","LST_SERV","editar","modal","warning|fa-edit","","");
		btn_editar.propertie.add("type","form").add("code","").add("class","warning").add("rel","editar");
		btn_remover = new IGRPButton("Remover","agenda","LST_SERV","remover","alert_submit","danger|fa-close","","");
		btn_remover.propertie.add("type","form").add("code","").add("class","danger").add("rel","remover");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(entidade);

		table_1.addField(servico);
		table_1.addField(checkbox_1);
		table_1.addField(checkbox_1_check);
		table_1.addField(filter);

		form_1.addButton(btn_novo);
		form_1.addButton(btn_editar);
		form_1.addButton(btn_remover);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/