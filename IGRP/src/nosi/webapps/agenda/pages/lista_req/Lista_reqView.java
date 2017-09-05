/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.lista_req;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class Lista_reqView extends View {
	
	
	public Field sectionheader_1_text;
	public Field nome_requisitos;
	public Field servicos;
	public Field tipo_de_requisito;
	public Field descricao_do_requisito;
	public Field estado;
	public Field p_p_id;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_edit;
	public IGRPButton btn_eliminar;
	public Lista_reqView(Lista_req model){
		this.setPageTitle("Listar os requisitos dos servicos");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Requisitos do Serviço");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		nome_requisitos = new TextField(model,"nome_requisitos");
		nome_requisitos.setLabel("Nome Requisitos");
		nome_requisitos.propertie().add("name","p_nome_requisitos").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		servicos = new TextField(model,"servicos");
		servicos.setLabel("Serviços");
		servicos.propertie().add("name","p_servicos").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		tipo_de_requisito = new TextField(model,"tipo_de_requisito");
		tipo_de_requisito.setLabel("Tipo de requisito");
		tipo_de_requisito.propertie().add("name","p_tipo_de_requisito").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		descricao_do_requisito = new TextField(model,"descricao_do_requisito");
		descricao_do_requisito.setLabel("Descrição Do Requisito");
		descricao_do_requisito.propertie().add("name","p_descricao_do_requisito").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		estado = new TextField(model,"estado");
		estado.setLabel("Estado");
		estado.propertie().add("name","p_estado").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		p_p_id = new HiddenField(model,"p_p_id");
		p_p_id.setLabel("");
		p_p_id.propertie().add("name","p_p_id").add("type","hidden").add("maxlength","30").add("tag","p_id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_pesquisar = new IGRPButton("Pesquisar","agenda","Lista_req","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","specific").add("code","").add("rel","pesquisar");
		btn_edit = new IGRPButton("Edit","agenda","Lista_req","edit","submit","warning|fa-edit","","");
		btn_edit.propertie.add("type","specific").add("code","").add("class","warning").add("rel","edit");
		btn_eliminar = new IGRPButton("Eliminar","agenda","Lista_req","eliminar","alert_submit","danger|fa-refresh","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		
	
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(nome_requisitos);


		table_1.addField(servicos);
		table_1.addField(tipo_de_requisito);
		table_1.addField(descricao_do_requisito);
		table_1.addField(estado);
		table_1.addField(p_p_id);

		toolsbar_1.addButton(btn_pesquisar);
		table_1.addButton(btn_edit);
		table_1.addButton(btn_eliminar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/