package nosi.apps.igrp.controllers;

import java.awt.Color;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.scene.control.CheckBox;
import  nosi.core.gui.fields.PasswordField;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPView;
import nosi.core.gui.fields.CheckBoxField;
import nosi.core.gui.fields.CheckBoxListField;
import nosi.core.gui.fields.ColorField;
import nosi.core.gui.fields.DateField;
import nosi.core.gui.fields.EmailField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FileField;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.ImageField;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.LookupField;
import nosi.core.gui.fields.NumberField;
import nosi.core.gui.fields.PlainTextField;
import nosi.core.gui.fields.RadioField;
import nosi.core.gui.fields.RadioListField;
import nosi.core.gui.fields.SeparatorField;
import nosi.core.gui.fields.TextAreaField;
import nosi.core.gui.fields.TextEditorField;
import nosi.core.gui.fields.TextField;
import nosi.core.gui.fields.VirtaulKeyboardField;

/**
 * Servlet implementation class IGRP
 */
@WebServlet("/IGRP")
public class IGRP extends HttpServlet {
	private static final long serialVersionUID = 01L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IGRP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 * response.getWriter().append("Param at: ").append(request.getParameter("r"));
		*/
		IGRPForm form = new IGRPForm("form_1");
		form.addButton("Button name", "App name", "Page name", "Action name", "Target", "Image name");
		/*Field nome = new ListField("nome");
		nome.addOption("option 1", 1);
		nome.addOption("option 2", 2);
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
		radiolist.addOption("Radio 1", 1);
		radiolist.addOption("Radio 2", 2);
		

		Field checkboxlist = new CheckBoxListField("checkboxlist");
		checkboxlist.addOption("Check 1", 1);
		checkboxlist.addOption("Check 2", 2);
		
		Field checkbox = new CheckBoxField("checkbox");
		checkbox.setValue(1);
		
		Field radio = new RadioField("radio");
		radio.setValue(1);
		
		Field email = new EmailField("email");
		email.setValue("ima@gmail.com");
		
		
		form.addField(nome);
		form.addField(morada);
		form.addField(hidden);
		form.addField(email);
		
		form2.addField(select);
		form2.addField(radiolist);
		form2.addField(checkboxlist);
		form2.addField(radio);
		form2.addField(checkbox);
		
		view.addField(email);
		view.addField(nome);*/
		
		Field text = new TextField("text");
		Field hidden = new HiddenField("hidden");
		Field email = new EmailField("email");
		Field textplain = new PlainTextField("plaintext");
		Field image = new ImageField("image");
		Field color = new ColorField("color");
		Field virtual = new VirtaulKeyboardField("virtual_key");
		Field number = new NumberField("number");
		Field texteditor = new TextEditorField("texteditor");
		Field lookup = new LookupField("lookup");
		lookup.setLookup("fdjdkfjkfdfd");
		Field seprator = new SeparatorField("separator");
		Field file = new FileField("file");
		Field textara = new TextAreaField("textarea");
		Field link = new LinkField("link");
		Field date = new DateField("date");
		Field pw = new PasswordField("password");
		
		form.addField(pw);
		form.addField(date);
		form.addField(link);
		form.addField(textara);
		form.addField(file);
		form.addField(seprator);
		form.addField(lookup);
		form.addField(texteditor);
		form.addField(number);
		form.addField(virtual);
		form.addField(color);
		form.addField(image);
		form.addField(textplain);
		form.addField(email);
		form.addField(hidden);
		form.addField(text);
		
		
		response.setContentType("text/xml;charset=UTF-8");
		response.getWriter().append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		response.getWriter().append("<rows>");
		response.getWriter().append(form.toString());
		response.getWriter().append("</rows>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
