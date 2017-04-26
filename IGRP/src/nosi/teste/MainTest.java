package nosi.teste;

import nosi.core.gui.components.IGRPBox;
import nosi.core.gui.components.IGRPButton;
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
import nosi.core.gui.fields.DateField;
import nosi.core.gui.fields.EmailField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.NumberField;
import nosi.core.gui.fields.RadioListField;
import nosi.core.gui.fields.TextField;
import nosi.webapps.igrp.pages.testetabela.Testetabela;
import nosi.webapps.igrp.pages.testetabela.TestetabelaView;
import nosi.webapps.igrp.pages.testetabela.Testetabela.Table1;

public class MainTest {
	
	public static void main(String[] args) {
		Testetabela model = new Testetabela();
		
		
		Field n_bi;
		Field nome;
		Field data_nascimento;
		IGRPForm form_1;
		IGRPTable table_1;

		IGRPToolsBar toolsbar_1;
		IGRPButton btn_save;
		IGRPButton btn_pesquisar;

		IGRPButton btn_button_1 = new IGRPButton("Button","","","","_blank","default|fa-angle-right","","");
		btn_button_1.propertie.add("type","specific").add("code","").add("class","default").add("rel","button_1");
		
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		n_bi = new NumberField(model,"n_bi");
		n_bi.setLabel("Nº BI");
		n_bi.propertie().add("name","p_n_bi").add("type","number").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		data_nascimento = new DateField(model,"data_nascimento");
		data_nascimento.setLabel("Data Nascimento");
		data_nascimento.propertie().add("name","p_data_nascimento").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","true").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_save = new IGRPButton("Save","RED","Teste","Action","_blank","default|fa-save","default||fa-save|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_save.propertie.add("type","specific").add("code","").add("rel","save");
		btn_pesquisar = new IGRPButton("Pesquisar","RED","Teste","Action","_blank","default|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		Testetabela.Table1 table1 = new Testetabela().new Table1();
		
		table1.setData_nascimento("2000-10-10");
		table1.setN_bi(1);
		table1.setNome("Teste");
		model.setTable1(table1);
		table_1.addData(model.getTable_1());
		
		Testetabela.Table1 table2 = new Testetabela().new Table1();
		
		table2.setData_nascimento("2000-10-10");
		table2.setN_bi(1);
		table2.setNome("Teste");
		model.setTable1(table1);
		table_1.addData(model.getTable_1());
		n_bi.setParam(true);
		form_1.addField(n_bi);
		form_1.addField(nome);
		form_1.addField(data_nascimento);

		table_1.addField(n_bi);
		table_1.addField(nome);
		table_1.addField(data_nascimento);
		table_1.addButton(btn_button_1);
		toolsbar_1.addButton(btn_save);
		form_1.addButton(btn_pesquisar);
		
		//System.out.println(form_1);
		System.out.println(table_1);
		/* Field sectionheader_1_text;
		 Field date_1;
		 Field number_1;
		 Field view_img;
		 IGRPSectionHeader sectionheader_1;
		 IGRPForm form_1;
		 IGRPFormList formlist_1;
		 IGRPView view_1;
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
		
		
		IGRPParagraph box = new IGRPParagraph("section");
		box.addField();
		TesteModel model = new TesteModel();
		
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1");
		form_1 = new IGRPForm("form_1");
		formlist_1 = new IGRPFormList("formlist_1");
		view_1 = new IGRPView("view_1");
		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel("");
		sectionheader_1_text.setValue("Teste");
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("persist","true").add("maxlength","4000");
		date_1 = new DateField(model,"date_1");
		date_1.setLabel("Date");
		date_1.propertie().add("name","p_date_1").add("type","date").add("format","IGRP_datePicker").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		number_1 = new NumberField(model,"number_1");
		number_1.setLabel("Number");
		number_1.propertie().add("name","p_number_1").add("type","number").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("desc","true");
		view_img = new TextField(model,"view_img");
		view_img.setLabel("");
		view_img.propertie().add("maxlength","300");

		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(date_1);

		formlist_1.addField(number_1);

		view_1.addField(number_1);
		view_1.addField(date_1);
		view_1.addField(view_img);
		System.out.println(form_1);
		System.out.println(formlist_1);
		System.out.println(view_1);
		System.out.println(sectionheader_1);*/
	}

}
