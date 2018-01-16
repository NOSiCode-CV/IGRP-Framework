
package nosi.webapps.igrp.pages.listapage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ListaPageView extends View {
	
	
	public Field sectionheader_1_text;
	public Field env_fk;
	public Field link_btn_nova_pagina;
	public Field btn_import;
	public Field descricao_page;
	public Field nome_page;
	public Field p_id_page;
	public Field icon;
	public Field aplicacao;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;
	public IGRPTable myapps_list;

	public IGRPToolsBar toolsbar_1;
	public IGRPToolsBar toolsbar_2;
	public IGRPButton btn_report_design;
	public IGRPButton btn_crud_generator;
	public IGRPButton btn_app_builder;
	public IGRPButton btn_nova_aplicacao;
	public IGRPButton btn_editar;
	public IGRPButton btn_visualizar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_gerar_codigo;
	public IGRPButton btn_download;
	public ListaPageView(ListaPage model){
		this.setPageTitle("Lista de Paginas");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");
		form_1 = new IGRPForm("form_1","");
		table_1 = new IGRPTable("table_1","Lista de Páginas");
		myapps_list = new IGRPTable("myapps_list","Minhas Aplicações");
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
		btn_import = new LinkField(model,"btn_import");
		btn_import.setLabel(gt("Importar"));
		
		btn_import.propertie().add("name","p_btn_import").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","index").add("page","Import_export").add("app","igrp").add("class","danger").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-upload").add("maxlength","30").add("placeholder","").add("right","true");
		descricao_page = new TextField(model,"descricao_page");
		descricao_page.setLabel(gt("Título"));
		
		descricao_page.propertie().add("name","p_descricao_page").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		nome_page = new TextField(model,"nome_page");
		nome_page.setLabel(gt("Código"));
		
		nome_page.propertie().add("name","p_nome_page").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		p_id_page = new HiddenField(model,"p_id_page");
		p_id_page.setLabel(gt(""));
		
		p_id_page.propertie().add("name","p_id_page").add("type","hidden").add("maxlength","30").add("iskey","false").add("tag","id_page");
		icon = new TextField(model,"icon");
		icon.setLabel(gt("Icon"));
		
		icon.propertie().add("name","p_icon").add("type","img").add("persist","true").add("img","http://igrp.teste.gov.cv/images/legislativas/data/img/candidatos/jon_doe.jpg").add("width","").add("height","").add("croppie","false").add("rounded","false").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		aplicacao = new LinkField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		
		aplicacao.propertie().add("name","p_aplicacao").add("type","link").add("target","_self").add("target_fields","").add("closerefresh","false").add("action","index").add("page","ListaPage").add("app","igrp").add("class","link").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-link").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("desc","true");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		toolsbar_2 = new IGRPToolsBar("toolsbar_2");
		btn_report_design = new IGRPButton("Report Design","igrp","ListaPage","report_design","_self","black|fa-file-text-o","","");
		btn_report_design.propertie.add("type","specific").add("code","").add("rel","report_design");
		btn_crud_generator = new IGRPButton("CRUD Generator","igrp","ListaPage","crud_generator","_self","success|fa-cogs","","");
		btn_crud_generator.propertie.add("type","specific").add("code","").add("rel","crud_generator");
		btn_app_builder = new IGRPButton("App Builder","igrp","ListaPage","app_builder","_self","info|fa-th-large","","");
		btn_app_builder.propertie.add("type","specific").add("code","").add("rel","app_builder");
		btn_nova_aplicacao = new IGRPButton("Nova Aplicação","igrp","ListaPage","nova_aplicacao","modal|refresh","primary|fa-plus","","");
		btn_nova_aplicacao.propertie.add("type","specific").add("code","").add("rel","nova_aplicacao");
		btn_editar = new IGRPButton("Editar","igrp","ListaPage","editar","modal|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_visualizar = new IGRPButton("Visualizar","igrp","ListaPage","visualizar","submit_popup","primary|fa-eye","","");
		btn_visualizar.propertie.add("type","specific").add("code","").add("class","primary").add("rel","visualizar");
		btn_eliminar = new IGRPButton("Eliminar","igrp","ListaPage","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		btn_gerar_codigo = new IGRPButton("Gerar Código","igrp","ListaPage","gerar_codigo","_blank","info|fa-gears","","");
		btn_gerar_codigo.propertie.add("type","specific").add("code","").add("class","info").add("rel","gerar_codigo");
		btn_download = new IGRPButton("Download","igrp","ListaPage","download","confirm","grey|fa-download","","");
		btn_download.propertie.add("type","specific").add("code","").add("class","grey").add("rel","download");
		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);


		form_1.addField(env_fk);
		form_1.addField(link_btn_nova_pagina);
		form_1.addField(btn_import);

		table_1.addField(descricao_page);
		table_1.addField(nome_page);
		table_1.addField(p_id_page);

		myapps_list.addField(icon);
		myapps_list.addField(aplicacao);


		toolsbar_1.addButton(btn_report_design);
		toolsbar_1.addButton(btn_crud_generator);
		toolsbar_1.addButton(btn_app_builder);
		toolsbar_2.addButton(btn_nova_aplicacao);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_visualizar);
		table_1.addButton(btn_eliminar);
		table_1.addButton(btn_gerar_codigo);
		table_1.addButton(btn_download);
		myapps_list.addButton(btn_editar);
		myapps_list.addButton(btn_visualizar);
		myapps_list.addButton(btn_eliminar);
		myapps_list.addButton(btn_gerar_codigo);
		myapps_list.addButton(btn_download);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(myapps_list);
		this.addToPage(toolsbar_1);
		this.addToPage(toolsbar_2);
	}
}
