package nosi.webapps.igrp.pages.menuorganica;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class MenuOrganicaView extends View {

	public Field menu;
	public Field menu_check;
	public Field descricao;
	public Field app;
	public Field env_fk;
	public Field id;
	public Field type;
	public IGRPTable table_1;
	public IGRPForm form_2;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPToolsBar toolsbar_2;
	public IGRPButton btn_gravar;
	public IGRPButton btn_novo;

	public MenuOrganicaView(){

		this.setPageTitle("Associar Menu a Organica");
			
		table_1 = new IGRPTable("table_1","Menu «--» Profile");

		form_2 = new IGRPForm("form_2","");

		form_1 = new IGRPForm("form_1","");

		menu = new CheckBoxField(model,"menu");
		menu.setLabel(gt(" "));
		menu.propertie().add("name","p_menu").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","int").add("showLabel","true").add("check","true").add("desc","true");
		
		menu_check = new CheckBoxField(model,"menu_check");
		menu_check.propertie().add("name","p_menu").add("type","checkbox").add("maxlength","30").add("switch","false").add("java-type","int").add("showLabel","true").add("check","true").add("desc","true");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Nome"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("showLabel","true");
		
		app = new HiddenField(model,"app");
		app.setLabel(gt(""));
		app.propertie().add("name","p_app").add("type","hidden").add("maxlength","30").add("java-type","").add("showLabel","true").add("tag","app");
		
		env_fk = new HiddenField(model,"env_fk");
		env_fk.setLabel(gt(""));
		env_fk.propertie().add("name","p_env_fk").add("type","hidden").add("maxlength","250").add("java-type","int").add("tag","env_fk");
		
		id = new HiddenField(model,"id");
		id.setLabel(gt(""));
		id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","int").add("tag","id");
		
		type = new HiddenField(model,"type");
		type.setLabel(gt(""));
		type.propertie().add("name","p_type").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","type");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		toolsbar_2 = new IGRPToolsBar("toolsbar_2");

		btn_gravar = new IGRPButton("Gravar","igrp","MenuOrganica","gravar","submit_ajax","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("rel","gravar");

		btn_novo = new IGRPButton("Novo","igrp","MenuOrganica","novo","modal|refresh","success|fa-plus-square-o","","");
		btn_novo.propertie.add("type","specific").add("rel","novo");

		
	}
		
	@Override
	public void render(){
		

		table_1.addField(menu);
		table_1.addField(menu_check);
		table_1.addField(descricao);
		table_1.addField(app);


		form_2.addField(env_fk);

		form_1.addField(id);
		form_1.addField(type);

		toolsbar_1.addButton(btn_gravar);
		toolsbar_2.addButton(btn_novo);
		this.addToPage(table_1);
		this.addToPage(form_2);
		this.addToPage(form_1);
		this.addToPage(toolsbar_1);
		this.addToPage(toolsbar_2);
	}
		
	@Override
	public void setModel(Model model) {
		
		menu.setValue(model);
		descricao.setValue(model);
		app.setValue(model);
		env_fk.setValue(model);
		id.setValue(model);
		type.setValue(model);	

		table_1.loadModel(((MenuOrganica) model).getTable_1());
		}
}
