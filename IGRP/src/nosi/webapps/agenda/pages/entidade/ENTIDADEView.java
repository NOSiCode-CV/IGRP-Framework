/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.entidade;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class ENTIDADEView extends View {
	
	
	public Field page_title_text;
	public Field nome;
	public Field organica;
	public Field p_estado;
	public IGRPBox box_1;
	public IGRPSectionHeader page_title;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_list;
	public ENTIDADEView(ENTIDADE model){
		this.setPageTitle("Adicionar Entidades");
			
		box_1 = new IGRPBox("box_1");
		page_title = new IGRPSectionHeader("page_title");
		form_1 = new IGRPForm("form_1");
		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel("");
		page_title_text.setValue("Registar Entidade");
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("persist","true").add("maxlength","4000");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		organica = new ListField(model,"organica");
		organica.setLabel("Orgânica");
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("domain","");
		p_estado = new HiddenField(model,"p_estado");
		p_estado.setLabel("");
		p_estado.propertie().add("name","p_estado").add("type","hidden").add("maxlength","30").add("tag","estado");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","agenda","ENTIDADE","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");

		btn_list = new IGRPButton("Lista de Entidade","agenda","LST_ENTIDADE","index","_self","default|fa-list","","");
		btn_list.propertie.add("type","specific").add("code","").add("rel","list");
	
	}
		
	@Override
	public void render(){
		

		page_title.addField(page_title_text);

		form_1.addField(nome);
		form_1.addField(organica);
		form_1.addField(p_estado);


		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_list);
		this.addToPage(box_1);
		this.addToPage(page_title);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/