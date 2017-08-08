/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.agenda;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class AgendaView extends View {
	
	
	public Field page_title_text;
	public Field balcao;
	public Field servico;
	public Field numero_de_atendimentos;
	public Field dias_de_semana;
	public Field hora_inicio;
	public Field hora_fim;
	public Field numero_de_atendedores;
	public Field tempo_medio_de_atendimento_mn;
	public Field antecedencia_alterarcancelar_hr;
	public Field antecedencia_de_agendamento_hr;
	public IGRPBox box_1;
	public IGRPSectionHeader page_title;
	public IGRPSeparatorList separatorlist_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public AgendaView(Agenda model){
		this.setPageTitle("Efetuar uma agenda");
			
		box_1 = new IGRPBox("box_1");
		page_title = new IGRPSectionHeader("page_title");
		separatorlist_1 = new IGRPSeparatorList("separatorlist_1");
		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel("");
		page_title_text.setValue("Agenda");
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("persist","true").add("maxlength","4000");
		balcao = new ListField(model,"balcao");
		balcao.setLabel("Balcão");
		balcao.propertie().add("name","p_balcao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("visible","true").add("desc","true");
		servico = new ListField(model,"servico");
		servico.setLabel("Serviço");
		servico.propertie().add("name","p_servico").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("visible","true").add("desc","true");
		numero_de_atendimentos = new NumberField(model,"numero_de_atendimentos");
		numero_de_atendimentos.setLabel("Número de atendimentos");
		numero_de_atendimentos.propertie().add("name","p_numero_de_atendimentos").add("type","number").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("desc","true");
		dias_de_semana = new ListField(model,"dias_de_semana");
		dias_de_semana.setLabel("Dias de semana");
		dias_de_semana.propertie().add("name","p_dias_de_semana").add("type","select").add("multiple","true").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("visible","true").add("desc","true");
		hora_inicio = new TextField(model,"hora_inicio");
		hora_inicio.setLabel("Hora Inicio");
		hora_inicio.propertie().add("name","p_hora_inicio").add("type","text").add("maxlength","6").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("desc","true");
		hora_fim = new TextField(model,"hora_fim");
		hora_fim.setLabel("Hora Fim");
		hora_fim.propertie().add("name","p_hora_fim").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("desc","true");
		numero_de_atendedores = new NumberField(model,"numero_de_atendedores");
		numero_de_atendedores.setLabel("Número de atendedores");
		numero_de_atendedores.propertie().add("name","p_numero_de_atendedores").add("type","number").add("maxlength","2").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("desc","true");
		tempo_medio_de_atendimento_mn = new NumberField(model,"tempo_medio_de_atendimento_mn");
		tempo_medio_de_atendimento_mn.setLabel("Tempo médio de atendimento (mn)");
		tempo_medio_de_atendimento_mn.propertie().add("name","p_tempo_medio_de_atendimento_mn").add("type","number").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("visible","true").add("desc","true");
		antecedencia_alterarcancelar_hr = new ListField(model,"antecedencia_alterarcancelar_hr");
		antecedencia_alterarcancelar_hr.setLabel("Antecedência alterar/cancelar (hr)");
		antecedencia_alterarcancelar_hr.propertie().add("name","p_antecedencia_alterarcancelar_hr").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("visible","true").add("desc","true");
		antecedencia_de_agendamento_hr = new ListField(model,"antecedencia_de_agendamento_hr");
		antecedencia_de_agendamento_hr.setLabel("Antecedência de agendamento (hr)");
		antecedencia_de_agendamento_hr.propertie().add("name","p_antecedencia_de_agendamento_hr").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false").add("visible","true").add("desc","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","agenda","Agenda","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	
	}
		
	@Override
	public void render(){
		

		page_title.addField(page_title_text);

		separatorlist_1.addField(balcao);
		separatorlist_1.addField(servico);
		separatorlist_1.addField(numero_de_atendimentos);
		separatorlist_1.addField(dias_de_semana);
		separatorlist_1.addField(hora_inicio);
		separatorlist_1.addField(hora_fim);
		separatorlist_1.addField(numero_de_atendedores);
		separatorlist_1.addField(tempo_medio_de_atendimento_mn);
		separatorlist_1.addField(antecedencia_alterarcancelar_hr);
		separatorlist_1.addField(antecedencia_de_agendamento_hr);


		toolsbar_1.addButton(btn_gravar);
		this.addToPage(box_1);
		this.addToPage(page_title);
		this.addToPage(separatorlist_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/