package nosi.webapps.igrp.pages.defaultPagina;

import java.io.IOException;
import nosi.core.webapp.*;
/**
 * @author Marcel Iekiny
 * Apr 15, 2017
 */
public class DefaultPaginaController extends Controller{
	
	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
	
	DefaultPaginaModel model = new DefaultPaginaModel();
	
	FlashMessage flashMessage = new FlashMessage();
	
	//flashMessage.addMessage("error", "Error1 ...");
	
	//Igrp.getInstance().getRequest().getSession().setAttribute("att1", "12");
	
	//System.out.println(Igrp.getInstance().getRequest().getSession().getAttribute("flash"));
	
	//System.out.println(Igrp.getInstance().getRequest().getSession().getAttribute("flash"));
	System.out.println(flashMessage.getMessages("error"));
	/*
	 * Start put your other model here ...
	 * */
	
	/*
	 * To refer a POST/GET parameter just put:
	 * 		String xpto = IGRP.getInstance().getRequest().getParameter("parameter_name");
	 * 		String []xpto = IGRP.getInstance().getRequest().getParameterValues("parameter_name")
	 * */
	
	/*
	 * Start put some business logic here ...
	 * */
	
	this.renderView(
			new DefaultPaginaView().
			addModel("model1", model).
			addModel("model2", new String("Iekiny Marcel")), true
			);
	}
	
}
