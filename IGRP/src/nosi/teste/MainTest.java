package nosi.teste;

import nosi.core.gui.components.IGRPContextMenu;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.gui.components.IGRPView;
import nosi.core.gui.fields.CheckBoxListField;
import nosi.core.gui.fields.EmailField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.RadioListField;
import nosi.core.gui.fields.TextField;
import nosi.core.gui.page.Page;
import nosi.webapps.igrp.pages.defaultPagina.DefaultPaginaView;

public class MainTest {

	public static void main(String[] args) {
		
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
		
		System.out.println(form);
		System.out.println(toolsbar);
		System.out.println(contextmenu);*/
		DefaultPaginaView view  = new DefaultPaginaView();
		view.render();
		System.out.println(view.getPage().renderContent(true));
	}

}
