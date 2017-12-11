package nosi.core.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import nosi.base.ActiveRecord.PersistenceUtils;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.ThreadLocalIgrpFactory;
/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
@WebListener
public class DataBase implements ServletContextListener {

    public DataBase() {} 

    public void contextDestroyed(ServletContextEvent arg0)  {
    	ThreadLocalIgrpFactory t = (ThreadLocalIgrpFactory)Igrp.getInstance().getAppInstance();
    	t.cleanUp();
    	PersistenceUtils.destroy(); 
    }

	public void contextInitialized(ServletContextEvent arg0)  { 
		PersistenceUtils.init(arg0.getServletContext().getRealPath("/WEB-INF/config/")); 
    }
}
