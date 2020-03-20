package nosi.webapps.igrp_studio.pages.importarquivo;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class ImportArquivoView extends View {

	public Field sectionheader_1_text;
	public Field help;
	public Field importar_aplicacao;
	public Field importar_jar_file;
	public Field importar_sql_script;
	public Field importar_imagem;
	public Field sectionheader_2_text;
	public Field sectionheader_4_text;
	public Field sectionheader_5_text;
	public Field sectionheader_6_text;
	public Field arquivo_aplicacao;
	public Field jar_file;
	public Field aplicacao_script;
	public Field data_source;
	public Field sql_script;
	public Field aplicacao_combo_img;
	public Field imagens;
	public Field icon_app;
	public Field icon_app_check;
	public Field form_5_link_1;
	public Field sectionheader_3_text;
	public Field list_aplicacao;
	public Field arquivo_pagina;
	public IGRPSectionHeader sectionheader_1;
	public IGRPView view_1;
	public IGRPTabContent tabcontent_1;
	public IGRPSectionHeader sectionheader_2;
	public IGRPSectionHeader sectionheader_4;
	public IGRPSectionHeader sectionheader_5;
	public IGRPSectionHeader sectionheader_6;
	public IGRPForm form_2;
	public IGRPForm form_3;
	public IGRPForm form_4;
	public IGRPForm form_5;
	public IGRPBox box_1;
	public IGRPSectionHeader sectionheader_3;
	public IGRPForm form_6;

	public IGRPButton btn_btm_import_aplicacao;
	public IGRPButton btn_importar_jar_file;
	public IGRPButton btn_importar_script;
	public IGRPButton btn_import_images;
	public IGRPButton btn_btm_importar_page;

	public ImportArquivoView(){

		this.setPageTitle("Import Arquivo");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		view_1 = new IGRPView("view_1","");

		tabcontent_1 = new IGRPTabContent("tabcontent_1","");

		sectionheader_2 = new IGRPSectionHeader("sectionheader_2","");

		sectionheader_4 = new IGRPSectionHeader("sectionheader_4","");

		sectionheader_5 = new IGRPSectionHeader("sectionheader_5","");

		sectionheader_6 = new IGRPSectionHeader("sectionheader_6","");

		form_2 = new IGRPForm("form_2","");

		form_3 = new IGRPForm("form_3","");

		form_4 = new IGRPForm("form_4","");

		form_5 = new IGRPForm("form_5","");

		box_1 = new IGRPBox("box_1","");

		sectionheader_3 = new IGRPSectionHeader("sectionheader_3","");

		form_6 = new IGRPForm("form_6","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Importar Arquivos"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		help = new LinkField(model,"help");
		help.setLabel(gt("Help"));
		help.setValue(gt("https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&dad=tutorial&target=_blank&isPublic=1&lang=pt_PT;&p_type=import"));
		help.propertie().add("name","p_help").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","fa-question-circle").add("maxlength","250").add("showlabel","true");
		
		importar_aplicacao = new TextField(model,"importar_aplicacao");
		importar_aplicacao.setLabel(gt("Importar IGRP"));
		importar_aplicacao.propertie().add("name","p_importar_aplicacao").add("type","button").add("img","fa-cloud-upload").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("maxlength","50");
		
		importar_jar_file = new TextField(model,"importar_jar_file");
		importar_jar_file.setLabel(gt("Importar extra lib."));
		importar_jar_file.propertie().add("name","p_importar_jar_file").add("type","button").add("img","fa-external-link-square").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("maxlength","50");
		
		importar_sql_script = new TextField(model,"importar_sql_script");
		importar_sql_script.setLabel(gt("Importar Sql Script"));
		importar_sql_script.propertie().add("name","p_importar_sql_script").add("type","button").add("img","fa-code").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("maxlength","50");
		
		importar_imagem = new TextField(model,"importar_imagem");
		importar_imagem.setLabel(gt("Importar Imagens"));
		importar_imagem.propertie().add("name","p_importar_imagem").add("type","button").add("request_fields","").add("img","fa-image").add("refresh_components","").add("refresh_submit","false").add("maxlength","50");
		
		sectionheader_2_text = new TextField(model,"sectionheader_2_text");
		sectionheader_2_text.setLabel(gt(""));
		sectionheader_2_text.setValue(gt("Importar aplicação (.jar/.zip)"));
		sectionheader_2_text.propertie().add("type","text").add("name","p_sectionheader_2_text").add("maxlength","4000");
		
		sectionheader_4_text = new TextField(model,"sectionheader_4_text");
		sectionheader_4_text.setLabel(gt(""));
		sectionheader_4_text.setValue(gt("Importar third-party jar file (.jar)"));
		sectionheader_4_text.propertie().add("type","text").add("name","p_sectionheader_4_text").add("maxlength","4000");
		
		sectionheader_5_text = new TextField(model,"sectionheader_5_text");
		sectionheader_5_text.setLabel(gt(""));
		sectionheader_5_text.setValue(gt("Importar Sql Script"));
		sectionheader_5_text.propertie().add("type","text").add("name","p_sectionheader_5_text").add("maxlength","4000");
		
		sectionheader_6_text = new TextField(model,"sectionheader_6_text");
		sectionheader_6_text.setLabel(gt(""));
		sectionheader_6_text.setValue(gt("Importar Imagens (.jpg/.png/...)"));
		sectionheader_6_text.propertie().add("type","text").add("name","p_sectionheader_6_text").add("maxlength","4000");
		
		arquivo_aplicacao = new FileField(model,"arquivo_aplicacao");
		arquivo_aplicacao.setLabel(gt("IGRP compress file"));
		arquivo_aplicacao.propertie().add("name","p_arquivo_aplicacao").add("type","file").add("accept","application/java-archive,.jar,application/zip").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","1000").add("required","true").add("disabled","false").add("class","primary");
		
		jar_file = new FileField(model,"jar_file");
		jar_file.setLabel(gt("Jar file"));
		jar_file.propertie().add("name","p_jar_file").add("type","file").add("accept","application/java-archive,.jar").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","10000").add("required","true").add("disabled","false").add("class","danger");
		
		aplicacao_script = new ListField(model,"aplicacao_script");
		aplicacao_script.setLabel(gt("Aplicação"));
		aplicacao_script.propertie().add("remote",Core.getIGRPLink("igrp_studio","ImportArquivo","index")).add("name","p_aplicacao_script").add("type","select").add("multiple","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("name","p_data_source").add("type","select").add("multiple","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		sql_script = new FileField(model,"sql_script");
		sql_script.setLabel(gt("Sql Script"));
		sql_script.propertie().add("name","p_sql_script").add("type","file").add("maxlength","250").add("required","true").add("disabled","false").add("class","warning").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false");
		
		aplicacao_combo_img = new ListField(model,"aplicacao_combo_img");
		aplicacao_combo_img.setLabel(gt("Aplicação"));
		aplicacao_combo_img.propertie().add("name","p_aplicacao_combo_img").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		imagens = new FileField(model,"imagens");
		imagens.setLabel(gt("Imagens"));
		imagens.propertie().add("name","p_imagens").add("type","file").add("accept","image/*").add("targetrend","").add("multiple","true").add("rendvalue","false").add("maxlength","250").add("required","true").add("disabled","false").add("class","purple");
		
		icon_app = new CheckBoxField(model,"icon_app");
		icon_app.setLabel(gt("Icon app?"));
		icon_app.propertie().add("name","p_icon_app").add("type","checkbox").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("java-type","int").add("switch","true").add("check","true");
		
		form_5_link_1 = new LinkField(model,"form_5_link_1");
		form_5_link_1.setLabel(gt("Link"));
		form_5_link_1.setValue(Core.getIGRPLink("igrp_studio","ListaEnv","index"));

									form_5_link_1.propertie().add("name","p_form_5_link_1").add("type","link").add("target","_self").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","link").add("img","fa-link").add("maxlength","250").add("placeholder",gt("")).add("desclabel","false");
		
		sectionheader_3_text = new TextField(model,"sectionheader_3_text");
		sectionheader_3_text.setLabel(gt(""));
		sectionheader_3_text.setValue(gt("Importar página IGRP antiga (.zip)"));
		sectionheader_3_text.propertie().add("type","text").add("name","p_sectionheader_3_text").add("maxlength","4000");
		
		list_aplicacao = new ListField(model,"list_aplicacao");
		list_aplicacao.setLabel(gt("Aplicação"));
		list_aplicacao.propertie().add("name","p_list_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		arquivo_pagina = new FileField(model,"arquivo_pagina");
		arquivo_pagina.setLabel(gt("Página"));
		arquivo_pagina.propertie().add("name","p_arquivo_pagina").add("type","file").add("accept","application/java-archive,.jar,application/zip").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","250").add("required","false").add("disabled","false").add("class","primary");
		


		btn_btm_import_aplicacao = new IGRPButton("Importar","igrp_studio","ImportArquivo","btm_import_aplicacao","submit_form","primary|fa-upload","","");
		btn_btm_import_aplicacao.propertie.add("id","button_94f6_cdb4").add("type","form").add("class","primary").add("rel","btm_import_aplicacao").add("refresh_components","");

		btn_importar_jar_file = new IGRPButton("Importar","igrp_studio","ImportArquivo","importar_jar_file","submit_form","danger|fa-upload","","");
		btn_importar_jar_file.propertie.add("id","button_7cc0_d1d0").add("type","form").add("class","danger").add("rel","importar_jar_file").add("refresh_components","");

		btn_importar_script = new IGRPButton("Importar","igrp_studio","ImportArquivo","importar_script","submit_form","warning|fa-upload","","");
		btn_importar_script.propertie.add("id","button_2757_073c").add("type","form").add("class","warning").add("rel","importar_script").add("refresh_components","");

		btn_import_images = new IGRPButton("Importar","igrp_studio","ImportArquivo","import_images","submit_form","purple|fa-upload","","");
		btn_import_images.propertie.add("id","button_c361_ef7f").add("type","form").add("class","purple").add("rel","import_images").add("refresh_components","");

		btn_btm_importar_page = new IGRPButton("Importar","igrp_studio","ImportArquivo","btm_importar_page","submit_form","primary|fa-upload","","");
		btn_btm_importar_page.propertie.add("id","button_6e68_d5a9").add("type","form").add("class","primary").add("rel","btm_importar_page").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(help);

		tabcontent_1.addField(importar_aplicacao);
		tabcontent_1.addField(importar_jar_file);
		tabcontent_1.addField(importar_sql_script);
		tabcontent_1.addField(importar_imagem);

		sectionheader_2.addField(sectionheader_2_text);

		sectionheader_4.addField(sectionheader_4_text);

		sectionheader_5.addField(sectionheader_5_text);

		sectionheader_6.addField(sectionheader_6_text);

		form_2.addField(arquivo_aplicacao);

		form_3.addField(jar_file);

		form_4.addField(aplicacao_script);
		form_4.addField(data_source);
		form_4.addField(sql_script);

		form_5.addField(aplicacao_combo_img);
		form_5.addField(imagens);
		form_5.addField(icon_app);
		form_5.addField(form_5_link_1);


		sectionheader_3.addField(sectionheader_3_text);

		form_6.addField(list_aplicacao);
		form_6.addField(arquivo_pagina);

		form_2.addButton(btn_btm_import_aplicacao);
		form_3.addButton(btn_importar_jar_file);
		form_4.addButton(btn_importar_script);
		form_5.addButton(btn_import_images);
		form_6.addButton(btn_btm_importar_page);
		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
		this.addToPage(tabcontent_1);
		this.addToPage(sectionheader_2);
		this.addToPage(sectionheader_4);
		this.addToPage(sectionheader_5);
		this.addToPage(sectionheader_6);
		this.addToPage(form_2);
		this.addToPage(form_3);
		this.addToPage(form_4);
		this.addToPage(form_5);
		this.addToPage(box_1);
		this.addToPage(sectionheader_3);
		this.addToPage(form_6);
	}
		
	@Override
	public void setModel(Model model) {
		
		importar_aplicacao.setValue(model);
		importar_jar_file.setValue(model);
		importar_sql_script.setValue(model);
		importar_imagem.setValue(model);
		arquivo_aplicacao.setValue(model);
		jar_file.setValue(model);
		aplicacao_script.setValue(model);
		data_source.setValue(model);
		sql_script.setValue(model);
		aplicacao_combo_img.setValue(model);
		imagens.setValue(model);
		icon_app.setValue(model);
		form_5_link_1.setValue(model);
		list_aplicacao.setValue(model);
		arquivo_pagina.setValue(model);	

		}
}
