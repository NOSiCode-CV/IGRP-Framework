
package nosi.webapps.tutorial.pages.geralapresentacao;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

import nosi.core.config.Config;

public class GeralApresentacaoView extends View {

	public Field sectionheader_2_text;
	public Field welcome;
	public Field videos_tutoriais;
	public Field documentos_gerais;
	public Field sectionheader_1_text;
	public Field quickbuttonbox_gestao_tit;
	public Field quickbuttonbox_gestao_val;
	public Field quickbuttonbox_gestao_url;
	public Field quickbuttonbox_gestao_bg;
	public Field quickbuttonbox_gestao_icn;
	public Field statbox_1_tit;
	public Field statbox_1_val;
	public Field statbox_1_txt;
	public Field statbox_1_url;
	public Field statbox_1_bg;
	public Field statbox_1_icn;
	public Field paragraph_1_text;
	public Field quickbuttonbox_instalar_tit;
	public Field quickbuttonbox_instalar_val;
	public Field quickbuttonbox_instalar_url;
	public Field quickbuttonbox_instalar_bg;
	public Field quickbuttonbox_instalar_icn;
	public Field paragraph_6_text;
	public Field video_2_text;
	public Field quickbuttonbox__tit;
	public Field quickbuttonbox__val;
	public Field quickbuttonbox__url;
	public Field quickbuttonbox__bg;
	public Field quickbuttonbox__icn;
	public Field documento;
	public Field ver;
	public IGRPForm sectionheader_2;
	public IGRPForm tabcontent_1;
	public IGRPForm sectionheader_1;
	public IGRPForm quickbuttonbox_gestao;
	public IGRPForm statbox_1;
	public IGRPForm paragraph_1;
	public IGRPForm quickbuttonbox_instalar;
	public IGRPForm paragraph_6;
	public IGRPVideo video_2;
	public IGRPForm quickbuttonbox_;
	public IGRPTable table_1;


