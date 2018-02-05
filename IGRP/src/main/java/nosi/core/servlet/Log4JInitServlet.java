package nosi.core.servlet;

import java.io.File;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;




/**
 * Servlet implementation class Log4JInitServlet 
 * �ngelo Correia
 */
@WebServlet("/Log4JInitServlet")
public class Log4JInitServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    //public static final org.apache.logging.log4j.Logger LOGGER = LogManager.getLogger(Log4JInitServlet.class.getName());
	public void init(ServletConfig config) throws ServletException {
		/*
		String log4jLocation = config.getInitParameter("log4j-properties-location");
		ServletContext sc = config.getServletContext();
		if (log4jLocation == null) {
			System.err.println("No log4j-properties-location init param, so initializing log4j with BasicConfigurator");
			Configurator.initialize(new DefaultConfiguration());
		} else {
			String webAppPath = sc.getRealPath("/");
			String log4jProp = webAppPath + log4jLocation;
			File newlogfile = new File(log4jProp);
			if (newlogfile.exists()) {
				LoggerContext context = (org.apache.logging.log4j.core.LoggerContext) LogManager.getContext(false);
				context.setConfigLocation(newlogfile.toURI());

			} else {
				System.err.println(" " + log4jProp + " file not found, so initializing log4j with BasicConfigurator");
				Configurator.initialize(new DefaultConfiguration());
			}
		}
		super.init(config);
		*/
		nosi.core.webapp.Core.setMessageError("Teste message errror");
		 //LOGGER.debug("Debug Message Logged !!!");
	     //LOGGER.info("Info Message Logged !!!");
	     //LOGGER.error("Error Message Logged !!!", new NullPointerException("NullError"));
	}
	
	

}
