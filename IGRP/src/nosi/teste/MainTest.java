package nosi.teste;

import nosi.core.gui.components.FormXML;
import nosi.core.gui.fields.CheckBoxListField;
import nosi.core.gui.fields.EmailField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.RadioListField;
import nosi.core.gui.fields.TextField;

public class MainTest {

	public static void main(String[] args) {
		
		
		FormXML form = new FormXML("form_1");
		FormXML form2 = new FormXML("form_2");
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
		
		System.out.println(form.toString());
		System.out.println(form2.toString());
	}

}
