/*Create View*/

package nosi.webapps.agenda.pages.addservicos;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class AddServicosView extends View {
	
	
	public Field page_title_text;
	public Field entidade;
	public Field nome_do_servico;
	public Field codigo_do_servico;
	public Field estado;
	public Field assunto;
	public IGRPBox box_1;
	public IGRPSectionHeader page_title;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public AddServicosView(AddServicos model){
		this.setPageTitle("Adicionar Serviços");
			
		box_1 = new IGRPBox("box_1");
		page_title = new IGRPSectionHeader("page_title");
		form_1 = new IGRPForm("form_1");
		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel("");
		page_title_text.setValue("Adicionar Serviços");
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("persist","true").add("maxlength","4000");
		entidade = new ListField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("domain","");
		nome_do_servico = new TextField(model,"nome_do_servico");
		nome_do_servico.setLabel("Nome do Serviço");
		nome_do_servico.propertie().add("name","p_nome_do_servico").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		codigo_do_servico = new TextField(model,"codigo_do_servico");
		codigo_do_servico.setLabel("Código do Serviço");
		codigo_do_servico.propertie().add("name","p_codigo_do_servico").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		estado = new ListField(model,"estado");
		estado.setLabel("Estado");
		estado.propertie().add("name","p_estado").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("domain","");
		assunto = new TextAreaField(model,"assunto");
		assunto.setLabel("Assunto");
		assunto.propertie().add("name","p_assunto").add("type","textarea").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","agenda","AddServicos","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	
	}
		
	@Override
	public void render(){
		

		page_title.addField(page_title_text);

		form_1.addField(entidade);
		form_1.addField(nome_do_servico);
		form_1.addField(codigo_do_servico);
		form_1.addField(estado);
		form_1.addField(assunto);


		toolsbar_1.addButton(btn_gravar);
		this.addToPage(box_1);
		this.addToPage(page_title);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*------------------------- END -------------------------*/