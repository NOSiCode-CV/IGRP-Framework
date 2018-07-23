//package igrp.unit.login;
//
//import static org.mockito.Mockito.*;
//import static org.junit.Assert.*;
//import java.io.*;
//import javax.servlet.http.*;
//
//import org.eclipse.jetty.testing.HttpTester;
//import org.eclipse.jetty.testing.ServletTester;
//import org.junit.Ignore;
//import org.junit.Test;
//
//import nosi.core.servlet.IgrpServlet;
//import nosi.core.webapp.FlashMessage;
//import nosi.core.webapp.Igrp;
////@Ignore
//public class IgrpServletTest {
//
//	
//    @Test
//    public void testServlet() throws Exception {
//
//    	ServletTester servletTester = new ServletTester();
//    	servletTester.addServlet(IgrpServlet.class, "/igrp");
//    	servletTester.start();
//
//    	
//    	HttpTester request = new HttpTester();
//    	request.setMethod("GET");
//    	request.setURI("/igrp");
//    	request.setVersion("HTTP/1.0");
//
//    	
//    	HttpTester response = new HttpTester();
//    	response.parse(servletTester.getResponses(request.generate()));
//
//    	// test response
//    	System.out.println(response.getContent());
//    
//    
//    	assertEquals(200,response.getStatus());
//    	assertEquals("It works",response.getContent());
//    	assertEquals("yes",response.getHeader("did-it-work"));
//
//    	
//        
////        HttpServletRequest request = mock(HttpServletRequest.class);       
////        HttpServletResponse response = mock(HttpServletResponse.class);    
////                
////        
////        when(request.getParameter("username")).thenReturn("demo");
////        when(request.getParameter("password")).thenReturn("demo");
////        
////    
////        StringWriter stringWriter = new StringWriter();
////        PrintWriter writer = new PrintWriter(stringWriter);
////        when(response.getWriter()).thenReturn(writer);
////        
////        IgrpServlet igrpservlet = new IgrpServlet();
////        
////       // Igrp igrp = Igrp.getInstance(); //.init(null, request, response);
////      // igrp.getRequest().
////        
////        new IgrpServlet().doGet(request, response);
////       
////    //    igrp.init(servlet, request, response);
////      //  igrp.doGet(request, response);
////        nosi.core.webapp.Igrp.getInstance().init(igrpservlet, request, response).run();        
////        
////        verify(request, atLeast(1)).getParameter("username"); // only if you want to verify username was called...
////        writer.flush(); // it may not have been flushed yet...
////        assertTrue(stringWriter.toString().contains("My expected string"));
//        
//    }
//}