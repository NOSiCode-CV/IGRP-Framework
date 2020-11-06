package nosi.webapps.igrp.pages.detalhesprocesso;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class DetalhesProcessoView extends View {

	public Field sectionheader_1_text;
	public Field numero_de_processo;
	public Field descricao;
	public Field data_inicio_de_processo;
	public Field data_criacao_de_processo;
	public Field data_fim_processo;
	public Field img_1;
	public IGRPSectionHeader sectionheader_1;
	public IGRPView view_1;
	public IGRPForm form_1;


	public DetalhesProcessoView(){

		this.setPageTitle("Detalhes Processo");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		view_1 = new IGRPView("view_1","");

		form_1 = new IGRPForm("form_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Detalhes do&nbsp;Processo</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		numero_de_processo = new TextField(model,"numero_de_processo");
		numero_de_processo.setLabel(gt("Processo"));
		numero_de_processo.propertie().add("name","p_numero_de_processo").add("type","text").add("maxlength","30").add("class","default").add("img","fa-hashtag").add("showlabel","true");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("class","info").add("img","fa-info-circle").add("showlabel","true");
		
		data_inicio_de_processo = new TextField(model,"data_inicio_de_processo");
		data_inicio_de_processo.setLabel(gt("Data Início de Processo"));
		data_inicio_de_processo.propertie().add("name","p_data_inicio_de_processo").add("type","text").add("maxlength","30").add("class","success").add("img","fa-calendar").add("showlabel","true");
		
		data_criacao_de_processo = new TextField(model,"data_criacao_de_processo");
		data_criacao_de_processo.setLabel(gt("Data Criação de Processo"));
		data_criacao_de_processo.propertie().add("name","p_data_criacao_de_processo").add("type","text").add("maxlength","30").add("class","primary").add("img","fa-calendar-plus-o").add("showlabel","true");
		
		data_fim_processo = new TextField(model,"data_fim_processo");
		data_fim_processo.setLabel(gt("Data Fim Processo"));
		data_fim_processo.propertie().add("name","p_data_fim_processo").add("type","text").add("maxlength","30").add("class","danger").add("img","fa-calendar-check-o").add("showlabel","true");
		
		img_1 = new TextField(model,"img_1");
		img_1.setLabel(gt("Img"));
		img_1.setValue(gt("../images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		img_1.propertie().add("name","p_img_1").add("type","img").add("img","").add("width","").add("height","").add("croppie","false").add("rounded","false").add("maxlength","30").add("placeholder",gt("")).add("autoupload","false").add("desclabel","false");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(numero_de_processo);
		view_1.addField(descricao);
		view_1.addField(data_inicio_de_processo);
		view_1.addField(data_criacao_de_processo);
		view_1.addField(data_fim_processo);

		form_1.addField(img_1);

		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
		this.addToPage(form_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		numero_de_processo.setValue(model);
		descricao.setValue(model);
		data_inicio_de_processo.setValue(model);
		data_criacao_de_processo.setValue(model);
		data_fim_processo.setValue(model);	

		}
}
