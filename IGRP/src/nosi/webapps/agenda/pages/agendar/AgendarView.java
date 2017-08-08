/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.agendar;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class AgendarView extends View {
	
	
	public Field page_title_text;
	public Field entidade;
	public Field servico;
	public Field balcao;
	public Field data;
	public Field hora;
	public Field nome;
	public Field tipo_requisito;
	public Field descritivo;
	public Field formulario;
	public Field tipo_documento_de_identificacao;
	public Field documento_de_identificacao;
	public Field email;
	public Field telemovel;
	public Field telefone;
	public IGRPBox box_1;
	public IGRPSectionHeader page_title;
	public IGRPSeparatorList separatorlist_2;
	public IGRPTable table_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_agendar;
	public AgendarView(Agendar model){
		this.setPageTitle("Agendar");
			
		box_1 = new IGRPBox("box_1");
		page_title = new IGRPSectionHeader("page_title");
		separatorlist_2 = new IGRPSeparatorList("separatorlist_2");
		table_1 = new IGRPTable("table_1");
		form_1 = new IGRPForm("form_1");
		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel("");
		page_title_text.setValue("Agendar Atendimento");
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("persist","true").add("maxlength","4000");
		entidade = new ListField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","true").add("disabled","false").add("right","false").add("visible","true").add("desc","true");
		servico = new ListField(model,"servico");
		servico.setLabel("Serviço");
		servico.propertie().add("name","p_servico").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","true").add("disabled","false").add("right","false").add("visible","true").add("desc","true");
		balcao = new ListField(model,"balcao");
		balcao.setLabel("Balcão");
		balcao.propertie().add("name","p_balcao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","true").add("disabled","false").add("right","false").add("visible","true").add("desc","true");
		data = new DateField(model,"data");
		data.setLabel("Data");
		data.propertie().add("name","p_data").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("class","primary").add("desc","true");
		hora = new ListField(model,"hora");
		hora.setLabel("Hora");
		hora.propertie().add("name","p_hora").add("type","select").add("multiple","true").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("visible","true").add("desc","true");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","6").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("desc","true");
		tipo_requisito = new TextField(model,"tipo_requisito");
		tipo_requisito.setLabel("Tipo Requisito");
		tipo_requisito.propertie().add("name","p_tipo_requisito").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		descritivo = new TextField(model,"descritivo");
		descritivo.setLabel("Descritivo");
		descritivo.propertie().add("name","p_descritivo").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		formulario = new LinkField(model,"formulario");
		formulario.setLabel("Formulário");
		formulario.propertie().add("name","p_formulario").add("type","link").add("target","_self").add("class","link").add("iconColor","#333").add("iconClass","").add("img","fa-link").add("maxlength","30").add("align","left").add("lookup_parser","false").add("desc","true");
		tipo_documento_de_identificacao = new ListField(model,"tipo_documento_de_identificacao");
		tipo_documento_de_identificacao.setLabel("Tipo documento de identificação");
		tipo_documento_de_identificacao.propertie().add("name","p_tipo_documento_de_identificacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		documento_de_identificacao = new NumberField(model,"documento_de_identificacao");
		documento_de_identificacao.setLabel("Documento de Identificação");
		documento_de_identificacao.propertie().add("name","p_documento_de_identificacao").add("type","number").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		email = new EmailField(model,"email");
		email.setLabel("Email");
		email.propertie().add("name","p_email").add("type","email").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		telemovel = new NumberField(model,"telemovel");
		telemovel.setLabel("Telemóvel");
		telemovel.propertie().add("name","p_telemovel").add("type","number").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		telefone = new NumberField(model,"telefone");
		telefone.setLabel("Telefone");
		telefone.propertie().add("name","p_telefone").add("type","number").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_agendar = new IGRPButton("Agendar","agenda","Agendar","agendar","submit","success|fa-calendar-check-o","","");
		btn_agendar.propertie.add("type","specific").add("code","").add("rel","agendar");
		
	
	}
		
	@Override
	public void render(){
		

		page_title.addField(page_title_text);

		separatorlist_2.addField(entidade);
		separatorlist_2.addField(servico);
		separatorlist_2.addField(balcao);
		separatorlist_2.addField(data);
		separatorlist_2.addField(hora);
		separatorlist_2.addField(nome);


		table_1.addField(tipo_requisito);
		table_1.addField(descritivo);
		table_1.addField(formulario);

		form_1.addField(nome);
		form_1.addField(tipo_documento_de_identificacao);
		form_1.addField(documento_de_identificacao);
		form_1.addField(email);
		form_1.addField(telemovel);
		form_1.addField(telefone);

		toolsbar_1.addButton(btn_agendar);
		this.addToPage(box_1);
		this.addToPage(page_title);
		this.addToPage(separatorlist_2);
		this.addToPage(table_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/