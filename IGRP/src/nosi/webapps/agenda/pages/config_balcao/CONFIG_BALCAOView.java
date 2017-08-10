/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.config_balcao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class CONFIG_BALCAOView extends View {
	
	
	public Field page_title_text;
	public Field organica;
	public Field entidade;
	public Field localizacao;
	public Field fuso_horario;
	public Field nr_servicos;
	public Field confirmacao;
	public Field horario_de_atendimento;
	public Field hr_inicio;
	public Field hr_fim;
	public Field p_id;
	public Field p_estado;
	public IGRPBox box_1;
	public IGRPSectionHeader page_title;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public CONFIG_BALCAOView(CONFIG_BALCAO model){
		this.setPageTitle("Configuração de Balcao");
			
		box_1 = new IGRPBox("box_1");
		page_title = new IGRPSectionHeader("page_title");
		form_1 = new IGRPForm("form_1");
		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel("");
		page_title_text.setValue("Configurar Ponto de Atendimento");
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("persist","true").add("maxlength","4000");
		organica = new ListField(model,"organica");
		organica.setLabel("Organica");
		organica.propertie().add("name","p_organica").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		entidade = new ListField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		localizacao = new TextField(model,"localizacao");
		localizacao.setLabel("Localização");
		localizacao.propertie().add("name","p_localizacao").add("type","text").add("maxlength","300").add("required","true").add("change","false").add("readonly","true").add("disabled","false").add("placeholder","").add("right","false");
		fuso_horario = new TextField(model,"fuso_horario");
		fuso_horario.setLabel("Fuso Horário");
		fuso_horario.propertie().add("name","p_fuso_horario").add("type","text").add("maxlength","300").add("required","true").add("change","false").add("readonly","true").add("disabled","false").add("placeholder","").add("right","false");
		nr_servicos = new ListField(model,"nr_servicos");
		nr_servicos.setLabel("Número de Serviços");
		nr_servicos.propertie().add("name","p_nr_servicos").add("type","select").add("multiple","false").add("domain","").add("maxlength","2").add("required","true").add("change","false").add("disabled","false").add("right","false");
		confirmacao = new ListField(model,"confirmacao");
		confirmacao.setLabel("Confirmacao");
		confirmacao.propertie().add("name","p_confirmacao").add("type","select").add("multiple","false").add("domain","ALIENACAO_FOGO").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		horario_de_atendimento = new SeparatorField(model,"horario_de_atendimento");
		horario_de_atendimento.setLabel("Horário de Atendimento");
		horario_de_atendimento.propertie().add("name","p_horario_de_atendimento").add("type","separator").add("maxlength","30").add("placeholder","").add("right","false");
		hr_inicio = new ListField(model,"hr_inicio");
		hr_inicio.setLabel("Inicio");
		hr_inicio.propertie().add("name","p_hr_inicio").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		hr_fim = new ListField(model,"hr_fim");
		hr_fim.setLabel("Fim");
		hr_fim.propertie().add("name","p_hr_fim").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		p_estado = new HiddenField(model,"p_estado");
		p_estado.setLabel("");
		p_estado.propertie().add("name","p_estado").add("type","hidden").add("maxlength","30").add("tag","estado");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_gravar = new IGRPButton("Gravar","agenda","CONFIG_BALCAO","gravar","submit","success|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	
	}
		
	@Override
	public void render(){
		

		page_title.addField(page_title_text);


		form_1.addField(organica);
		form_1.addField(entidade);
		form_1.addField(localizacao);
		form_1.addField(fuso_horario);
		form_1.addField(nr_servicos);
		form_1.addField(confirmacao);
		form_1.addField(horario_de_atendimento);
		form_1.addField(hr_inicio);
		form_1.addField(hr_fim);
		form_1.addField(p_id);
		form_1.addField(p_estado);

		toolsbar_1.addButton(btn_gravar);
		this.addToPage(box_1);
		this.addToPage(page_title);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/