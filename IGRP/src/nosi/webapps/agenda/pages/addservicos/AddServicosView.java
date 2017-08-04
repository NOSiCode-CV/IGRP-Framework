/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.addservicos;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class AddServicosView extends View {
	
	
	public Field page_title_text;
	public Field entidade;
	public Field balcao;
	public Field servicos;
	public Field checkbox_1;
	public Field checkbox_1_check;
	public IGRPBox box_1;
	public IGRPSectionHeader page_title;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_filtrar;
	public AddServicosView(AddServicos model){
		this.setPageTitle("Adicionar Serviços");
			
		box_1 = new IGRPBox("box_1");
		page_title = new IGRPSectionHeader("page_title");
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel("");
		page_title_text.setValue("Associar/Desassociar Serviços");
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("persist","true").add("maxlength","4000");
		entidade = new ListField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","true").add("disabled","false").add("right","false");
		balcao = new ListField(model,"balcao");
		balcao.setLabel("Balcão");
		balcao.propertie().add("name","p_balcao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		servicos = new TextField(model,"servicos");
		servicos.setLabel("Serviços");
		servicos.propertie().add("name","p_servicos").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		checkbox_1 = new CheckBoxField(model,"checkbox_1");
		checkbox_1.setLabel("Checkbox");
		checkbox_1.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");
		checkbox_1_check = new CheckBoxField(model,"checkbox_1_check");
		checkbox_1_check.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","agenda","AddServicos","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_filtrar = new IGRPButton("Filtrar","agenda","AddServicos","filtrar","_self","info|fa-filter","","");
		btn_filtrar.propertie.add("type","form").add("code","").add("class","info").add("rel","filtrar");
		
	
	}
		
	@Override
	public void render(){
		

		page_title.addField(page_title_text);

		form_1.addField(entidade);
		form_1.addField(balcao);

		table_1.addField(servicos);
		table_1.addField(checkbox_1);
		table_1.addField(checkbox_1_check);


		toolsbar_1.addButton(btn_gravar);
		form_1.addButton(btn_filtrar);
		this.addToPage(box_1);
		this.addToPage(page_title);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/