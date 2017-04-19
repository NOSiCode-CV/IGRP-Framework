package nosi.teste;

import nosi.core.gui.components.IGRPBox;
import nosi.core.gui.components.IGRPContextMenu;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPFormList;
import nosi.core.gui.components.IGRPParagraph;
import nosi.core.gui.components.IGRPSectionHeader;
import nosi.core.gui.components.IGRPTabContent;
import nosi.core.gui.components.IGRPTable;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.gui.components.IGRPView;
import nosi.core.gui.fields.CheckBoxListField;
import nosi.core.gui.fields.EmailField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.RadioListField;
import nosi.core.gui.fields.TextField;

public class MainTest {

	public static void main(String[] args) {
		IGRPForm form = new IGRPForm("form_1");
		Field nome = new TextField(null,"nome");		
		nome.setValue("Ima");
		nome.propertie().add("ajha", "hssd");
		form.addField(nome);
		/*IGRPForm form = new IGRPForm("form_1");
		IGRPForm form2 = new IGRPForm("form_2");
		IGRPView view = new IGRPView("view_1");
		Field nome = new TextField("nome");
		
		nome.setValue("Ima");
		
		Field morada = new TextField("morada");
		morada.setValue("VN");
		
		Field hidden = new HiddenField("hidden");
		hidden.setValue(1);
		
		Field select = new ListField("select");
		select.addOption("Option 1", 1);
		select.addOption("Option 2", 2);
		
		Field radiolist = new RadioListField("radiolist");
		radiolist.addOption("Check 1", 1);
		radiolist.addOption("Check 2", 2);
		

		Field checkboxlist = new CheckBoxListField("checkboxlist");
		checkboxlist.addOption("Check 1", 1);
		checkboxlist.addOption("Check 2", 2);
		
		Field email = new EmailField("email");
		email.setValue("ima@gmail.com");
		
		
		form.addField(nome);
		form.addField(morada);
		form.addField(hidden);
		form.addField(email);
		
		form2.addField(select);
		form2.addField(radiolist);
		form2.addField(checkboxlist);
		
		view.addField(email);
		view.addField(nome);
		System.out.println(form.toString());
		System.out.println(form2.toString());
		System.out.println(view.toString());*/
		
		/*IGRPForm form = new IGRPForm("form_1");
		form.addButton("Button name", "App name", "Page name", "Action name", "Target", "Image name", "","buuton_1","danger");
		form.addButton("Button name", "App name", "Page name", "Action name", "Target", "Image name", "","buuton_2","danger","params");
		
		IGRPToolsBar toolsbar = new IGRPToolsBar("toolsbar_1");
		toolsbar.addItem("Button name", "App name", "Page name", "Action name", "Target", "Image name", "","buuton_1","danger","params");
		
		IGRPContextMenu contextmenu = new IGRPContextMenu();
		contextmenu.addItem("Button name", "App name", "Page name", "Action name", "Target", "Image name", "","buuton_1","danger","params");
		
		IGRPToolsBar button = new IGRPToolsBar("button");
		button.addItem("Button name", "App name", "Page name", "Action name", "Target", "Image name");
		
		System.out.println(form);
		System.out.println(toolsbar);
		System.out.println(contextmenu);
		System.out.println(button.toXmlButton());
		
		Field nome = new TextField("nome");
		nome.setValue("Ima");
		
		Field morada = new TextField("morada");
		morada.setValue("VN");
		
		IGRPTable table = new IGRPTable("table_1");
		table.addField(nome);
		table.addField(morada);
		
		table.addButton("Button name", "App name", "Page name", "Action name", "Target", "Image name", "","buuton_1","danger");
		table.addButton("Button name", "App name", "Page name", "Action name", "Target", "Image name", "","buuton_2","danger","params");
		
		IGRPFormList formlist = new IGRPFormList("formlist_1");
		formlist.addField(nome);
		formlist.addField(morada);
		
		formlist.addButton("Button name", "App name", "Page name", "Action name", "Target", "Image name", "","buuton_1","danger");
		formlist.addButton("Button name", "App name", "Page name", "Action name", "Target", "Image name", "","buuton_2","danger","params");
		
		
		IGRPTabContent tab = new IGRPTabContent("tabcontent_1");
		tab.addItem("tab_item_1", "Tab Item 1", "fa-dot-circle-o");
		tab.addItem("tab_item_2", "Tab Item 2", "fa-dot-circle-o");
		
		*/
		IGRPParagraph box = new IGRPParagraph("section", "Teste");
	
		System.out.println(form);
	}

}
