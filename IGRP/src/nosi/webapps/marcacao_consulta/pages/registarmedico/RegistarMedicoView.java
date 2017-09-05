/*-------------------------*/

/*Create View*/

package nosi.webapps.marcacao_consulta.pages.registarmedico;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class RegistarMedicoView extends View {
	
	
	public Field nome;
	public Field morada;
	public Field n_consulta_por_dia;
	public Field especialidades;
	public Field p_id;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public RegistarMedicoView(RegistarMedico model){
		this.setPageTitle("Registar Medico");
			
		form_1 = new IGRPForm("form_1");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		morada = new TextField(model,"morada");
		morada.setLabel("Morada");
		morada.propertie().add("name","p_morada").add("type","text").add("maxlength","60").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		n_consulta_por_dia = new NumberField(model,"n_consulta_por_dia");
		n_consulta_por_dia.setLabel("Nº Consulta por dia");
		n_consulta_por_dia.propertie().add("name","p_n_consulta_por_dia").add("type","number").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("min","").add("max","");
		especialidades = new ListField(model,"especialidades");
		especialidades.setLabel("Especialidades");
		especialidades.propertie().add("name","p_especialidades").add("type","select").add("multiple","true").add("domain","").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","marcacao_consulta","RegistarMedico","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_voltar = new IGRPButton("Listar Medico","marcacao_consulta","RegistarMedico","voltar","_self","default|fa-list","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		
	
	}
		
	@Override
	public void render(){
		

		form_1.addField(nome);
		form_1.addField(morada);
		form_1.addField(n_consulta_por_dia);
		form_1.addField(especialidades);
		form_1.addField(p_id);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_1.addButton(btn_voltar);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/