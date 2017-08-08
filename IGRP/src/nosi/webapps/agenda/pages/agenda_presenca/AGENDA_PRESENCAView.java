/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.agenda_presenca;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class AGENDA_PRESENCAView extends View {
	
	
	public Field entidade;
	public Field balcao;
	public Field serviao;
	public Field date_de;
	public Field data_ate;
	public Field dia;
	public Field hora;
	public Field nome;
	public Field servico;
	public Field estado;
	public Field checkbox_1;
	public Field checkbox_1_check;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_confirmar;
	public IGRPButton btn_notificar;
	public AGENDA_PRESENCAView(AGENDA_PRESENCA model){
		this.setPageTitle("Marcar Presença de Uma Agenda feita");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		entidade = new ListField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		balcao = new ListField(model,"balcao");
		balcao.setLabel("Balcão");
		balcao.propertie().add("name","p_balcao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		serviao = new ListField(model,"serviao");
		serviao.setLabel("Serviço");
		serviao.propertie().add("name","p_serviao").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
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
		servico = new TextField(model,"servico");
		servico.setLabel("Serviço");
		servico.propertie().add("name","p_servico").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		estado = new TextField(model,"estado");
		estado.setLabel("Estado");
		estado.propertie().add("name","p_estado").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		checkbox_1 = new CheckBoxField(model,"checkbox_1");
		checkbox_1.setLabel("Checkbox");
		checkbox_1.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");
		checkbox_1_check = new CheckBoxField(model,"checkbox_1_check");
		checkbox_1_check.propertie().add("name","p_checkbox_1").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_confirmar = new IGRPButton("Confirmar","agenda","AGENDA_PRESENCA","confirmar","confirm","success|fa-check","","");
		btn_confirmar.propertie.add("type","specific").add("code","").add("rel","confirmar");
		btn_notificar = new IGRPButton("Notificar","agenda","AGENDA_PRESENCA","notificar","modal","warning|fa-commenting","","");
		btn_notificar.propertie.add("type","specific").add("code","").add("rel","notificar");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(entidade);
		form_1.addField(balcao);
		form_1.addField(serviao);
		form_1.addField(date_de);
		form_1.addField(data_ate);


		table_1.addField(dia);
		table_1.addField(hora);
		table_1.addField(nome);
		table_1.addField(balcao);
		table_1.addField(servico);
		table_1.addField(estado);
		table_1.addField(checkbox_1);
		table_1.addField(checkbox_1_check);

		toolsbar_1.addButton(btn_confirmar);
		toolsbar_1.addButton(btn_notificar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/