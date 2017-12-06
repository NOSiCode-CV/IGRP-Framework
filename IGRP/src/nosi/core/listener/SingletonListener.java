package nosi.core.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;

import nosi.core.webapp.Igrp;
import nosi.core.webapp.ThreadLocalIgrpFactory;

/**
 * Application Lifecycle Listener implementation class SingletonListener
 *
 */
//@WebListener 
public class SingletonListener implements ServletRequestListener {

    /**
     * Default constructor. 
     */
    public SingletonListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletRequestListener#requestDestroyed(ServletRequestEvent)
     */
    public void requestDestroyed(ServletRequestEvent arg0)  { 
         // TODO Auto-generated method stub
    	 ThreadLocalIgrpFactory app = (ThreadLocalIgrpFactory) Igrp.getInstance().getAppInstance();
    	 app.cleanUp();
    	 System.out.println("Listener entrado ...");
    }

	/**
     * @see ServletRequestListener#requestInitialized(ServletRequestEvent)
     */
    public void requestInitialized(ServletRequestEvent arg0)  { 
    }
	
}
