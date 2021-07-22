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
	public Field tipo;
	public Field imagens;
	public Field form_5_link_1;
	public Field sectionheader_3_text;
	public Field carousel_1_label;
	public Field carousel_1_img;
	public Field list_aplicacao;
	public Field arquivo_pagina;
	public Field imagem;
	public Field imagem_tbl;
	public Field imagem_tbl_desc;
	public Field id_img_desc;
	public Field id_img;
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
	public IGRPBox box_2;
	public IGRPSectionHeader sectionheader_3;
	public IGRPTable carousel_1;
	public IGRPForm form_6;
	public IGRPForm form_1;
	public IGRPFormList formlist_1;

	public IGRPToolsBar toolsbar_2;
	public IGRPButton btn_ordenar;
	public IGRPButton btn_btm_import_aplicacao;
	public IGRPButton btn_importar_jar_file;
	public IGRPButton btn_importar_script;
	public IGRPButton btn_import_images;
	public IGRPButton btn_btm_importar_page;
	public IGRPButton btn_upload;

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

		box_2 = new IGRPBox("box_2","Importar Imagens para Página Login");

		sectionheader_3 = new IGRPSectionHeader("sectionheader_3","");

		carousel_1 = new IGRPTable("carousel_1","");

		form_6 = new IGRPForm("form_6","");

		form_1 = new IGRPForm("form_1","");

		formlist_1 = new IGRPFormList("formlist_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Importar Arquivos"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		help = new LinkField(model,"help");
		help.setLabel(gt("Help"));
		help.propertie().add("name","p_help").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","[object Object]").add("maxlength","250").add("showlabel","true").add("adbcli","");
		
		importar_aplicacao = new TextField(model,"importar_aplicacao");
		importar_aplicacao.setLabel(gt("Importar IGRP"));
		importar_aplicacao.propertie().add("name","p_importar_aplicacao").add("type","button").add("img","fa-cloud-upload").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("adbcli","").add("maxlength","50");
		
		importar_jar_file = new TextField(model,"importar_jar_file");
		importar_jar_file.setLabel(gt("Importar extra lib."));
		importar_jar_file.propertie().add("name","p_importar_jar_file").add("type","button").add("img","fa-external-link-square").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("adbcli","").add("maxlength","50");
		
		importar_sql_script = new TextField(model,"importar_sql_script");
		importar_sql_script.setLabel(gt("Importar Sql Script"));
		importar_sql_script.propertie().add("name","p_importar_sql_script").add("type","button").add("img","fa-code").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("adbcli","").add("maxlength","50");
		
		importar_imagem = new TextField(model,"importar_imagem");
		importar_imagem.setLabel(gt("Importar Imagens"));
		importar_imagem.propertie().add("name","p_importar_imagem").add("type","button").add("request_fields","").add("img","fa-image").add("refresh_components","").add("refresh_submit","false").add("adbcli","").add("maxlength","50");
		
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
		
		tipo = new RadioListField(model,"tipo");
		tipo.setLabel(gt("Tipo / Localização"));
		tipo.propertie().add("name","p_tipo").add("type","radiolist").add("domain","").add("maxlength","250").add("required","true").add("readonly","false").add("disabled","false").add("child_size","4").add("java-type","int");
		
		imagens = new FileField(model,"imagens");
		imagens.setLabel(gt("Imagens"));
		imagens.propertie().add("name","p_imagens").add("type","file").add("accept","image/*").add("targetrend","").add("multiple","true").add("rendvalue","false").add("maxlength","250").add("required","true").add("disabled","false").add("class","purple");
		
		form_5_link_1 = new PlainTextField(model,"form_5_link_1");
		form_5_link_1.setLabel(gt("Link"));
		form_5_link_1.propertie().add("name","p_form_5_link_1").add("type","plaintext").add("clear","false").add("disable_output_escaping","false").add("html_class","").add("maxlength","250");
		
		sectionheader_3_text = new TextField(model,"sectionheader_3_text");
		sectionheader_3_text.setLabel(gt(""));
		sectionheader_3_text.setValue(gt("Importar página IGRP antiga (.zip)"));
		sectionheader_3_text.propertie().add("type","text").add("name","p_sectionheader_3_text").add("maxlength","4000");
		
		carousel_1_label = new TextField(model,"carousel_1_label");
		carousel_1_label.setLabel(gt("Title"));
		carousel_1_label.propertie().add("name","p_carousel_1_label").add("type","text").add("maxlength","200");
		
		carousel_1_img = new TextField(model,"carousel_1_img");
		carousel_1_img.setLabel(gt("Image"));
		carousel_1_img.propertie().add("name","p_carousel_1_img").add("type","text").add("maxlength","200");
		
		list_aplicacao = new ListField(model,"list_aplicacao");
		list_aplicacao.setLabel(gt("Aplicação"));
		list_aplicacao.propertie().add("name","p_list_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","");
		
		arquivo_pagina = new FileField(model,"arquivo_pagina");
		arquivo_pagina.setLabel(gt("Página"));
		arquivo_pagina.propertie().add("name","p_arquivo_pagina").add("type","file").add("accept","application/java-archive,.jar,application/zip").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","250").add("required","false").add("disabled","false").add("class","primary");
		
		imagem = new FileField(model,"imagem");
		imagem.setLabel(gt("Imagem"));
		imagem.propertie().add("name","p_imagem").add("type","file").add("accept","image/*").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","250").add("required","true").add("disabled","false").add("class","grey");
		
		imagem_tbl = new LinkField(model,"imagem_tbl");
		imagem_tbl.setLabel(gt("Imagem"));
		imagem_tbl.setValue(Core.getIGRPLink("igrp_studio","ListaPage","index"));

									imagem_tbl_desc = new LinkField(model,"imagem_tbl_desc");
		imagem_tbl_desc.setLabel(gt("Imagem"));
		imagem_tbl.propertie().add("name","p_imagem_tbl").add("type","link").add("target","modal").add("request_fields","").add("list_source","").add("refresh_components","").add("refresh_submit","false").add("adbcli","").add("class","link").add("img","fa-link").add("maxlength","250").add("placeholder",gt("")).add("desc","true");
		
		id_img = new HiddenField(model,"id_img");
		id_img.setLabel(gt(""));
		id_img.propertie().add("name","p_id_img").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","id_img").add("desc","true");
		

		toolsbar_2 = new IGRPToolsBar("toolsbar_2");

		btn_ordenar = new IGRPButton("Gravar Ordenação","igrp_studio","ImportArquivo","ordenar","submit_notvalidate","grey|fa-sort-numeric-asc","","");
		btn_ordenar.propertie.add("type","specific").add("rel","ordenar").add("refresh_components","");

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

		btn_upload = new IGRPButton("Upload","igrp_studio","ImportArquivo","upload","submit_form","grey|fa-upload","","");
		btn_upload.propertie.add("id","button_0498_24b9").add("type","form").add("class","grey").add("rel","upload").add("refresh_components","carousel_1,table_1");

		
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
		form_5.addField(tipo);
		form_5.addField(imagens);
		form_5.addField(form_5_link_1);



		sectionheader_3.addField(sectionheader_3_text);

		carousel_1.addField(carousel_1_label);
		carousel_1.addField(carousel_1_img);

		form_6.addField(list_aplicacao);
		form_6.addField(arquivo_pagina);

		form_1.addField(imagem);

		formlist_1.addField(imagem_tbl);
		formlist_1.addField(imagem_tbl_desc);
		formlist_1.addField(id_img);


		toolsbar_2.addButton(btn_ordenar);
		form_2.addButton(btn_btm_import_aplicacao);
		form_3.addButton(btn_importar_jar_file);
		form_4.addButton(btn_importar_script);
		form_5.addButton(btn_import_images);
		form_6.addButton(btn_btm_importar_page);
		form_1.addButton(btn_upload);
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
		this.addToPage(box_2);
		this.addToPage(sectionheader_3);
		this.addToPage(carousel_1);
		this.addToPage(form_6);
		this.addToPage(form_1);
		this.addToPage(formlist_1);
		this.addToPage(toolsbar_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		help.setValue(model);
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
		tipo.setValue(model);
		imagens.setValue(model);
		form_5_link_1.setValue(model);
		carousel_1_label.setValue(model);
		carousel_1_img.setValue(model);
		list_aplicacao.setValue(model);
		arquivo_pagina.setValue(model);
		imagem.setValue(model);
		imagem_tbl.setValue(model);
		imagem_tbl_desc.setValue(model);
		id_img.setValue(model);	

		carousel_1.loadModel(((ImportArquivo) model).getCarousel_1());
		formlist_1.loadModel(((ImportArquivo) model).getFormlist_1());
		}
}
