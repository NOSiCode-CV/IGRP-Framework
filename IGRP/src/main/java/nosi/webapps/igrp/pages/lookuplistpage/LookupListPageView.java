
package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.config.Config;
import java.util.Map;
import java.util.HashMap;

public class LookupListPageView extends View {
	
	
	public Field associar_pagina;
	public Field associar_documentos;
	public Field env_fk;
	public Field page;
	public Field page_descr;
	public Field checkbox;
	public Field checkbox_check;
	public Field obrigatorio;
	public Field obrigatorio_check;
	public Field tipo_documento;
	public Field nome;
	public Field descricao_documento;
	public Field nome_pagina;
	public Field descricao;
	public Field id;
	public Field taskid;
	public Field processid;
	public IGRPForm tabcontent_1;
	public IGRPForm form_1;
	public IGRPFormList formlist_1;
	public IGRPTable table_1;
	public IGRPForm form_2;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_pesquisar;
	public LookupListPageView(){

		this.setPageTitle("Lista de Pagina Para Lookup");
			
		tabcontent_1 = new IGRPForm("tabcontent_1","");
		form_1 = new IGRPForm("form_1","");
		formlist_1 = new IGRPFormList("formlist_1","");
		table_1 = new IGRPTable("table_1","");
		form_2 = new IGRPForm("form_2","");
		associar_pagina = new TextField(model,"associar_pagina");
		associar_pagina.setLabel(gt("Associar Página"));
		associar_pagina.propertie().add("name","p_associar_pagina").add("type","button").add("maxlength","50");
		
		associar_documentos = new TextField(model,"associar_documentos");
		associar_documentos.setLabel(gt("Associar Documentos"));
		associar_documentos.propertie().add("name","p_associar_documentos").add("type","button").add("maxlength","50");
		
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicacao"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("domain","").add("java-type","");
		
		page = new TextField(model,"page");
		page.setLabel(gt("Nome Pagina"));
		page.propertie().add("name","p_page").add("type","text").add("maxlength","100").add("required","false");
		
		page_descr = new TextField(model,"page_descr");
		page_descr.setLabel(gt("Descricao Pagina"));
		page_descr.propertie().add("name","p_page_descr").add("type","text").add("maxlength","100").add("required","false");
		
		checkbox = new CheckBoxField(model,"checkbox");
		checkbox.setLabel(gt(" "));
		checkbox.propertie().add("name","p_checkbox").add("type","checkbox").add("maxlength","30").add("required","false").add("check","true").add("desc","true");
		
		checkbox_check = new CheckBoxField
		(model,"checkbox_check");
		checkbox_check.propertie().add("name","p_checkbox").add("type","checkbox").add("maxlength","30").add("required","false").add("check","true").add("desc","true");
		obrigatorio = new CheckBoxField(model,"obrigatorio");
		obrigatorio.setLabel(gt("Obrigatório?"));
		obrigatorio.propertie().add("name","p_obrigatorio").add("type","checkbox").add("maxlength","30").add("required","false").add("check","true").add("desc","true");
		
		obrigatorio_check = new CheckBoxField
		(model,"obrigatorio_check");
		obrigatorio_check.propertie().add("name","p_obrigatorio").add("type","checkbox").add("maxlength","30").add("required","false").add("check","true").add("desc","true");
		tipo_documento = new TextField(model,"tipo_documento");
		tipo_documento.setLabel(gt("Tipo Documento"));
		tipo_documento.propertie().add("name","p_tipo_documento").add("type","text").add("maxlength","30").add("required","false").add("desc","true");
		
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("desc","true");
		
		descricao_documento = new TextField(model,"descricao_documento");
		descricao_documento.setLabel(gt("Descrição"));
		descricao_documento.propertie().add("name","p_descricao_documento").add("type","text").add("maxlength","30").add("required","false").add("desc","true");
		
		nome_pagina = new TextField(model,"nome_pagina");
		nome_pagina.setLabel(gt("Nome Pagina"));
		nome_pagina.propertie().add("name","p_nome_pagina").add("type","text").add("maxlength","30");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		
		taskid = new HiddenField(model,"taskid");
		taskid.setLabel(gt(""));
		taskid.propertie().add("name","p_taskId").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","taskid");
		
		processid = new HiddenField(model,"processid");
		processid.setLabel(gt(""));
		processid.propertie().add("name","p_processId").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","processid");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","LookupListPage","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		btn_pesquisar = new IGRPButton("Pesquisar","igrp","LookupListPage","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){
		
		tabcontent_1.addField(associar_pagina);
		tabcontent_1.addField(associar_documentos);

		form_1.addField(env_fk);
		form_1.addField(page);
		form_1.addField(page_descr);


		formlist_1.addField(checkbox);
		formlist_1.addField(checkbox_check);
		formlist_1.addField(obrigatorio);
		formlist_1.addField(obrigatorio_check);
		formlist_1.addField(tipo_documento);
		formlist_1.addField(nome);
		formlist_1.addField(descricao_documento);

		table_1.addField(nome_pagina);
		table_1.addField(descricao);
		table_1.addField(id);

		form_2.addField(taskid);
		form_2.addField(processid);

		toolsbar_1.addButton(btn_gravar);
		form_1.addButton(btn_pesquisar);
		this.addToPage(tabcontent_1);
		this.addToPage(form_1);
		this.addToPage(formlist_1);
		this.addToPage(table_1);
		this.addToPage(form_2);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(LookupListPage model) {
		
		associar_pagina.setValue(model);
		associar_documentos.setValue(model);
		env_fk.setValue(model);
		page.setValue(model);
		page_descr.setValue(model);
		checkbox.setValue(model);
		obrigatorio.setValue(model);
		tipo_documento.setValue(model);
		nome.setValue(model);
		descricao_documento.setValue(model);
		nome_pagina.setValue(model);
		descricao.setValue(model);
		id.setValue(model);
		taskid.setValue(model);
		processid.setValue(model);	

		formlist_1.loadModel(model.getFormlist_1());
		table_1.loadModel(model.getTable_1());
		
	}
}
