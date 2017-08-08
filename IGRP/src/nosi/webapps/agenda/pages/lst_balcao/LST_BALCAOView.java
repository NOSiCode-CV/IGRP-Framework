/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.lst_balcao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class LST_BALCAOView extends View {
	
	
	public Field entidade;
	public Field balcao;
	public Field organica;
	public Field checkbox_1;
	public Field checkbox_1_check;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_novo;
	public IGRPButton btn_editar;
	public IGRPButton btn_remover;
	public LST_BALCAOView(LST_BALCAO model){
		this.setPageTitle("Lista de Balcão");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		entidade = new TextField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","true").add("disabled","false").add("placeholder","").add("right","false");
		balcao = new TextField(model,"balcao");
		balcao.setLabel("Balcão");
		balcao.propertie().add("name","p_balcao").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		organica = new TextField(model,"organica");
		organica.setLabel("Orgânica");
		organica.propertie().add("name","p_organica").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		checkbox_1 = new CheckBoxField(model,"checkbox_1");
		checkbox_1.setLabel("Checkbox");
		checkbox_1.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");
		checkbox_1_check = new CheckBoxField(model,"checkbox_1_check");
		checkbox_1_check.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");

		btn_novo = new IGRPButton("Novo","agenda","LST_BALCAO","novo","modal","success|fa-plus-square","","");
		btn_novo.propertie.add("type","form").add("code","").add("class","success").add("rel","novo");
		btn_editar = new IGRPButton("Editar","agenda","LST_BALCAO","editar","modal","warning|fa-edit","","");
		btn_editar.propertie.add("type","form").add("code","").add("class","warning").add("rel","editar");
		btn_remover = new IGRPButton("Remover","agenda","LST_BALCAO","remover","alert_submit","danger|fa-close","","");
		btn_remover.propertie.add("type","form").add("code","").add("class","danger").add("rel","remover");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(entidade);

		table_1.addField(balcao);
		table_1.addField(organica);
		table_1.addField(checkbox_1);
		table_1.addField(checkbox_1_check);

		form_1.addButton(btn_novo);
		form_1.addButton(btn_editar);
		form_1.addButton(btn_remover);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/