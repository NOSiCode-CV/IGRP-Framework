package nosi.teste;

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.TextField;
import nosi.core.gui.page.Page;

public class MainTest {

	public static void main(String[] args) {
		Field nome = new TextField("nome");
		nome.setValue("Yma");
		
		Field morada = new TextField("morada");
		morada.setValue("VN");
		
		Field sexo = new ListField("sexo");
		sexo.setValue("Option 1", 1);
		
		Page page = new Page();
		
		page.addField(nome);
		page.addField(morada);
		page.addField(sexo);
		page.displayForm();
	}

}
