/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.lookuplistpage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class LookupListPageView extends View {
	
	
	public Field env_fk;
	public Field page;
	public Field page_descr;
	public Field nome_page;
	public Field descricao_page;
	public Field nome_page_desc;
	public Field descricao_page_desc;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;
	public LookupListPageView(LookupListPage model){
		this.setPageTitle("Lookup para lista de pagina");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel("Aplicacao");
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		page = new TextField(model,"page");
		page.setLabel("Nome Pagina");
		page.propertie().add("name","p_page").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		page_descr = new TextField(model,"page_descr");
		page_descr.setLabel("Descricao Pagina");
		page_descr.propertie().add("name","p_page_descr").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		nome_page = new LinkField(model,"nome_page");
		nome_page.setLabel("Nome Pagina");
		nome_page.propertie().add("name","p_nome_page").add("type","link").add("target","_self").add("class","link").add("iconColor","#333").add("iconClass","").add("img","fa-link").add("maxlength","30").add("align","left").add("lookup_parser","true").add("desc","true");
		descricao_page = new LinkField(model,"descricao_page");
		descricao_page.setLabel("Descrição");
		descricao_page.propertie().add("name","p_descricao_page").add("type","link").add("target","_self").add("class","link").add("iconColor","#333").add("iconClass","").add("img","fa-link").add("maxlength","30").add("align","left").add("lookup_parser","true").add("desc","true");
		
		nome_page_desc = new TextField(model,"nome_page_desc");
		nome_page_desc.setLabel("Nome Pagina");
		nome_page_desc.propertie().add("name","p_nome_page_desc").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		descricao_page_desc = new TextField(model,"descricao_page_desc");
		descricao_page_desc.setLabel("Descrição");
		descricao_page_desc.propertie().add("name","p_descricao_page_desc").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		
		
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");

		btn_pesquisar = new IGRPButton("Pesquisar","igrp","LookupListPage","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");	
	}
		
	@Override
	public void render(){
		
		form_1.addField(env_fk);
		form_1.addField(page);
		form_1.addField(page_descr);

		table_1.addField(nome_page);
		table_1.addField(descricao_page);
		table_1.addField(nome_page_desc);
		table_1.addField(descricao_page_desc);
		table_1.addField(p_id);

		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/