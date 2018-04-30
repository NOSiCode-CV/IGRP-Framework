
package nosi.webapps.igrp_studio.pages.importarquivo;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

import nosi.core.config.Config;



public class ImportArquivoView extends View {

	public Field sectionheader_1_text;
	public Field importar_aplicacao;
	public Field importar_pagina;
	public Field importar_jar_file;
	public Field sectionheader_2_text;
	public Field sectionheader_3_text;
	public Field sectionheader_4_text;
	public Field arquivo_aplicacao;
	public Field list_aplicacao;
	public Field arquivo_pagina;
	public Field jar_file;
	public IGRPForm sectionheader_1;
	public IGRPForm tabcontent_1;
	public IGRPForm sectionheader_2;
	public IGRPForm sectionheader_3;
	public IGRPForm sectionheader_4;
	public IGRPForm form_2;
	public IGRPForm form_1;
	public IGRPForm form_3;

	public IGRPButton btn_btm_import_aplicacao;
	public IGRPButton btn_btm_importar_page;
	public IGRPButton btn_importar_jar_file;

	public ImportArquivoView(){

		this.setPageTitle("Import Arquivo");
			
		sectionheader_1 = new IGRPForm("sectionheader_1","");

		tabcontent_1 = new IGRPForm("tabcontent_1","");

		sectionheader_2 = new IGRPForm("sectionheader_2","");

		sectionheader_3 = new IGRPForm("sectionheader_3","");

		sectionheader_4 = new IGRPForm("sectionheader_4","");

		form_2 = new IGRPForm("form_2","");

		form_1 = new IGRPForm("form_1","");

		form_3 = new IGRPForm("form_3","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Importar Arquivos"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		importar_aplicacao = new TextField(model,"importar_aplicacao");
		importar_aplicacao.setLabel(gt("Importar Aplicação"));
		importar_aplicacao.propertie().add("name","p_importar_aplicacao").add("type","button").add("maxlength","50");
		
		importar_pagina = new TextField(model,"importar_pagina");
		importar_pagina.setLabel(gt("Importar Página"));
		importar_pagina.propertie().add("name","p_importar_pagina").add("type","button").add("maxlength","50");
		
		importar_jar_file = new TextField(model,"importar_jar_file");
		importar_jar_file.setLabel(gt("Importar Jar File"));
		importar_jar_file.propertie().add("name","p_importar_jar_file").add("type","button").add("maxlength","50");
		
		sectionheader_2_text = new TextField(model,"sectionheader_2_text");
		sectionheader_2_text.setLabel(gt(""));
		sectionheader_2_text.setValue(gt("Importar aplicação (.app.jar/.zip)"));
		sectionheader_2_text.propertie().add("type","text").add("name","p_sectionheader_2_text").add("maxlength","4000");
		
		sectionheader_3_text = new TextField(model,"sectionheader_3_text");
		sectionheader_3_text.setLabel(gt(""));
		sectionheader_3_text.setValue(gt("Importar página (.page.jar/.zip)"));
		sectionheader_3_text.propertie().add("type","text").add("name","p_sectionheader_3_text").add("maxlength","4000");
		
		sectionheader_4_text = new TextField(model,"sectionheader_4_text");
		sectionheader_4_text.setLabel(gt(""));
		sectionheader_4_text.setValue(gt("Importar jar File (.jar)"));
		sectionheader_4_text.propertie().add("type","text").add("name","p_sectionheader_4_text").add("maxlength","4000");
		
		arquivo_aplicacao = new FileField(model,"arquivo_aplicacao");
		arquivo_aplicacao.setLabel(gt("Aplicação"));
		arquivo_aplicacao.propertie().add("name","p_arquivo_aplicacao").add("type","file").add("maxlength","1000").add("required","true").add("accept",".jar,application/zip,application/x-zip-compressed, multipart/x-zip, application/x-compressed").add("targetrend","").add("multiple","false").add("rendvalue","false");
		
		list_aplicacao = new ListField(model,"list_aplicacao");
		list_aplicacao.setLabel(gt("Aplicação"));
		list_aplicacao.propertie().add("name","p_list_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","true").add("java-type","");
		
		arquivo_pagina = new FileField(model,"arquivo_pagina");
		arquivo_pagina.setLabel(gt("Página"));
		arquivo_pagina.propertie().add("name","p_arquivo_pagina").add("type","file").add("maxlength","1000").add("required","true").add("accept",".jar,application/zip,application/x-zip-compressed, multipart/x-zip, application/x-compressed").add("targetrend","").add("multiple","false").add("rendvalue","false");
		
		jar_file = new FileField(model,"jar_file");
		jar_file.setLabel(gt("Jar file"));
		jar_file.propertie().add("name","p_jar_file").add("type","file").add("accept",".jar").add("targetrend","").add("multiple","true").add("rendvalue","false").add("maxlength","10000").add("required","true");
		


		btn_btm_import_aplicacao = new IGRPButton("Import","igrp_studio","ImportArquivo","btm_import_aplicacao","submit_form","success|fa-upload","","");
		btn_btm_import_aplicacao.propertie.add("type","form").add("rel","btm_import_aplicacao");

		btn_btm_importar_page = new IGRPButton("Import","igrp_studio","ImportArquivo","btm_importar_page","submit_form","success|fa-upload","","");
		btn_btm_importar_page.propertie.add("type","form").add("rel","btm_importar_page");

		btn_importar_jar_file = new IGRPButton("Importar","igrp_studio","ImportArquivo","importar_jar_file","submit_form","success|fa-upload","","");
		btn_importar_jar_file.propertie.add("type","form").add("rel","importar_jar_file");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		tabcontent_1.addField(importar_aplicacao);
		tabcontent_1.addField(importar_pagina);
		tabcontent_1.addField(importar_jar_file);

		sectionheader_2.addField(sectionheader_2_text);

		sectionheader_3.addField(sectionheader_3_text);

		sectionheader_4.addField(sectionheader_4_text);

		form_2.addField(arquivo_aplicacao);

		form_1.addField(list_aplicacao);
		form_1.addField(arquivo_pagina);

		form_3.addField(jar_file);

		form_2.addButton(btn_btm_import_aplicacao);
		form_1.addButton(btn_btm_importar_page);
		form_3.addButton(btn_importar_jar_file);
		this.addToPage(sectionheader_1);
		this.addToPage(tabcontent_1);
		this.addToPage(sectionheader_2);
		this.addToPage(sectionheader_3);
		this.addToPage(sectionheader_4);
		this.addToPage(form_2);
		this.addToPage(form_1);
		this.addToPage(form_3);
	}
		
	public void setModel(ImportArquivo model) {
		
		importar_aplicacao.setValue(model);
		importar_pagina.setValue(model);
		importar_jar_file.setValue(model);
		arquivo_aplicacao.setValue(model);
		list_aplicacao.setValue(model);
		arquivo_pagina.setValue(model);
		jar_file.setValue(model);	

		
	}
}
