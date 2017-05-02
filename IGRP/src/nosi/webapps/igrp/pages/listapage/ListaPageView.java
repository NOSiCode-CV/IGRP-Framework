/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.listapage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import nosi.core.config.Config; 

public class ListaPageView extends View {
	public String title = "Detalhe App";		
	
	public Field env_fk;
	public Field page;
	public Field page_descr;
	public Field action_descr;
	public Field version;
	public Field status;
	public Field p_id;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_editar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_visualizar;
	public IGRPButton btn_gerar;
	
	
	public ListaPageView(ListaPage model){			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel("Aplicacao");
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		page = new TextField(model,"page");
		page.setLabel("Cod. Modulo");
		page.propertie().add("name","p_page").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		page_descr = new TextField(model,"page_descr");
		page_descr.setLabel("Cod. Pagina");
		page_descr.propertie().add("name","p_page_descr").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		action_descr = new TextField(model,"action_descr");
		action_descr.setLabel("Pagina");
		action_descr.propertie().add("name","p_action_descr").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		version = new TextField(model,"version");
		version.setLabel("Versao");
		version.propertie().add("name","p_version").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false");
		status = new CheckBoxField(model,"status");
		status.setLabel("Ativo?");
		status.propertie().add("name","p_status").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("check","true").add("desc","true");
		p_id = new HiddenField(model, "p_id");
		p_id.propertie().add("name","p_id").add("type","hidden");
		
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","igrp","page","index","_self","default|fa-plus","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		
		btn_editar = new IGRPButton("Editar","igrp","page","editar","_self","default|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("rel","editar");
		
		btn_eliminar = new IGRPButton("Eliminar","igrp","page","eliminar","_self","default|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("rel","eliminar");
		
		btn_visualizar = new IGRPButton("Visualizar","igrp","page","visualizar","_target","default|fa-eye","","");
		btn_visualizar.propertie.add("type","specific").add("code","").add("rel","visualizar");
		
		btn_gerar = new IGRPButton("Gerar Pagina","igrp","generator","index","_target","default|fa-gears","","");
		btn_gerar.propertie.add("type","specific").add("code","").add("rel","gerar");
		
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","lista-page","pesquisar","submit","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){
		Config.TITLE = this.title;

		form_1.addField(env_fk);
		form_1.addField(page);
		form_1.addField(page_descr);

		table_1.addField(p_id);
		table_1.addField(page);
		table_1.addField(page_descr);
		table_1.addField(action_descr);
		table_1.addField(version);
		table_1.addField(status);

		table_1.addButton(btn_editar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_visualizar);
		table_1.addButton(btn_gerar);
		
		toolsbar_1.addButton(btn_novo);
		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/