/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.pontoatendimento;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class PontoAtendimentoView extends View {
	
	
	public Field page_title_text;
	public Field entidade;
	public Field ponto_atendimento;
	public Field estado_list;
	public Field p_id_balcao;
	public Field ponto;
	public Field n_de_servicos;
	public Field localizacao;
	public Field fuso_horario;
	public Field confirmacao_automatica;
	public Field horario_de_atendimento;
	public Field hora_inicio;
	public Field hora_fim;
	public Field p_id_ponto_atendimento;
	public Field p_estado;
	public Field servicos;
	public Field id_servico_check;
	public Field id_servico_check_check;
	public Field p_id_servico;
	public IGRPSectionHeader page_title;
	public IGRPForm form_2;
	public IGRPTable table_1;
	public IGRPForm form_1;
	public IGRPTable table_2;

	public IGRPToolsBar toolsbar_2;
	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_novo;
	public IGRPButton btn_configurar;
	public IGRPButton btn_remover;
	public IGRPButton btn_requisitos;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_editar_serv;
	public PontoAtendimentoView(PontoAtendimento model){
		this.setPageTitle("Ponto de Atendimento");
			
		page_title = new IGRPSectionHeader("page_title");
		form_2 = new IGRPForm("form_2");
		table_1 = new IGRPTable("table_1");
		form_1 = new IGRPForm("form_1");
		table_2 = new IGRPTable("table_2");
		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel("");
		page_title_text.setValue("Ponto de Atendimento");
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("persist","true").add("maxlength","4000");
		entidade = new ListField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("change","true").add("disabled","false").add("right","false");
		ponto_atendimento = new LinkField(model,"ponto_atendimento");
		ponto_atendimento.setLabel("Ponto Atendimento");
		ponto_atendimento.propertie().add("name","p_ponto_atendimento").add("type","link").add("target","_self").add("target_fields","").add("action","index").add("page","PontoAtendimento").add("app","agenda").add("class","link").add("btnSize","[object Object]").add("iconColor","#333").add("iconClass","").add("img","").add("maxlength","100").add("align","left").add("lookup_parser","false").add("iskey","false").add("desc","false");

		estado_list = new TextField(model,"estado_list");
		estado_list.setLabel("Estado");
		estado_list.propertie().add("name","p_estado_list").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		p_id_balcao = new HiddenField(model,"p_id_balcao");
		p_id_balcao.setLabel("");
		p_id_balcao.propertie().add("name","p_id_balcao").add("type","hidden").add("maxlength","30").add("tag","id_balcao");
		ponto = new TextField(model,"ponto");
		ponto.setLabel("Ponto de Atendimento");
		ponto.propertie().add("name","p_ponto").add("type","text").add("maxlength","300").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		n_de_servicos = new ListField(model,"n_de_servicos");
		n_de_servicos.setLabel("Nº de Serviços");
		n_de_servicos.propertie().add("name","p_n_de_servicos").add("type","select").add("multiple","false").add("domain","").add("maxlength","2").add("required","true").add("change","false").add("disabled","false").add("right","false");
		localizacao = new TextField(model,"localizacao");
		localizacao.setLabel("Localização");
		localizacao.propertie().add("name","p_localizacao").add("type","text").add("maxlength","300").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		fuso_horario = new TextField(model,"fuso_horario");
		fuso_horario.setLabel("Fuso Horário");
		fuso_horario.propertie().add("name","p_fuso_horario").add("type","text").add("maxlength","300").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		confirmacao_automatica = new RadioListField(model,"confirmacao_automatica");
		confirmacao_automatica.setLabel("Confirmação Automática");
		confirmacao_automatica.propertie().add("name","p_confirmacao_automatica").add("type","radiolist").add("domain","YES_NO").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("child_size","12").add("right","false");
		horario_de_atendimento = new SeparatorField(model,"horario_de_atendimento");
		horario_de_atendimento.setLabel("Horário de Atendimento");
		horario_de_atendimento.propertie().add("name","p_horario_de_atendimento").add("type","separator").add("maxlength","30").add("placeholder","").add("right","false");
		hora_inicio = new DateField(model,"hora_inicio");
		hora_inicio.setLabel("Hora Inicio");
		hora_inicio.propertie().add("name","p_hora_inicio").add("type","date").add("format","IGRP_timePicker").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		hora_fim = new DateField(model,"hora_fim");
		hora_fim.setLabel("Hora Fim");
		hora_fim.propertie().add("name","p_hora_fim").add("type","date").add("format","IGRP_timePicker").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		p_id_ponto_atendimento = new HiddenField(model,"p_id_ponto_atendimento");
		p_id_ponto_atendimento.setLabel("");
		p_id_ponto_atendimento.propertie().add("name","p_id_ponto_atendimento").add("type","hidden").add("maxlength","30").add("tag","id_ponto_atendimento");
		p_estado = new HiddenField(model,"p_estado");
		p_estado.setLabel("");
		p_estado.propertie().add("name","p_estado").add("type","hidden").add("maxlength","30").add("tag","estado");
		servicos = new TextField(model,"servicos");
		servicos.setLabel("Serviços");
		servicos.propertie().add("name","p_servicos").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		id_servico_check = new CheckBoxField(model,"id_servico_check");
		id_servico_check.setLabel("Id_servico_check");
		id_servico_check.propertie().add("name","p_id_servico_check").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		id_servico_check_check = new CheckBoxField(model,"id_servico_check_check");
		id_servico_check_check.propertie().add("name","p_id_servico_check").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		p_id_servico = new HiddenField(model,"p_id_servico");
		p_id_servico.setLabel("");
		p_id_servico.propertie().add("name","p_id_servico").add("type","hidden").add("maxlength","30").add("tag","id_servico");

		toolsbar_2 = new IGRPToolsBar("toolsbar_2");
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","agenda","PontoAtendimento","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_novo = new IGRPButton("Novo Servi�o","agenda","PontoAtendimento","novo","_blank","success|fa-plus-square","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_configurar = new IGRPButton("Configurar","agenda","PontoAtendimento","configurar","_blank","info|fa-certificate","","");
		btn_configurar.propertie.add("type","specific").add("code","").add("rel","configurar");
		btn_remover = new IGRPButton("Alterar Estado","agenda","PontoAtendimento","remover","alert_submit","info|fa-refresh","","");
		btn_remover.propertie.add("type","specific").add("code","").add("class","danger").add("rel","remover");
		btn_requisitos = new IGRPButton("Requisitos","agenda","PontoAtendimento","requisitos","_blank","warning|fa-info","","");
		btn_requisitos.propertie.add("type","specific").add("code","").add("class","warning").add("rel","requisitos");
		btn_eliminar = new IGRPButton("Alterar Estado","agenda","PontoAtendimento","eliminar","alert_submit","info|fa-refresh","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		
		btn_editar_serv = new IGRPButton("Editar","agenda","PontoAtendimento","editarServico","_blank","warning|fa-pencil","","");
		btn_editar_serv.propertie.add("type","specific").add("code","").add("class","danger").add("rel","Editar");
		
	}
		
	@Override
	public void render(){
		
		page_title.addField(page_title_text);

		form_2.addField(entidade);

		table_1.addField(ponto_atendimento);
		table_1.addField(estado_list);
		table_1.addField(p_id_balcao);


		form_1.addField(ponto);
		form_1.addField(n_de_servicos);
		form_1.addField(localizacao);
		form_1.addField(fuso_horario);
		form_1.addField(confirmacao_automatica);
		form_1.addField(horario_de_atendimento);
		form_1.addField(hora_inicio);
		form_1.addField(hora_fim);
		form_1.addField(p_id_ponto_atendimento);
		form_1.addField(p_estado);


		table_2.addField(servicos);
		table_2.addField(id_servico_check);
		table_2.addField(id_servico_check_check);
		table_2.addField(p_id_servico);

		toolsbar_2.addButton(btn_gravar);
		toolsbar_1.addButton(btn_novo);
//		toolsbar_1.addButton(btn_configurar);
		table_1.addButton(btn_remover);
		table_2.addButton(btn_requisitos);
		table_2.addButton(btn_eliminar);
		table_2.addButton(btn_editar_serv);
		this.addToPage(page_title);
		this.addToPage(form_2);
		this.addToPage(table_1);
		this.addToPage(form_1);
		this.addToPage(table_2);
		this.addToPage(toolsbar_2);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/