	public GeralApresentacaoView(){

		this.setPageTitle("O que fazer dentro do IGRP JAVA...");
			
		sectionheader_2 = new IGRPForm("sectionheader_2","");

		tabcontent_1 = new IGRPForm("tabcontent_1","");

		sectionheader_1 = new IGRPForm("sectionheader_1","");

		quickbuttonbox_gestao = new IGRPForm("quickbuttonbox_gestao","");

		statbox_1 = new IGRPForm("statbox_1","");

		paragraph_1 = new IGRPForm("paragraph_1","Tutorial IGRP WEB");

		quickbuttonbox_instalar = new IGRPForm("quickbuttonbox_instalar","");

		paragraph_6 = new IGRPForm("paragraph_6","Documentos IGRP WEB");

		video_2 = new IGRPVideo("video_2","Welcome IGRP WEB Framework");

		quickbuttonbox_ = new IGRPForm("quickbuttonbox_","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_2_text = new TextField(model,"sectionheader_2_text");
		sectionheader_2_text.setLabel(gt(""));
		sectionheader_2_text.setValue(gt("Tutorial IGRP WEB"));
		sectionheader_2_text.propertie().add("type","text").add("name","p_sectionheader_2_text").add("maxlength","4000");
		
		welcome = new TextField(model,"welcome");
		welcome.setLabel(gt("Welcome"));
		welcome.propertie().add("name","p_welcome").add("type","button").add("request_fields","").add("maxlength","50");
		
		videos_tutoriais = new TextField(model,"videos_tutoriais");
		videos_tutoriais.setLabel(gt("Videos Tutoriais"));
		videos_tutoriais.propertie().add("name","p_videos_tutoriais").add("type","button").add("request_fields","").add("maxlength","50");
		
		documentos_gerais = new TextField(model,"documentos_gerais");
		documentos_gerais.setLabel(gt("Documentos Gerais"));
		documentos_gerais.propertie().add("name","p_documentos_gerais").add("type","button").add("request_fields","").add("maxlength","50");
		
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Bem-vindo ao seu IGRP WEB"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		quickbuttonbox_gestao_tit = new TextField(model,"quickbuttonbox_gestao_tit");
		quickbuttonbox_gestao_tit.setLabel(gt("Title"));
		quickbuttonbox_gestao_tit.setValue(gt("Criação e Gestão de uma Aplicação"));
		quickbuttonbox_gestao_tit.propertie().add("name","p_quickbuttonbox_gestao_tit").add("type","text").add("maxlength","4000");
		
		quickbuttonbox_gestao_val = new TextField(model,"quickbuttonbox_gestao_val");
		quickbuttonbox_gestao_val.setLabel(gt("Value"));
		quickbuttonbox_gestao_val.propertie().add("name","p_quickbuttonbox_gestao_val").add("type","text").add("maxlength","4000");
		
		quickbuttonbox_gestao_url = new TextField(model,"quickbuttonbox_gestao_url");
		quickbuttonbox_gestao_url.setLabel(gt(""));
		quickbuttonbox_gestao_url.setValue(gt("[object Object]"));
		quickbuttonbox_gestao_url.propertie().add("name","p_quickbuttonbox_gestao_url").add("type","text").add("maxlength","4000");
		
		quickbuttonbox_gestao_bg = new TextField(model,"quickbuttonbox_gestao_bg");
		quickbuttonbox_gestao_bg.setLabel(gt("Background"));
		quickbuttonbox_gestao_bg.setValue(gt("cp-starrynight"));
		quickbuttonbox_gestao_bg.propertie().add("name","p_quickbuttonbox_gestao_bg").add("type","text").add("maxlength","4000");
		
		quickbuttonbox_gestao_icn = new TextField(model,"quickbuttonbox_gestao_icn");
		quickbuttonbox_gestao_icn.setLabel(gt("Icon"));
		quickbuttonbox_gestao_icn.setValue(gt("fa-video-camera"));
		quickbuttonbox_gestao_icn.propertie().add("name","p_quickbuttonbox_gestao_icn").add("type","text").add("maxlength","4000");
		
		statbox_1_tit = new TextField(model,"statbox_1_tit");
		statbox_1_tit.setLabel(gt("Box Title"));
		statbox_1_tit.setValue(gt("FAQ"));
		statbox_1_tit.propertie().add("name","p_statbox_1_tit").add("type","text").add("maxlength","4000");
		
		statbox_1_val = new TextField(model,"statbox_1_val");
		statbox_1_val.setLabel(gt("Value"));
		statbox_1_val.setValue(gt(""));
		statbox_1_val.propertie().add("name","p_statbox_1_val").add("type","text").add("maxlength","4000");
		
		statbox_1_txt = new TextField(model,"statbox_1_txt");
		statbox_1_txt.setLabel(gt("Url Text"));
		statbox_1_txt.setValue(gt("Read More..."));
		statbox_1_txt.propertie().add("name","p_statbox_1_txt").add("type","text").add("maxlength","4000");
		
		statbox_1_url = new TextField(model,"statbox_1_url");
		statbox_1_url.setLabel(gt("Url"));
		statbox_1_url.setValue(gt("https://nosicode.gitbook.io/faq/"));
		statbox_1_url.propertie().add("name","p_statbox_1_url").add("type","text").add("maxlength","4000");
		
		statbox_1_bg = new TextField(model,"statbox_1_bg");
		statbox_1_bg.setLabel(gt("Background"));
		statbox_1_bg.setValue(gt("cp-cyan"));
		statbox_1_bg.propertie().add("name","p_statbox_1_bg").add("type","text").add("maxlength","4000");
		
		statbox_1_icn = new TextField(model,"statbox_1_icn");
		statbox_1_icn.setLabel(gt("Icon"));
		statbox_1_icn.setValue(gt("fa-external-link"));
		statbox_1_icn.propertie().add("name","p_statbox_1_icn").add("type","text").add("maxlength","4000");
		
		paragraph_1_text = new TextField(model,"paragraph_1_text");
		paragraph_1_text.setLabel(gt(""));
		paragraph_1_text.setValue(gt("Nesse pequeno Tutorial vamos ver como fazer diversas coisas com o IGRP WEB através de vídeos e documentos., como gerir um App desde a sua criação até atribuição de acesso, gerar as páginas e os CRUDs numa tabela. Agora é só navegar e descobrir a mágica da criaão e integração das aplicações. Bom aproveito..."));
		paragraph_1_text.propertie().add("type","text").add("name","p_paragraph_1_text").add("maxlength","4000");
		
		quickbuttonbox_instalar_tit = new TextField(model,"quickbuttonbox_instalar_tit");
		quickbuttonbox_instalar_tit.setLabel(gt("Title"));
		quickbuttonbox_instalar_tit.setValue(gt("Como importar o IGRP WEB"));
		quickbuttonbox_instalar_tit.propertie().add("name","p_quickbuttonbox_instalar_tit").add("type","text").add("maxlength","4000");
		
		quickbuttonbox_instalar_val = new TextField(model,"quickbuttonbox_instalar_val");
		quickbuttonbox_instalar_val.setLabel(gt("Value"));
		quickbuttonbox_instalar_val.propertie().add("name","p_quickbuttonbox_instalar_val").add("type","text").add("maxlength","4000");
		
		quickbuttonbox_instalar_url = new TextField(model,"quickbuttonbox_instalar_url");
		quickbuttonbox_instalar_url.setLabel(gt(""));
		quickbuttonbox_instalar_url.setValue(gt("[object Object]"));
		quickbuttonbox_instalar_url.propertie().add("name","p_quickbuttonbox_instalar_url").add("type","text").add("maxlength","4000");
		
		quickbuttonbox_instalar_bg = new TextField(model,"quickbuttonbox_instalar_bg");
		quickbuttonbox_instalar_bg.setLabel(gt("Background"));
		quickbuttonbox_instalar_bg.setValue(gt("cp-starrynight"));
		quickbuttonbox_instalar_bg.propertie().add("name","p_quickbuttonbox_instalar_bg").add("type","text").add("maxlength","4000");
		
		quickbuttonbox_instalar_icn = new TextField(model,"quickbuttonbox_instalar_icn");
		quickbuttonbox_instalar_icn.setLabel(gt("Icon"));
		quickbuttonbox_instalar_icn.setValue(gt("fa-video-camera"));
		quickbuttonbox_instalar_icn.propertie().add("name","p_quickbuttonbox_instalar_icn").add("type","text").add("maxlength","4000");
		
		paragraph_6_text = new TextField(model,"paragraph_6_text");
		paragraph_6_text.setLabel(gt(""));
		paragraph_6_text.setValue(gt("Documentos auxiliares na apredizagem de algumas funcionalidades do IGRP WEB. Para mais dúvidas... por favor consulte o nosso FAQ ao lado!!"));
		paragraph_6_text.propertie().add("type","text").add("name","p_paragraph_6_text").add("maxlength","4000");
		
		video_2_text = new TextField(model,"video_2_text");
		video_2_text.setLabel(gt(""));
		video_2_text.setValue(gt("https://www.youtube.com/embed/Xc38EPBydco"));
		video_2_text.propertie().add("type","text").add("name","p_video_2_text").add("maxlength","4000");
		
		quickbuttonbox__tit = new TextField(model,"quickbuttonbox__tit");
		quickbuttonbox__tit.setLabel(gt("Title"));
		quickbuttonbox__tit.setValue(gt("My First App, config DB, Crud"));
		quickbuttonbox__tit.propertie().add("name","p_quickbuttonbox__tit").add("type","text").add("maxlength","4000");
		
		quickbuttonbox__val = new TextField(model,"quickbuttonbox__val");
		quickbuttonbox__val.setLabel(gt("Value"));
		quickbuttonbox__val.propertie().add("name","p_quickbuttonbox__val").add("type","text").add("maxlength","4000");
		
		quickbuttonbox__url = new TextField(model,"quickbuttonbox__url");
		quickbuttonbox__url.setLabel(gt(""));
		quickbuttonbox__url.setValue(gt("[object Object]"));
		quickbuttonbox__url.propertie().add("name","p_quickbuttonbox__url").add("type","text").add("maxlength","4000");
		
		quickbuttonbox__bg = new TextField(model,"quickbuttonbox__bg");
		quickbuttonbox__bg.setLabel(gt("Background"));
		quickbuttonbox__bg.setValue(gt("cp-starrynight"));
		quickbuttonbox__bg.propertie().add("name","p_quickbuttonbox__bg").add("type","text").add("maxlength","4000");
		
		quickbuttonbox__icn = new TextField(model,"quickbuttonbox__icn");
		quickbuttonbox__icn.setLabel(gt("Icon"));
		quickbuttonbox__icn.setValue(gt("fa-video-camera"));
		quickbuttonbox__icn.propertie().add("name","p_quickbuttonbox__icn").add("type","text").add("maxlength","4000");
		
		documento = new TextField(model,"documento");
		documento.setLabel(gt("Documento"));
		documento.propertie().add("name","p_documento").add("type","text").add("maxlength","30");
		
		ver = new LinkField(model,"ver");
		ver.setLabel(gt("Ver"));
		ver.setValue(new Config().getResolveUrl("undefined","undefined","undefined"));
		ver.propertie().add("name","p_ver").add("type","link").add("target","_newtab").add("maxlength","30").add("request_fields","").add("desc","true");
		


		
	}
		
	@Override
	public void render(){
		
		sectionheader_2.addField(sectionheader_2_text);

		tabcontent_1.addField(welcome);
		tabcontent_1.addField(videos_tutoriais);
		tabcontent_1.addField(documentos_gerais);

		sectionheader_1.addField(sectionheader_1_text);

		quickbuttonbox_gestao.addField(quickbuttonbox_gestao_tit);
		quickbuttonbox_gestao.addField(quickbuttonbox_gestao_val);
		quickbuttonbox_gestao.addField(quickbuttonbox_gestao_url);
		quickbuttonbox_gestao.addField(quickbuttonbox_gestao_bg);
		quickbuttonbox_gestao.addField(quickbuttonbox_gestao_icn);

		statbox_1.addField(statbox_1_tit);
		statbox_1.addField(statbox_1_val);
		statbox_1.addField(statbox_1_txt);
		statbox_1.addField(statbox_1_url);
		statbox_1.addField(statbox_1_bg);
		statbox_1.addField(statbox_1_icn);

		paragraph_1.addField(paragraph_1_text);

		quickbuttonbox_instalar.addField(quickbuttonbox_instalar_tit);
		quickbuttonbox_instalar.addField(quickbuttonbox_instalar_val);
		quickbuttonbox_instalar.addField(quickbuttonbox_instalar_url);
		quickbuttonbox_instalar.addField(quickbuttonbox_instalar_bg);
		quickbuttonbox_instalar.addField(quickbuttonbox_instalar_icn);

		paragraph_6.addField(paragraph_6_text);

		video_2.addField(video_2_text);

		quickbuttonbox_.addField(quickbuttonbox__tit);
		quickbuttonbox_.addField(quickbuttonbox__val);
		quickbuttonbox_.addField(quickbuttonbox__url);
		quickbuttonbox_.addField(quickbuttonbox__bg);
		quickbuttonbox_.addField(quickbuttonbox__icn);

		table_1.addField(documento);
		table_1.addField(ver);

		this.addToPage(sectionheader_2);
		this.addToPage(tabcontent_1);
		this.addToPage(sectionheader_1);
		this.addToPage(quickbuttonbox_gestao);
		this.addToPage(statbox_1);
		this.addToPage(paragraph_1);
		this.addToPage(quickbuttonbox_instalar);
		this.addToPage(paragraph_6);
		this.addToPage(video_2);
		this.addToPage(quickbuttonbox_);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		welcome.setValue(model);
		videos_tutoriais.setValue(model);
		documentos_gerais.setValue(model);
		quickbuttonbox_gestao_val.setValue(model);
		quickbuttonbox_instalar_val.setValue(model);
		quickbuttonbox__val.setValue(model);
		documento.setValue(model);
		ver.setValue(model);	

		table_1.loadModel(((GeralApresentacao) model).getTable_1());
		
	}
}
