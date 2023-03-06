package nosi.core.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import nosi.core.webapp.Igrp;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "IGRP", urlPatterns = "/app/*")
@MultipartConfig(maxFileSize = 52428800, maxRequestSize = 52428800, fileSizeThreshold = 0)
public class IgrpServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	public IgrpServlet() { super(); }
    
    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	Igrp.getInstance().init(this, request, response).run();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
