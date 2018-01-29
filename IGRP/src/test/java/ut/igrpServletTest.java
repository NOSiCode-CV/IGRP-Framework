package ut;

import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.Mockito.*;
import java.io.*;

import javax.servlet.http.*;

import org.junit.jupiter.api.Test;

import nosi.core.servlet.IgrpServlet;
public class igrpServletTest {

    @Test
    public void ServletLoginFailTest() throws Exception {
        HttpServletRequest request = mock(HttpServletRequest.class);       
        HttpServletResponse response = mock(HttpServletResponse.class);    

        request.setAttribute("authentication_type", "db");
        request.setAttribute("env", "dev");
       
        when(request.getParameter("username")).thenReturn("demo");
        when(request.getParameter("password")).thenReturn("1");
        
        StringWriter stringWriter = new StringWriter();
        PrintWriter writer = new PrintWriter(stringWriter);
        when(response.getWriter()).thenReturn(writer);
        
        new IgrpServlet().doGet(request, response);
                
        writer.flush(); // it may not have been flushed yet...
        assertTrue(stringWriter.toString().contains("A sua conta ou palavra-passe está incorreta."));
    }
}
