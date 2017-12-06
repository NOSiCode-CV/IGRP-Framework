/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

import static nosi.core.i18n.Translator.gt;

public class LookupListPageView extends View {
	
	
	public Field env_fk;
	public Field page;
	public Field page_descr;
	public Field nome_pagina;
	public Field descricao;
	public Field p_id;
	public Field p_id_aplicacao;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public LookupListPageView(LookupListPage model){
		this.setPageTitle("Lista de Pagina Para Lookup");
			
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel("Aplicacao");
		
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false").add("domain","");
		page = new TextField(model,"page");
		page.setLabel(gt("Nome Página"));
		
		page.propertie().add("name","p_page").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		page_descr = new TextField(model,"page_descr");
		page_descr.setLabel(gt("Descricao Página"));
		
		page_descr.propertie().add("name","p_page_descr").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome_pagina = new TextField(model,"nome_pagina");
		nome_pagina.setLabel(gt("Nome Página"));
		
		nome_pagina.propertie().add("name","p_nome_pagina").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","true").add("iskey","false");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","true").add("iskey","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id");

		p_id_aplicacao = new HiddenField(model,"p_id_aplicacao");
		p_id_aplicacao.setLabel("");
		p_id_aplicacao.propertie().add("name","p_id_aplicacao").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","p_id_aplicacao");

		btn_pesquisar = new IGRPButton(gt("Pesquisar"),"igrp","LookupListPage","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){
		
		form_1.addField(env_fk);
		form_1.addField(page);
		form_1.addField(page_descr);

		table_1.addField(nome_pagina);
		table_1.addField(descricao);
		table_1.addField(p_id);
		table_1.addField(p_id_aplicacao);

		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/