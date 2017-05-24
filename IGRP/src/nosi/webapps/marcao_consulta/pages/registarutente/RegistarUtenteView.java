/*-------------------------*/

/*Create View*/

package nosi.webapps.marcao_consulta.pages.registarutente;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class RegistarUtenteView extends View {
	public String title = "Registar Utente";		
	
	public Field nome;
	public Field morada;
	public Field data_nascimento;
	public Field sexo;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public RegistarUtenteView(RegistarUtente model){			
		form_1 = new IGRPForm("form_1");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		morada = new TextField(model,"morada");
		morada.setLabel("Morada");
		morada.propertie().add("name","p_morada").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		data_nascimento = new DateField(model,"data_nascimento");
		data_nascimento.setLabel("Data Nascimento");
		data_nascimento.propertie().add("name","p_data_nascimento").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		sexo = new ListField(model,"sexo");
		sexo.setLabel("Sexo");
		sexo.propertie().add("name","p_sexo").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","marcao_consulta","RegistarUtente","gravar","submit","default|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton("Voltar","marcao_consulta","RegistarUtente","voltar","_self","default|fa-angle-right","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;


		form_1.addField(nome);
		form_1.addField(morada);
		form_1.addField(data_nascimento);
		form_1.addField(sexo);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/