
package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Model;import java.sql.Date;
import nosi.core.config.Config;
import java.util.Map;
import java.util.HashMap;

public class LookupListPageView extends View {
	
	
	public Field env_fk;
	public Field page;
	public Field page_descr;
	public Field nome_pagina;
	public Field descricao;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public LookupListPageView(){

		this.setPageTitle("Lista de Pagina Para Lookup");
			
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicacao"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("domain","").add("java-type","");
		
		page = new TextField(model,"page");
		page.setLabel(gt("Nome Pagina"));
		page.propertie().add("name","p_page").add("type","text").add("maxlength","100").add("required","false");
		
		page_descr = new TextField(model,"page_descr");
		page_descr.setLabel(gt("Descricao Pagina"));
		page_descr.propertie().add("name","p_page_descr").add("type","text").add("maxlength","100").add("required","false");
		
		nome_pagina = new TextField(model,"nome_pagina");
		nome_pagina.setLabel(gt("Nome Pagina"));
		nome_pagina.propertie().add("name","p_nome_pagina").add("type","text").add("maxlength","30");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descricao"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30");
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","LookupListPage","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){
		
		form_1.addField(env_fk);
		form_1.addField(page);
		form_1.addField(page_descr);

		table_1.addField(nome_pagina);
		table_1.addField(descricao);
		table_1.addField(p_id);

		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	public void setModel(LookupListPage model) {
		
		env_fk.setValue(model);
		page.setValue(model);
		page_descr.setValue(model);
		nome_pagina.setValue(model);
		descricao.setValue(model);
		p_id.setValue(model);	

		table_1.loadModel(model.getTable_1());
		
	}
}
