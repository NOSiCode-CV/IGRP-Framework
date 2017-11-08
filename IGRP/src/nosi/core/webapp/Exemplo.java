package nosi.core.webapp;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Marcel Iekiny
 * Nov 7, 2017
 */
public class Exemplo {
	
	public static void func(HttpServlet servlet, HttpServletRequest request, HttpServletResponse response) throws IOException {
		nosi.core.webapp.Igrp.getInstance().init(servlet, request, response).run(); 
	}
	
}
