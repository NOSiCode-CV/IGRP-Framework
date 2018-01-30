
package nosi.webapps.igrp_studio.pages.listapage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ListaPageView extends View {
	
	
	public Field infopanel_1_title;
	public Field infopanel_1_val;
	public Field infopanel_1_url;
	public Field infopanel_1_bg;
	public Field infopanel_1_icn;
	public Field infopanel_2_title;
	public Field infopanel_2_val;
	public Field infopanel_2_url;
	public Field infopanel_2_bg;
	public Field infopanel_2_icn;
	public Field infopanel_3_title;
	public Field infopanel_3_val;
	public Field infopanel_3_url;
	public Field infopanel_3_bg;
	public Field infopanel_3_icn;
	public Field env_fk;
	public Field link_btn_nova_pagina;
	public Field crud_generator;
	public Field btn_import;
	public Field status_page;
	public Field status_page_check;
	public Field descricao_page;
	public Field nome_page;
	public Field p_id_page;
	public Field icon;
	public Field aplicacao;
	public IGRPForm infopanel_1;
	public IGRPForm infopanel_2;
	public IGRPForm infopanel_3;
	public IGRPForm box_2;
	public IGRPForm form_1;
	public IGRPForm box_1;
	public IGRPTable table_1;
	public IGRPTable myapps_list;

	public IGRPToolsBar toolsbar_2;
	public IGRPButton btn_nova_aplicacao;
	public IGRPButton btn_editar;
	public IGRPButton btn_visualizar;
	public IGRPButton btn_eliminar;
	public IGRPButton btn_gerar_codigo;
	public IGRPButton btn_download;
	public ListaPageView(ListaPage model){
		this.setPageTitle("Page builder");
			
		infopanel_1 = new IGRPForm("infopanel_1","");
		infopanel_2 = new IGRPForm("infopanel_2","");
		infopanel_3 = new IGRPForm("infopanel_3","");
		box_2 = new IGRPForm("box_2","");
		form_1 = new IGRPForm("form_1","Page builder");
		box_1 = new IGRPForm("box_1","");
		table_1 = new IGRPTable("table_1","");
		myapps_list = new IGRPTable("myapps_list","Minhas Aplicações");
		infopanel_1_title = new TextField(model,"infopanel_1_title");
		infopanel_1_title.setLabel(gt("Title"));
		infopanel_1_title.setValue(gt("Report designer"));
		infopanel_1_title.propertie().add("name","p_infopanel_1_title").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_1_val = new TextField(model,"infopanel_1_val");
		infopanel_1_val.setLabel(gt("Value"));
		infopanel_1_val.propertie().add("name","p_infopanel_1_val").add("type","text").add("maxlength","4000");
		
		infopanel_1_url = new TextField(model,"infopanel_1_url");
		infopanel_1_url.setLabel(gt("URL"));
		infopanel_1_url.setValue(gt("webapps?r=igrp_studio/WebReport/index"));
		infopanel_1_url.propertie().add("name","p_infopanel_1_url").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_1_bg = new TextField(model,"infopanel_1_bg");
		infopanel_1_bg.setLabel(gt("Background"));
		infopanel_1_bg.setValue(gt("cp-black"));
		infopanel_1_bg.propertie().add("name","p_infopanel_1_bg").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_1_icn = new TextField(model,"infopanel_1_icn");
		infopanel_1_icn.setLabel(gt("Icon"));
		infopanel_1_icn.setValue(gt("fa-file-text"));
		infopanel_1_icn.propertie().add("name","p_infopanel_1_icn").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_2_title = new TextField(model,"infopanel_2_title");
		infopanel_2_title.setLabel(gt("Title"));
		infopanel_2_title.setValue(gt("BPMN designer"));
		infopanel_2_title.propertie().add("name","p_infopanel_2_title").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_2_val = new TextField(model,"infopanel_2_val");
		infopanel_2_val.setLabel(gt("Value"));
		infopanel_2_val.propertie().add("name","p_infopanel_2_val").add("type","text").add("maxlength","4000");
		
		infopanel_2_url = new TextField(model,"infopanel_2_url");
		infopanel_2_url.setLabel(gt("URL"));
		infopanel_2_url.setValue(gt("webapps?r=igrp_studio/BPMNDesigner/index"));
		infopanel_2_url.propertie().add("name","p_infopanel_2_url").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_2_bg = new TextField(model,"infopanel_2_bg");
		infopanel_2_bg.setLabel(gt("Background"));
		infopanel_2_bg.setValue(gt("cp-lavendar"));
		infopanel_2_bg.propertie().add("name","p_infopanel_2_bg").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_2_icn = new TextField(model,"infopanel_2_icn");
		infopanel_2_icn.setLabel(gt("Icon"));
		infopanel_2_icn.setValue(gt("fa-sitemap"));
		infopanel_2_icn.propertie().add("name","p_infopanel_2_icn").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_3_title = new TextField(model,"infopanel_3_title");
		infopanel_3_title.setLabel(gt("Title"));
		infopanel_3_title.setValue(gt("Application builder"));
		infopanel_3_title.propertie().add("name","p_infopanel_3_title").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_3_val = new TextField(model,"infopanel_3_val");
		infopanel_3_val.setLabel(gt("Value"));
		infopanel_3_val.propertie().add("name","p_infopanel_3_val").add("type","text").add("maxlength","4000");
		
		infopanel_3_url = new TextField(model,"infopanel_3_url");
		infopanel_3_url.setLabel(gt("URL"));
		infopanel_3_url.setValue(gt("webapps?r=igrp_studio/ListaEnv/index"));
		infopanel_3_url.propertie().add("name","p_infopanel_3_url").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_3_bg = new TextField(model,"infopanel_3_bg");
		infopanel_3_bg.setLabel(gt("Background"));
		infopanel_3_bg.setValue(gt("cp-starrynight"));
		infopanel_3_bg.propertie().add("name","p_infopanel_3_bg").add("type","text").add("maxlength","4000").add("persist","true");
		
		infopanel_3_icn = new TextField(model,"infopanel_3_icn");
		infopanel_3_icn.setLabel(gt("Icon"));
		infopanel_3_icn.setValue(gt("fa-folder-open"));
		infopanel_3_icn.propertie().add("name","p_infopanel_3_icn").add("type","text").add("maxlength","4000").add("persist","true");
		
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		
		link_btn_nova_pagina = new LinkField(model,"link_btn_nova_pagina");
		link_btn_nova_pagina.setLabel(gt("Nova página"));
		link_btn_nova_pagina.propertie().add("name","p_link_btn_nova_pagina").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","index").add("page","ListaEnv").add("app","igrp_studio").add("class","success").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-plus-square").add("maxlength","30").add("placeholder","").add("right","true");
		
		crud_generator = new LinkField(model,"crud_generator");
		crud_generator.setLabel(gt("CRUD generator"));
		crud_generator.propertie().add("name","p_crud_generator").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","index").add("page","HomeStudio").add("app","igrp_studio").add("class","warning").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-gears").add("maxlength","30").add("placeholder","").add("right","true");
		
		btn_import = new LinkField(model,"btn_import");
		btn_import.setLabel(gt("Importar"));
		btn_import.propertie().add("name","p_btn_import").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","undefined").add("page","undefined").add("app","undefined").add("class","danger").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-upload").add("maxlength","30").add("placeholder","").add("right","true");
		
		status_page = new CheckBoxField(model,"status_page");
		status_page.setLabel(gt("Estado"));
		status_page.propertie().add("name","p_status_page").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("switch","true").add("check","true").add("desc","true");
		
		status_page_check = new CheckBoxField
		(model,"status_page_check");
		status_page_check.propertie().add("name","p_status_page").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("switch","true").add("check","true").add("desc","true");
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
		icon.setValue(gt(""));
		icon.propertie().add("name","p_icon").add("type","img").add("persist","true").add("img","images/IGRP/IGRP2.3/assets/img/jon_doe.jpg").add("width","").add("height","").add("croppie","false").add("rounded","false").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		
		aplicacao = new LinkField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","link").add("target","_self").add("target_fields","").add("closerefresh","false").add("action","index").add("page","ListaPage").add("app","igrp_studio").add("class","link").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-link").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("desc","true");
		

		toolsbar_2 = new IGRPToolsBar("toolsbar_2");
		btn_nova_aplicacao = new IGRPButton("Nova Aplicação","igrp_studio","ListaPage","nova_aplicacao","modal|refresh","primary|fa-plus","","");
		btn_nova_aplicacao.propertie.add("type","specific").add("code","").add("rel","nova_aplicacao");
		btn_editar = new IGRPButton("Editar","igrp_studio","ListaPage","editar","modal|refresh","warning|fa-pencil","","");
		btn_editar.propertie.add("type","specific").add("code","").add("class","warning").add("rel","editar");
		btn_visualizar = new IGRPButton("Visualizar","igrp_studio","ListaPage","visualizar","_blank","primary|fa-eye","","");
		btn_visualizar.propertie.add("type","specific").add("code","").add("class","primary").add("rel","visualizar");
		btn_eliminar = new IGRPButton("Eliminar","igrp_studio","ListaPage","eliminar","confirm","danger|fa-trash","","");
		btn_eliminar.propertie.add("type","specific").add("code","").add("class","danger").add("rel","eliminar");
		btn_gerar_codigo = new IGRPButton("Gerar Código","igrp_studio","ListaPage","gerar_codigo","_blank","info|fa-gears","","");
		btn_gerar_codigo.propertie.add("type","specific").add("code","").add("class","info").add("rel","gerar_codigo");
		btn_download = new IGRPButton("Download","igrp_studio","ListaPage","download","confirm","grey|fa-download","","");
		btn_download.propertie.add("type","specific").add("code","").add("class","grey").add("rel","download");
		
	}
		
	@Override
	public void render(){
		
		infopanel_1.addField(infopanel_1_title);
		infopanel_1.addField(infopanel_1_val);
		infopanel_1.addField(infopanel_1_url);
		infopanel_1.addField(infopanel_1_bg);
		infopanel_1.addField(infopanel_1_icn);

		infopanel_2.addField(infopanel_2_title);
		infopanel_2.addField(infopanel_2_val);
		infopanel_2.addField(infopanel_2_url);
		infopanel_2.addField(infopanel_2_bg);
		infopanel_2.addField(infopanel_2_icn);

		infopanel_3.addField(infopanel_3_title);
		infopanel_3.addField(infopanel_3_val);
		infopanel_3.addField(infopanel_3_url);
		infopanel_3.addField(infopanel_3_bg);
		infopanel_3.addField(infopanel_3_icn);


		form_1.addField(env_fk);
		form_1.addField(link_btn_nova_pagina);
		form_1.addField(crud_generator);
		form_1.addField(btn_import);


		table_1.addField(status_page);
		table_1.addField(status_page_check);
		table_1.addField(descricao_page);
		table_1.addField(nome_page);
		table_1.addField(p_id_page);

		myapps_list.addField(icon);
		myapps_list.addField(aplicacao);


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
		this.addToPage(infopanel_1);
		this.addToPage(infopanel_2);
		this.addToPage(infopanel_3);
		this.addToPage(box_2);
		this.addToPage(form_1);
		this.addToPage(box_1);
		this.addToPage(table_1);
		this.addToPage(myapps_list);
		this.addToPage(toolsbar_2);
	}
}
