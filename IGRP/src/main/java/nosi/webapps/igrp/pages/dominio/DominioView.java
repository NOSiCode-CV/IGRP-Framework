package nosi.webapps.igrp.pages.dominio;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Core;

public class DominioView extends View {

	public Field sectionheader_1_text;
	public Field documento;
	public Field forum;
	public Field aplicacao;
	public Field lst_dominio;
	public Field novo_dominio;
	public Field app;
	public Field description;
	public Field key;
	public Field estado;
	public Field estado_check;
	public Field ordem_desc;
	public Field ordem;
	public Field dominio;
	public Field id_dom;
	public IGRPSectionHeader sectionheader_1;
	public IGRPView view_1;
	public IGRPView view_2;
	public IGRPForm form_1;
	public IGRPFormList formlist_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_guardar_item_domain;
	public IGRPButton btn_gravar_domain;
	public IGRPButton btn_editar;
	public IGRPButton btn_delete;
	public IGRPButton btn_download;

	public DominioView(){

		this.setPageTitle("Gestão de Domínios");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		view_1 = new IGRPView("view_1","");

		view_2 = new IGRPView("view_2","");

		form_1 = new IGRPForm("form_1","");

		formlist_1 = new IGRPFormList("formlist_1","");

		table_1 = new IGRPTable("table_1","Lista dos domínios");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("Gestão de Domínio"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		documento = new LinkField(model,"documento");
		documento.setLabel(gt("Help"));
		documento.propertie().add("name","p_documento").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","[object Object]").add("maxlength","250").add("showlabel","true").add("adbcli","");
		
		forum = new LinkField(model,"forum");
		forum.setLabel(gt("Forum"));
		forum.propertie().add("name","p_forum").add("type","link").add("target","_newtab").add("request_fields","").add("refresh_components","").add("refresh_submit","false").add("class","[object Object]").add("img","[object Object]").add("maxlength","250").add("showlabel","true").add("adbcli","");
		
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Aplicação"));
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","Integer").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		lst_dominio = new ListField(model,"lst_dominio");
		lst_dominio.setLabel(gt("Editar domínio"));
		lst_dominio.propertie().add("remote",Core.getIGRPLink("igrp","Dominio","index")).add("remote",Core.getIGRPLink("igrp","Dominio","index")).add("name","p_lst_dominio").add("type","select").add("multiple","false").add("tags","false").add("domain","").add("maxlength","250").add("required","false").add("disabled","false").add("java-type","").add("load_service_data","false").add("tooltip","false").add("disable_copy_paste","false");
		
		novo_dominio = new TextField(model,"novo_dominio");
		novo_dominio.setLabel(gt("Novo domínio"));
		novo_dominio.propertie().add("name","p_novo_dominio").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("dad_name Ex: igrp_types_doc")).add("desclabel","false").add("disablehtml","true").add("inputmask","").add("tooltip","false").add("disable_copy_paste","false");
		
		app = new HiddenField(model,"app");
		app.setLabel(gt(""));
		app.propertie().add("name","p_app").add("type","hidden").add("maxlength","250").add("java-type","Integer").add("tooltip","false").add("disable_copy_paste","false").add("tag","app");
		
		description = new TextField(model,"description");
		description.setLabel(gt("Descrição"));
		description.propertie().add("name","p_description").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("Yes")).add("disablehtml","true").add("inputmask","").add("desc","true");
		
		key = new TextField(model,"key");
		key.setLabel(gt("Chave"));
		key.propertie().add("name","p_key").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("placeholder",gt("Y")).add("disablehtml","true").add("inputmask","").add("desc","true");
		
		estado = new CheckBoxField(model,"estado");
		estado.setLabel(gt("Ativo?"));
		estado.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","1000").add("required","false").add("readonly","false").add("disabled","false").add("java-type","int").add("check","true").add("desc","true");
		
		estado_check = new CheckBoxField(model,"estado_check");
		estado_check.propertie().add("name","p_estado").add("type","checkbox").add("maxlength","1000").add("required","false").add("readonly","false").add("disabled","false").add("java-type","int").add("check","true").add("desc","true");
		
		ordem = new HiddenField(model,"ordem");
		ordem.setLabel(gt(""));
		ordem.propertie().add("name","p_ordem").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","ordem").add("desc","true");
		
		dominio = new TextField(model,"dominio");
		dominio.setLabel(gt("Domínio"));
		dominio.propertie().add("name","p_dominio").add("type","text").add("maxlength","30").add("showLabel","true").add("group_in","");
		
		id_dom = new HiddenField(model,"id_dom");
		id_dom.setLabel(gt(""));
		id_dom.propertie().add("name","p_id_dom").add("type","hidden").add("maxlength","30").add("showLabel","true").add("group_in","").add("java-type","").add("tag","id_dom");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_guardar_item_domain = new IGRPButton("Guardar","igrp","Dominio","guardar_item_domain","submit_ajax","primary|fa-save","","");
		btn_guardar_item_domain.propertie.add("type","specific").add("rel","guardar_item_domain").add("refresh_components","formlist_1");

		btn_gravar_domain = new IGRPButton("Adicionar","igrp","Dominio","gravar_domain","submit_ajax","success|fa-plus-square","","");
		btn_gravar_domain.propertie.add("type","specific").add("rel","gravar_domain").add("refresh_components","toolsbar_1,form_1,formlist_1");

		btn_editar = new IGRPButton("Editar","igrp","Dominio","editar","right_panel|refresh","warning|fa-pencil-square","","");
		btn_editar.propertie.add("id","button_91cf_1728").add("type","specific").add("class","warning").add("rel","editar").add("refresh_components","");

		btn_delete = new IGRPButton("Delete","igrp","Dominio","delete","alert_submit","danger|fa-times-circle","","");
		btn_delete.propertie.add("id","button_91cf_1728").add("type","specific").add("class","danger").add("rel","delete").add("refresh_components","").add("labelConfirm","Deseja realmente realizar esta operação?");

		btn_download = new IGRPButton("Download","igrp","Dominio","download","download|refresh","grey|fa-download","","");
		btn_download.propertie.add("id","button_682b_bf52").add("type","specific").add("class","grey").add("rel","download").add("refresh_components","");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		view_1.addField(documento);

		view_2.addField(forum);


		form_1.addField(aplicacao);
		form_1.addField(lst_dominio);
		form_1.addField(novo_dominio);
		form_1.addField(app);

		formlist_1.addField(description);
		formlist_1.addField(key);
		formlist_1.addField(estado);
		formlist_1.addField(estado_check);
		formlist_1.addField(ordem);

		table_1.addField(dominio);
		table_1.addField(id_dom);

		toolsbar_1.addButton(btn_guardar_item_domain);
		toolsbar_1.addButton(btn_gravar_domain);
		table_1.addButton(btn_editar);
		table_1.addButton(btn_delete);
		table_1.addButton(btn_download);
		this.addToPage(sectionheader_1);
		this.addToPage(view_1);
		this.addToPage(view_2);
		this.addToPage(form_1);
		this.addToPage(formlist_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		documento.setValue(model);
		forum.setValue(model);
		aplicacao.setValue(model);
		lst_dominio.setValue(model);
		novo_dominio.setValue(model);
		app.setValue(model);
		description.setValue(model);
		key.setValue(model);
		estado.setValue(model);
		ordem.setValue(model);
		dominio.setValue(model);
		id_dom.setValue(model);	

		formlist_1.loadModel(((Dominio) model).getFormlist_1());
		table_1.loadModel(((Dominio) model).getTable_1());
		}
}
