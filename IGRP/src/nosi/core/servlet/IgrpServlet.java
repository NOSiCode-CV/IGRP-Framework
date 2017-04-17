package nosi.core.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import nosi.core.webapp.Igrp;

@WebServlet
@MultipartConfig
public class IgrpServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    
    public IgrpServlet() {
        super();
    }
    
    private void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
    	Igrp.getInstance().init(this, request, response).run();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
