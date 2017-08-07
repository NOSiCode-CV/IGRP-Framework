/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.config_balcao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class CONFIG_BALCAOView extends View {
	
	
	public Field sectionheader_1_text;
	public Field balcao;
	public Field localizacao;
	public Field fuso_horario;
	public Field escolher_hora;
	public Field nr_de_servicos_por_agendamento;
	public Field hora_inicio;
	public Field hora_fim;
	public Field confirmacao_automatica;
	public IGRPBox box_1;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public CONFIG_BALCAOView(CONFIG_BALCAO model){
		this.setPageTitle("Configuração de Balcão");
			
		box_1 = new IGRPBox("box_1");
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Balcão");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		balcao = new ListField(model,"balcao");
		balcao.setLabel("Balcão");
		balcao.propertie().add("name","p_balcao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		localizacao = new TextField(model,"localizacao");
		localizacao.setLabel("Localização");
		localizacao.propertie().add("name","p_localizacao").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","true").add("disabled","false").add("placeholder","").add("right","false");
		fuso_horario = new TextField(model,"fuso_horario");
		fuso_horario.setLabel("Fuso horário");
		fuso_horario.propertie().add("name","p_fuso_horario").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","true").add("disabled","false").add("placeholder","").add("right","false");
		escolher_hora = new ListField(model,"escolher_hora");
		escolher_hora.setLabel("Escolher hora?");
		escolher_hora.propertie().add("name","p_escolher_hora").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		nr_de_servicos_por_agendamento = new ListField(model,"nr_de_servicos_por_agendamento");
		nr_de_servicos_por_agendamento.setLabel("Nr de serviços por agendamento");
		nr_de_servicos_por_agendamento.propertie().add("name","p_nr_de_servicos_por_agendamento").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		hora_inicio = new TextField(model,"hora_inicio");
		hora_inicio.setLabel("Hora Inicio");
		hora_inicio.propertie().add("name","p_hora_inicio").add("type","text").add("maxlength","6").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		hora_fim = new TextField(model,"hora_fim");
		hora_fim.setLabel("Hora Fim");
		hora_fim.propertie().add("name","p_hora_fim").add("type","text").add("maxlength","6").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		confirmacao_automatica = new ListField(model,"confirmacao_automatica");
		confirmacao_automatica.setLabel("Confirmação automática?");
		confirmacao_automatica.propertie().add("name","p_confirmacao_automatica").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","agenda","CONFIG_BALCAO","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	
	}
		
	@Override
	public void render(){
		

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(balcao);
		form_1.addField(localizacao);
		form_1.addField(fuso_horario);
		form_1.addField(escolher_hora);
		form_1.addField(nr_de_servicos_por_agendamento);
		form_1.addField(hora_inicio);
		form_1.addField(hora_fim);
		form_1.addField(confirmacao_automatica);


		toolsbar_1.addButton(btn_gravar);
		this.addToPage(box_1);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/