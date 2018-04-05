
package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class LookupListPageView extends View {
	
	
	public Field componentes;
	public Field paginas;
	public Field env_fk;
	public Field page;
	public Field page_descr;
	public Field aplicacao;
	public Field nome_componente;
	public Field descricao_componente;
	public Field p_task_id;
	public Field nome_pagina;
	public Field descricao;
	public Field p_id;
	public Field selecionar;
	public Field selecionar_check;
	public Field titulo;
	public Field t_nome_componente;
	public Field t_descricao_componente;
	public IGRPForm tabcontent_1;
	public IGRPForm form_1;
	public IGRPForm form_2;
	public IGRPTable table_1;
	public IGRPFormList formlist_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_gravar;
	public IGRPButton btn_pesquisar2;
	public IGRPButton btn_pesquisar1;
	public LookupListPageView(){

		this.setPageTitle("Lista de Pagina Para Lookup");
			
		tabcontent_1 = new IGRPForm("tabcontent_1","");
		form_1 = new IGRPForm("form_1","");
		form_2 = new IGRPForm("form_2","");
		table_1 = new IGRPTable("table_1","");
		formlist_1 = new IGRPFormList("formlist_1","");
		componentes = new TextField(model,"componentes");
		componentes.setLabel(gt("Componentes"));
		componentes.propertie().add("name","p_componentes").add("type","button").add("maxlength","50");
		
		paginas = new TextField(model,"paginas");
		paginas.setLabel(gt("Páginas"));
		paginas.propertie().add("name","p_paginas").add("type","button").add("maxlength","50");
		
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicacao"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("domain","").add("java-type","");
		
		page = new TextField(model,"page");
		page.setLabel(gt("Nome Pagina"));
		page.propertie().add("name","p_page").add("type","text").add("maxlength","100").add("required","false");
		
		page_descr = new TextField(model,"page_descr");
		page_descr.setLabel(gt("Descricao Pagina"));
		page_descr.propertie().add("name","p_page_descr").add("type","text").add("maxlength","100").add("required","false");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicacao"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("java-type","");
		
		nome_componente = new TextField(model,"nome_componente");
		nome_componente.setLabel(gt("Nome Componente"));
		nome_componente.propertie().add("name","p_nome_componente").add("type","text").add("maxlength","100").add("required","false");
		
		descricao_componente = new TextField(model,"descricao_componente");
		descricao_componente.setLabel(gt("Descricao Componente"));
		descricao_componente.propertie().add("name","p_descricao_componente").add("type","text").add("maxlength","100").add("required","false");
		
		p_task_id = new HiddenField(model,"p_task_id");
		p_task_id.setLabel(gt(""));
		p_task_id.propertie().add("name","p_task_id").add("type","hidden").add("maxlength","100").add("java-type","").add("tag","task_id");
		
		nome_pagina = new TextField(model,"nome_pagina");
		nome_pagina.setLabel(gt("Nome Pagina"));
		nome_pagina.propertie().add("name","p_nome_pagina").add("type","text").add("maxlength","30");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		
		selecionar = new CheckBoxField(model,"selecionar");
		selecionar.setLabel(gt("Selecionar"));
		selecionar.propertie().add("name","p_selecionar").add("type","checkbox").add("maxlength","30").add("required","false").add("check","true").add("desc","true");
		
		titulo = new TextField(model,"titulo");
		titulo.setLabel(gt("Título"));
		titulo.propertie().add("name","p_titulo").add("type","text").add("maxlength","30").add("required","true").add("desc","true");
		
		t_nome_componente = new TextField(model,"t_nome_componente");
		t_nome_componente.setLabel(gt("Nome Componente"));
		t_nome_componente.propertie().add("name","p_t_nome_componente").add("type","text").add("maxlength","30").add("required","false").add("desc","true");
		
		t_descricao_componente = new TextField(model,"t_descricao_componente");
		t_descricao_componente.setLabel(gt("Descrição Componente"));
		t_descricao_componente.propertie().add("name","p_t_descricao_componente").add("type","text").add("maxlength","30").add("required","false").add("desc","true");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_gravar = new IGRPButton("Gravar","igrp","LookupListPage","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		btn_pesquisar2 = new IGRPButton("Pesquisar","igrp","LookupListPage","pesquisar2","submit","primary|fa-search","","");
		btn_pesquisar2.propertie.add("type","form").add("rel","pesquisar2");

		btn_pesquisar1 = new IGRPButton("Pesquisar","igrp","LookupListPage","pesquisar1","submit","primary|fa-search","","");
		btn_pesquisar1.propertie.add("type","form").add("rel","pesquisar1");
		
	}
		
	@Override
	public void render(){
		
		tabcontent_1.addField(componentes);
		tabcontent_1.addField(paginas);


		form_1.addField(env_fk);
		form_1.addField(page);
		form_1.addField(page_descr);

		form_2.addField(aplicacao);
		form_2.addField(nome_componente);
		form_2.addField(descricao_componente);
		form_2.addField(p_task_id);

		table_1.addField(nome_pagina);
		table_1.addField(descricao);
		table_1.addField(p_id);

		formlist_1.addField(selecionar);
		formlist_1.addField(titulo);
		formlist_1.addField(t_nome_componente);
		formlist_1.addField(t_descricao_componente);

		toolsbar_1.addButton(btn_gravar);
		form_1.addButton(btn_pesquisar2);
		form_2.addButton(btn_pesquisar1);
		this.addToPage(tabcontent_1);
		this.addToPage(form_1);
		this.addToPage(form_2);
		this.addToPage(table_1);
		this.addToPage(formlist_1);
		this.addToPage(toolsbar_1);
	}
		
	public void setModel(LookupListPage model) {
		
		componentes.setValue(model);

		paginas.setValue(model);

		env_fk.setValue(model);

		page.setValue(model);

		page_descr.setValue(model);

		aplicacao.setValue(model);

		nome_componente.setValue(model);

		descricao_componente.setValue(model);

		p_task_id.setValue(model);

		nome_pagina.setValue(model);

		descricao.setValue(model);

		p_id.setValue(model);

		selecionar.setValue(model);

		titulo.setValue(model);

		t_nome_componente.setValue(model);

		t_descricao_componente.setValue(model);
	
		table_1.loadModel(model.getTable_1());

	}
}
