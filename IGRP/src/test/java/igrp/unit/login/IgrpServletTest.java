package igrp.unit.login;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;
import java.io.*;
import java.util.Optional;

import javax.servlet.http.*;
import org.junit.Ignore;
import org.junit.Test;

import nosi.core.servlet.IgrpServlet;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
//@Ignore
public class IgrpServletTest {

	
    @Test
    public void testServlet() throws Exception {
    	
    	Optional.empty();
    	
        HttpServletRequest request = mock(HttpServletRequest.class);       
        HttpServletResponse response = mock(HttpServletResponse.class);    
        
        IgrpServlet igrpservlet = mock(IgrpServlet.class);
        
        igrpservlet.processRequest(request, response);
        
        when(request.getParameter("username")).thenReturn("demo");
        when(request.getParameter("password")).thenReturn("demo");
        
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(writer);
        
        //FlashMessage.setMessage("sd", "sd");
        
       // Igrp igrp = Igrp.getInstance(); //.init(null, request, response);
      // igrp.getRequest().
        
       // new IgrpServlet().doGet(request, response);
       
    //    igrp.init(servlet, request, response);
      //  igrp.doGet(request, response);
    
        //nosi.core.webapp.Igrp.getInstance().init(igrpservlet, request, response).run();        
        
       // verify(request, atLeast(1)).getParameter("username"); // only if you want to verify username was called...
        
       // System.out.println(stringWriter.toString());
        
        writer.flush(); // it may not have been flushed yet... 
        
        writer.close();
        
        System.out.println("Result: " + stringWriter.toString());
        
        assertTrue(stringWriter.toString().contains("My expected string"));
    }
    
}
