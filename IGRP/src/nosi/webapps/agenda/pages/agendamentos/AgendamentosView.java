/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.agendamentos;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class AgendamentosView extends View {
	
	
	public Field entidade;
	public Field balcao;
	public Field servico;
	public Field date_de;
	public Field data_ate;
	public Field dia;
	public Field hora;
	public Field nome;
	public Field estado;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_agendar;
	public IGRPButton btn_confirmar;
	public IGRPButton btn_cancelar;
	public AgendamentosView(Agendamentos model){
		this.setPageTitle("Lista de Agendamentos");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		entidade = new ListField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		balcao = new ListField(model,"balcao");
		balcao.setLabel("Balcão");
		balcao.propertie().add("name","p_balcao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		servico = new ListField(model,"servico");
		servico.setLabel("Serviço");
		servico.propertie().add("name","p_servico").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		date_de = new DateField(model,"date_de");
		date_de.setLabel("Date de");
		date_de.propertie().add("name","p_date_de").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","primary");
		data_ate = new DateField(model,"data_ate");
		data_ate.setLabel("Data até");
		data_ate.propertie().add("name","p_data_ate").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","primary");
		dia = new DateField(model,"dia");
		dia.setLabel("Dia");
		dia.propertie().add("name","p_dia").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("align","left").add("lookup_parser","false");
		hora = new TextField(model,"hora");
		hora.setLabel("Hora");
		hora.propertie().add("name","p_hora").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		estado = new TextField(model,"estado");
		estado.setLabel("Estado");
		estado.propertie().add("name","p_estado").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_agendar = new IGRPButton("Agendar","agenda","Agendamentos","agendar","modal","success|fa-plus-square","","");
		btn_agendar.propertie.add("type","specific").add("code","").add("rel","agendar");
		btn_confirmar = new IGRPButton("Confirmar","agenda","Agendamentos","confirmar","modal","success|fa-check-circle-o","","");
		btn_confirmar.propertie.add("type","specific").add("code","").add("class","success").add("rel","confirmar");
		btn_cancelar = new IGRPButton("Cancelar","agenda","Agendamentos","cancelar","alert_submit","danger|fa-close","","");
		btn_cancelar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","cancelar");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(entidade);
		form_1.addField(balcao);
		form_1.addField(servico);
		form_1.addField(date_de);
		form_1.addField(data_ate);


		table_1.addField(dia);
		table_1.addField(hora);
		table_1.addField(nome);
		table_1.addField(balcao);
		table_1.addField(servico);
		table_1.addField(estado);

		toolsbar_1.addButton(btn_agendar);
		table_1.addButton(btn_confirmar);
		table_1.addButton(btn_cancelar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/