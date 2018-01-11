
package nosi.webapps.tutorial.pages.geralapresentacao;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class GeralApresentacaoView extends View {
	
	
	public Field sectionheader_2_text;
	public Field welcome;
	public Field gestao;
	public Field desenvolvimento;
	public Field contribuicao;
	public Field documentos_gerais;
	public Field paragraph_6_text;
	public Field sectionheader_1_text;
	public Field documento;
	public Field ver;
	public Field paragraph_1_text;
	public Field video_2_text;
	public Field paragraph_7_text;
	public Field paragraph_8_text;
	public Field video_6_text;
	public Field paragraph_3_text;
	public Field video_3_text;
	public Field video_7_text;
	public Field paragraph_5_text;
	public Field video_1_text;
	public Field como_instalar_igrp_java_framework;
	public Field my_first_app;
	public IGRPSectionHeader sectionheader_2;
	public IGRPTabContent tabcontent_1;
	public IGRPTabContent tabcontent_2;
	public IGRPParagraph paragraph_6;
	public IGRPSectionHeader sectionheader_1;
	public IGRPTable table_1;
	public IGRPParagraph paragraph_1;
	public IGRPVideo video_2;
	public IGRPParagraph paragraph_7;
	public IGRPParagraph paragraph_8;
	public IGRPVideo video_6;
	public IGRPParagraph paragraph_3;
	public IGRPVideo video_3;
	public IGRPVideo video_7;
	public IGRPParagraph paragraph_5;
	public IGRPVideo video_1;
	public IGRPTabContent tabcontent_3;

	public GeralApresentacaoView(GeralApresentacao model){
		this.setPageTitle("O que fazer dentro do IGRP JAVA...");
			
		sectionheader_2 = new IGRPSectionHeader("sectionheader_2","");
		tabcontent_1 = new IGRPTabContent("tabcontent_1","");
		tabcontent_2 = new IGRPTabContent("tabcontent_2","");
		paragraph_6 = new IGRPParagraph("paragraph_6","Documentos IGRP JAVA Framework");
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		table_1 = new IGRPTable("table_1","");
		paragraph_1 = new IGRPParagraph("paragraph_1","Tutorial IGRP JAVA Framework");
		video_2 = new IGRPVideo("video_2","Video de Welcome IGRP JAVA Framework");
		paragraph_7 = new IGRPParagraph("paragraph_7","Como Contribuir no IGRP JAVA");
		paragraph_8 = new IGRPParagraph("paragraph_8","Baixar e instalar IGRP JAVA Framework");
		video_6 = new IGRPVideo("video_6","Como importar o IGRP JAVA (NosiCode e GitHub)");
		paragraph_3 = new IGRPParagraph("paragraph_3","Exemplo de como gerir uma aplicação");
		video_3 = new IGRPVideo("video_3","Criação e Gestão de uma Aplicação");
		video_7 = new IGRPVideo("video_7","Contribuindo no IGRP JAVA Framework");
		paragraph_5 = new IGRPParagraph("paragraph_5","Minha Primeira Aplicação");
		video_1 = new IGRPVideo("video_1","My First App");
		tabcontent_3 = new IGRPTabContent("tabcontent_3","");
		sectionheader_2_text = new TextField(model,"sectionheader_2_text");
		sectionheader_2_text.setLabel(gt(""));
		
		sectionheader_2_text.setValue(gt("Tutorial Framework IGRP JAVA"));
		sectionheader_2_text.propertie().add("type","text").add("name","p_sectionheader_2_text").add("persist","true").add("maxlength","4000");
		welcome = new TextField(model,"welcome");
		welcome.setLabel(gt("Welcome"));
		
		welcome.propertie().add("name","p_welcome").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-child").add("maxlength","50");
		gestao = new TextField(model,"gestao");
		gestao.setLabel(gt("Gestão"));
		
		gestao.propertie().add("name","p_gestao").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-video-camera").add("maxlength","50");
		desenvolvimento = new TextField(model,"desenvolvimento");
		desenvolvimento.setLabel(gt("Desenvolvimento"));
		
		desenvolvimento.propertie().add("name","p_desenvolvimento").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-video-camera").add("maxlength","50");
		contribuicao = new TextField(model,"contribuicao");
		contribuicao.setLabel(gt("Contribuição"));
		
		contribuicao.propertie().add("name","p_contribuicao").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-video-camera").add("maxlength","50");
		documentos_gerais = new TextField(model,"documentos_gerais");
		documentos_gerais.setLabel(gt("Documentos Gerais"));
		
		documentos_gerais.propertie().add("name","p_documentos_gerais").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-file-text").add("maxlength","50");
		paragraph_6_text = new TextField(model,"paragraph_6_text");
		paragraph_6_text.setLabel(gt(""));
		
		paragraph_6_text.setValue(gt("Documentos auxiliares na apredizagem de algumas funcionalidades do IGRP JAVA Framework."));
		paragraph_6_text.propertie().add("type","text").add("name","p_paragraph_6_text").add("persist","true").add("maxlength","4000");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		
		sectionheader_1_text.setValue(gt("Bem-vindo ao seu IGRP Java"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		documento = new TextField(model,"documento");
		documento.setLabel(gt("Documento"));
		
		documento.propertie().add("name","p_documento").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		ver = new LinkField(model,"ver");
		ver.setLabel(gt("Ver"));
		
		ver.propertie().add("name","p_ver").add("type","link").add("target","_newtab").add("target_fields","").add("closerefresh","false").add("action","undefined").add("page","undefined").add("app","undefined").add("class","link").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-link").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("desc","true");
		paragraph_1_text = new TextField(model,"paragraph_1_text");
		paragraph_1_text.setLabel(gt(""));
		
		paragraph_1_text.setValue(gt("Nesse pequeno Tutorial vamos ver como fazer diversas coisas com o IGRP JAVA Framework através de vídeos e documentos., como gerir um App desde a sua criação até atribuição de acesso, geração das páginas e dos CRUDs numa tabela. Agora é só navegar e descobrir a mágica da criaão e integração das aplicações. Bom aproveito..."));
		paragraph_1_text.propertie().add("type","text").add("name","p_paragraph_1_text").add("persist","true").add("maxlength","4000");
		video_2_text = new TextField(model,"video_2_text");
		video_2_text.setLabel(gt(""));
		
		video_2_text.setValue(gt("https://www.youtube.com/embed/nbcj8C_FQEw"));
		video_2_text.propertie().add("type","text").add("name","p_video_2_text").add("persist","true").add("maxlength","4000");
		paragraph_7_text = new TextField(model,"paragraph_7_text");
		paragraph_7_text.setLabel(gt(""));
		
		paragraph_7_text.setValue(gt("Nesse vídeo vamos aprender como fazer uma contribuição nesse framework, desde do import do projecto no repositório GitHub até como gerar as nossas páginas e actualizar o nosso repositório local."));
		paragraph_7_text.propertie().add("type","text").add("name","p_paragraph_7_text").add("persist","true").add("maxlength","4000");
		paragraph_8_text = new TextField(model,"paragraph_8_text");
		paragraph_8_text.setLabel(gt(""));
		
		paragraph_8_text.setValue(gt("Nessa sessão mostra como baixar e instalar o IGRP, para tal temos 2 vídeos. Primeiro mostra como como importar o IGRP JAVA do repositório GitHub directamente do Eclipse IDE e o segundo mostra como baixar o IGRP JAVA do site NosiCode e depois importar no Eclipse IDE"));
		paragraph_8_text.propertie().add("type","text").add("name","p_paragraph_8_text").add("persist","true").add("maxlength","4000");
		video_6_text = new TextField(model,"video_6_text");
		video_6_text.setLabel(gt(""));
		
		video_6_text.setValue(gt("https://www.youtube.com/embed/ABd-IR3_wsQ?rel=0"));
		video_6_text.propertie().add("type","text").add("name","p_video_6_text").add("persist","true").add("maxlength","4000");
		paragraph_3_text = new TextField(model,"paragraph_3_text");
		paragraph_3_text.setLabel(gt(""));
		
		paragraph_3_text.setValue(gt("Um pequeno Demo de como criar uma aplicação, gerar páginas e atribuir permissões de acesso a determinados utilizadores."));
		paragraph_3_text.propertie().add("type","text").add("name","p_paragraph_3_text").add("persist","true").add("maxlength","4000");
		video_3_text = new TextField(model,"video_3_text");
		video_3_text.setLabel(gt(""));
		
		video_3_text.setValue(gt("https://www.youtube.com/embed/v5zFGYK3zV8"));
		video_3_text.propertie().add("type","text").add("name","p_video_3_text").add("persist","true").add("maxlength","4000");
		video_7_text = new TextField(model,"video_7_text");
		video_7_text.setLabel(gt(""));
		
		video_7_text.setValue(gt("https://www.youtube.com/embed/cJTJuEtTRbc"));
		video_7_text.propertie().add("type","text").add("name","p_video_7_text").add("persist","true").add("maxlength","4000");
		paragraph_5_text = new TextField(model,"paragraph_5_text");
		paragraph_5_text.setLabel(gt(""));
		
		paragraph_5_text.setValue(gt("Aqui vamos desenvolver uma pequena aplicação com duas páginas com intuito de inserir e ler dados os dados de base de dados (PostgreSql). Ao longo do vídeo também mostra como baixar e instalar o PostGreSql e configurar a conexão da aplicação com o mesmo."));
		paragraph_5_text.propertie().add("type","text").add("name","p_paragraph_5_text").add("persist","true").add("maxlength","4000");
		video_1_text = new TextField(model,"video_1_text");
		video_1_text.setLabel(gt(""));
		
		video_1_text.setValue(gt("https://www.youtube.com/embed/BEjnNo_old8"));
		video_1_text.propertie().add("type","text").add("name","p_video_1_text").add("persist","true").add("maxlength","4000");
		como_instalar_igrp_java_framework = new TextField(model,"como_instalar_igrp_java_framework");
		como_instalar_igrp_java_framework.setLabel(gt("Como instalar IGRP JAVA Framework"));
		
		como_instalar_igrp_java_framework.propertie().add("name","p_como_instalar_igrp_java_framework").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-hand-o-right").add("maxlength","50");
		my_first_app = new TextField(model,"my_first_app");
		my_first_app.setLabel(gt("My first App"));
		
		my_first_app.propertie().add("name","p_my_first_app").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-hand-o-right").add("maxlength","50");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_2.addField(sectionheader_2_text);

		tabcontent_1.addField(welcome);
		tabcontent_1.addField(gestao);
		tabcontent_1.addField(desenvolvimento);
		tabcontent_1.addField(contribuicao);
		tabcontent_1.addField(documentos_gerais);


		paragraph_6.addField(paragraph_6_text);

		sectionheader_1.addField(sectionheader_1_text);

		table_1.addField(documento);
		table_1.addField(ver);

		paragraph_1.addField(paragraph_1_text);

		video_2.addField(video_2_text);

		paragraph_7.addField(paragraph_7_text);

		paragraph_8.addField(paragraph_8_text);

		video_6.addField(video_6_text);

		paragraph_3.addField(paragraph_3_text);

		video_3.addField(video_3_text);

		video_7.addField(video_7_text);

		paragraph_5.addField(paragraph_5_text);

		video_1.addField(video_1_text);

		tabcontent_3.addField(como_instalar_igrp_java_framework);
		tabcontent_3.addField(my_first_app);

		this.addToPage(sectionheader_2);
		this.addToPage(tabcontent_1);
		this.addToPage(tabcontent_2);
		this.addToPage(paragraph_6);
		this.addToPage(sectionheader_1);
		this.addToPage(table_1);
		this.addToPage(paragraph_1);
		this.addToPage(video_2);
		this.addToPage(paragraph_7);
		this.addToPage(paragraph_8);
		this.addToPage(video_6);
		this.addToPage(paragraph_3);
		this.addToPage(video_3);
		this.addToPage(video_7);
		this.addToPage(paragraph_5);
		this.addToPage(video_1);
		this.addToPage(tabcontent_3);
	}
}
