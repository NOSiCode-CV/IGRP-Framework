
package nosi.webapps.igrp.pages.listapage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ListaPageView extends View {
	
	
	public Field sectionheader_1_text;
	public Field env_fk;
	public Field link_btn_nova_pagina;
	public Field link_btn_ab;
	public Field btn_import;
	public Field status_page;
	public Field status_page_check;
	public Field descricao_page;
	public Field nome_page;
	public Field p_id_page;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_editar;
	public IGRPButton btn_visualizar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_gerar_codigo;
	public IGRPButton btn_download;
	public ListaPageView(ListaPage model){
		this.setPageTitle("App builder");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","Lista de Páginas");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		
		sectionheader_1_text.setValue(gt("Page Builder"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		link_btn_nova_pagina = new LinkField(model,"link_btn_nova_pagina");
		link_btn_nova_pagina.setLabel(gt("Nova página"));
		
		link_btn_nova_pagina.propertie().add("name","p_link_btn_nova_pagina").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","index").add("page","ListaEnv").add("app","igrp").add("class","success").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-plus-square").add("maxlength","30").add("placeholder","").add("right","true");
		link_btn_ab = new LinkField(model,"link_btn_ab");
		link_btn_ab.setLabel(gt("App builder"));
		
		link_btn_ab.propertie().add("name","p_link_btn_ab").add("type","link").add("target","_self").add("target_fields","").add("closerefresh","false").add("action","index").add("page","ListaEnv").add("app","igrp").add("class","info").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-th").add("maxlength","30").add("placeholder","").add("right","true");
		btn_import = new LinkField(model,"btn_import");
		btn_import.setLabel(gt("Importar"));
		
		btn_import.propertie().add("name","p_btn_import").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","index").add("page","Import_export").add("app","igrp").add("class","default").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-upload").add("maxlength","30").add("placeholder","").add("right","true");
		status_page = new CheckBoxField(model,"status_page");
		status_page.setLabel(gt("Ativo?"));
		
		status_page.propertie().add("name","p_status_page").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		status_page_check = new CheckBoxField(model,"status_page_check");
		status_page_check.propertie().add("name","p_status_page").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		descricao_page = new TextField(model,"descricao_page");
		descricao_page.setLabel(gt("Título"));
		
		descricao_page.propertie().add("name","p_descricao_page").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		nome_page = new TextField(model,"nome_page");
		nome_page.setLabel(gt("Código"));
		
		nome_page.propertie().add("name","p_nome_page").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		p_id_page = new HiddenField(model,"p_id_page");
		p_id_page.setLabel(gt(""));
		
		p_id_page.propertie().add("name","p_id_page").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id_page");

		btn_editar = new IGRPButton("Editar","igrp","ListaPage","editar","modal|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
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
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(env_fk);
		form_1.addField(link_btn_nova_pagina);
		form_1.addField(link_btn_ab);
		form_1.addField(btn_import);

		table_1.addField(status_page);
		table_1.addField(status_page_check);
		table_1.addField(descricao_page);
		table_1.addField(nome_page);
		table_1.addField(p_id_page);

		table_1.addButton(btn_editar);
		table_1.addButton(btn_visualizar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_gerar_codigo);
		table_1.addButton(btn_download);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
