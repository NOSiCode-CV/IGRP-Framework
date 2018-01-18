
package nosi.webapps.igrp_studio.pages.listapage;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class ListaPageView extends View {
	
	
	public Field quickbuttonbox_1_tit;
	public Field quickbuttonbox_1_val;
	public Field quickbuttonbox_1_url;
	public Field quickbuttonbox_1_bg;
	public Field quickbuttonbox_1_icn;
	public Field quickbuttonbox_2_tit;
	public Field quickbuttonbox_2_val;
	public Field quickbuttonbox_2_url;
	public Field quickbuttonbox_2_bg;
	public Field quickbuttonbox_2_icn;
	public Field quickbuttonbox_3_tit;
	public Field quickbuttonbox_3_val;
	public Field quickbuttonbox_3_url;
	public Field quickbuttonbox_3_bg;
	public Field quickbuttonbox_3_icn;
	public Field env_fk;
	public Field link_btn_nova_pagina;
	public Field btn_import;
	public Field descricao_page;
	public Field nome_page;
	public Field p_id_page;
	public Field icon;
	public Field aplicacao;
	public IGRPQuickButtonBox quickbuttonbox_1;
	public IGRPQuickButtonBox quickbuttonbox_2;
	public IGRPQuickButtonBox quickbuttonbox_3;
	public IGRPForm form_1;
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
			
		quickbuttonbox_1 = new IGRPQuickButtonBox("quickbuttonbox_1","");
		quickbuttonbox_2 = new IGRPQuickButtonBox("quickbuttonbox_2","");
		quickbuttonbox_3 = new IGRPQuickButtonBox("quickbuttonbox_3","");
		form_1 = new IGRPForm("form_1","Page builder");
		table_1 = new IGRPTable("table_1","Lista de Páginas");
		myapps_list = new IGRPTable("myapps_list","Minhas Aplicações");
		quickbuttonbox_1_tit = new TextField(model,"quickbuttonbox_1_tit");
		quickbuttonbox_1_tit.setLabel(gt("Title"));
		
		quickbuttonbox_1_tit.setValue(gt("Report Designer"));
		quickbuttonbox_1_tit.propertie().add("name","p_quickbuttonbox_1_tit").add("type","text").add("maxlength","4000").add("persist","true");
		quickbuttonbox_1_val = new TextField(model,"quickbuttonbox_1_val");
		quickbuttonbox_1_val.setLabel(gt("Value"));
		
		quickbuttonbox_1_val.setValue(gt(""));
		quickbuttonbox_1_val.propertie().add("name","p_quickbuttonbox_1_val").add("type","text").add("maxlength","4000");
		quickbuttonbox_1_url = new TextField(model,"quickbuttonbox_1_url");
		quickbuttonbox_1_url.setLabel(gt("Url"));
		
		quickbuttonbox_1_url.setValue(gt("webapps?r=igrp_studio/WebReport/index"));
		quickbuttonbox_1_url.propertie().add("name","p_quickbuttonbox_1_url").add("type","text").add("maxlength","4000");
		quickbuttonbox_1_bg = new TextField(model,"quickbuttonbox_1_bg");
		quickbuttonbox_1_bg.setLabel(gt("Background"));
		
		quickbuttonbox_1_bg.setValue(gt("cp-black"));
		quickbuttonbox_1_bg.propertie().add("name","p_quickbuttonbox_1_bg").add("type","text").add("maxlength","4000").add("persist","true");
		quickbuttonbox_1_icn = new TextField(model,"quickbuttonbox_1_icn");
		quickbuttonbox_1_icn.setLabel(gt("Icon"));
		
		quickbuttonbox_1_icn.setValue(gt("fa-file-text"));
		quickbuttonbox_1_icn.propertie().add("name","p_quickbuttonbox_1_icn").add("type","text").add("maxlength","4000").add("persist","true");
		quickbuttonbox_2_tit = new TextField(model,"quickbuttonbox_2_tit");
		quickbuttonbox_2_tit.setLabel(gt("Title"));
		
		quickbuttonbox_2_tit.setValue(gt("CRUD generator"));
		quickbuttonbox_2_tit.propertie().add("name","p_quickbuttonbox_2_tit").add("type","text").add("maxlength","4000").add("persist","true");
		quickbuttonbox_2_val = new TextField(model,"quickbuttonbox_2_val");
		quickbuttonbox_2_val.setLabel(gt("Value"));
		
		quickbuttonbox_2_val.setValue(gt(""));
		quickbuttonbox_2_val.propertie().add("name","p_quickbuttonbox_2_val").add("type","text").add("maxlength","4000");
		quickbuttonbox_2_url = new TextField(model,"quickbuttonbox_2_url");
		quickbuttonbox_2_url.setLabel(gt("Url"));
		
		quickbuttonbox_2_url.setValue(gt("webapps?r=igrp_studio/CRUDGenerator/index"));
		quickbuttonbox_2_url.propertie().add("name","p_quickbuttonbox_2_url").add("type","text").add("maxlength","4000");
		quickbuttonbox_2_bg = new TextField(model,"quickbuttonbox_2_bg");
		quickbuttonbox_2_bg.setLabel(gt("Background"));
		
		quickbuttonbox_2_bg.setValue(gt("cp-irises"));
		quickbuttonbox_2_bg.propertie().add("name","p_quickbuttonbox_2_bg").add("type","text").add("maxlength","4000").add("persist","true");
		quickbuttonbox_2_icn = new TextField(model,"quickbuttonbox_2_icn");
		quickbuttonbox_2_icn.setLabel(gt("Icon"));
		
		quickbuttonbox_2_icn.setValue(gt("fa-gears"));
		quickbuttonbox_2_icn.propertie().add("name","p_quickbuttonbox_2_icn").add("type","text").add("maxlength","4000").add("persist","true");
		quickbuttonbox_3_tit = new TextField(model,"quickbuttonbox_3_tit");
		quickbuttonbox_3_tit.setLabel(gt("Title"));
		
		quickbuttonbox_3_tit.setValue(gt("Application builder"));
		quickbuttonbox_3_tit.propertie().add("name","p_quickbuttonbox_3_tit").add("type","text").add("maxlength","4000").add("persist","true");
		quickbuttonbox_3_val = new TextField(model,"quickbuttonbox_3_val");
		quickbuttonbox_3_val.setLabel(gt("Value"));
		
		quickbuttonbox_3_val.setValue(gt(""));
		quickbuttonbox_3_val.propertie().add("name","p_quickbuttonbox_3_val").add("type","text").add("maxlength","4000");
		quickbuttonbox_3_url = new TextField(model,"quickbuttonbox_3_url");
		quickbuttonbox_3_url.setLabel(gt("Url"));
		
		quickbuttonbox_3_url.setValue(gt("webapps?r=igrp/ListaEnv/index"));
		quickbuttonbox_3_url.propertie().add("name","p_quickbuttonbox_3_url").add("type","text").add("maxlength","4000");
		quickbuttonbox_3_bg = new TextField(model,"quickbuttonbox_3_bg");
		quickbuttonbox_3_bg.setLabel(gt("Background"));
		
		quickbuttonbox_3_bg.setValue(gt("cp-cyan"));
		quickbuttonbox_3_bg.propertie().add("name","p_quickbuttonbox_3_bg").add("type","text").add("maxlength","4000").add("persist","true");
		quickbuttonbox_3_icn = new TextField(model,"quickbuttonbox_3_icn");
		quickbuttonbox_3_icn.setLabel(gt("Icon"));
		
		quickbuttonbox_3_icn.setValue(gt("fa-th-large"));
		quickbuttonbox_3_icn.propertie().add("name","p_quickbuttonbox_3_icn").add("type","text").add("maxlength","4000").add("persist","true");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicação"));
		
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","true").add("disabled","false").add("right","false").add("domain","").add("java-type","");
		link_btn_nova_pagina = new LinkField(model,"link_btn_nova_pagina");
		link_btn_nova_pagina.setLabel(gt("Nova página"));
		
		link_btn_nova_pagina.propertie().add("name","p_link_btn_nova_pagina").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","undefined").add("page","undefined").add("app","undefined").add("class","success").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-plus-square").add("maxlength","30").add("placeholder","").add("right","true");
		btn_import = new LinkField(model,"btn_import");
		btn_import.setLabel(gt("Importar"));
		
		btn_import.propertie().add("name","p_btn_import").add("type","link").add("target","modal").add("target_fields","").add("closerefresh","true").add("action","undefined").add("page","undefined").add("app","undefined").add("class","danger").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-upload").add("maxlength","30").add("placeholder","").add("right","true");
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
		
		quickbuttonbox_1.addField(quickbuttonbox_1_tit);
		quickbuttonbox_1.addField(quickbuttonbox_1_val);
		quickbuttonbox_1.addField(quickbuttonbox_1_url);
		quickbuttonbox_1.addField(quickbuttonbox_1_bg);
		quickbuttonbox_1.addField(quickbuttonbox_1_icn);

		quickbuttonbox_2.addField(quickbuttonbox_2_tit);
		quickbuttonbox_2.addField(quickbuttonbox_2_val);
		quickbuttonbox_2.addField(quickbuttonbox_2_url);
		quickbuttonbox_2.addField(quickbuttonbox_2_bg);
		quickbuttonbox_2.addField(quickbuttonbox_2_icn);

		quickbuttonbox_3.addField(quickbuttonbox_3_tit);
		quickbuttonbox_3.addField(quickbuttonbox_3_val);
		quickbuttonbox_3.addField(quickbuttonbox_3_url);
		quickbuttonbox_3.addField(quickbuttonbox_3_bg);
		quickbuttonbox_3.addField(quickbuttonbox_3_icn);

		form_1.addField(env_fk);
		form_1.addField(link_btn_nova_pagina);
		form_1.addField(btn_import);

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
		this.addToPage(quickbuttonbox_1);
		this.addToPage(quickbuttonbox_2);
		this.addToPage(quickbuttonbox_3);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(myapps_list);
		this.addToPage(toolsbar_2);
	}
}
