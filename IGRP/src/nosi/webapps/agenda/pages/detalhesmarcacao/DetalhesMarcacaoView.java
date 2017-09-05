/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.detalhesmarcacao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class DetalhesMarcacaoView extends View {
	
	
	public Field nome;
	public Field requerente;
	public Field contato;
	public Field email;
	public Field telemovel;
	public Field telefone;
	public Field detalhes_agenda;
	public Field servico;
	public Field balcao;
	public Field data;
	public Field hora;
	public Field tipo_documento;
	public Field n_documento;
	public Field view_1_img;
	public Field p_id;
	public IGRPView view_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_confirmar_presenca;
	public IGRPButton btn_cancelar_agenda;
	public IGRPButton btn_confirmar_agenda;
	public DetalhesMarcacaoView(DetalhesMarcacao model){
		this.setPageTitle("Detalhes Agenda Marcado");
			
		view_1 = new IGRPView("view_1");
		form_1 = new IGRPForm("form_1");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30");
		requerente = new TextField(model,"requerente");
		requerente.setLabel("Requerente");
		requerente.propertie().add("name","p_requerente").add("type","text").add("maxlength","30");
		contato = new SeparatorField(model,"contato");
		contato.setLabel("Contato");
		contato.propertie().add("name","p_contato").add("type","separator").add("maxlength","30");
		email = new TextField(model,"email");
		email.setLabel("Email");
		email.propertie().add("name","p_email").add("type","text").add("maxlength","30");
		telemovel = new TextField(model,"telemovel");
		telemovel.setLabel("Telemovel");
		telemovel.propertie().add("name","p_telemovel").add("type","text").add("maxlength","30");
		telefone = new TextField(model,"telefone");
		telefone.setLabel("Telefone");
		telefone.propertie().add("name","p_telefone").add("type","text").add("maxlength","30");
		detalhes_agenda = new SeparatorField(model,"detalhes_agenda");
		detalhes_agenda.setLabel("Detalhes Agenda");
		detalhes_agenda.propertie().add("name","p_detalhes_agenda").add("type","separator").add("maxlength","30");
		servico = new TextField(model,"servico");
		servico.setLabel("Serviço");
		servico.propertie().add("name","p_servico").add("type","text").add("maxlength","30");
		balcao = new TextField(model,"balcao");
		balcao.setLabel("Balcao");
		balcao.propertie().add("name","p_balcao").add("type","text").add("maxlength","30");
		data = new TextField(model,"data");
		data.setLabel("Data");
		data.propertie().add("name","p_data").add("type","text").add("maxlength","30");
		hora = new TextField(model,"hora");
		hora.setLabel("Hora");
		hora.propertie().add("name","p_hora").add("type","text").add("maxlength","30");
		tipo_documento = new TextField(model,"tipo_documento");
		tipo_documento.setLabel("Tipo Documento");
		tipo_documento.propertie().add("name","p_tipo_documento").add("type","text").add("maxlength","30");
		n_documento = new TextField(model,"n_documento");
		n_documento.setLabel("Nº Documento");
		n_documento.propertie().add("name","p_n_documento").add("type","text").add("maxlength","30");
		view_1_img = new TextField(model,"view_1_img");
		view_1_img.setLabel("");
		view_1_img.propertie().add("type","text").add("name","p_view_1_img").add("maxlength","300");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_confirmar_presenca = new IGRPButton("Confirmar Presenca","agenda","DetalhesMarcacao","confirmarPresenca","alert_submit","warning|fa-hand-pointer-o","","");
		btn_confirmar_presenca.propertie.add("type","specific").add("code","").add("rel","confirmar_presenca");
		btn_cancelar_agenda = new IGRPButton("Cancelar Agenda","agenda","DetalhesMarcacao","cancelarAgenda","alert_submit","danger|fa-remove","","");
		btn_cancelar_agenda.propertie.add("type","specific").add("code","").add("rel","cancelar_agenda");
		btn_confirmar_agenda = new IGRPButton("Confirmar Agenda","agenda","DetalhesMarcacao","confirmarAgenda","alert_submit","success|fa-check","","");
		btn_confirmar_agenda.propertie.add("type","specific").add("code","").add("rel","confirmar_agenda");
		
	}
		
	@Override
	public void render(){
		

		view_1.addField(nome);
		view_1.addField(requerente);
		view_1.addField(contato);
		view_1.addField(email);
		view_1.addField(telemovel);
		view_1.addField(telefone);
		view_1.addField(detalhes_agenda);
		view_1.addField(servico);
		view_1.addField(balcao);
		view_1.addField(data);
		view_1.addField(hora);
		view_1.addField(tipo_documento);
		view_1.addField(n_documento);
		view_1.addField(view_1_img);

		form_1.addField(p_id);

		this.addToPage(view_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/