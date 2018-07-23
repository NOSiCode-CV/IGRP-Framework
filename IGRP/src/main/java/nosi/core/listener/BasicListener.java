package nosi.core.listener;

import java.util.Set;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import nosi.base.ActiveRecord.HibernateUtils;
/**
 * Marcel Iekiny
 * Nov 23, 2017
 */
@WebListener
public class BasicListener implements ServletContextListener {

    public BasicListener() {} 

    public void contextDestroyed(ServletContextEvent arg0)  {
    	Set<Thread> threadSet = Thread.getAllStackTraces().keySet();
    	threadSet.stream().forEach(t->{
			System.out.println("Stop:"+t.getName()+"-"+t.getPriority());
//    		if(t.getState().toString().compareTo("RUNNABLE")!=0 || t.getName().equalsIgnoreCase("thread-compiler")) {
//    			System.out.println("Stop:"+t.getName());
//    			t.interrupt();
//    		}
    	});
    	HibernateUtils.destroy(); 
    	HibernateUtils.unregisterAllDrivers();
		System.gc();
    }
    
	public void contextInitialized(ServletContextEvent arg0)  {}
	
}
