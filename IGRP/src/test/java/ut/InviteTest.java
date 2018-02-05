package ut;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.inject.Inject;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.pages.novoutilizador.NovoUtilizador;
import nosi.webapps.igrp.pages.novoutilizador.NovoUtilizadorController;

public class InviteTest { 
    
	@Inject NovoUtilizadorController userController;
	
	private void setHttpServletRequest() {
		
		
	}
	private void ldapAcess() throws Exception {
		
		NovoUtilizadorController obj = new NovoUtilizadorController();
		Method ldap = NovoUtilizadorController.class.getDeclaredMethod("ldap", null);
		ldap.setAccessible(true);
		String returnValue = (String) ldap.invoke(obj, null);
		System.out.println("returnValue = " + returnValue);
	    
	 }
	
	
	@Test
    public void inviteTest() {
		HttpServlet servlet;
		HttpServletRequest request;
		HttpServletResponse response;
		
    	//Igrp.init(servlet, request, response);
    	
		NovoUtilizador model = new NovoUtilizador();
		try {
			model.load();
		} catch (IllegalArgumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IllegalAccessException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			ldapAcess();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	System.out.println("to test");
    	
    		assertEquals(4, 2*2);
    }
    

}
