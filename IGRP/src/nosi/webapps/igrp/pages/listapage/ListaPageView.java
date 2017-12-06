
package nosi.webapps.igrp.pages.listapage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ListaPageView extends View {
	
	
	public Field env_fk;
	public Field page;
	public Field page_descr;
	public Field nome_page;
	public Field descricao_page;
	public Field status_page;
	public Field status_page_check;
	public Field p_id_page;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_pesquisar;
	public IGRPButton btn_eidtar;
	public IGRPButton btn_visualizar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_gerar_codigo;
	public IGRPButton btn_download;
	public ListaPageView(ListaPage model){
		this.setPageTitle("Lista de Paginas");
			
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","Lista de Páginas");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicacao"));
		
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","");
		page = new TextField(model,"page");
		page.setLabel(gt("Nome Página"));
		
		page.propertie().add("name","p_page").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		page_descr = new TextField(model,"page_descr");
		page_descr.setLabel(gt("Descrição Página"));
		
		page_descr.propertie().add("name","p_page_descr").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome_page = new TextField(model,"nome_page");
		nome_page.setLabel(gt("Nome Página"));
		
		nome_page.propertie().add("name","p_nome_page").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		descricao_page = new TextField(model,"descricao_page");
		descricao_page.setLabel(gt("Descrição da Página"));
		
		descricao_page.propertie().add("name","p_descricao_page").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		status_page = new CheckBoxField(model,"status_page");
		status_page.setLabel(gt("Ativo?"));
		
		status_page.propertie().add("name","p_status_page").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		status_page_check = new CheckBoxField(model,"status_page_check");
		status_page_check.propertie().add("name","p_status_page").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		p_id_page = new HiddenField(model,"p_id_page");
		p_id_page.setLabel(gt(""));
		
		p_id_page.propertie().add("name","p_id_page").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id_page");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","igrp","ListaPage","novo","modal","success|fa-plus-square","","");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_pesquisar = new IGRPButton("Pesquisar","igrp","ListaPage","pesquisar","submit","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","primary").add("rel","pesquisar");
		btn_eidtar = new IGRPButton("Eidtar","igrp","ListaPage","eidtar","modal","warning|fa-pencil","","");
		btn_eidtar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","eidtar");
		btn_visualizar = new IGRPButton("Visualizar","igrp","ListaPage","visualizar","submit_popup","primary|fa-eye","","");
		btn_visualizar.propertie.add("type","specific").add("code","").add("class","primary").add("rel","visualizar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","ListaPage","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		btn_gerar_codigo = new IGRPButton("Gerar Código","igrp","ListaPage","gerar_codigo","_blank","info|fa-gears","","");
		btn_gerar_codigo.propertie.add("type","specific").add("code","").add("class","info").add("rel","gerar_codigo");
		btn_download = new IGRPButton("Download","igrp","ListaPage","download","confirm","link|fa-download","","");
		btn_download.propertie.add("type","specific").add("code","").add("class","link").add("rel","download");
		
	}
		
	@Override
	public void render(){
		
		form_1.addField(env_fk);
		form_1.addField(page);
		form_1.addField(page_descr);


		table_1.addField(nome_page);
		table_1.addField(descricao_page);
		table_1.addField(status_page);
		table_1.addField(status_page_check);
		table_1.addField(p_id_page);

		toolsbar_1.addButton(btn_novo);
		form_1.addButton(btn_pesquisar);
		table_1.addButton(btn_eidtar);
		table_1.addButton(btn_visualizar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_gerar_codigo);
		table_1.addButton(btn_download);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
