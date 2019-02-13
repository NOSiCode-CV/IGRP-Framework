package nosi.webapps.igrp_studio.pages.importarquivo;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class ImportArquivoView extends View {

	public Field sectionheader_1_text;
	public Field importar_aplicacao;
	public Field importar_pagina;
	public Field importar_jar_file;
	public Field importar_sql_script;
	public Field importar_imagem;
	public Field sectionheader_2_text;
	public Field sectionheader_3_text;
	public Field sectionheader_4_text;
	public Field sectionheader_5_text;
	public Field sectionheader_6_text;
	public Field arquivo_aplicacao;
	public Field list_aplicacao;
	public Field arquivo_pagina;
	public Field jar_file;
	public Field aplicacao_script;
	public Field data_source;
	public Field sql_script;
	public Field aplicacao_combo_img;
	public Field imagens;
	public IGRPForm sectionheader_1;
	public IGRPForm tabcontent_1;
	public IGRPForm sectionheader_2;
	public IGRPForm sectionheader_3;
	public IGRPForm sectionheader_4;
	public IGRPForm sectionheader_5;
	public IGRPForm sectionheader_6;
	public IGRPForm form_2;
	public IGRPForm form_1;
	public IGRPForm form_3;
	public IGRPForm form_4;
	public IGRPForm form_5;

	public IGRPButton btn_btm_import_aplicacao;
	public IGRPButton btn_btm_importar_page;
	public IGRPButton btn_importar_jar_file;
	public IGRPButton btn_importar_script;
	public IGRPButton btn_import_images;

	public ImportArquivoView(){

		this.setPageTitle("Import Arquivo");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		tabcontent_1 = new IGRPForm("tabcontent_1","");

		sectionheader_2 = new IGRPForm("sectionheader_2","");

		sectionheader_3 = new IGRPForm("sectionheader_3","");

		sectionheader_4 = new IGRPForm("sectionheader_4","");

		sectionheader_5 = new IGRPForm("sectionheader_5","");

		sectionheader_6 = new IGRPForm("sectionheader_6","");

		form_2 = new IGRPForm("form_2","");

		form_1 = new IGRPForm("form_1","");

		form_3 = new IGRPForm("form_3","");

		form_4 = new IGRPForm("form_4","");

		form_5 = new IGRPForm("form_5","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Importar Arquivos"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		importar_aplicacao = new TextField(model,"importar_aplicacao");
		importar_aplicacao.setLabel(gt("Importar IGRP"));
		importar_aplicacao.propertie().add("name","p_importar_aplicacao").add("type","button").add("request_fields","").add("maxlength","50");
		
		importar_pagina = new TextField(model,"importar_pagina");
		importar_pagina.setLabel(gt("Importar Página"));
		importar_pagina.propertie().add("name","p_importar_pagina").add("type","button").add("request_fields","").add("maxlength","50");
		
		importar_jar_file = new TextField(model,"importar_jar_file");
		importar_jar_file.setLabel(gt("Importar extra lib."));
		importar_jar_file.propertie().add("name","p_importar_jar_file").add("type","button").add("request_fields","").add("maxlength","50");
		
		importar_sql_script = new TextField(model,"importar_sql_script");
		importar_sql_script.setLabel(gt("Importar Sql Script"));
		importar_sql_script.propertie().add("name","p_importar_sql_script").add("type","button").add("request_fields","").add("maxlength","50");
		
		importar_imagem = new TextField(model,"importar_imagem");
		importar_imagem.setLabel(gt("Importar Imagens"));
		importar_imagem.propertie().add("name","p_importar_imagem").add("type","button").add("request_fields","").add("maxlength","50");
		
		sectionheader_2_text = new TextField(model,"sectionheader_2_text");
		sectionheader_2_text.setLabel(gt(""));
		sectionheader_2_text.setValue(gt("Importar aplicação (.jar/.zip)"));
		sectionheader_2_text.propertie().add("type","text").add("name","p_sectionheader_2_text").add("maxlength","4000");
		
		sectionheader_3_text = new TextField(model,"sectionheader_3_text");
		sectionheader_3_text.setLabel(gt(""));
		sectionheader_3_text.setValue(gt("Importar página (.page.jar/.zip)"));
		sectionheader_3_text.propertie().add("type","text").add("name","p_sectionheader_3_text").add("maxlength","4000");
		
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
		arquivo_aplicacao.propertie().add("name","p_arquivo_aplicacao").add("type","file").add("accept","application/java-archive,.jar,application/zip").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","1000").add("required","true").add("disabled","false");
		
		list_aplicacao = new ListField(model,"list_aplicacao");
		list_aplicacao.setLabel(gt("Aplicação"));
		list_aplicacao.propertie().add("name","p_list_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		arquivo_pagina = new FileField(model,"arquivo_pagina");
		arquivo_pagina.setLabel(gt("Página"));
		arquivo_pagina.propertie().add("name","p_arquivo_pagina").add("type","file").add("accept","application/java-archive,.jar,application/zip").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","100").add("required","true").add("disabled","false");
		
		jar_file = new FileField(model,"jar_file");
		jar_file.setLabel(gt("Jar file"));
		jar_file.propertie().add("name","p_jar_file").add("type","file").add("accept","application/java-archive,.jar").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","10000").add("required","true").add("disabled","false");
		
		aplicacao_script = new ListField(model,"aplicacao_script");
		aplicacao_script.setLabel(gt("Aplicação"));
		aplicacao_script.propertie().add("name","p_aplicacao_script").add("type","select").add("multiple","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		data_source = new ListField(model,"data_source");
		data_source.setLabel(gt("Data Source"));
		data_source.propertie().add("name","p_data_source").add("type","select").add("multiple","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","").add("tags","false");
		
		sql_script = new FileField(model,"sql_script");
		sql_script.setLabel(gt("Sql Script"));
		sql_script.propertie().add("name","p_sql_script").add("type","file").add("maxlength","250").add("required","true").add("disabled","false").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false");
		
		aplicacao_combo_img = new ListField(model,"aplicacao_combo_img");
		aplicacao_combo_img.setLabel(gt("Aplicação"));
		aplicacao_combo_img.propertie().add("name","p_aplicacao_combo_img").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","true").add("disabled","false").add("java-type","");
		
		imagens = new FileField(model,"imagens");
		imagens.setLabel(gt("Imagens"));
		imagens.propertie().add("name","p_imagens").add("type","file").add("accept","image/*").add("targetrend","").add("multiple","true").add("rendvalue","false").add("maxlength","250").add("required","true").add("disabled","false");
		


		btn_btm_import_aplicacao = new IGRPButton("Import","igrp_studio","ImportArquivo","btm_import_aplicacao","submit_form","primary|fa-upload","","");
		btn_btm_import_aplicacao.propertie.add("type","form").add("rel","btm_import_aplicacao");

		btn_btm_importar_page = new IGRPButton("Import","igrp_studio","ImportArquivo","btm_importar_page","submit_form","primary|fa-upload","","");
		btn_btm_importar_page.propertie.add("type","form").add("rel","btm_importar_page");

		btn_importar_jar_file = new IGRPButton("Importar","igrp_studio","ImportArquivo","importar_jar_file","submit_form","primary|fa-upload","","");
		btn_importar_jar_file.propertie.add("type","form").add("rel","importar_jar_file");

		btn_importar_script = new IGRPButton("Importar","igrp_studio","ImportArquivo","importar_script","submit_form","primary|fa-upload","","");
		btn_importar_script.propertie.add("type","form").add("rel","importar_script");

		btn_import_images = new IGRPButton("Import","igrp_studio","ImportArquivo","import_images","submit_form","primary|fa-upload","","");
		btn_import_images.propertie.add("type","form").add("rel","import_images");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		tabcontent_1.addField(importar_aplicacao);
		tabcontent_1.addField(importar_pagina);
		tabcontent_1.addField(importar_jar_file);
		tabcontent_1.addField(importar_sql_script);
		tabcontent_1.addField(importar_imagem);

		sectionheader_2.addField(sectionheader_2_text);

		sectionheader_3.addField(sectionheader_3_text);

		sectionheader_4.addField(sectionheader_4_text);

		sectionheader_5.addField(sectionheader_5_text);

		sectionheader_6.addField(sectionheader_6_text);

		form_2.addField(arquivo_aplicacao);

		form_1.addField(list_aplicacao);
		form_1.addField(arquivo_pagina);

		form_3.addField(jar_file);

		form_4.addField(aplicacao_script);
		form_4.addField(data_source);
		form_4.addField(sql_script);

		form_5.addField(aplicacao_combo_img);
		form_5.addField(imagens);

		form_2.addButton(btn_btm_import_aplicacao);
		form_1.addButton(btn_btm_importar_page);
		form_3.addButton(btn_importar_jar_file);
		form_4.addButton(btn_importar_script);
		form_5.addButton(btn_import_images);
		this.addToPage(sectionheader_1);
		this.addToPage(tabcontent_1);
		this.addToPage(sectionheader_2);
		this.addToPage(sectionheader_3);
		this.addToPage(sectionheader_4);
		this.addToPage(sectionheader_5);
		this.addToPage(sectionheader_6);
		this.addToPage(form_2);
		this.addToPage(form_1);
		this.addToPage(form_3);
		this.addToPage(form_4);
		this.addToPage(form_5);
	}
		
	@Override
	public void setModel(Model model) {
		
		importar_aplicacao.setValue(model);
		importar_pagina.setValue(model);
		importar_jar_file.setValue(model);
		importar_sql_script.setValue(model);
		importar_imagem.setValue(model);
		arquivo_aplicacao.setValue(model);
		list_aplicacao.setValue(model);
		arquivo_pagina.setValue(model);
		jar_file.setValue(model);
		aplicacao_script.setValue(model);
		data_source.setValue(model);
		sql_script.setValue(model);
		aplicacao_combo_img.setValue(model);
		imagens.setValue(model);	

		}
}
