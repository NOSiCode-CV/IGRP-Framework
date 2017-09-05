/*-------------------------*/

/*Create View*/

package nosi.webapps.marcacao_consulta.pages.consultapendente;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class ConsultaPendenteView extends View {
	
	
	public Field nome_utente;
	public Field data_consulta;
	public Field medico_a_consultar;
	public Field data_da_consulta;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_nova_consulta;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_confirmar_consulta;
	public IGRPButton btn_cancelar_consulta;
	public ConsultaPendenteView(ConsultaPendente model){
		this.setPageTitle("Lista de Consultas Pendentes");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		nome_utente = new TextField(model,"nome_utente");
		nome_utente.setLabel("Nome Utente");
		nome_utente.propertie().add("name","p_nome_utente").add("type","text").add("maxlength","98").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		data_consulta = new DateField(model,"data_consulta");
		data_consulta.setLabel("Data Consulta");
		data_consulta.propertie().add("name","p_data_consulta").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		medico_a_consultar = new TextField(model,"medico_a_consultar");
		medico_a_consultar.setLabel("Medico a Consultar");
		medico_a_consultar.propertie().add("name","p_medico_a_consultar").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		data_da_consulta = new DateField(model,"data_da_consulta");
		data_da_consulta.setLabel("Data da Consulta");
		data_da_consulta.propertie().add("name","p_data_da_consulta").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_nova_consulta = new IGRPButton("Nova Consulta","marcacao_consulta","ConsultaPendente","nova_consulta","_self","success|fa-plus-circle","","");
		btn_nova_consulta.propertie.add("type","specific").add("code","").add("rel","nova_consulta");
		btn_pesquisar = new IGRPButton("Pesquisar","marcacao_consulta","ConsultaPendente","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		btn_confirmar_consulta = new IGRPButton("Confirmar Consulta","marcacao_consulta","ConsultaPendente","confirmar_consulta","confirm","success|fa-chevron-down","","");
		btn_confirmar_consulta.propertie.add("type","specific").add("code","").add("class","success").add("rel","confirmar_consulta");
		btn_cancelar_consulta = new IGRPButton("Cancelar Consulta","marcacao_consulta","ConsultaPendente","cancelar_consulta","confirm","danger|fa-remove","","");
		btn_cancelar_consulta.propertie.add("type","specific").add("code","").add("class","danger").add("rel","cancelar_consulta");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(nome_utente);
		form_1.addField(data_consulta);


		table_1.addField(nome_utente);
		table_1.addField(medico_a_consultar);
		table_1.addField(data_da_consulta);
		table_1.addField(p_id);

		toolsbar_1.addButton(btn_nova_consulta);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_confirmar_consulta);
		table_1.addButton(btn_cancelar_consulta);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/