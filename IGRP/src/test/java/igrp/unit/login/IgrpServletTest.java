package igrp.unit.login;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;
import java.io.*;
import javax.servlet.http.*;
import org.junit.Ignore;
import org.junit.Test;

import nosi.core.servlet.IgrpServlet;
@Ignore
public class IgrpServletTest {

	
    @Test
    public void testServlet() throws Exception {
        HttpServletRequest request = mock(HttpServletRequest.class);       
        HttpServletResponse response = mock(HttpServletResponse.class);    

        when(request.getParameter("username")).thenReturn("demo");
        when(request.getParameter("password")).thenReturn("1");

        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(writer);

        new IgrpServlet().doGet(request, response);

        verify(request, atLeast(1)).getParameter("username"); // only if you want to verify username was called...
        writer.flush(); // it may not have been flushed yet...
        assertTrue(stringWriter.toString().contains("My expected string"));
        
    }
}
