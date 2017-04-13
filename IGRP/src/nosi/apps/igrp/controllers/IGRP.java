package nosi.apps.igrp.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPView;
import nosi.core.gui.fields.CheckBoxListField;
import nosi.core.gui.fields.EmailField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.ListField;
import nosi.core.gui.fields.RadioListField;
import nosi.core.gui.fields.TextField;

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
		/*response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getWriter().append("Param at: ").append(request.getParameter("r"));
		*/
		IGRPForm form = new IGRPForm("form_1");
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
		response.setContentType("text/xml;charset=UTF-8");
		response.getWriter().append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		response.getWriter().append("<rows>");
		response.getWriter().append(form.toString());
		response.getWriter().append(form2.toString());
		response.getWriter().append(view.toString());
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
