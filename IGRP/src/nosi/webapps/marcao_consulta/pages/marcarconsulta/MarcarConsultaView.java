/*-------------------------*/

/*Create View*/

package nosi.webapps.marcao_consulta.pages.marcarconsulta;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class MarcarConsultaView extends View {
	public String title = "Marcar Consulta";		
	
	public Field utente;
	public Field medico;
	public Field data_consulta;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public MarcarConsultaView(MarcarConsulta model){			
		form_1 = new IGRPForm("form_1");
		utente = new ListField(model,"utente");
		utente.setLabel("Utente");
		utente.propertie().add("name","p_utente").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		medico = new ListField(model,"medico");
		medico.setLabel("Medico");
		medico.propertie().add("name","p_medico").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		data_consulta = new DateField(model,"data_consulta");
		data_consulta.setLabel("Data Consulta");
		data_consulta.propertie().add("name","p_data_consulta").add("type","date").add("format","IGRP_dateTimePicker").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","marcao_consulta","MarcarConsulta","gravar","submit","default|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton("Voltar","marcao_consulta","MarcarConsulta","voltar","_self","default|fa-angle-right","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;


		form_1.addField(utente);
		form_1.addField(medico);
		form_1.addField(data_consulta);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/