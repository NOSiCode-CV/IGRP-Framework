
package nosi.webapps.igrp.pages.menuorganica;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class MenuOrganicaView extends View {
	
	
	public Field menu;
	public Field menu_check;
	public Field descricao;
	public Field p_id;
	public Field p_type;
	public IGRPTable table_1;
	public IGRPForm form_1;

	public IGRPToolsBar toolsbar_2;
	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_voltar;
	public IGRPButton btn_gravar;
	public MenuOrganicaView(MenuOrganica model){
		this.setPageTitle("Associar Menu a Organica");
			
		table_1 = new IGRPTable("table_1","");
		form_1 = new IGRPForm("form_1","");
		menu = new CheckBoxField(model,"menu");
		menu.setLabel(gt("Menu"));
		
		menu.propertie().add("name","p_menu").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		menu_check = new CheckBoxField(model,"menu_check");
		menu_check.propertie().add("name","p_menu").add("type","checkbox").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("check","true").add("desc","true");
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Nome"));
		
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel(gt(""));
		
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("java-type","int").add("tag","id");
		p_type = new HiddenField(model,"p_type");
		p_type.setLabel(gt(""));
		
		p_type.propertie().add("name","p_type").add("type","hidden").add("maxlength","30").add("java-type","").add("tag","type");

		toolsbar_2 = new IGRPToolsBar("toolsbar_2");
		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_voltar = new IGRPButton("Voltar","igrp","MenuOrganica","voltar","_back","warning|fa-arrow-left","","");
		btn_voltar.propertie.add("type","specific").add("code","").add("rel","voltar");
		btn_gravar = new IGRPButton("Gravar","igrp","MenuOrganica","gravar","submit","primary|fa-save","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		
	}
		
	@Override
	public void render(){
		


		table_1.addField(menu);
		table_1.addField(menu_check);
		table_1.addField(descricao);

		form_1.addField(p_id);
		form_1.addField(p_type);

		toolsbar_2.addButton(btn_voltar);
		toolsbar_1.addButton(btn_gravar);
		this.addToPage(table_1);
		this.addToPage(form_1);
		this.addToPage(toolsbar_2);
		this.addToPage(toolsbar_1);
	}
}
