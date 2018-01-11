
package nosi.webapps.igrp.pages.detalhesprocesso;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class DetalhesProcessoView extends View {
	
	
	public Field sectionheader_1_text;
	public Field numero_de_processo;
	public Field descricao;
	public Field data_criacao_de_processo;
	public Field data_inicio_de_processo;
	public Field data_fim_processo;
	public Field view_1_img;
	public IGRPSectionHeader sectionheader_1;
	public IGRPView view_1;

	public DetalhesProcessoView(DetalhesProcesso model){
		this.setPageTitle("Detalhes Processo");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		view_1 = new IGRPView("view_1","");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		
		sectionheader_1_text.setValue(gt("Detalhes de Processo"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		numero_de_processo = new TextField(model,"numero_de_processo");
		numero_de_processo.setLabel(gt("Número De Processo"));
		
		numero_de_processo.propertie().add("name","p_numero_de_processo").add("type","text").add("maxlength","30");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30");
		data_criacao_de_processo = new TextField(model,"data_criacao_de_processo");
		data_criacao_de_processo.setLabel(gt("Data Criação de Processo"));
		
		data_criacao_de_processo.propertie().add("name","p_data_criacao_de_processo").add("type","text").add("maxlength","30");
		data_inicio_de_processo = new TextField(model,"data_inicio_de_processo");
		data_inicio_de_processo.setLabel(gt("Data Início de Processo"));
		
		data_inicio_de_processo.propertie().add("name","p_data_inicio_de_processo").add("type","text").add("maxlength","30");
		data_fim_processo = new TextField(model,"data_fim_processo");
		data_fim_processo.setLabel(gt("Data Fim Processo"));
		
		data_fim_processo.propertie().add("name","p_data_fim_processo").add("type","text").add("maxlength","30");
		view_1_img = new TextField(model,"view_1_img");
		view_1_img.setLabel(gt(""));
		
		view_1_img.propertie().add("type","text").add("name","p_view_1_img").add("maxlength","300");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(numero_de_processo);
		view_1.addField(descricao);
		view_1.addField(data_criacao_de_processo);
		view_1.addField(data_inicio_de_processo);
		view_1.addField(data_fim_processo);
		view_1.addField(view_1_img);

		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
	}
}
